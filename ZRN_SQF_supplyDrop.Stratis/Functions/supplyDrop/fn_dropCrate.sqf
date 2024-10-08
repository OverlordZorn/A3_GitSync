/*
* Author: Zorn
* Function that will create the crate and put it on a parachute beneath the airframe that is dropping the crate.
*
* Arguments:
* 0 - object - the aircraft that is supposed to drop the crate
* 1 - string - classname of the crate object to be created
* 2 - string - classname of the parachute to be used
*
* Return Value:
* None
*
* Example:
* ['something', player] call cvo_fnc_sth
*
* Public: Yes
*/

#define MIN_ALTITUDE 35

if !(isServer) exitWith {false};

diag_log "[CVO](debug)(fn_dropCrate) Start";

params ["_entryName", "_aircraft"];


private _catalog = missionNamespace getVariable ["ZRN_supplyDrop_catalog", "404"];
if (_catalog isEqualTo "404") exitWith {diag_log "[CVO](debug)(fn_dispatchAircraft) Failed: No Catalog";};
if !(_entryName in _catalog) exitWith  {diag_log "[CVO](debug)(fn_dispatchAircraft) Failed: Entry Not Found";};


private _entry = _catalog get _entryName;

private _crateClass = _entry get "class_box";
private _paraClass = _entry get "class_para";




if (_aircraft isEqualTo objNull) exitWith {false};
if (damage _aircraft == 1) exitWith {false};

private _box = createVehicle [_crateClass, [0,0,0]];
if (isNull _box) exitWith {diag_log "[CVO](debug)(fn_dropCrate) _box creation failed";};

private _chute = createVehicle [_paraClass, [0,0,100], [], 0, "CAN_COLLIDE"];
if (isNull _chute) exitWith {diag_log "[CVO](debug)(fn_dropCrate) _chute creation failed";};

_aircraft disableCollisionWith _chute;
_aircraft disableCollisionWith _box;


private _posAircraft = getPosASL _aircraft;

private _offsetBox   = boundingBox _box select 2;
private _offsetAir   = boundingBox _aircraft select 2;
private _offsetTotal = _offsetAir + _offsetBox;

private _spawnPos = if ((_posAircraft # 2 - _offsetTotal) > MIN_ALTITUDE) then {
    diag_log "[CVO](debug)(fn_dropCrate) Beneath";
    [ _posAircraft # 0, _posAircraft # 1, _posAircraft # 2 - _offsetTotal ]
} else {
    diag_log "[CVO](debug)(fn_dropCrate) Behind";
    _aircraft getRelPos [_offsetTotal, 180]
};


diag_log format ['[CVO](debug)(fn_dropCrate) _aircraft: %1', getPosASL _aircraft];
diag_log format ['[CVO](debug)(fn_dropCrate) _spawnPos: %1', _spawnPos];

_chute setPosASL _spawnPos;


[
    _box,
    _entry get "items",
    _entry get "backpacks",
    _entry get "emptyBox"
] call ZRN_supplyDrop_fnc_fillCrate;

_box attachTo [_chute, [0,0,0]];


if (_attachStrobe) then {
    private _strobe = createVehicle ["ACE_IR_Strobe_Effect", [0,0,10], [], 0, "CAN_COLLIDE"];
    _strobe attachTo [attachedTo _box, [0,0,32]];
    [ {	isTouchingGround _this#1 }, { deleteVehicle _this#0 }, [_strobe, _box] ] call CBA_fnc_waitUntilAndExecute;
};

// Detaches the box from the parachute once its close to the ground or deleted
[
    { isNull _this || { ( getPos _this #2 ) <1 } },
    { if (isNull _this) exitWith {}; detach _this },
    _box,
    300
] call CBA_fnc_waitUntilAndExecute;

diag_log "[CVO](debug)(fn_dropCrate) End";