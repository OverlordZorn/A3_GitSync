_desiredTime = 0;
_srss = date call BIS_fnc_sunriseSunsetTime;
_sunrise = _srss select 0;
_sunset = _srss select 1;


if ((daytime>_sunset) OR (_sunrise > daytime)) then {_desiredTime = _sunrise - 0.5} else {_desiredTime = _sunset + 0.5};


// implements randomness before and after
_desiredVariation = 0.5; // in hours
_variation = -_desiredVariation/2 + ((round random 100)/100 * _desiredVariation);
_targetTime = _desiredTime + _variation;

// checks if targettime is during the next day
_nextDay = 0;
if(daytime > _targetTime) then {_nextDay = 24};


_hoursToSkip = (_nextDay - daytime + _targetTime);


hintC format["%1",_targetTime];
sleep 0.1;

// cutText ["You decided to rest for some time","BLACK",1];
// sleep 5;
skiptime _hoursToSkip;
// cutText ["Time to go","BLACK IN",1];

