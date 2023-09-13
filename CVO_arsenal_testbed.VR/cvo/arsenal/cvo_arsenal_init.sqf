// Define Global Variables
// Array of Objects the CVO_Arsenal should be acessible from 
CVO_arsenal_boxes 		= [
	CVO_arsenal
	];

// Primes the Arsenal Box Attributes - Only needs to be done once initially.
if (0 < count CVO_arsenal_boxes) then {
	{
		[_x, false] 				call ace_dragging_fnc_setDraggable;			// Disables Dragging
		[_x, false] 				call ace_dragging_fnc_setCarryable;			// Disables Carrying
		[_x, -1] 					call ace_cargo_fnc_setSize;					// Disables Ace Cargo Loading
		_x setVariable ["ace_cargo_noRename", true];							// Disables Ace Cargo Renaming
	} forEach CVO_arsenal_boxes;
};

// #####################################################
// Functions
// #####################################################

cvo_A_fnc_update = 		compileScript ["cvo\arsenal\cvo_arsenal_fnc_update.sqf", 	false, ""];


// adds Paperwork Interaction
	[compileScript ["cvo\arsenal\cvo_arsenal_paperwork.sqf"]] call CBA_fnc_directCall;

// set default loadout at spawn
	[] spawn {
		if (!hasInterface) exitWith {};
		sleep 20;
		player setVariable ["CVO_Loadout", getUnitLoadout player];
		diag_log ("[CVO] [LOADOUT] - " + str player + " - Loadout saved"); 
	};

//// This really needs to be in initPlayerLocal.sqf for JIP

/* 
//// doesnt really seem to work ->>>> instead USE onPlayerResapwn.sqf

// adds EH when respawning, using the previously saved loadout  
player addEventHandler ["Respawn", {
	params ["_unit", "_corpse"]; 
	player setUnitLoadout (player getVariable ["CVO_Loadout", []]);
	diag_log ("[CVO] [LOADOUT] - " + str player + " - Loadout loaded"); 
}];                                 
*/

//// Adds EVENT HANDLERS
	// ARESENAL CLOSED - Save Loadout
		["ace_arsenal_displayClosed", {
			player setVariable ["CVO_Loadout", getUnitLoadout player];
			diag_log ("[CVO] [LOADOUT] - " + str player + " - Loadout saved");
		}] call CBA_fnc_addEventHandler;      

	// ARSENAL OPENED - update
		["ace_arsenal_displayOpened", {
			//
			//
		}] call CBA_fnc_addEventHandler;




// #####################################################
// ###### MEDICAL TAB

	private _medicalTab = [
		"ACE_quikclot", "ACE_packingBandage","ACE_elasticBandage", "ACE_fieldDressing",
		"ACE_tourniquet", "ACE_splint",
		"ACE_morphine","ACE_epinephrine", "ACE_adenosine", 
		"ACE_salineIV", "ACE_salineIV_500","ACE_salineIV_250",
		"ACE_plasmaIV","ACE_plasmaIV_500","ACE_plasmaIV_250",
		"ACE_bloodIV","ACE_bloodIV_500","ACE_bloodIV_250",
		"ACE_personalAidKit","ACE_bodyBag",
		"ACE_surgicalKit","ACE_suture"
	];
	[_medicalTab, "Medical", getMissionPath "\cvo\img\whiteCrystal.paa"] call ace_arsenal_fnc_addRightPanelButton;
	diag_log "[CVO] [ARSENAL] - Medical Tab Applied";

// #####################################################




diag_log ("[CVO] [LOADOUT] - " + str player + " - init completed");