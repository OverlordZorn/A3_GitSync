add2_function = {
	params [ ["_numA",0,[0]] , ["_numB",0,[0]] ];
	_sum = _numA + _numB;
	hint format ["%1 + %2 = %3", _numA, _numB, _sum];
	_sum;
};



fnc_randomArray = {
	params [ ["_arrLength", 10, [0]] , ["_maxValue",100,[0]] ];
	_arr = [];
	if (_arrLength < 0) then {_arrLength = _arrLength * -1};
	if (!(_arrLength == 0)) then {
		_arrLength = (round _arrLength); 

		for "_i" from 0 to (_arrLength -1) step 1 do {
			_arr pushBack round random _maxValue;
		};
	};
	hintC format["Parameters: \n _arrLength: \n %1 \n _maxValue: \n %2 \n Array: \n %3",_arrLength,_maxValue,_arr];
	sleep 0.1;
	_arr;
};




fnc_sumOfAll = {
	params [ [ "_arrSum",[], [[]] ] ];
	_sum = 0;
	{
		_sum = _sum + _x;
	} foreach _arrSum;
	hintC format["The array: %1 \n Summed up: \n %2 ",_arrSum,_sum];
	sleep 0.1;
	_sum;
};



hint "functions added";
sleep 1;
