if (!isServer) exitWith {};

ENDQRFSCRIPT = 0;

private _Loadout_0 = getUnitLoadout BR_AI_0;
private _Loadout_1 = getUnitLoadout BR_AI_1;
private _Loadout_2 = getUnitLoadout BR_AI_2;
private _Loadout_3 = getUnitLoadout BR_AI_3;
private _Loadout_4 = getUnitLoadout BR_AI_4;
private _Loadout_5 = getUnitLoadout BR_AI_5;
private _Loadout_6 = getUnitLoadout BR_AI_6;
private _Loadout_7 = getUnitLoadout BR_AI_7;


AIQRFSCRIPT = [_Loadout_0, _Loadout_1, _Loadout_2, _Loadout_3, _Loadout_4, _Loadout_5, _Loadout_6, _Loadout_7] spawn {

private _New_Group = ["O_Soldier_F", "O_Soldier_F", "O_Soldier_F", "O_Soldier_F", "O_Soldier_F", "O_Soldier_F"];

    while {true} do {

        if ((count units east) < 100) then {

            _PlayerArray = playableUnits;

            {
            if (!isNil _x) then {
                _PlayerArray = playableUnits - [_x];
            };
            } forEach ["Z_1", "Z_2", "PU_0", "PU_1", "PU_2", "PU_3", "PU_4"];       //units to exclude go in here

            _SqdCount = selectRandom [1, 1, 1, 1, 2, 2, 3, 3];

            for "_i" from 0 to _SqdCount do {

            _randomTarget = selectRandom _PlayerArray;

            if (ENDQRFSCRIPT == 1) then {
                systemChat "terminated AiReinforcements.sqf";
                terminate AIQRFSCRIPT;
                };

            private _randomPos_spawn = selectRandom ["Spawn_1", "Spawn_2", "Spawn_3"];

            private _randomPos_QRF = [[[getMarkerPos _randomPos_spawn, 500]], []] call BIS_fnc_randomPos;

            private _AI_Group = [_randomPos_QRF, east, _New_Group] call BIS_fnc_spawnGroup;

            {
            Z_Module addCuratorEditableObjects [[_x], true];
            _x setUnitLoadout selectRandom [_this select 0, _this select 1, _this select 2, _this select 3, _this select 4, _this select 5, _this select 6, _this select 7];
            _x setSkill ["aimingAccuracy", 0.35];
            _x setSkill ["aimingShake", 0.35];
            _x setSkill ["aimingSpeed", 0.35];
            _x setSkill ["spotDistance", 0.75];
            _x setSkill ["spotTime", 0.75];
            _x setSkill ["reloadSpeed", 0.3];
            _x setSkill ["courage", 0.75];
            _x setSkill ["commanding", 0.3];
            Z_Module addCuratorEditableObjects [[_x], true];
            } forEach units _AI_Group;

            selectRandom units _AI_Group setRank "SERGEANT";

            private _ActiveWP_1 = _AI_Group addWaypoint [position _randomTarget, 500];
            _ActiveWP_1 setWayPointType "SAD";

            private _ActiveWP_2 = _AI_Group addWaypoint [position _randomTarget, 50];
            _ActiveWP_2 setWayPointType "CYCLE";
            _ActiveWP_2 setWaypointSpeed "FULL";

            sleep 10;
            };

            sleep random [120, 300, 600];

        } else {
        sleep 10;
        };
    };
};
