private _pos = getPos player;

{if (_x distance _pos < 1000) then
	{
		[_x, _x] call ace_medical_treatment_fnc_fullHeal;
	
		if (_x getVariable ["INCAPACITATED",false]) then {_x setVariable ["INCAPACITATED",false,true]};
		_x setDamage 0;
		};
	_x setVariable ["compromised", 0, true];
	} forEach allUnits;

{
if ((_x distance _pos < 150) and (alive _x) and (isNull(attachedTo _x))) then
	{
	_x setDamage 0;
	if (_x getVariable ["INCAPACITATED",false]) then {_x setVariable ["INCAPACITATED",false,true]};
	};
} forEach vehicles;
