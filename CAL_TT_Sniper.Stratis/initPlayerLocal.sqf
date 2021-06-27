player setVariable ["TAG_LoadoutStart", getUnitLoadout player];

["InitializePlayer", [player]] call BIS_fnc_dynamicGroups; // Initializes the player/client side Dynamic Groups framework

_nul = [] execVM "script\init_heal.sqf";
