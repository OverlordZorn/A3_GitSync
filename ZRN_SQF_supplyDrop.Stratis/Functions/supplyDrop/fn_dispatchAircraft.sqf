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

_startPos set [2, ATLToASL _startPos # 2 + 100];

// Create Aircraft and Vehicle

private _aircraft = createVehicle [(_entry get "class_air"), [0,0,0], [], 0, "FLY"];

private _grp = (_entry get "side") createVehicleCrew _aircraft;
_grp addVehicle _aircraft;
_grp setCombatBehaviour "CARELESS";

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

_endPos = switch true do {
    case (_endPos isEqualTo "RETURN"):   { _startPos };
    case (_endPos isEqualTo "CONTINUE"): { _targetPos getPos [10000, _dir] };
    case (_endPos isEqualType []):       { _endPos };
    default { [0,0,0] };
};

_grp AddWaypoint [_endPos, 100];


// Handle the Drop
// WUAE - Drop Crate 
// condition - Needs to return bool
private _condition = {
    params ["_aircraft", "_targetPos"];
    isNull _aircraft ||
    { damage _aircraft == 1 ||
    { ( _aircraft distance2D _targetPos ) < 50 } }
};

// Code to be executed once condition true
private _statement = {
    params ["_aircraft", "_targetPos"];
    diag_log format ['[CVO](debug)(fn_dispatchAircraft) WUAE Delete: _aircraft: %1 - _targetPos: %2', _aircraft , _targetPos];
    if (isNull _aircraft) exitWith {};
    if (damage _aircraft == 1) exitWith {};

    [_this#0, _this#2, _this#3, _this#4, _this#5 ] call zrn_supplydrop_fnc_dropCrate;
};

[
    _condition,
    _statement,
    [
        _aircraft,
        _targetPos,
        _entry get "class_box",
        _entry get "class_para",
        [
            _entry get "items",
            _entry get "backpacks",
            _entry get "emptyBox"
        ],
        _entry get "attachStrobe"
    ],
    TIMEOUT,
    {}
] call CBA_fnc_waitUntilAndExecute;


/*
// Handles  Cleanup incase the aircraft gets deleted.
// WUAE - Delete Aircraft
private _condition = {
    params ["_aircraft", "_endPos"];
    diag_log format ['[CVO](debug)(fn_dispatchAircraft) WUAE Delete: _aircraft: %1 - _endPos: %2', _aircraft , _endPos];
    isNull _aircraft ||
    { damage _aircraft == 1 ||
    { (_aircraft distance2D _endPos) < 150 } }
};

// Code to be executed once condition true
private _statement = {
    if (isNull _this#0) exitWith {};
    deleteVehicleCrew _this#0;
    deleteVehicle _this#0;

    diag_log "[CVO](debug)(fn_dispatchAircraft) Aircraft Deleted";
};

[_condition, _statement, [_aircraft, _endPos], TIMEOUT ,_statement] call CBA_fnc_waitUntilAndExecute;
*/
diag_log "[CVO](debug)(fn_dispatchAircraft) END ";