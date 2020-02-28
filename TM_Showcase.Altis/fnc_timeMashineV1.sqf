fnc_timeMashine = {
	/* Possible Parameters: 
	1. _desiredTime
		- number, same format as daytime (0-24)
		- default = 0 => will jump to next SunRise or SunSet
	2. _desiredVariation
		- number, 1 = 1 hour
		- default = 1 => Targettime will be within 30min before or after _desiredTime.
	3. _cooldown 			
		- number, in minutes
		- default = 1 => avoids being initiated instantly again.
	*/


	private ["_durationPerHour", "_sps","_srss","_sunrise", "_sunset","_variation","_targetTime","_nextDay","_hoursToSkip","_totalSteps","_sleep","_skipTime","_strTime","_strEnd"];

	params [
		["_desiredTime",0,[0]],
		["_desiredVariation",1,[0]],
		["_cooldown",1,[0]]
	];


	//debug
	//hintC format["%1,%2,%3",_desiredTime,_desiredVariation,_cooldown];
	//sleep 0.1;

	// config
	_durationPerHour = 10; 	// how many seconds should 1 Hour take
	_sps = 30;				// steps per secound Max, will be limited by diag_fpsMin

	_strEnd = "It is time to go";

	// limits the steps per second to the  Framerate
	if (floor diag_fps<_sps) then {_sps = floor diag_fps};




	// Checks Preconditions, manipulate if needed
	isAllConditions = true;


	// internal preconditions
	if (!isAllConditions) exitWith {HintC "Some Conditions have not been met";};
	if (isTimeMashineRunning) exitWith {hintC "The Time Mashine is currently running!"};
	if (isTimeMashineCooldown) exitWith {hintC "The Time Mashine is currently cooling down!"};

	// turns globalVariable true so it can't be called while it is already running
	isTimeMashineRunning = true;

	// If no Parameters are provided
	if (_desiredTime == 0) then {
	_srss = date call BIS_fnc_sunriseSunsetTime;
	_sunrise = _srss select 0;
	_sunset = _srss select 1;
	if ((daytime>_sunset) OR (_sunrise > daytime)) then {_desiredTime = _sunrise - 0.25} else {_desiredTime = _sunset + 0.25};
	};


	// implements randomness before and after
	// _desiredVariation = 1; // in hours via PARAM
	_variation = -_desiredVariation/2 + ((round random 100)/100 * _desiredVariation);
	_targetTime = _desiredTime + _variation;


	// checks if targettime is during the next day
	_nextDay = 0;
	if(daytime > _targetTime) then {_nextDay = 24};


	_hoursToSkip = (_nextDay - daytime + _targetTime);

	// debug
	 hintC format["TargetTime: %1 \n _hoursToSkip: %2",_targetTime, _hoursToSkip];
	 sleep 0.1;

	// hintC "start";
	// _start = daytime;
	// _start2 = time;


	_totalSteps = floor (_hoursToSkip * _durationPerHour * _sps);
	_sleep = 1 / _durationPerHour / 10;
	_skipTime = _hoursToSkip / _totalSteps;



	for "_x" from 0 to _totalSteps step 1 do {

		// Stops the TimeMashine if a Precondition gets broken
		if (!isAllConditions) exitWith {
			HintC "Some Conditions has been broken";
			isTimeMashineRunning = false;
		};


		_strTime = daytime call BIS_fnc_timeToString;
		hintSilent format["_hoursToSkip \n %1 \n _durationPerHour \n %2 \n _sps \n %3 \n %4 of %5 Steps \n Time: %6", _hoursToSkip, _durationPerHour, _sps, _x, _totalSteps, _strTime];
		// hintSilent format["%1",_strTime];

		skipTime _skipTime;
		sleep _sleep;
	};



	// debug stuff
	// _end = daytime;
	// _end2 = time;
	// hintC "end";
	// sleep 0.01;
	// hintC format ["%1 -> %2",_start,_end ];
	// sleep 0.01;
	// hintC format ["RealTime Duration: %1",(_end2-_start2)];


	// changes globalVariable so it can run again.
	isTimeMashineRunning = false;

	hint _strEnd;

	isTimeMashineCooldown = true;
	sleep _cooldown * 60;
	isTimeMashineCooldown = false;
};

// Initiation of Global Variables
isTimeMashineRunning = false;
isTimeMashineCooldown = false;