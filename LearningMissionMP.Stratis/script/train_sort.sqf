hint "start";
sleep 1;
_a = 0;
_b = 0;
_c = 0;
hint format["a: %1     b: %2     c: %3", _a,_b,_c];
sleep 1;
hint "random numbers";
sleep 1;
_a = round random 100;
_b = round random 100;
_c = round random 100;

hint format["a: %1     b: %2     c: %3", _a,_b,_c];
sleep 5;

hint "start sorting";
_loop = 0;

while {(_a<_b) OR (_b<_c)} do {
	hint "start loop";
	sleep 1;
	_store = 0;
	hint format["a: %1     b: %2     c: %3    loop nr: %4", _a,_b,_c,_loop];
	sleep 1;

	if (_c>_b) then {
		_store = _b;
		_b = _c;
		_c = _store;

	} else {
		if (_b>_a) then {
			_store = _a;
			_a = _b;
			_b = _store ;
		};
	};
	_loop = _loop +1;
};

hint "finished while loop";
sleep 1;

if ((_a>_b) && (_b>_c)) then {hint "sorted!"} else {hint "not sorted!"};
sleep 2;
hint format["a: %1     b: %2     c: %3   loops needed: %4", _a,_b,_c,_loop];
sleep 5;
hint "script end";