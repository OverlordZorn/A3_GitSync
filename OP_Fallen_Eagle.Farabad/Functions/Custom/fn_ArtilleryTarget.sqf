/*
This is longer than the original selector code, but it helps ease the O(n^2) time complexity.
It first finds the grid squares that are occupied by the players. This could reduce the n component from 30 to just around 4.
The cutting step is O(n) time complexity.
It searches for nearby AI from a sorted list of AI within _captainVisionRange. It checks if the first thing in the list is nearer than _friendlyFireProtectionRange, if so it exits.
If that passed, it will search for a "CAPTAIN". As soon as one is found, the selection code exits and returns the grid square's centre as a validTarget position.

If this fails to find a target, recommend waiting for a while so that AI can change their positions.
*/

// Settings
private _captainVisionRange = 800;
private _friendlyFireProtectionRange = 100;
private _artillerySide = independent;
private _gridSquareSize = 100;  // Used for cutting the players into groups
// End of Settings

// Get all awake players
private _players = allPlayers select {alive _x && !captive _x};
    if (!isNil "Z_0") then {
        _players = _players - [Z_0];
    };
    if (!isNil "Z_1") then {
        _players = _players - [Z_1];
    };


// Get all the grid squares that have players in them
private _occupiedGridSquares = [];
{
    private _pos = getPos _x;
    // Round the player's position so that it reflects the grid square they occupy
    private _nearestGridSquare = [floor (_pos#0 / _gridSquareSize),floor (_pos#1 / _gridSquareSize)];
    _occupiedGridSquares pushBackUnique _nearestGridSquare;
} forEach _players;


// Filter the grid squares to remove friendly fire incidents and make sure there is a captain nearby.
private _gridSquareCentreOffset = [_gridSquareSize,_gridSquareSize] vectorMultiply 0.5;
private _validTargetPos = [0,0];
private _hasValidTarget = false;
{
    // Reverse the size reduction and add the offset so that the center of the grid square is the target.
    private _gridSquareCentre = _x vectorMultiply _gridSquareSize vectorAdd _gridSquareCentreOffset;

    // Find all nearby enemy AI.
    private _nearestAIs = nearestObjects [_gridSquareCentre, ["CAManBase"], _captainVisionRange, true] select {alive _x && {side _x == _artillerySide}};
    // Check that no enemy AI will be Friendly fired.
    if (_nearestAIs#0 distance _gridSquareCentre < _friendlyFireProtectionRange) then {continue};
    // Check if there is a captain among us ඞ.
    if (_nearestAIs findIf {rank _x isEqualTo "SERGEANT"} != -1) exitWith {
        _validTargetPos = _gridSquareCentre;
        _hasValidTarget = true;
    };
} forEach _occupiedGridSquares;

[_hasValidTarget,_validTargetPos];

// Use _hasValidTarget and _validTargetPos, _validTargetPos is a 2D coordinate