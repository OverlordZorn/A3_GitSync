/*---------------------------------------------------------------------------
The code in this file is executed only on server when mission is started.
In most cases global functions should be called here and not in the objects init field.

For more info see https://community.bistudio.com/wiki/Event_Scripts#initServer.sqf
---------------------------------------------------------------------------*/

/*---------------------------------------------------------------------------
You can use functions AET_fnc_disableLayerAI to disable AI of units in a whole layer.
-----------------------------------------------------------------------------
    Example:
        ["Ambush Layer", "PATH"] call AET_fnc_disableLayerAI;
        ["Layer 1", "TARGET"] call AET_fnc_disableLayerAI;
*/

/*---------------------------------------------------------------------------
You can use functions AET_fnc_enableLayerAI to enable AI of units in a whole layer.
-----------------------------------------------------------------------------
    Example:
	["Ambush Layer", "PATH"] call AET_fnc_enableLayerAI;
	["Layer 1", "TARGET"] call AET_fnc_enableLayerAI;
*/

/*---------------------------------------------------------------------------
Example for executing commands on layer entities.
-----------------------------------------------------------------------------
    private _layer_1 = (getMissionLayerEntities "Town") select 0;
    {
        _x allowDamage false;
    } forEach _layer_1;
*/

/*---------------------------------------------------------------------------
Example of executing a command on every element in an array.
_x is the element of an array.
-----------------------------------------------------------------------------
    _array = [heli_1, heli_2, heli_3];
    {
        _x allowDamage true;
    } forEach _array;
*/

["Initialize", [true]] call BIS_fnc_dynamicGroups;

    private _layer_Garrison = (getMissionLayerEntities "IA_Garrison") select 0;
    {
        _x disableAI "PATH";
    } forEach _layer_Garrison;

    [USP_0, true] call ace_medical_fnc_setUnconscious;

//execVM "Scripts\AiCombatRoutine.sqf";
execVM "Scripts\AiReinforcements.sqf";
execVM "Scripts\AiReinfVics.sqf";

[] spawn {
    waituntil {sleep 1; !alive AA_1};
    "AA_01" setMarkerAlpha 0;
};
[] spawn {
    waituntil {sleep 1; !alive AA_2};
    "AA_02" setMarkerAlpha 0;
};

if (!isNil "PU_0") then {
[] spawn {
    while {isNull objectParent PU_0} do {sleep 1};
    sleep 10;
    if (!isNil "PU_1") then {
    ["SHOWTIME"] remoteExec ["playsound", [PU_0, PU_1]];
    ["SHOWTIME"] remoteExec ["playsound", [PU_0, PU_1]];
    } else {
    ["SHOWTIME"] remoteExec ["playsound", PU_0];
    ["SHOWTIME"] remoteExec ["playsound", PU_0];
    };
};
};

if (!isNil "PU_3") then {
[] spawn {
    while {isNull objectParent PU_3} do {sleep 1};
    sleep 10;
    if (!isNil "PU_4") then {
    ["SHOWTIME"] remoteExec ["playsound", [PU_3, PU_4]];
    ["SHOWTIME"] remoteExec ["playsound", [PU_3, PU_4]];
    } else {
    ["SHOWTIME"] remoteExec ["playsound", PU_3];
    ["SHOWTIME"] remoteExec ["playsound", PU_3];
    };
};
};