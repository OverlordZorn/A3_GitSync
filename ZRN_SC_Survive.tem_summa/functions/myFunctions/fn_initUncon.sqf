params [["_player",objNull,[objNull]]];

hint "1: gosleep";

[_player, 1] call ace_medical_status_fnc_adjustPainLevel;
//[_player, true] call ace_medical_status_fnc_setUnconsciousState;
[_player, true] call ace_medical_status_fnc_setCardiacArrestState;

hint "2: random sleep";
sleep 30 + (random 120);
hint "3: end random sleep - apply wounds";

// apply randomised wounds
if (random 1 > 0.1) then {
	[_player, "head", random 1, "falling", [0,1,1,1,2,1,3,1,4,1,5,1]] call ace_medical_damage_fnc_woundsHandlerSQF;
};
sleep 1;

if (random 1 > 0.1) then {
	[_player, "body", random 1, "falling", [0,1,1,1,2,1,3,1,4,1,5,1]] call ace_medical_damage_fnc_woundsHandlerSQF;
};
sleep 1;

if (random 1 > 0.1) then {
	[_player, "leftarm", random 1, "falling", [0,1,1,1,2,1,3,1,4,1,5,1]] call ace_medical_damage_fnc_woundsHandlerSQF;
};
sleep 1;

if (random 1 > 0.1) then {
	[_player, "rightarm", random 1, "falling", [0,1,1,1,2,1,3,1,4,1,5,1]] call ace_medical_damage_fnc_woundsHandlerSQF;
};
sleep 1;

if (true) then {
	[_player, "leftleg",  1, "falling", [0,1,1,1,2,1,3,1,4,1,5,1]] call ace_medical_damage_fnc_woundsHandlerSQF;
};
sleep 1;

if (true) then {
	[_player, "rightleg",  1, "falling", [0,1,1,1,2,1,3,1,4,1,5,1]] call ace_medical_damage_fnc_woundsHandlerSQF;
};


hint "4: end wounds - delay";

sleep 1;

hint "5: end delay, wake up";

[_player, 0.7] call ace_medical_status_fnc_adjustPainLevel;
//[_player, false] call ace_medical_status_fnc_setUnconsciousState;
[_player, false] call ace_medical_status_fnc_setCardiacArrestState;

hint "6: end woke up";