/*
* Author: Zorn
* Function to fill the crate with the needed items.
*
* Arguments:
* 0 _crateOBJ   - Object - Crate to be filled
* 1 _items      - Array - Nested Array of items to fill into the box: [["classname", 10], ...]
* 2 _backpacks  - Array - Nested Array of backpacks to fill into the box: [["classname", 10], ...]
*
* Return Value:
* None
*
* Example:
* ['something', player] call cvo_fnc_sth
*
* Public: Yes
*/

if !(isServer) exitWith {false};

params [
    ["_box",        objNull,    [objNull]   ],
    ["_items",      [],         [[]]        ],
    ["_backpacks",  [],         [[]]        ],
    ["_clearBox",   true,       [true]      ]
];

if (_box isEqualTo objNull) exitWith {false};

if (_clearBox) then {
    clearBackpackCargoGlobal _box;
    clearMagazineCargoGlobal _box;
    clearWeaponCargoGlobal _box;
    clearItemCargoGlobal _box;
};

if (count _items + count _backpacks == 0) exitWith {true};

// Fills the Box with anything in the array that isnt a backpack
{	_box addItemCargoGlobal [_x # 0, _x # 1] } forEach _items;

// Fills the Box with with backpacks
{ _box addBackpackCargoGlobal [_x # 0, _x # 1] } forEach _backpacks;

true