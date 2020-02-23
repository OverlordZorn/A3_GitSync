_target = 0;
_tpArr = [TP_HQ, TP_01, TP_02, TP_03];

if (_this select 0 isEqualTo "init") then {
	sleep 1;

	TP_01 addAction["Travel to HQ","TP\TP.sqf",TP_HQ];
	TP_02 addAction["Travel to HQ","TP\TP.sqf",TP_HQ];
	TP_03 addAction["Travel to HQ","TP\TP.sqf",TP_HQ];

	TP_HQ addAction["Travel to TP01", "TP\TP.sqf",TP_01];
	TP_HQ addAction["Travel to TP02", "TP\TP.sqf",TP_02];
	TP_HQ addAction["Travel to TP03", "TP\TP.sqf",TP_03];
} else {
	_target = _this select 3;
};

if (_target in _tpArr) then {
	_caller = _this select 1;

	cutText ["You travel to your destination", "BLACK", 5];
	sleep 8;
	_caller setPos (_target modelToWorld [-5,-2,0]);
	_caller setDir (_caller getDir _target);
	skipTime 1;
	sleep 1;
	cutText ["You arrived", "BLACK IN", 2.5];
};
