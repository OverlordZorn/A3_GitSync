["InitializePlayer", [player]] call BIS_fnc_dynamicGroups; // Initializes the player/client side Dynamic Groups framework

_nul = [] execVM "script\phones.sqf";
_nul = [] execVM "script\init_heal.sqf";

player spawn {sleep 5; [_this] execVM "script\Intro.sqf"};