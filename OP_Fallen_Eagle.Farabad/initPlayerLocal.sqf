/*---------------------------------------------------------------------------
Title
	The code in this file is executed locally when player joins mission.
	For more info see https://community.bistudio.com/wiki/Event_Scripts#initPlayerLocal.sqf
	
	Parameters:
	0. OBJECT: the player's object
	1. BOOL: if the player Joins In Progress, the parameter returns true, otherwise false
---------------------------------------------------------------------------*/
params ["_player", "_jip"];

#include "AET_scripts\AET_initPlayerLocal.sqf";
#include "AET_scripts\AET_diary.sqf";
#include "AET_scripts\AET_disclaimer.sqf";

if (!didJIP) then {
	#include "AET_scripts\AET_equipment.sqf";
};

"ColorCorrections" ppEffectEnable true; 
"ColorCorrections" ppEffectAdjust [0.88, 0.88, 0, [0.2, 0.29, 0.2, -0.1], [1, 1, 1, 1.3], [0.15, 0.09, 0.09, 0.0]]; 
"ColorCorrections" ppEffectCommit 0;

[] call HM_fnc_CallSupplydrop;