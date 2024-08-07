params [
    ["_target",     objNull,    [objNull]   ]
];

if (!isServer) exitWith {};
diag_log "[CVO](debug)(fn_bigBoomPrep) INIT";

private _HandlerID = _target addEventHandler ["Dammaged", {
    params ["_vehicle", "_selection", "_damage", "_hitIndex", "_hitPoint", "_shooter", "_projectile"];

    diag_log format ['[CVO](debug)(fn_bigBoomPrep) _vehicle: %1 - _damage: %2 - _shooter: %3', _vehicle , _damage ,_shooter];

    if (_damage < 0.1) exitWith {};

    
    // creates helper object which can be deleted by zeus to stop the effects
    private _pos = getPos _vehicle;

    _pos set [2, _pos#2 + 5];
    
    private _helper = createVehicle ["Helper_Base_F", [0,0,0]];
    
    _helper setPos _pos;
    
    diag_log format ['[CVO](debug)(EventHandler) helper created: _helper: %1 - getPos _helper: %2', _helper , getPos _helper];

    [{
        params ["_vehicle", "_helper"];
        createVehicle ["Bo_GBU12_LGB", getPos _vehicle]; // Spawn bomb once globally
        [CBA_missionTime, _vehicle, _helper] remoteExecCall ["ZRN_fnc_bigBoomHMO", [0,-2] select isDedicated,_helper];
    }, [_vehicle,_helper], random 3] call CBA_fnc_waitAndExecute;

    _vehicle removeEventHandler [_thisEvent, _thisEventHandler];
}];
diag_log format ['[CVO](debug)(fn_bigBoomPrep) Eventhandler added to: %1 - _HandlerID: %2', _target  , _HandlerID];