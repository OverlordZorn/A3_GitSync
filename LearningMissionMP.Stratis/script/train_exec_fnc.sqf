_actionID = _this select 2;

removeAllActions server1;

server1 addAction ["Execute Function add2_function", {
	[(round random 100),(round random 100)] call add2_function;
}];

server1 addAction ["Execute Function fnc_randomArray", {
	[10,10] call fnc_randomArray;
}];

server1 addAction ["Execute Function fnc_sumOfAll", {
	_randomArr = [50,1000] call fnc_randomArray;
	_nil = [_randomArr] call fnc_SumOfAll;
}];

server1 addAction ["Close List", {
	removeAllActions server1;
	server1 addAction ["Open List", {[] execVM "script\train_exec_fnc.sqf"}];
}];



