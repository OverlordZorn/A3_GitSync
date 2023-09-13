////////////////////////// CREATE ARSENAL

// Creates the Ace Virtual Arsenal and Adds the Basics Arrays

if (count CVO_arsenal_boxes isEqualTo 0) exitWith {};
{
	[_x, false, false] 			call ace_arsenal_fnc_initBox;				// Initialises ACE Arsenal on boxes
	[_x, CVO_A_Basic, false] 	call ace_arsenal_fnc_addVirtualItems;		// Adds the basic list to the arsenal
} forEach CVO_arsenal_boxes;


////////////////////////// DEFINE ROLE KIT
private _roleKit = [];



/*
if (player getVariable ["CBRN",false]) then {
	_roleKit append CVO_A_CBRN;
};
*/



{[_x, _roleKit, false] call ace_arsenal_fnc_addVirtualItems;} forEach CVO_arsenal_boxes;



////////////////////////// DEFINE PERSONAL KIT
// TBA

if (getPlayerUID player isEqualTo "_SP_PLAYER_") exitWith {
	systemChat "_SP_PLAYER_ detected"};



private _customKit = []; 

_VDV_Hats = [
	"rhs_beret_vdv1",
	"rhs_beret_vdv2",
	"rhs_beret_vdv3",
	"rhs_beret_vdv_early"
];

private _customKit = []; 

if (getPlayerUID player isEqualTo "76561198147307775") then { // Clone
	_customKit append _VDV_Hats;
};


if (getPlayerUID player isEqualTo "76561197970306509") then { // Zorn
	_customKit append _VDV_Hats;
};

{[_x, _customKit, false] call ace_arsenal_fnc_addVirtualItems;} forEach CVO_arsenal_boxes;
