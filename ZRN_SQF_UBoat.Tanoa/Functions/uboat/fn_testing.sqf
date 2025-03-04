/*
* Author: Zorn
* Function to test
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

if !(isServer) exitWith { };


[ uboat_start_1, uboat_after_1, 10 ] call zrn_fnc_prep;
[ uboat_start_2, uboat_after_2, 5 ] call zrn_fnc_prep;


[
    { 
        systemChat "Starting 1. Transition";
        ["zrn_uboat_transition_server", [uboat_start_2]] call CBA_fnc_serverEvent;
    },
    [],
    20
] call CBA_fnc_waitAndExecute;

[
    { 
        systemChat "Starting 2. Transition";
        ["zrn_uboat_transition_server", [uboat_start_1]] call CBA_fnc_serverEvent;
    },
    [],
    30
] call CBA_fnc_waitAndExecute;

