/*
* Author: Zorn
* Triggers a Rockslide and populates it across all currently connected players. No JIP required.
*
* Arguments:
*
* Return Value:
* none
*
* Example:
* ['something', player] call cvo_fnc_sth
*
* Public: Yes
*/

if (!isServer) exitWith {};

if (is3DENPreview) then {diag_log "fnc global"};

params ["_posStart", "_posEnd", "_bomb", "_duration", "_layerName", "_numberOfBombs"];

// Creates HelperObj at the startPos and endPos

_bomb = createVehicle ["Helper_Base_F", [0,0,0]];

_bomb setPosASL _posStart;


// Ensures this code only gets executed once.
if (ZRN_ROCKSLIDE_DONE == true) exitWith {};
ZRN_ROCKSLIDE_DONE = true;

// create bigger Explosion
_numberOfBombs = _numberOfBombs max 1;
for "_i" from 1 to _numberOfBombs do {

//    private _pos = vectorLinearConversion [1,_numberOfBombs, _i, _posStart, vectorLinearConversion[0,1,0.75,_posStart,_posEnd], true];
    private _pos = _posStart;
    if (is3DENPreview) then {diag_log format ["GLOB - Bomb#%1 - POS: %2", _i, _pos]};


    [{
        params ["_pos"];
        private _obj = createVehicle ["Bo_GBU12_LGB",[0,0,0], [], 50, "CAN_COLLIDE"];
        _obj setPosASL _pos;
        if (is3DENPreview) then {diag_log "GLOB - Bomb"};

    } , [_pos], random 2] call CBA_fnc_waitAndExecute; 
};


// unhide the Rock objects globally
{
    [{
        _this#0 hideObjectGlobal false;
        if (is3DENPreview) then {diag_log "GLOB - Unhide - Plop"};

    } , [_x], _duration * 0.6 + random (0.4 * _duration)] call CBA_fnc_waitAndExecute;
} forEach (getMissionLayerEntities _layerName select 0);


[{
    params ["_posStart", "_posEnd", "_bomb", "_duration", "_layerName", "_numberOfBombs"];

    // Play sound globally
    playSound3D [getMissionPath "sound_landslide.ogg", objNull , false, _posEnd, 5, 1, 2000, 0, false];
    if (is3DENPreview) then {diag_log "GLOB - Sound"};

    // Playerside Effects
    [_posStart, _posEnd, _bomb, _duration, _layerName, _numberOfBombs] remoteExecCall ["ZRN_fnc_local_effects", [0,-2] select isDedicated, false];

} , [_posStart, _posEnd, _bomb, _duration, _layerName, _numberOfBombs], 2] call CBA_fnc_waitAndExecute;

