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

if !(isServer) exitWith {false};


params [
    ["_aircraft",        objNull,               [objNull]   ],
    ["_crateClass",      [],                    [""]        ],
    ["_parachuteClass",  "B_Parachute_02_F",    [""]        ],
    ["_content",         [[],[],true],          [[]],   [3] ],
    ["_attachStrobe",    false,                 [false]     ]
];

if (_aircraft isEqualTo objNull) exitWith {false};
if (damage _aircraft == 1) exitWith {false};


#define MIN_ALTITUDE 35

private _posAircraft = getPosASL _aircraft;
private _boundingBox = boundingBoxReal _aircraft;
private _offsetZ = _boundingBox select 1 select 2;
private _offsetY = _boundingBox select 1 select 1;


private _spawnPos = if ((_posAircraft # 2 - _offsetZ) > MIN_ALTITUDE) then {
    [ _posAircraft # 0, _posAircraft # 1, _posAircraft # 2 - _offsetZ ]
} else {
    _aircraft getRelPos [_offsetY, 180]
};

private _chute = createVehicle [_parachuteClass, [0,0,100], [], 0, "CAN_COLLIDE"];
_chute setPosASL _spawnPos;

private _box = createVehicle [_crateClass, [0,0,0]];

([_box] + _content) call ZRN_supplyDrop_fnc_fillCrate;

_box attachTo [_chute, [0,0,0]];


if (_attachStrobe) then {
    private _strobe = createVehicle ["ACE_IR_Strobe_Effect", [0,0,10], [], 0, "CAN_COLLIDE"];
    _strobe attachTo [attachedTo _box, [0,0,32]];
    [ {	isTouchingGround _this#1 }, { deleteVehicle _this#0 }, [_strobe, _box] ] call CBA_fnc_waitUntilAndExecute;
};

// Detaches the box from the parachute once its close to the ground or deleted
[{
    isNull _this || 
    { ( getPos _this #2 ) <1 }
}, {
    if (isNull _this) exitWith {};
    detach _this
}, _box, 300] call CBA_fnc_waitUntilAndExecute;