if (isServer) then {

    private _array = [];

    for "_i" from 0 to 6 do {
        _varName = ["fuel",_i] joinString "_";
        
        if (isNil _varName) then { continue };
        _array pushback (missionNamespace getVariable [_varName,objNull]);
    };

    { [_x] call ZRN_fnc_bigBoomPrep; } forEach _array;
};
