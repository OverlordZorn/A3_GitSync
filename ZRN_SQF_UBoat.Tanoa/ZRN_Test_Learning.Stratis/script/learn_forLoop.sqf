_i = 0;
_test = "noo";
hint _test;
while {_i < 10} do {
	hint format["%1", _i];
	_i = _i + 1;
	sleep 1;
	_test = _test+"i";
};
hint "i = 10 !";
hint _test;
for [{_j = 0},{_j<10},{_j = _j + 1}] do {
	hint format["_j = %1", _j];
	sleep 1;
	_test = _test+"j";
};

hint format["_j = %1", _j];
hint _test;
for "_k" from 1 to 10 step 1 do {
	hint format["_k = %1", _k];
	sleep 1;
	_test = _test+"k";

};
hint _test;