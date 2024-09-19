params ["_SDpos"];
//CUP_B_C130J_USMC
_Supply_Plane = createVehicle ["RHS_UH60M_d", [10000, 0, 1000], [], 0, "FLY"];
_SpawnPos = position _Supply_Plane;
createVehicleCrew _Supply_Plane;
_Supply_Plane setDir 45;
_Supply_Plane setVelocityModelspace [0, 100, 0];
_Supply_Plane flyinHeight 75;

private _groupCrew = group driver _Supply_Plane;

private _WP_0 = _groupCrew addWaypoint [_SDpos, 0];
_WP_0 setWayPointType "MOVE";
_WP_0 setWayPointBehaviour "CARELESS";
_WP_0 setWaypointSpeed "FULL";

private _WP_1 = _groupCrew addWaypoint [[0, 0, 0], 0];
_WP_1 setWayPointType "MOVE";
_WP_1 setWayPointBehaviour "CARELESS";
_WP_1 setWaypointSpeed "FULL";

waitUntil {sleep 0.25; (_Supply_Plane distance _SDpos) < 150};
_DropPos = getPos _Supply_Plane;
sleep 0.25;

_Supply_Crate = createVehicle ["B_CargoNet_01_ammo_F", _DropPos, [], 0, "CAN_COLLIDE"];
_Supply_Crate allowDamage false;

_Supply_Chute = createVehicle ["B_Parachute_02_F", _DropPos, [], 0, "FLY"];
_Supply_Crate attachTo [_Supply_Chute, [0, 0, -1.3]];
_Supply_Chute setVelocityModelspace [0, 0, -20];

if !(local _Supply_Crate) exitWith {};

clearWeaponCargoGlobal _Supply_Crate;
clearMagazineCargoGlobal _Supply_Crate;
clearItemCargoGlobal _Supply_Crate;
clearBackpackCargoGlobal _Supply_Crate;

{
  _Supply_Crate addWeaponCargoGlobal _x;
} forEach [["vn_m72", 3]];

{
  _Supply_Crate addMagazineCargoGlobal _x;
} forEach [["1Rnd_Smoke_Grenade_shell", 10], ["vn_40mm_m682_smoke_r_mag", 10], ["vn_40mm_m433_hedp_mag", 20], ["vn_m16_30_mag", 50], ["vn_m16_30_t_mag", 50], ["vn_m14_10_mag", 10], ["vn_m14_mag", 10], ["vn_m14_t_mag", 10], ["vn_m14_t_mag", 10], ["vn_m67_grenade_mag", 20], ["vn_40mm_m680_smoke_w_mag", 20], ["vn_m18_green_mag", 10], ["vn_m18_red_mag", 10], ["vn_m18_white_mag", 10], ["vn_m60_100_mag", 10]];
{
  _Supply_Crate addItemCargoGlobal _x;
} forEach [["ACE_fieldDressing", 40], ["ACE_packingBandage", 40], ["ACE_elasticBandage", 40], ["ACE_tourniquet", 10], ["ACE_splint", 10], ["ACE_morphine", 20], ["ACE_epinephrine", 20], ["ACE_bloodIV", 10], ["ACE_bloodIV_500", 10], ["ACE_personalAidKit", 10]];

_smoke = createVehicle ["SmokeShellYellow", [0,0,0], [], 0 , ""];
_smoke attachTo [_Supply_Crate, [0,0,0.5]];

waitUntil {position _Supply_Crate select 2 < 0.5 || isNull _Supply_Chute};
_Supply_Crate allowDamage true;


if (isNull _smoke) then {
_smoke = createVehicle ["SmokeShellYellow", [0,0,0], [], 0 , ""];
_smoke attachTo [_Supply_Crate, [0,0,0.5]];
};

detach _Supply_Crate;

waitUntil {sleep 1; (_Supply_Plane distance [0, 0, 0]) < 300};
deleteVehicleCrew _Supply_Plane;
deleteVehicle _Supply_Plane;

if (isNull _Supply_Plane) exitWith {};