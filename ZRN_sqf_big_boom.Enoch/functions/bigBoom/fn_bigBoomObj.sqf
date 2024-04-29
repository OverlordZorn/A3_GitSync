params [ [ "_object", objNull, [objNull] ] ];

if (_object isEqualTo objNull) exitWith {};
private _pos = getPos _object;
private _radius = boundingBoxReal cursorObject # 2 * 0.4;

_code = {
    params ["_object","_pos","_radius"];
    _pos set [2, _pos#2 + (_radius*0.75) ];

    _particleSource = createVehicleLocal ["#particlesource", _pos];
    _particleSource setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal.p3d",16,2,80,0],"","Billboard",1,5,[0,0,0],[0,0,2.5],0,1,1,0.01,[5,8],[[1,1,1,-20],[1,1,1,-15],[1,1,1,-10],[1,1,1,-6],[1,1,1,-2]],[0.25],0.2,0.1,"","","",0,false,0,[[0,0,0,0]],[0,1,0]];
    _particleSource setParticleRandom [0.3,[5,5,6],[2,2,2],25,0.4,[0,0,0,0.3],0.2,0.05,1,0];
    _particleSource setParticleCircle [(_radius*0.5),[0,0,5]];
    _particleSource setDropInterval 0.01;

    _hmoVarName = [_pos] call ZRN_fnc_bigBoomLight;
    
    // Cleanup
    [{
        deleteVehicle _this#0;
        deleteVehicle _this#1;

        _hmo = missionNamespace getVariable [_this#2, "404"];
        if (_hmo isEqualTo "404") exitWith {};
        _hmo set ["isActive", false];
    } , [_particleSoruce,_lightSource, _hmoVarName],  60 * ( 10 )] call CBA_fnc_waitAndExecute;
};
[_code,[_object,_pos,_radius], 1] call CBA_fnc_waitAndExecute;


_code = {
    params ["_object","_pos","_radius"];
    _pos set [2, _pos#2 + (_radius*0.75) ];

    _particleSource = createVehicleLocal ["#particlesource", _pos];

    _particleSource setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal_02.p3d",8,0,40,1],"","Billboard",1,20,[0,0,10],[-1,-1,1],-2.5,1,1,0.015,[15,15,25,15],[[0.261772,0.149282,0.0973639,0.403105],[0.195432,0.0973639,0.0858262,0.844411],[0,0,0,0.945364],[0,0,0,0.108901]],[0.1,0,0,0],2,1,"","","",0,false,0,[[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0]],[0,1,0]];
    _particleSource setParticleRandom [5,[0,0,0],[2,2,0.5],5,0,[0,0,0,0.06],6,1,0.5,0];
    _particleSource setParticleCircle [_radius*0.75,[0,0,0]];
    _particleSource setDropInterval 0.1;

    // Cleanup
    [ { deleteVehicle _this } , _particleSoruce,  60 * ( 10 )] call CBA_fnc_waitAndExecute;
};
[_code,[_object,_pos,_radius], 3] call CBA_fnc_waitAndExecute;
