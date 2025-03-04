/*
* Author: Zorn
* Function to check if its currently night
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

date call BIS_fnc_sunriseSunsetTime params ["_sunrise", "_sunset"];
private _curr = dayTime; 

// disable RON when its only one hour before sunrise
_sunset < _curr  || { _curr < (_sunrise - 1) }
