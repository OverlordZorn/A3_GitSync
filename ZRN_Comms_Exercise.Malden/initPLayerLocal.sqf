["InitializePlayer", [player]] call BIS_fnc_dynamicGroups; // Initializes the player/client side Dynamic Groups framework

_nul = [] execVM "script\stations.sqf";
_nul = [] execVM "script\init_heal.sqf";

player spawn {sleep 10; [_this] execVM "script\Intro.sqf"};