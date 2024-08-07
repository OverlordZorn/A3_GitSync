if (isServer) then {

    private _array = [];

    for "_i" from 0 to 2 do {
        private _varName = ["fuel",_i] joinString "_";
        
        if (isNil _varName) then { 
            diag_log format ['[CVO](debug)(fn_bigBoomInit)[ERROR] _varName is Nil!: %1', _varName];
            continue
        };
        _array pushback (missionNamespace getVariable [_varName,objNull]);
    };

    diag_log format ['[CVO](debug)(fn_bigBoomInit) _array: %1', _array];

    { [_x] call ZRN_fnc_bigBoomPrep; } forEach _array;
};