enableSaving [false, false];

removeAllActions player;

waitUntil {!isNull player};

createCenter east;
createCenter west;

TrainingCourse_TargetList = [];
TrainingCourse_BulletPathTracing = false;
TrainingCourse_BulletCamera = false;
TrainingCourse_BulletCameraAbort = false;

TrainingCourse_ShotsFired = 0;
TrainingCourse_TargetsHit = 0;
TrainingCourse_AverageDistance = 0;
TrainingCourse_AverageTargetScore = 0;
TrainingCourse_AverageImpactDeviation = 0;

setWind [random 4, random 4, true];

player addaction [("<t color=""#BBBBBB"">" + "Check Impact" + "</t>"), "fnc_check_impact.sqf", "", 0, false, false];


player addaction [("<t color=""#CCAA44"">" + "Toggle Bullet Path Tracing" + "</t>"), "fnc_toggle_path_tracing.sqf", "", 0, false, false];
player addaction [("<t color=""#CCAA44"">" + "Toggle Bullet Camera" + "</t>"), "fnc_toggle_bullet_camera.sqf", "", 0, false, false];

//player addaction [("<t color=""#AA9977"">" + "King of the hill" + "</t>"), "fnc_king_of_the_hill.sqf", "", 0, false, false];

player addEventHandler ["fired", {_this execVM "fnc_bullet_trace.sqf"}];
player addEventHandler ["fired", {_this execVM "fnc_bullet_camera.sqf"}];
Projectile_Impact_Aux = "Sign_Sphere10cm_F" createVehicle [0,0,0];


	


