/*
* Author: Zorn
* This is purely an example
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


// For testing purpose
["Test"] call zrn_supplydrop_fnc_register;


[
    "Monkey Supply Crate",
    [
        ["ace_banana", 69],
        ["ace_suture", 69],
        ["ACE_painkillers", 69]
    ],
    [
        // ["somebackpackclassname", 420]
    ],
    createHashMapFromArray [
        ["pos_start",       [10,10,10]],
        ["emptyBox",        true],
        ["targetMode",      "PLAYER"],
        ["class_box",       "ACE_medicalSupplyCrate_advanced"],
        ["class_air",       "B_T_VTOL_01_vehicle_F"]
    ]
] call zrn_supplydrop_fnc_register;


/*
list of all possible additional parameter

private _entry = createHashMapFromArray [

    ["Name",            _name],
    ["pos_start",       [0,0,0]],

    ["targetMode",      "MAP"],

    ["pos_target",      [0,0,0]],

    ["drop_alt",        50],
    ["drop_alt_forced", true],
    
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
`/