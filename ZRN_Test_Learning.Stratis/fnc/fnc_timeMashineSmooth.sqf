_desiredTime = 0;
_srss = date call BIS_fnc_sunriseSunsetTime;
_sunrise = _srss select 0;
_sunset = _srss select 1;


if ((daytime>_sunset) OR (_sunrise > daytime)) then {_desiredTime = _sunrise - 0.5} else {_desiredTime = _sunset + 0.5};


// randomness of +- 0.5*variation
_desiredVariation = 0.5; // in hours
_variation = -_desiredVariation/2 + ((round random 100)/100 * _desiredVariation);
_targetTime = _desiredTime + _variation;

// checks if targettime is during the next day
_nextDay = 0;
if(daytime > _targetTime) then {_nextDay = 24};


_hoursToSkip = (_nextDay - daytime + _targetTime);


hintC format["TargetTime: %1 \n _hoursToSkip: %2",_targetTime, _hoursToSkip];
sleep 0.1;

// many little timejumps


for "_i" from 0 to _hoursToSkip step 0.01 do {
	skipTime 0.01;
	sleep 0.01;
};
