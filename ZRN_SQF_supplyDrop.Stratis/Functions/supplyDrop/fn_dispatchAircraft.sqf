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
    ["_startPos",       [0,0,0],    [[]],   [2,3]   ],
    ["_airClass",       "",         [""]            ],
    ["_targetPos",      [0,0,0],    [[]],   [2,3]   ],
    ["_isProtected",    false,      [true]          ],
    ["_side",           CIVILIAN,   [west]          ],
    ["_endPos",         "RETURN",   ["", []], [2,3] ]
];

private _aircraft = createVehicle [_airClass, [0,0,0], [], 0, "FLY"];

private _grp = _side createVehicleCrew vehicle;
_grp addVehicle _aircraft;
_grp combatBehaviour "CARELESS";

private _dir = (_startPos getDir _targetPos);
_aircraft setPosASL _startPos;
_aircraft setDir _dir;

if (_isProtected) then {
    { _x allowDamage false; } forEach [_aircraft] + crew _aircraft;
};


_grp addWaypoint [_targetPos, 25];
_grp addWaypoint [_targetPos getPos [250, _dir], 25];

_endPos = switch (true) do {
    case _endPos isEqualTo "RETURN": { _startPos };
    case _endPos isEqualTo "CONTINUE": { _targetPos getPos [10000, _dir] };
    case _endPos isEqualType []: { _endPos };
    default { [0,0,0] };
};


_grp AddWaypoint [_endPos, 100];


// condition - Needs to return bool
_condition = { isNull _this#0 || { damage _this#0 == 1 || { _this#0 distance2D _this#1} } };

// Code to be executed once condition true
_statement = {};                
_parameter = [_aircraft, _endPos];                // arguments to be passed on -> _this
_timeout = -1;                  // if condition isnt true within this time in S, _timecode will be executed.
_timeoutCode = {};              // code to be executed if timeout
[_condition, _statement, _parameter, _timeout,_timeoutCode] call CBA_fnc_waitUntilAndExecute;
