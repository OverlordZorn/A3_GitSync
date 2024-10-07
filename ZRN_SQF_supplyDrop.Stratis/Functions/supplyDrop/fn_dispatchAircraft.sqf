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

if !(isServer) exitWith {false};


params [
    ["_entryName",  "",     [""]]
];

/*
params [
    ["_startPos",       [0,0,0],                [[]],       [2,3]   ],
    ["_airClass",       "",                     [""]                ],
    ["_targetPos",      [0,0,0],                [[]],       [2,3]   ],
    ["_isProtected",    false,                  [true]              ],
    ["_side",           CIVILIAN,               [west]              ],
    ["_endPos",         "RETURN",               ["", []],   [2,3]   ],
    ["_crateClass",     "B_supplyCrate_F",      [""]                ],
    ["_paraClass",      "B_Parachute_02_F",     [""]                ],
    ["_content",        [[],[],true],           [[]],       [3]     ],
    ["_attachStrobe",   false,                  [true]              ]
];
*/

private _aircraft = createVehicle [_airClass, [0,0,0], [], 0, "FLY"];

private _grp = _side createVehicleCrew vehicle;
_grp addVehicle _aircraft;
_grp combatBehaviour "CARELESS";

private _dir = (_startPos getDir _targetPos);
_aircraft setPosASL _startPos;
_aircraft setDir _dir;

if (_isProtected) then { { _x allowDamage false; } forEach [_aircraft] + crew _aircraft; };


_grp addWaypoint [_targetPos, 25];
_grp addWaypoint [_targetPos getPos [250, _dir], 25];

_endPos = switch (true) do {
    case _endPos isEqualTo "RETURN": { _startPos };
    case _endPos isEqualTo "CONTINUE": { _targetPos getPos [10000, _dir] };
    case _endPos isEqualType []: { _endPos };
    default { [0,0,0] };
};

_grp AddWaypoint [_endPos, 100];

// WUAE - Delete Aircraft 
// condition - Needs to return bool
private _condition = { isNull _this#0 || { damage _this#0 == 1 || { (_this#0 distance2D _this#1) < 50 } } };

// Code to be executed once condition true
private _statement = {
    if (isNull _this#0) exitWith {};
    deleteVehicleCrew _this#0;
    deleteVehicle _this#0;
};

[_condition, _statement, [_aircraft, _endPos], 600 ,_statement] call CBA_fnc_waitUntilAndExecute;


// WUAE - Drop Crate 
// condition - Needs to return bool
private _condition = { isNull _this#0 || { damage _this#0 == 1 || { (_this#0 distance2D _this#1) < 50 } } };

// Code to be executed once condition true
private _statement = {
    if (isNull _this#0) exitWith {};
    if (damage _this#0 == 1) exitWith {};

    [_this#0, _this#2, _this#3, _this#4, _this#5 ] call zrn_supplydrop_fnc_dropCrate;
};

[_condition, _statement, [_aircraft, _targetPos, _crateClass, _paraClass, _content, _attachStrobe], 600 ,{}] call CBA_fnc_waitUntilAndExecute;