/*
* Author: Zorn
* FNC to gradually adjust timeAcc to target over time
*
* Arguments:
*
* Return Value:
* None
*
* Example:
* ['something', player] call prefix_component_fnc_functionname
*
* Public: No
*/



params [
    ["_timeAcc_tgt", 120, [0]],
    ["_duration", 15, [0]]
];

diag_log format ['[zrn](debug)(fn_gradientTimeAcc) _this: %1', _this];


_timeAcc_tgt = _timeAcc_tgt max 0.1 min 120;

private _timeAcc_cur = timeMultiplier;


private _codeToRun = {
        setTimeMultiplier linearConversion [ _this#0, _this#1, CBA_missionTime, _this#2, _this#3, true ];
};
private _exitCode = { setTimeMultiplier (_this#3) };

private _startTime = CBA_missionTime;
private _endTime = CBA_missionTime + _duration;
private _condition = { (_this#1) > CBA_missionTime };
private _parameters = [_startTime, _endTime, _timeAcc_cur, _timeAcc_tgt];

private _delay = 0.5;

[{
    params ["_args", "_handle"];
    _args params ["_codeToRun", "_exitCode", "_parameters", "_condition"];

    if (_parameters call _condition) then {
        _parameters call _codeToRun;
    } else {
        _handle call CBA_fnc_removePerFrameHandler;
        _parameters call _exitCode;
    };
}, _delay, [_codeToRun, _exitCode, _parameters, _condition]] call CBA_fnc_addPerFrameHandler;



