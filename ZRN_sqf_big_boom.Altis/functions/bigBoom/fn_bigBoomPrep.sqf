params ["_target"];

if (!isServer) exitWith {};

_target addEventHandler ["Explosion", {
    params ["_vehicle", "_damage", "_source"];

    if (_damage < 0.5) exitWith {};

    _code = {
    createVehicle ["Bo_GBU12_LGB", getPos _this]; // Spawn bomb once globally
    [_this] remoteExecCall ["ZRN_fnc_bigBoomHMO", [0,-2] select isDedicated,_this];
    };
    
    [_code, _vehicle, random 5] call CBA_fnc_waitAndExecute;


    
    _vehicle removeEventHandler [_thisEvent, _thisEventHandler];
}];
