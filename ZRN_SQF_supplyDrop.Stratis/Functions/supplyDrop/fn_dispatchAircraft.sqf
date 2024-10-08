/*
* Author: Zorn
* Function to create the aircraft which will bring the supplies to the dropzone.
*
* Arguments:
*
* Return Value:
* None
*
* Example:
* ['something', player] call cvo_fnc_sth
*
* Public: Yes
*/

if !(isServer) exitWith {};

#define TIMEOUT 900

params [
    ["_entryName",  "",         [""]            ],
    ["_targetPos",  [0,0,0],    [[]],   [2,3]   ]
];


diag_log format ['[CVO](debug)(fn_dispatchAircraft) _entryName: %1 - _targetPos: %2', _entryName , _targetPos];


private _catalog = missionNamespace getVariable ["ZRN_supplyDrop_catalog", "404"];
if (_catalog isEqualTo "404") exitWith {diag_log "[CVO](debug)(fn_dispatchAircraft) Failed: No Catalog";};
if !(_entryName in _catalog) exitWith  {diag_log "[CVO](debug)(fn_dispatchAircraft) Failed: Entry Not Found";};


private _entry = _catalog get _entryName;
private _startPos = _entry get "pos_start";

_startPos set [2, 0 max (ATLToASL _startPos # 2) + 100];


// Create Aircraft
private _aircraft = createVehicle [(_entry get "class_air"), [0,0,0], [], 0, "FLY"];

_aircraft flyInHeight [_entry get "drop_alt", _entry get "drop_alt_forced"];
_aircraft flyInHeightASL [25, 25, 25];

private _grp = (_entry get "side") createVehicleCrew _aircraft;
_grp addVehicle _aircraft;
_grp setCombatBehaviour "CARELESS";
_grp deleteGroupWhenEmpty true;

//  Manage ACE HC Blacklist
[[_aircraft] + units _grp, true] call ace_headless_fnc_blacklist;

// Place and Rotate Plane
_aircraft setPosASL _startPos;
private _dir = (_startPos getDir _targetPos);
_aircraft setDir _dir;

diag_log format ['[CVO](debug)(fn_dispatchAircraft) _aircraft: %1', _aircraft];

// If enabled, make Asset Invincible
if (_entry get "isProtected") then { { _x allowDamage false; } forEach [_aircraft] + crew _aircraft; };

// Provide Waypoints
_grp addWaypoint [_targetPos, 25];
_grp addWaypoint [_targetPos getPos [250, _dir], 25];

private _endpos = _entry get "pos_end";

_endPos = switch true do {
    case (_endPos isEqualTo "RETURN"):   { _startPos };
    case (_endPos isEqualTo "CONTINUE"): { _targetPos getPos [10000, _dir] };
    case (_endPos isEqualType []):       { _endPos };
    default { [0,0,0] };
};

private _wpEnd = _grp AddWaypoint [_endPos, 100];
_wpEnd setWaypointStatements ["true", "{deleteVehicle _x} forEach [vehicle this] + thisList"];


// PFEH - Drop Crate 
private _pfeh_id = [{
    params ["_args", "_handle"];
    _args params ["_entryName", "_aircraft", "_targetPos"];

    if (( _aircraft distance2D _targetPos ) > 50) exitWith {};
    [_entryName, _aircraft] call zrn_supplydrop_fnc_dropCrate;
    _handle call CBA_fnc_removePerFrameHandler;

}, _delay, [_entryName, _aircraft, _targetPos]] call CBA_fnc_addPerFrameHandler;

// Store PFEH_ID on object to retrieve during EH's
_aircraft setVariable ["zrn_airdrop_pfeh_id", _pfeh_id];

// Stops the PFEH when the object is killed or deleted
private _cleanup = {
    params ["_aircraft"];
    _aircraft getVariable "zrn_airdrop_pfeh_id" call CBA_fnc_removePerFrameHandler;
    diag_log format ['[CVO](debug)(fn_dispatchAircraft) PFEH Canceled - %1 %2', _thisEvent , _aircraft];
};
_aircraft addEventHandler ["Killed", _cleanup];
_aircraft addEventHandler ["Deleted", _cleanup];

diag_log "[CVO](debug)(fn_dispatchAircraft) END";