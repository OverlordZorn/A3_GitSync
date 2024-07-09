if (!isServer) exitWith {};

/*
* Author: Zorn
* Post Init Function for the Mission. Handles the Triggering of the bomb at a specific time.
*
* Arguments:
*
* Return Value:
* None
*
* Example:
* ['something', player] call cvo_fnc_sth
*
* Public: Yes
*/


///////////////////////////////////
// DEFINE HERE

// BOMB Variable
private _bomb = bomb1;
// duration of the event in secounds
private _duration = 40;
// NAME OF LAYER for roadblockage
private _layerName = "HiddenRocks";
// TIME OF DETONATION as single value: example: 06:30 -> 6.5 | 14:45 -> 14.75
private _timeDetonation = 7.25;
// Number of Explostions
private _numberOfBombs = 3;

///////////////////////////////////

///////////////////////////////////
// CODE

#define FNC_ROCKSLIDE ZRN_Rockslide_Params call ZRN_fnc_global_effects
ZRN_ROCKSLIDE_DONE = false;

if (is3DENPreview) then {diag_log "Post Init"};

private _posStart = getPosASL _bomb;

// get Median Position as "target pos" - thanks jenna!
private _objects = getMissionLayerEntities _layerName select 0;
private _posEnd = [];
{ _posEnd = _posEnd vectorAdd (getPosASL _x); } foreach _objects;

{ _x hideObjectGlobal true } foreach _objects;

_posEnd = _posEnd VectorMultiply (1/count _objects);


ZRN_Rockslide_Params = [_posStart, _posEnd, _bomb, _duration, _layerName, _numberOfBombs];


// just in case hide all object inside hiddenRocks


///////////////////////////////////
// Establish Event Handlers
//Triggers when bomb gets deleted
_bomb addEventHandler ["Deleted", {
	params ["_entity"];

    if (is3DENPreview) then {diag_log "Deleted Trigger"};
    FNC_ROCKSLIDE;
}];

// Trigger when bomb gets damaged
_bomb addEventHandler ["Dammaged", {
	params ["_unit", "_selection", "_damage", "_hitIndex", "_hitPoint", "_shooter", "_projectile"];
    if (is3DENPreview) then {diag_log "Damage Trigger pre"};

    if (_damage < 0.1) exitWith {};
    if (is3DENPreview) then {diag_log "Damage Trigger post"};
    FNC_ROCKSLIDE;

    _unit removeEventHandler [_thisEvent, _thisEventHandler];
}];


// destroys the Bomb when certain ingame point in time has reached

_condition = { dayTime > _this#0 };                 // condition - Needs to return bool
_statement = {
    if (is3DENPreview) then {diag_log "Time Trigger"};
    //_this#1 setDamage 1;
    deleteVehicle (_this#1);
};                                    // Code to be executed once condition true
_parameter = [_timeDetonation,_bomb];                        // arguments to be passed on -> _this;
[_condition, _statement, _parameter] call CBA_fnc_waitUntilAndExecute;

///////////////////////////////////