/*
* Author: Zorn
* Function to overwrite the Default Settings. This way, the user can avoid changing the parameters manually 
*
* Arguments:
*
* Return Value:
* returns the (updated) defaultentry
*
* Example:
* [] call zrn_supplyDrop_fnc_defaultEntry;
*
* Public: Yes
*/

params [
    ["_newDefaults",    "404", [createHashMap]]
];


private _entry = missionNamespace getVariable ["ZRN_supplyDrop_default_entry", "404"];

if (_entry isEqualTo "404") then {
    _entry = createHashMapFromArray [

        ["Name",            ""],
        ["pos_start",       [0,0,0]],

        ["targetMode",      "MAPCLICK"],

        ["pos_target",      [0,0,0]],
        ["pos_end",         "RETURN"],

        ["drop_alt",        100],
        ["drop_alt_forced", true],

        ["items",           ""],
        ["backpacks",       _backpacks],

        ["class_box",       "C_supplyCrate_F"],
        ["class_air",       "C_Heli_Light_01_civil_F"],
        ["class_para",      "B_Parachute_02_F"],

        ["side",            CIVILIAN],

        ["isProtected",     false],
        ["emptyBox",        true],
        ["attachStrobe",    false],
        ["class_strobe",    "ACE_IR_Strobe_Effect"],

        ["attachSmoke",     true],
        ["class_smoke",     "SmokeShellOrange"] // CfgMagazines
    ];
};

if (_newDefaults isNotEqualTo "404") then {
    _entry merge [_newDefaults, true];
    missionNamespace setVariable ["ZRN_supplyDrop_default_entry", _entry];
};


_entry