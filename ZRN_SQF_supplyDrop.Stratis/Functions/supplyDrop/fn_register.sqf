/*
* Author: Zorn
* Registers the supplydrop and its meta data and creates a ZEUS Interaction for it.
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

if !(isServer) exitWith {false};

params [
    ["_name",           "Default",                  [""]            ],
    ["_start",          [0,0,0],                    [[]],   [2,3]   ],
    ["_boxClass",       "IG_supplyCrate_F",         [""]            ],
    ["_airClass",       "C_Heli_Light_01_civil_F",  [""]            ],
    ["_items",          [],                         [[]]            ],
    ["_backpacks",      [],                         [[]]            ],
    ["_side",           CIVILIAN,                   [west]          ],
    ["_paraClass",      "B_Parachute_02_F",         [""]            ],
    ["_isProtected",    false,                      [true]          ],
    ["_clearBox",       true,                       [true]          ],
    ["_attachStrobe",   false,                      [true]          ],
];