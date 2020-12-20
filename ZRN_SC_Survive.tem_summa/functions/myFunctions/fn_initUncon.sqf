//initUncon.sqf
[player, 1] call ace_medical_status_fnc_adjustPainLevel;
[player, true] call ace_medical_status_fnc_setUnconsciousState;
//[player, true] call ace_medical_status_fnc_setCardiacArrestState;
sleep 60 + (random 120);

// apply randomised wounds
if (random 1 > 0.5) then {
	[player, "head", (random 0.4), objNull, "vehiclecrash"] call ace_medical_fnc_handleDamage_assignwounds;
};
if (random 1 > 0.5) then {
	[player, "body", (random 0.4), objNull, "vehiclecrash"] call ace_medical_fnc_handleDamage_assignwounds;
};

if (random 1 > 0.5) then {
	[player, "leg_r", (random 0.4), objNull, "vehiclecrash"] call ace_medical_fnc_handleDamage_assignwounds;
};
if (random 1 > 0.5) then {
	[player, "leg_l", (random 0.4), objNull, "vehiclecrash"] call ace_medical_fnc_handleDamage_assignwounds;
};

if (random 1 > 0.5) then {
	[player, "hand_l", (random 0.4), objNull, "vehiclecrash"] call ace_medical_fnc_handleDamage_assignwounds;
};
if (random 1 > 0.5) then {
	[player, "hand_r", (random 0.4), objNull, "vehiclecrash"] call ace_medical_fnc_handleDamage_assignwounds;
};


sleep 5;
[player, 0.3] call ace_medical_status_fnc_adjustPainLevel;
[player, false] call ace_medical_status_fnc_setUnconsciousState;
//[player, false] call ace_medical_status_fnc_setCardiacArrestState;