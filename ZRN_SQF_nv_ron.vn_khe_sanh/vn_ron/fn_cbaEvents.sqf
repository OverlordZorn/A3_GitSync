/*
* Author: Zorn
* Function to establish CBA Events
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

[ "ron_EH_watch_display", vn_ron_fnc_watch_display ] call CBA_fnc_addEventHandler;
[ "ron_EH_watch_fade", vn_ron_fnc_watch_fade ] call CBA_fnc_addEventHandler;

[ "ron_EH_ron_run", vn_ron_fnc_ron_run ] call CBA_fnc_addEventHandler;