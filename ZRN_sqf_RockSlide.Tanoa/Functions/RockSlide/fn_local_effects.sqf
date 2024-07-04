/*
* Author: Zorn
* Function for Clientside Effects of the Rockslide
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

params ["_posStart", "_posEnd", "_bomb", "_duration", "_layerName", "_numberOfBombs"];

if (is3DENPreview) then {diag_log "fnc local"};

_this call ZRN_fnc_local_rocks;
_this call ZRN_fnc_local_smoke;

// CamShake Duration
enableCamShake true;
[{
    addCamShake [4, 0.2 * _this#0, 3];
    if (is3DENPreview) then {diag_log "LOC - Shake"};
} , [_duration], _duration * 0.2] call CBA_fnc_waitAndExecute;

[{
    addCamShake [8, 0.4 * _this#0, 3];
    if (is3DENPreview) then {diag_log "LOC - Shake"};
} , [_duration], _duration * 0.4] call CBA_fnc_waitAndExecute;

[{
    addCamShake [4, 0.4 * _this#0, 3];
    if (is3DENPreview) then {diag_log "LOC - Shake"};
} , [_duration], _duration * 0.8] call CBA_fnc_waitAndExecute;

// Camera Blur

private _PP_dynamic = ppEffectCreate ["DynamicBlur",500];
_PP_dynamic ppEffectEnable true;
_PP_dynamic ppEffectAdjust [0.5];
_PP_dynamic ppEffectCommit _duration/3;

[{
    _this#0 ppEffectAdjust [0.0];
    _this#0 ppEffectCommit _this#1;
} , [_PP_dynamic, _duration/3], _duration/2] call CBA_fnc_waitAndExecute;
[{
    ppEffectDestroy _this#0;
} , [_PP_dynamic], _duration * 1.1] call CBA_fnc_waitAndExecute;