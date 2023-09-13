/*
	Author: Mr. Zorn

	Description:
		Defines or Updates the local CVO_A_FULL Array to be used in the CVO Arsenal.

	Parameter(s):

	Returns:
		<Array> List of classnames of additional gear to be used in ACE Arsenal

	Examples:
		<example>
		[] call CVO_FNC_A_update;
*/


if (!hasInterface) exitWith {};
if (count CVO_arsenal_boxes isEqualTo 0) exitWith {};

private _finalKit = [];
private _finalKit append CVO_A_BASE;

// ############ Detect ROLE KIT ############

private _roles = player getVariable ["CVO_A_Roles", []];

// Detectes ACE MEDIC and ACE Engineer
if (0 < player getVariable ["ace_medical_medicClass", 0]) 	then {_roles pushBackUnique "Medic"};
if (0 < player getVariable ["ACE_IsEngineer",0]) 			then {_roles pushBackUnique "Engineer"};

{// Retrieves Info from HASHMAP
	_array = CVO_A_HASH_RoleKit get _x;
	// _array = [  "KEY/ROLENAME",	[  ["ARRAY OF CLASSNAMES"],{"Optional CODEBLOCK"}  ]  ]
	
	_finalKit append (_array select 0);
	_finalKit append (call (_array select 1));


} forEach _roles;

// Return
_finalkit;