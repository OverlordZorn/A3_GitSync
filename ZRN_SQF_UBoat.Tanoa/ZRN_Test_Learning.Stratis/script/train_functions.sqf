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


fnc_timeString = {
private _daytime = daytime;
private _hours = floor _daytime;
private _minutes = floor ((_daytime -_hours)*60);
private _seconds = floor ((((_daytime - _hours)*60)- _minutes) *60);

private _strH = if (_hours<10) then{format["0%1",_hours];} else {format["%1",_hours];};
private _strM = if (_minutes<10) then{format["0%1",_minutes];} else {format["%1",_minutes];};
private _strS = if (_seconds<10) then{format["0%1",_seconds];} else {format["%1",_seconds];};

private _timeString = format["%1:%2:%3",_strH,_strM,_strS];

_timeString;

};


hint "functions added";
sleep 1;
 

