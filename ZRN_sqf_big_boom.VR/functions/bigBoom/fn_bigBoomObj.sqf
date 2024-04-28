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
    _particleSource setParticleCircle [(_radius*0.75),[0,0,5]];
    _particleSource setDropInterval 0.01;

    [ { deleteVehicle _this } , _particleSoruce,  60 * (5 + (ceil random 5) )] call CBA_fnc_waitAndExecute;

};

[_code,[_object,_pos,_radius], 1] call CBA_fnc_waitAndExecute;


_code = {
    params ["_object","_pos","_radius"];
    _pos set [2, _pos#2 + (_radius*0.75) ];

    _particleSource = createVehicleLocal ["#particlesource", _pos];
    _particleSource setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal_02.p3d",8,0,40,1],"","Billboard",1,30,[0,0,0],[0,0,2.5],1,0.04,0.05,0.1,[10,15,25],[[0,0,0,0.789609],[0,0,0,0.734806],[0,0,0,1],[0.42,0.0973639,0.103132,0.28],[0.198316,0.206969,0.166588,0.16],[0.305037,0.348302,0.325227,0.09],[0.42,0.42,0.42,0.06],[0.5,0.5,0.5,0.02],[0.5,0.5,0.5,0]],[1,0.55,0.35],5,2,"","","",0,false,0,[[0,0,0,0]],[0,1,0]];
    _particleSource setParticleRandom [8,[0.15,0.15,0.15],[1,1,1],0.5,0,[0,0,0,0.06],0,1,0.5,0];
    _particleSource setParticleCircle [(_radius*0.75),[0,3,5]];
    _particleSource setDropInterval 0.03;


    [ { deleteVehicle _this } , _particleSoruce,  60 * (10 + (ceil random 5) )] call CBA_fnc_waitAndExecute;

};

[_code,_this, 3] call CBA_fnc_waitAndExecute;

