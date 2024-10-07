/*
* Author: Zorn
* Registers the supplydrop and its meta data and creates a ZEUS Interaction for it.
* To be Executed on Server + all clients.
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

params [
    ["_name",           "Default",                  [""]                ],

    ["_items",          [],                         [[]]                ],
    ["_backpacks",      [],                         [[]]                ],

    ["_params",         "404",                      [createHashMap]     ]

//    ["_start",          [0,0,0],                    [[]],       [2,3]   ],
//    ["_target",         "MAP",                      ["", []],   [2,3]   ],
//    ["_side",           CIVILIAN,                   [west]              ],
//    ["_paraClass",      "B_Parachute_02_F",         [""]                ],
//    ["_isProtected",    false,                      [true]              ],
//    ["_clearBox",       true,                       [true]              ],
//    ["_attachStrobe",   false,                      [true]              ]
];


// hashmap

private _catalog = missionNamespace getVariable ["ZRN_supplyDrop_catalog", "404"];

if (_catalog isEqualTo "404") then {
    
    diag_log "[CVO](debug)(fn_register) Init Catalog";
    _catalog = createHashMap;
    missionNamespace setVariable ["ZRN_supplyDrop_catalog", _catalog];

    [] call zrn_supplyDrop_fnc_createZeusInteraction;
};

if (_name in _catalog) exitWith { "SupplyDrop with this Name already exists" };

private _entry = createHashMapFromArray [

    ["Name",            _name],
    ["pos_start",       [0,0,0]],

    ["targetMode",      "MAP"],

    ["pos_target",      [0,0,0]],
    
    ["items",           _items],
    ["backpacks",       _backpacks],

    ["class_box",       "C_supplyCrate_F"],
    ["class_air",       "C_Heli_Light_01_civil_F"],
    ["class_para",      "B_Parachute_02_F"],

    ["side",            CIVILIAN],

    ["isProtected",     false],
    ["emptyBox",        true],
    ["attachStrobe",   false]
];

if (_params isNotEqualTo "404") then { _entry merge [_params, true] };

_catalog set [_name, _entry];

diag_log format ['[CVO](debug)(fn_register) keys _catalog: %1', keys _catalog];

true