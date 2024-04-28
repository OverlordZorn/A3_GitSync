if (isServer) then {

    FuelStorageArray = [];
    for "_i" from 1 to 20 do {
        _varName = ["fuel",_i] joinString "_";
        if (isNil _varName) exitWith {};
        FuelStorageArray pushback (missionNamespace getVariable [_varName,objNull]);
    };

    {
        private _object = _x;
        diag_log  "forEachFuelStorageArray";
        _object addEventHandler ["Explosion", {
            	params ["_vehicle", "_damage", "_source"];
            if (_damage > 0.5) then {
            
                createVehicle ["Bo_GBU12_LGB", getPos _vehicle]; // Spawn bomb once globally
                [_vehicle] remoteExecCall ["ZRN_fnc_bigBoomObj", 0,false];
                
                _vehicle removeEventHandler [_thisEvent, _thisEventHandler];
            };
        }];
    } forEach FuelStorageArray;
};
