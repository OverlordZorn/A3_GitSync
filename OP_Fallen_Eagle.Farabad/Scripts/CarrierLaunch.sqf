/*
["CRW_S_1", "CAT_1"] spawn {
private _shooter = _this select 0;
private _catapult = _this select 1;
_shooter switchMove "Acts_JetsShooterIdle"; 
private _nearestJet = nearestObjects [position _shooter, "Plane"];
waitUntil {sleep 1; _nearestJet distance _shooter =< 1};
_shooter playMove "Acts_JetsShooterShootingReady_in";
_shooter playMove "Acts_JetsShooterShootingReady_loop";
_pilot = driver _nearestJet;
waitUntil {sleep 1; _pilot getVariable "carrierCatapultAttached" == "true"};
_shooter playMove "Acts_JetsShooterShootingReady_pointing"; 
_shooter playMove "Acts_JetsShooterShootingLaunch_in"; 
_shooter playMove "Acts_JetsShooterShootingLaunch_loop";
_shooter playMove "Acts_JetsShooterShootingLaunch_out";
_shooter playMove "Acts_JetsShooterIdle"; 
_shooter switchMove "Acts_JetsShooterIdle";


};
*/
//player getVariable "carrierCatapultState";
CATLAUNCHTEST = [CRW_S_2, CAT_2] spawn {

    private _shooter = _this select 0;
    private _catapult = _this select 1;

    private _nearestJet = nearestObject [position _catapult, "Plane"];
    private _pilot = driver _nearestJet;


    //if !(_pilot getVariable "carrierCatapultAttached" ==  false && _pilot getVariable "carrierCatapultState" == -1) then {

            _shooter playMove "Acts_JetsShooterShootingReady_in";
            _shooter playMove "Acts_JetsShooterShootingReady_pointing"; 
            _shooter playMove "Acts_JetsShooterShootingLaunch_in"; 
            _shooter playMove "Acts_JetsShooterShootingLaunch_loop";
            _shooter playMove "Acts_JetsShooterShootingLaunch_out";
            _shooter playMove "Acts_JetsShooteridle";


};//spawn