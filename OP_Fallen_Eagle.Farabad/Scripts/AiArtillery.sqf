_Arty_R = [AI_ART_0, AI_ART_1, AI_ART_2];

if (!isServer) exitWith {};

While {alive AI_ART_0 || alive AI_ART_1 || alive AI_ART_2} do 
{   

    _ArtyChance = 0;
    _ArtyChance = selectRandom [0, 1, 1];

    call HM_fnc_ArtilleryTarget params ["_hasValidTarget","_validTargetPos"];

    if (_hasValidTarget) then {

        if (_ArtyChance == 1) then {

        _FirePos = [[[_validTargetPos, random 300]],[]] call BIS_fnc_randomPos;
        //[[["FALCON 1", "Artillery smoke markers have been spotted. Proceed with caution.", 0]], BIS_fnc_EXP_camp_playSubtitles] remoteExec ["spawn", EAST];
        ["FALCON 1", "Artillery smoke markers have been spotted. Proceed with caution."] spawn BIS_fnc_showSubtitle;
        ["ArtyCall"] remoteExec ["playSound", 0];

        for "_i" from 0 to selectRandom [3, 4, 5] do {

        _rnd_pos_temp = [[[_FirePos, random 75]],[]] call BIS_fnc_randomPos;
        _smoke = createVehicle ["SmokeShellRed", _rnd_pos_temp, [], 0 , ""];
        _smoke setPos [getPos _smoke select 0, getPos _smoke select 1, (getPos _smoke select 2) + 100 + random 200];
        sleep 3 + random 2;

        };

        _FireMarker = createMarkerLocal ["ArtyPos", _FirePos];
        "ArtyPos" setMarkerType "loc_destroy";
        "ArtyPos" setMarkerColorLocal "ColorRed";
        "ArtyPos" setMarkerText "Estimated Impact Area";
        "ArtyPos" setMarkerPos _FirePos;
        sleep random [10, 20, 30];

        {    
            _x doArtilleryFire [_FirePos, "vn_cannon_m101_mag_he_x8", 2];
            sleep 2 + random 2;
        } forEach _Arty_R;

        {    
            _x doArtilleryFire [_FirePos, "vn_cannon_m101_mag_he_x8", 2];
            sleep 2 + random 2;
        } forEach _Arty_R;

        {_x setVehicleAmmo 1} forEach _Arty_R;

        sleep 60;
        deleteMarker "ArtyPos";
        sleep random [300, 600, 900];
        } else {

            sleep random [180, 360, 540];

        };

    } else {
        sleep 3;
    };
};