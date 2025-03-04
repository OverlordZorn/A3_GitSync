/*
* Author: Zorn
* global hint function for cba Events
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

if !(hasInterface) exitWith {};

params ["_text"];

systemChat _text;
