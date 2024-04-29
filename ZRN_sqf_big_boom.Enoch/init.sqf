if (isServer) then {

    FuelStorageArray = [];

    for "_i" from 1 to 20 do {
        _varName = ["fuel",_i] joinString "_";
        if (isNil _varName) then { continue };
        FuelStorageArray pushback (missionNamespace getVariable [_varName,objNull]);
    };

    { [_x] call ZRN_fnc_bigBoomPrep; } forEach FuelStorageArray;
};
