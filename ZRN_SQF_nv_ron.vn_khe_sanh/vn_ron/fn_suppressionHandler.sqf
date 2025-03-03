/*
* Author: Zorn
* Function to initialize the suppression handler for players
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

if !(isServer) exitWith {};

// Define GVAR on Mission Start
missionNamespace setVariable ["vn_ron_suppress_lastSuppressed", -1 * vn_ron_suppress_lastSuppressed_delta];


// Adds the Eventhandler to every playerObject
addMissionEventHandler [
    "OnUserSelectedPlayer",
    {
        params ["_networkId", "_playerObject", "_attempts"];

        if !(_playerObject getVariable ["vn_ron_suppressHandler", false]) then {

            _playerObject addEventHandler [
                "Suppressed",
                {
                    // params ["_unit", "_distance", "_shooter", "_instigator", "_ammoObject", "_ammoClassName", "_ammoConfig"];
                    missionNamespace setVariable ["vn_ron_suppress_lastSuppressed", CBA_missionTime];
                }
            ];
            _playerObject setVariable ["vn_ron_suppressHandler", true];
        };
    }
];


// Broadcast updated "vn_ron_suppress_inContact" state only when the state changes
[{
    private _delta = missionNamespace getVariable ["vn_ron_suppress_lastSuppressed_delta", 300];
    private _newState = (vn_ron_suppress_lastSuppressed + _delta) > CBA_missionTime;
    private _previousState = missionNamespace getVariable ["vn_ron_suppress_inContact", false];
    if (_previousState isNotEqualTo _newState) then { missionNamespace setVariable ["vn_ron_suppress_inContact", _newState, true] };

}, 5, []] call CBA_fnc_addPerFrameHandler;

