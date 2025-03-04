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


// check for  of RON being interrrupted
if ( [_requester] call vn_ron_fnc_interrupt_chance ) then {
    /* code that happens when they get intterrupted */
    skipTime (_timeToSkip * linearConversion [0,1,random 1, 0.25, 0.75]);

    [_requester] call vn_ron_fnc_interruption;

    [ CBA_fnc_globalEvent , ["ron_EH_hint", ["The watchpost thinks he heard something and woke everyone up..."]], 25 + ceil random 10 ] call CBA_fnc_waitAndExecute;

    missionNamespace setVariable ["vn_ron_suppress_gotInterrupted", true, true];
    [ { missionNamespace setVariable ["vn_ron_suppress_gotInterrupted", false, true]; } , [], 60*5] call CBA_fnc_waitAndExecute;

} else {
    /*code that happens when they dont get interrupted */
    
    skipTime (_timeToSkip - 0.75);

    missionNamespace setVariable ["vn_ron_suppress_didRONRecently", true, true];
    [ { missionNamespace setVariable ["vn_ron_suppress_didRONRecently", false, true]; } , [], 60*60] call CBA_fnc_waitAndExecute;

    [ CBA_fnc_globalEvent , ["ron_EH_hint", ["It is morning and the sun will rise soon..."]], 25 + ceil random 10 ] call CBA_fnc_waitAndExecute;
};


forceWeatherChange;