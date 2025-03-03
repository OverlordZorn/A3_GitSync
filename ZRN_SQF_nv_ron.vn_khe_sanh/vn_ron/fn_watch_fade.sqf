/*
* Author: Zorn
* function to black in/out watch screen
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
    "_transition",
    ["_target", "OVERLAY", ["OVERLAY"]],
    ["_duration", 3, [0]]
];

private _value = switch (_transition) do {
    case "TOBLACK": { 0 };
    case "FROMBLACK": { 1 };
    default { 1 };
};

private _ctrl = switch (_target) do {
    case "OVERLAY": { uiNamespace getVariable ["RscDisplaySOGWatch_overlay", controlNull]; };
    case "BACKGROUND": { uiNamespace getVariable ["RscDisplaySOGWatch_background", controlNull]; };
};

_ctrl ctrlSetFade _value;
_ctrl ctrlCommit _duration;

_duration fadeEnvironment _value;