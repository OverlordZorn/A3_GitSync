["<t color='#FFFFFF' align='left'>Initiate Launch Sequence</t>        <t color='#83ffffff' align='right'>     </t>","
	bis_fnc_holdAction_running = true;

	
	if (!isNil ""bis_fnc_holdAction_scriptHandle"" && {!scriptDone bis_fnc_holdAction_scriptHandle}) exitWith {};

	bis_fnc_holdAction_params = _this;
	bis_fnc_holdAction_scriptHandle = _this spawn
	{
		
		params
		[
			[""_target"",objNull,[objNull]],
			[""_caller"",objNull,[objNull]],
			[""_actionID"",10,[123]],
			[""_arguments"",[],[[]]]
		];

		private _this = _caller;	

		
		{inGameUISetEventHandler [_x, ""true""]} forEach [""PrevAction"", ""NextAction""];

		
		_arguments params[""_a0"",""_a1"",""_a2"",""_a3"",""_a4"",""_a5"",""_a6"",""_a7"",""_a8"",""_a9"",""_target"",""_title"",""_iconIdle"",""_iconProgress"",""_condShow"",""_condProgress"",""_codeStart"",""_codeProgress"",""_codeCompleted"",""_codeInterrupted"",""_duration"",""_removeCompleted""];

		
		private _condProgressCode = compile _condProgress;

		
		for ""_i"" from 0 to 3 do
		{
			sleep 0.05;

			
			[_target,_actionID,_title,_iconIdle,bis_fnc_holdAction_texturesIn,_i] call bis_fnc_holdAction_showIcon;
		};

		
		[_target,_caller,_actionID,_arguments] call _codeStart;

		
		private _frame = 0;
		private _timeStart = time;
		private _timeNextStep = time;
		private _stepDuration = _duration / 24;

		
		while {call _condProgressCode && {_frame < 24}} do
		{
			_timeNextStep = _timeStart + (_frame * _stepDuration);

			waitUntil
			{
				time >= _timeNextStep || {(inputAction ""Action"" < 0.5 && {inputAction ""ActionContext"" < 0.5}) || {visibleMap || {!(call _condProgressCode)}}}
			};

			
			if (time < _timeNextStep) exitWith
			{
				





			};

			
			_frame = _frame + 1;

			
			[_target,_actionID,_title,_iconProgress,bis_fnc_holdAction_texturesProgress,_frame] call bis_fnc_holdAction_showIcon;

			
			[_target,_caller,_actionID,_arguments,_frame,24] call _codeProgress;
		};

		
		if (_frame == 24) then
		{
			sleep _stepDuration;

			if (_removeCompleted) then
			{
				_target removeAction _actionID;
			};

			[_target,_caller,_actionID,_arguments] call _codeCompleted;
		}
		else
		{
			[_target,_caller,_actionID,_arguments] call _codeInterrupted;
		};

		
		[_target,_actionID,_title,_iconIdle,bis_fnc_holdAction_texturesProgress,0] call bis_fnc_holdAction_showIcon;

		
		{inGameUISetEventHandler [_x, """"]} forEach [""PrevAction"", ""NextAction""];

		
		bis_fnc_holdAction_running = false;
	};
",[<null>,<null>,<null>,<null>,<null>,<null>,<null>,<null>,<null>,<null>,B Alpha 1-5:1 (Hombre) (PU_3),"<t color='#FFFFFF' align='left'>Initiate Launch Sequence</t>        <t color='#83ffffff' align='right'>     </t>","<img size='3' color='#ffffff' image='\A3\Ui_f\data\IGUI\Cfg\HoldActions\holdAction_takeOff1_ca.paa'/>","<img size='3' color='#ffffff' image='\A3\Ui_f\data\IGUI\Cfg\HoldActions\holdAction_takeOff2_ca.paa'/>","([{true},15] call bis_fnc_carrier01CatapultID) != -1","([{true},15] call bis_fnc_carrier01CatapultID) != -1",{
private _catapultData = 					((							(player getVariable ["bis_carrierDeckTrigger",objNull]) getVariable ["bis_carrierCatapultsData",[]]) param [						([] call bis_fnc_carrier01CatapultID),[]]); if (count _catapultData == 0) exitWith {(player setVariable ["carrierCatapultState",					-1])};

(player setVariable ["carrierCatapultState",						0]);

_catapultData params
[
["_part", objNull],
["_memPoint", ""],
["_dirOffset", 0],
["_animations", 0],
["_actionName", ""]
];

([_part,_animations,							10] call BIS_fnc_Carrier01AnimateDeflectors);


_catapultData spawn bis_fnc_carrier01CatapultLockTo;


private _codeStart = getText(missionConfigFile >> "CfgCarrier" >> "LaunchSettings" >> "codeStart");

if (_codeStart != "") then
{
call compile _codeStart;
};
},{
private _catapultData = 					((							(player getVariable ["bis_carrierDeckTrigger",objNull]) getVariable ["bis_carrierCatapultsData",[]]) param [						([] call bis_fnc_carrier01CatapultID),[]]); if (count _catapultData == 0) exitWith {(player setVariable ["carrierCatapultState",					-1])};
private _currentProgress = param [4,-1,[123]];

(player setVariable ["carrierCatapultState",_currentProgress]);

_catapultData params
[
["_part", objNull],
["_memPoint", ""],
["_dirOffset", 0],
["_animations", 0],
["_actionName", ""]
];

private _plane = cameraOn;




if (				(player getVariable ["carrierCatapultAttached",false]) || {!(isNull attachedTo _plane)}) then
{
if (_currentProgress > 11) then
{
private _throttleCurrent = _plane animationSourcePhase "throttle";
private _throttle = (_currentProgress - 11)/12 max _throttleCurrent min 1;

_plane setAirplaneThrottle _throttle;
};
}
else
{
_plane setAirplaneThrottle 0.2;
};
},{
private _catapultData = 					((							(player getVariable ["bis_carrierDeckTrigger",objNull]) getVariable ["bis_carrierCatapultsData",[]]) param [						([] call bis_fnc_carrier01CatapultID),[]]); if (count _catapultData == 0) exitWith {};

(player setVariable ["carrierCatapultState",					25]);

_catapultData params
[
["_part", objNull],
["_memPoint", ""],
["_dirOffset", 0],
["_animations", 0],
["_actionName", ""]
];

private _plane = cameraOn;


_plane setAirplaneThrottle 1;

([_part,_animations,						0] call BIS_fnc_Carrier01AnimateDeflectors);

private _dirCatapult = (getDir _part - _dirOffset - 180) % 360;

[_plane,_dirCatapult] call BIS_fnc_AircraftCatapultLaunch;


private _codeEnd = getText(missionConfigFile >> "CfgCarrier" >> "LaunchSettings" >> "codeEnd");

if (_codeEnd != "") then
{
call compile _codeEnd;
};

(player setVariable ["carrierCatapultAttached",false]);
},{
private _catapultData = (							(player getVariable ["bis_carrierDeckTrigger",objNull]) getVariable ["bis_carrierCatapultsData",[]]) param [				(player getVariable ["carrierCatapultLastID",						-1]),[]]; if (count _catapultData == 0) exitWith {};

(player setVariable ["carrierCatapultState",					-1]);

_catapultData params
[
["_part", objNull],
["_memPoint", ""],
["_dirOffset", 0],
["_animations", 0],
["_actionName", ""]
];


cameraOn setAirplaneThrottle 0;

([_part,_animations,						0] call BIS_fnc_Carrier01AnimateDeflectors);
(player setVariable ["carrierCatapultAttached",false]);
},6,true],1000,true,false,"","_target = _originalTarget; _eval = ([{true},15] call bis_fnc_carrier01CatapultID) != -1; [""<t color='#FFFFFF' align='left'>Initiate Launch Sequence</t>        <t color='#83ffffff' align='right'>     </t>"",""<img size='3' color='#ffffff' image='\A3\Ui_f\data\IGUI\Cfg\HoldActions\holdAction_takeOff1_ca.paa'/>"",""<t font='RobotoCondensedBold'>Hold <t color='#ffae00'></t> to Initiate Launch Sequence</t>""] call bis_fnc_holdAction_animationTimerCode; _eval",15,false,"<img size='3' shadow='0' color='#BFFFFFFF' image='\A3\Ui_f\data\IGUI\Cfg\HoldActions\in\in_0_ca.paa'/>","<img size='3' color='#ffffff' image='\A3\Ui_f\data\IGUI\Cfg\HoldActions\holdAction_takeOff1_ca.paa'/><br/><br/><t font='RobotoCondensedBold'>Hold <t color='#ffae00'></t> to Initiate Launch Sequence</t>","",""]