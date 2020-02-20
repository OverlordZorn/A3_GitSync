_time = 0.1;
hint "start";
sleep _time;

// create array, fill random for random length
hint "create array";
sleep _time;
_arr = [];
hint format["array: %1", _arr];
sleep _time;


hint "random length of array";
sleep _time;
_arrLength = 100/*round random 100;
if (_arrLength <= 1) then {_arrLength = 2}*/;

hint format["the array will have %1 elements", _arrLength];
sleep _time;

for "_i" from 0 to (_arrLength-1) step 1 do {
	_rv = round random 100; // randomValue
	hint format["Adding Value %1 to Index %2 / %3", _rv,_i,(_arrLength-1)];
	sleep _time;
	_arr pushBack _rv;
	hint format["array: %1", _arr];
	sleep _time;
};

hint format["Array creation finished: %1", _arr];
sleep _time;
sleep 5;
_time = 0.01;
sleep _time;
hint "Start Sorting";

_i = 1;
_loopCount = 0;
_safety = 0;
_max = 1;

while {_i < _arrLength} do {
	sleep _time;
	_store = 0;
	if (_arr select (_i-1) < _arr select _i) then {
		hint format["#%5 MAX%6 PUSH LEFT #%1 %3 with #%2 %4", (_i-1),_i, _arr select (_i-1), _arr select (_i), _loopCount, _max];
		_store = _arr select (_i-1);
		_arr set [(_i-1), _arr select _i];
		_arr set [_i, _store];
		_i = _i - 1;
	} else {
		if (_max > _i) then {_i = _max-1};
		hint format["#%5 MAX%6 PUSH NEIN #%1 %3 with #%2 %4", (_i-1),_i, _arr select (_i-1), _arr select (_i), _loopCount, _max];
		_i = _i + 1;
		_max = _i;
		};

	if (_i<= 0) then {_i = 1;};

	_safety = _safety + 1;
	_loopCount = _loopCount +1;
	if (_safety > 10000) then {_i = _arrLength; hint "safety reached"; sleep (10);};
};

hint format["Array Sorting finished after %1 loops: %2",_loopCount, _arr]; 





/*
hint format["Array before sorting: %1", _arr];
sleep 1;
_arr sort true;
hint format["Array after sorting: %1", _arr];
*/