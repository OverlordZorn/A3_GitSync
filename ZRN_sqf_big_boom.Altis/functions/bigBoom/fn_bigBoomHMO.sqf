params [
    [ "_fuelTank", objNull, [objNull]   ],
    ["_startTime", 0,       [0]         ]   // CBA_missionTime
 ];


if (_fuelTank isEqualTo objNull) exitWith {};

enableCamShake true; 

private _pos = getPos _fuelTank;
private _radius = boundingBoxReal _fuelTank # 2 * 0.4;

private _varName = ["ZRN","fuelTank","HMO",_pos#0,_pos#1,_pos#2] joinString "_";

private _HashMapObject = createHashMapObject [[

    ["varName", _varName],

    ["startTime", _startTime],
    ["intensity", 1],

	["#flags", ["sealed","unscheduled","noCopy"]],

    ["fuelTank", _fuelTank],
    ["pos", _pos],
    ["radius", _radius],

    ["src_fire", objNull],
    ["src_smoke", objNull],
    ["src_light", objNull],

    ["fire_min", 0.25],
    ["fire_max", 0.01],
    ["fire_rate", 60],

    ["smoke_min", 0.25],
    ["smoke_max", 0.1],
    ["smoke_rate", 60],

    ["light_max", 10000000],
    ["light_min", 10000],
    ["light_rate", 0.1],

    ["red_max", 0.9],
    ["red_min", 0.8],

    ["green_max", 0.25],
    ["green_min", 0.1],

    ["blue_max", 0.07],
    ["blue_min", 0.0],

    ["Execute_Shockwave",{

        if (cba_missionTime - (_self get "startTime") > 10) exitWith {};

        private _pos = (_self get "pos");
        private _distance = player distance _pos;
        [{
            params ["_distance","_pos"];
            _intensity = linearConversion[0,2000,_distance,10,2];
            _duration = linearConversion[0,2000,_distance,10,2];
            addCamShake [_intensity, 5, _duration];


            if  (_distance > random 1000 ) then {

                private _forceMultiplyer = linearConversion [0, 500, _distance, 3000, 300];
                private _force = _pos vectorFromTo getPos player vectorMultiply _forceMultiplyer;
                _force set [2, _force#2 + 500];

                player allowDamage false;
                player addForce [_force, [0,0,1]];

                [{(animationState _this) find "ace_medical_engine_uncon_anim_face" != -1}, {
                	[{
                		_this setUnconscious false;
                		_this allowDamage true;
                	}, _this, 2] call CBA_fnc_waitAndExecute;
                }, _unit, 20] call CBA_fnc_waitUntilAndExecute;

            };
        }, [_distance, _pos], 0.01 + _distance / 343 ] call CBA_fnc_waitAndExecute;


    }],

	["#delete", {
        deleteVehicle (_self get "src_fire");
        deleteVehicle (_self get "src_smoke");
        deleteVehicle (_self get "src_light");
    }],

    ["#create", {
        _self call ["Establish_EH"];
        
        _self call ["Start_Fire"];
        _self call ["Start_Light"];
        
        _self call ["Start_Smoke"];
    }],

    ["Start_Fire", {
        private _radius = _self get "radius";
        private _pos = + _self get "pos";
        _pos set [2, _pos#2 + _radius*0.75];

        _src_fire = createVehicleLocal ["#particlesource", _pos];
        _src_fire setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal.p3d",16,2,80,0],"","Billboard",1,5,[0,0,0],[0,0,2.5],0,1,1,0.01,[5,8],[[1,1,1,-20],[1,1,1,-15],[1,1,1,-10],[1,1,1,-6],[1,1,1,-2]],[0.25],0.2,0.1,"","","",0,false,0,[[0,0,0,0]],[0,1,0]];
        _src_fire setParticleRandom [0.3,[5,5,6],[2,2,2],25,0.4,[0,0,0,0.3],0.2,0.05,1,0];
        _src_fire setParticleCircle [(_radius *0.5),[0,0,5]];
        _src_fire setDropInterval 0.01;

        _self set ["src_fire", _src_fire];
    }],


    ["Update_Fire", {
        _self call ["Update_Value"];
        private _intensity = _self get "intensity";
        private _src_fire = _self get "src_fire";

        _src_fire setDropInterval linearConversion[0,1,_intensity, _self get "fire_min", _self get "fire_max"];

        private _code = {
            params ["_varName"];
            _hmo = missionNamespace getVariable [_varName, "404"];
            if (_hmo isEqualTo "404") exitWith {};
            _hmo call ["Update_Fire"];
        };      
        [_code, [_self get "varName"], _self get "fire_rate"] call CBA_fnc_waitAndExecute;        
    }],

    ["Start_Light", {
        private _radius = _self get "radius";
        private _pos = + _self get "pos";
        _pos set [2, _pos#2 + _radius*0.75];

        _src_light = createVehicleLocal ["#lightpoint", _pos];
        _src_light setLightUseFlare true;
        _src_light setLightFlareSize 16;
        _src_light setLightFlareMaxDistance 2000;
        _src_light setLightDayLight true;

        _self set ["src_light", _src_light];
    }],

    ["Update_Light", {
        _self call ["Update_Value"];
        private _src_light = _self get "src_light";
        private _intensity = _self get "intensity";
        _intensity = _intensity + _intensity * random 0.2;

        _src_light setLightIntensity (linearConversion [0,1,_intensity,_self get "Intensity_min",_self get "Intensity_max",false]);
        _src_light setLightColor [
            linearConversion [0,1,_intensity,_self get "red_max",_self get "red_min",true],
            linearConversion [0,1,_intensity,_self get "green_min",_self get "green_max",true],
            linearConversion [0,1,_intensity,_self get "blue_min",_self get "blue_max",true]
        ];
        _src_light setLightAmbient [
            linearConversion [0,1,_intensity,_self get "red_max",_self get "red_min",true],
            linearConversion [0,1,_intensity,_self get "green_max",_self get "green_min",true],
            linearConversion [0,1,_intensity,_self get "blue_max",_self get "blue_min",true]
        ];


        private _code = {
            params ["_varName"];
            _hmo = missionNamespace getVariable [_varName, "404"];
            if (_hmo isEqualTo "404") exitWith {};
            _hmo call ["Update_Light"];
        };      
        [_code, [_self get "varName"], _self get "light_rate"] call CBA_fnc_waitAndExecute;
    }],


    ["Start_Smoke", {
        private _radius = _self get "radius";
        private _pos = + _self get "pos";
        _pos set [2, _pos#2 + _radius*0.75];

        _src_smoke = createVehicleLocal ["#particlesource", _pos];
        _src_smoke setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal_02.p3d",8,0,40,1],"","Billboard",1,20,[0,0,10],[-1,-1,1],-2.5,1,1,0.015,[15,15,25,15],[[0.261772,0.149282,0.0973639,0.403105],[0.195432,0.0973639,0.0858262,0.844411],[0,0,0,0.945364],[0,0,0,0.108901]],[0.1,0,0,0],2,1,"","","",0,false,0,[[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0]],[0,1,0]];
        _src_smoke setParticleRandom [5,[0,0,0],[2,2,0.5],5,0,[0,0,0,0.06],6,1,0.5,0];
        _src_smoke setParticleCircle [_radius*0.75,[0,0,0]];
        _src_smoke setDropInterval 0.1;

        _self set ["src_smoke", _src_smoke];
    }],


    ["Update_Smoke", {
        _self call ["Update_Value"];
        private _intensity = _self get "intensity";
        private _src_smoke = _self get "src_smoke";

        _src_fire setDropInterval linearConversion[0,1,_intensity, _self get "smoke_min", _self get "smoke_max"];

        private _code = {
            params ["_varName"];
            _hmo = missionNamespace getVariable [_varName, "404"];
            if (_hmo isEqualTo "404") exitWith {};
            _hmo call ["Update_Smoke"];
        };      
        [_code, [_self get "varName"], _self get "smoke_rate"] call CBA_fnc_waitAndExecute;
    }],

    ["Update_Value", {
        private _pastTime = cba_missionTime - (_self get "startTime");
        _pastTime = _pastTime / 60;
        private _intensity = 1.2 / (((_pastTime / 8.412) - 0.6)^2 + 1 );
        _self set ["intensity", _intensity];
    }],
    ["Establish_EH", {
        private _obj = _self get "fuelTank";
        _obj addEventHandler ["Deleted", {
	        params ["_entity"];
            private _varName = ["ZRN","fuelTank","HMO",_pos#0,_pos#1,_pos#2] joinString "_";
            missionNameSpace setVariable [_varName, nil]; // Will delete the HMO
        }];
    }]
]]; 