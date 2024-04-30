if (isServer) then {

    for "_i" from 0 to 6 do {
        _varName = ["fuel",_i] joinString "_";
        
        if (isNil _varName) then { continue };
        FuelStorageArray pushback (missionNamespace getVariable [_varName,objNull]);
    };

    { [_x] call ZRN_fnc_bigBoomPrep; } forEach FuelStorageArray;
};
