/*
* Author: Zorn
* Function to get alist of nearby units of a set of sides and distance
*
* Arguments:
*
* Return Value:
* None
*
* Example:
* ['something', player] call prefix_component_fnc_functionname
*
* Public: No
*/



params [
    ["_pos", [], [[]], [2,3]],
    ["_sides", [east]],
    ["_distance", 100]
];

if !(_sides isEqualType []) then { _sides = [_sides] };

private _classes = [];
{
    switch (_x) do {
        case west:        { _classes pushBackUnique "B_Soldier_Base_F" };
        case east:        { _classes pushBackUnique "O_Soldier_Base_F" };
        case independent: { _classes pushBackUnique "I_Soldier_Base_F" };
        case civilian:    { _classes pushBackUnique "Civilian_F" };
    };
} forEach _sides;

_pos nearEntities [_classes, _distance]