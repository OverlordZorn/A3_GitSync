/*
* Author: Zorn
* Function to handle the TimeSkipping
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

params ["_requester"];


date call BIS_fnc_sunriseSunsetTime params ["_sunrise", "_sunset"];

private _curr = dayTime;

private _timeToSkip = if (_curr > _sunrise ) then { _sunrise + 24 - _curr } else { _sunrise - _curr };

skipTime (_timeToSkip - 0.75);


missionNamespace setVariable ["vn_ron_suppress_didRONRecently", true, true];
[ { missionNamespace setVariable ["vn_ron_suppress_didRONRecently", false, true]; } , [], 60*60] call CBA_fnc_waitAndExecute;

// TODO: Implment chance to be interrupted