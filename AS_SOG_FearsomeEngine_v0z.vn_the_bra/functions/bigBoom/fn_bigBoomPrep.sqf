params [
    ["_target",     objNull,    [objNull]   ]
];

if (!isServer) exitWith {};

private _array = missionNamespace getVariable ["cvo_bigBoom_array", []];
_array pushBackUnique _target;
missionNamespace setVariable ["cvo_bigBoom_array", _array];

diag_log format ['[CVO](debug)(fn_bigBoomPrep) cvo_bigBoom_array updated: %1', cvo_bigBoom_array];

private _ehID = missionNamespace getVariable ["cvo_bigBoom_EH_ID", "404"];

if (_ehID isEqualTo "404") then {

    _ehID = addMissionEventHandler ["EntityKilled", {
        params ["_unit", "_killer", "_instigator", "_useEffects"];

        if (!(_unit in cvo_bigBoom_array)) exitWith {};

            private _pos = getPos _unit;
            _pos set [2, _pos#2 + 5];
            private _helper = createVehicle ["Helper_Base_F", [0,0,0]];
            _helper setPos _pos;
            diag_log format ['[CVO](debug)(EventHandler) EH Triggered - Bomb Dropped: _helper: %1 - getPos _helper: %2', _helper , getPos _helper];

            [{
                params ["_unit", "_helper"];
                createVehicle ["Bo_GBU12_LGB", getPos _unit]; // Spawn bomb once globally
                [CBA_missionTime, _unit, _helper] remoteExecCall ["ZRN_fnc_bigBoomHMO", [0,-2] select isDedicated,_helper];
            }, [_unit,_helper], random 3] call CBA_fnc_waitAndExecute;

    }];
    diag_log format ['[CVO](debug)(fn_bigBoomPrep) Eventhandler created - ID: %1', _ehID];
};
missionNamespace setVariable ["cvo_bigBoom_EH_ID", _ehID];

