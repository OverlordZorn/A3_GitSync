/*
* Author: Zorn
* Function to define some global variables which will control some of the behaviour of this system.
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

#define DEFAULT_CLASSES ["vn_o_men_vc_local_03", "vn_o_men_vc_local_14", "vn_o_men_vc_local_09", "vn_o_men_vc_local_11", "vn_o_men_vc_local_07"]



vn_ron_interruption_enabled = true;
vn_ron_interruption_min_chance = 0.05;
vn_ron_interruption_max_chance = 0.75;

vn_ron_interruption_enemyPresence_radius = 1000;

vn_ron_interruption_enemy_classes = missionNamespace getVariable ["btc_type_units", DEFAULT_CLASSES];
vn_ron_interruption_enemy_size = [3, 10];

vn_ron_interruption_enemy_sides = [east];
vn_ron_interruption_enemy_distance = 100;

vn_ron_interruption_location_types = ["NameLocal","NameVillage"];
vn_ron_interruption_location_distance = 500;

vn_ron_suppress_lastSuppressed_delta = 300; // time in secounds - player shall not be engaged(suppressed) for atleast this time to be able to rest.