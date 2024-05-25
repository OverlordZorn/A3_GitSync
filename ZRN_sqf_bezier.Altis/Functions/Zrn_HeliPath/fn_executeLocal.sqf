// lz_start, wp_1, wp_2, wp_3, wp_4, wp_5, wp_6, wp_7, lz_end



params [
    ["_heli",           objNull,    [objNull]   ],
    ["_duration",       60,         [0]         ],
    ["_wp_OBJ_Array",   [],         [[]]        ]
];

private _startTime = CBA_missionTime;

private _args = [_heli, _duration, _wp_OBJ_Array, _startTime];

_heli allowDammage false;

[{
    _args params ["_heli","_duration","_wp_OBJ_Array","_startTime"];

    private _oldPos = getPosATL _heli;

    private _endTime = _startTime + _duration;

    private _progress = linearConversion [_startTime, _endTime, CBA_missionTime, 0, 1, true];

    private _pos_Array = _wp_OBJ_Array apply {getPosATL _x};

    private _newPos = _progress bezierInterpolation _pos_Array;

    private _oldDir = getDir _heli;
    private _newDir = _oldPos getDir _newPos;
    _newDir = linearConversion[0,1,0.01, _oldDir, _newDir, true];

    _heli setDir _newDir;
    _heli setPosATL _newPos;

    if (_progress >= 1) then {
        [_handle] call CBA_fnc_removePerFrameHandler; 
    }

}, 1/60, _args] call CBA_fnc_addPerFrameHandler;