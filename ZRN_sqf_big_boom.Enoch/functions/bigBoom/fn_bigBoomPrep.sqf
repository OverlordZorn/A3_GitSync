params ["_target"];

if (!isServer) exitWith {};

_target addEventHandler ["Explosion", {
    params ["_vehicle", "_damage", "_source"];

    if (_damage < 0.5) exitWith {};

    createVehicle ["Bo_GBU12_LGB", getPos _vehicle]; // Spawn bomb once globally
    [_vehicle] remoteExecCall ["ZRN_fnc_bigBoomObj", 0,false];
    
    _vehicle removeEventHandler [_thisEvent, _thisEventHandler];
}];
