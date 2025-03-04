/*
* Author: Zorn
* Function
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


params ["_pos"];

/*
// Condition for the ACE ACTION
// Request can only be made by the SL

// Current Daytime between Sunset and Sunrise
[] call vn_ron_fnc_isNight
*/

private _canRON = true;

// CONDITION CHECK DURING EXECUTION

// Didnt got interrupted recently....
if ( missionNamespace getVariable ["vn_ron_suppress_gotInterrupted", false] isEqualTo true ) exitWith { systemChat "Make sure there is no threat first!"; false };

// Didnt RON recently....
if ( missionNamespace getVariable ["vn_ron_suppress_didRONRecently", false] isEqualTo true ) then { _canRON = false; systemChat "You already did RON!" };


// Not in contact (based on suppressed Eventhandler)
if ( missionNamespace getVariable ["vn_ron_suppress_inContact", false] isEqualTo true ) then { _canRON = false; systemChat "You're not sure, if you were able to shake the enemies" };

// Distance from nearest village > 500 "NameLocal","NameVillage"
if (count (nearestLocations [_pos, vn_ron_interruption_location_types, vn_ron_interruption_location_distance]) != 0) then { _canRON = false; systemChat "You're too close to a village" };


// All Squadmembers( or all players? what about zeus? What about ded people at base?) need to be within 50m of the RON Site.
private _allPlayers = call BIS_fnc_listPlayers select { _x distance2D (getMarkerPos "btc_base") > 1000 } select { (_x distance2D _pos) > 25 };
if (count ( _allPlayers ) != 0) then {
    _canRON = false;
    systemChat format ["The following players are to far away from the RON Site: %1", _allPlayers apply { name _x } joinString ", "];
};

// Check for enemies nearby
if ( count ( [_pos, vn_ron_interruption_enemy_sides, vn_ron_interruption_enemy_distance ] call vn_ron_fnc_nearbyUnits ) != 0 ) then {
    _canRON = false;
    systemChat "You dont feel safe here...";
};

if (_canRON) then { systemChat "Starting RON soon..." };

_canRON
