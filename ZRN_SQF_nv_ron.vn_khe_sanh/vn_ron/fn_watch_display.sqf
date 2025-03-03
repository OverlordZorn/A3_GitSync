/*
* Author: Zorn
* Function for CBA EH to enable/disable the sog:pf Watch Overlay.
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

params [ ["_enable", false, [false] ] ];

switch (_enable) do {
    case true:  {
        createDialog "RscDisplaySOGWatch";
        private _background = uiNamespace getVariable ["RscDisplaySOGWatch_background", controlNull];
        _background ctrlSetFade 1;
        _background ctrlCommit 0;

        disableUserInput true;
    };
    case false: {
        closeDialog 1;
        while { userInputDisabled } do { disableUserInput false; };
    };
};
