params [
    ["_target",     objNull,    [objNull]   ]
];

if (!isServer) exitWith {};

_target addEventHandler ["Explosion", {
    params ["_vehicle", "_damage", "_source"];

    diag_log format ['[CVO](debug)(fn_bigBoomPrep) _vehicle: %1 - _damage: %2 - _source: %3', _vehicle , _damage ,_source];

    if (_damage < 0.3) exitWith {};
    
    
    // creates helper object which can be deleted by zeus to stop the effects
    private _pos = getPos _vehicle;
    _pos set [2, _pos#2 + 5];
    private _helper = createVehicle ["Helper_Base_F", [0,0,0]];
    _helper setPos _pos;
    diag_log format ['[CVO](debug)(fn_bigBoomPrep) helper created: _helper: %1 - getPos _helper: %2', _helper , getPos _helper];

    [{
        params ["_vehicle", "_helper"];
        createVehicle ["Bo_GBU12_LGB", getPos _vehicle]; // Spawn bomb once globally
        [CBA_missionTime, _vehicle, _helper] remoteExecCall ["ZRN_fnc_bigBoomHMO", [0,-2] select isDedicated,_helper];
    }, [_vehicle,_helper], random 3] call CBA_fnc_waitAndExecute;

    _vehicle removeEventHandler [_thisEvent, _thisEventHandler];
}];
