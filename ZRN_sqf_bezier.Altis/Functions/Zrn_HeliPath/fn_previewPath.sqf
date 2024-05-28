private _return = get3DENSelected "object";


if (count _return == 0) exitWith { missionNamespace setVariable ["ZRN_heliPath_wpOBJ_Array", []]; };

private _array = missionNamespace getVariable ["ZRN_heliPath_wpOBJ_Array", [] ];
_array pushBack (_return#0);

systemChat (["Currently Monitored:", count _array, _array] joinString " ");

missionNamespace setVariable ["ZRN_heliPath_wpOBJ_Array", _array];
missionNamespace setVariable ["ZRN_heliPath_totalSteps", (count _array -1) * 20];

if (count _array < 2) exitWith {};
if !(missionNameSpace getVariable ["ZRN_heliPath_pfH_isActive", true]) exitWith {};

private _codeToRun = {
    { deleteVehicle _x; } forEach missionNamespace getVariable ["ZRN_heliPath_PreviewOBJ_Array", []];

    private _obj_array = missionNamespace getVariable ["ZRN_heliPath_wpOBJ_Array", []] select {_x isNotEqualTo objNull };

    private _pos_Array = _obj_array apply {getPosASL _x};
    private _stepTotal = missionNamespace getVariable ["ZRN_heliPath_totalSteps", 100];

    private _array = [];

    for "_i" from 0 to _stepsTotal do {
        private _progress = 1 / _stepsTotal * _i;
        private _newPos = _progress bezierInterpolation _pos_Array;

        private _obj = createVehicle ["Sign_Sphere100cm_F", [0,0,0]];
        _obj setObjectTexture [0, "#(rgb,8,8,3)color(1,0,0,1)"];
        _obj setPosASL _newPos;
        _array pushBack _obj;
    };

    missionNamespace setVariable ["ZRN_heliPath_wpOBJ_Array", _obj_array];
    missionNamespace setVariable ["ZRN_heliPath_PreviewOBJ_Array", _array];
};

private _parameters = [  /*parameters*/  ];
private _exitCode = {
        { deleteVehicle _x; } forEach missionNamespace getVariable ["ZRN_heliPath_PreviewOBJ_Array", []];
        missionNamespace setVariable ["ZRN_heliPath_pfH_isActive", false];
    };
private _condition = { count (missionNamespace getVariable ["ZRN_heliPath_wpOBJ_Array", [] ]) == 0 };
private _delay = 1;

[{
    params ["_args", "_handle"];
    _args params ["_codeToRun", "_parameters", "_exitCode", "_condition"];

    sytemChat (str systemTime);

    if (_parameters call _condition) then {
        _parameters call _codeToRun;
        systemChat "update";
    } else {
        _handle call CBA_fnc_removePerFrameHandler;
        _parameters call _exitCode;
        systemChat "exit";
    };
}, _delay, [_codeToRun, _parameters, _exitCode, _condition]] call CBA_fnc_addPerFrameHandler;

missionNamespace setVariable ["ZRN_heliPath_pfH_isActive", true];