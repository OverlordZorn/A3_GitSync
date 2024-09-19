//if (!isServer) exitWith {};
ENDQRFVICSCRIPT = 0;

private _Loadout_0 = getUnitLoadout BR_AI_1;

QRFSQFVIC = [_Loadout_0] spawn {

while {true} do {

    if (ENDQRFVICSCRIPT == 1) then {
    systemChat "terminated AiReinfVics.sqf";
    terminate QRFSQFVIC;
    };

    
            {
            if (!isNil _x) then {
                _PlayerArray = playableUnits - [_x];
            };
            } forEach ["Z_1", "Z_2", "PU_0", "PU_1", "PU_2", "PU_3", "PU_4"];       //units to exclude go in here

    _VicCount = selectRandom [1, 1, 1, 2, 2, 2, 3, 3];

    for "_i" from 0 to _VicCount do {

    private _Sel_Vic = selectRandom ["vn_i_wheeled_m151_mg_06_rla", "vn_i_wheeled_m151_mg_01_rla", "vn_i_wheeled_m151_mg_01_rla", "vn_i_wheeled_m151_mg_02_rla", "vn_i_wheeled_m151_mg_02_rla"];
    private _randomPos_spawn = selectRandom ["Spawn_5", "Spawn_4"];
    private _randomPos_QRF = [[[getMarkerPos _randomPos_spawn, 0]], []] call BIS_fnc_randomPos;
    _New_Vic = _Sel_Vic createVehicle _randomPos_QRF;

    createVehicleCrew _New_Vic;
    clearWeaponCargoGlobal  _New_Vic; 
    clearMagazineCargoGlobal  _New_Vic; 
    clearItemCargoGlobal  _New_Vic;

    {

        Z_Module addCuratorEditableObjects [[_x], true];
        _x setUnitLoadout selectRandom [_this select 0];

    } forEach crew _New_Vic;

    crew _New_Vic join createGroup east;

    Z_Module addCuratorEditableObjects [[_New_Vic], true];

    {
        //_x setFace "PersianHead_A3_01";
        if (isServer) then { [_x , "PersianHead_A3_01"] remoteExec ["setFace", 0, _x] };
        _x setSpeaker "Male02PER";
        _x setSkill ["aimingAccuracy", 0.35];
        _x setSkill ["aimingShake", 0.35];
        _x setSkill ["aimingSpeed", 0.35];
        _x setSkill ["spotDistance", 0.75];
        _x setSkill ["spotTime", 0.75];
        _x setSkill ["reloadSpeed", 0.3];
        _x setSkill ["courage", 0.75];
        _x setSkill ["commanding", 0.75];
    } forEach crew _New_Vic;

    _PlayerArray = playableUnits;

    if (!isNil "Z_0") then {
        _PlayerArray = playableUnits - [Z_0];
    };

    if (!isNil "Z_1") then {
        _PlayerArray = playableUnits - [Z_1];
    };

    _randomTarget = selectRandom _PlayerArray;

    private _ActiveWP = group (crew _New_Vic select 1) addWaypoint [position _randomTarget, 500];
    _ActiveWP setWayPointType "SAD";
    _ActiveWP setWayPointBehaviour "COMBAT";
    sleep 30;
    };

    sleep random [30, 240, 480];
    };

};
