params ["_pos"];

private _varName = ["ZRN","HMO","lightsource",_pos#0,_pos#1,_pos#2] joinString "_";

private _hashMapObject = createHashMapObject [[
    ["varName", _varName],

    ["isActive", true],

    ["lightSourceObj", createVehicleLocal ["#lightpoint", _pos]],

    ["red_max", 0.9],
    ["red_min", 0.8],

    ["green_max", 0.25],
    ["green_min", 0.1],

    ["blue_max", 0.07],
    ["blue_min", 0.0],

    ["Intensity_max", 10000000],
    ["Intensity_min", 50000],

    ["value", 1],

	["#flags", ["sealed","unscheduled","noCopy"]],

	["#delete", { deleteVehicle (_self get "lightSourceObj"); }],

    ["#create", {
        private _light = _self get "lightSourceObj";

        _light setLightUseFlare true;
        _light setLightFlareSize 16;
        _light setLightFlareMaxDistance 2000;
        _light setLightDayLight true;
        _self call ["Meth_apply"];
        [{_this call ["Meth_iteration"]}, _self] call CBA_fnc_execNextFrame;
    }],

	["Meth_iteration", {
        if (!(_self get "isActive")) exitWith { missionNamespace setVariable [(_self get "varName"), nil] };
        _self call ["Meth_newValue"];
        _self call ["Meth_apply"];
        [{_this call ["Meth_iteration"]}, _self,(1/10)] call CBA_fnc_waitAndExecute;
    }],

    ["Meth_apply", {
        private _light = _self get "lightSourceObj";

        _light setLightIntensity (linearConversion [0,1,_self get "value",_self get "Intensity_min",_self get "Intensity_max",true]);
        _light setLightColor [
            linearConversion [0,1,_self get "value",_self get "red_min",_self get "red_max",true],
            linearConversion [0,1,_self get "value",_self get "green_min",_self get "green_max",true],
            linearConversion [0,1,_self get "value",_self get "blue_min",_self get "blue_max",true]
        ];
        _light setLightAmbient [
            linearConversion [0,1,_self get "value",_self get "red_max",_self get "red_min",true],
            linearConversion [0,1,_self get "value",_self get "green_max",_self get "green_min",true],
            linearConversion [0,1,_self get "value",_self get "blue_max",_self get "blue_min",true]
        ];
    }],

    ["Meth_newValue",{  // could be better, less random +-, more
        private _value = _self get "value";
        _value = _value + (selectRandom[-1,1] * random 0.1);
        _value = _value min 1 max 0; 
        _self set ["value", _value];
    }]
]];

missionNamespace setVariable [_varName, _hashMapObject];

_varName
