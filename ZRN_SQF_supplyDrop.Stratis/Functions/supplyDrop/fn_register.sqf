/*
* Author: Zorn
* Registers the supplydrop and its meta data and creates a ZEUS Interaction for it.
* To be Executed on Server + all clients.
*
* Arguments:
*
* Return Value:
* 0 - <STRING>           "Monkey Supply Crate"          name of the Supplydrop
*
* 1 - <Nested Array>    ["ace_banana", 69]              Nested Array of Items to be filled into the crate
* 2 - <Nested Array>    ["ace_banana", 69]              Nested Array of Backpacks to be filled into the crate
*
* 3 - <hashMap>         hashmap of additional parameters
*
* Example:
* ['something', player] call cvo_fnc_sth
*
* Public: Yes
*/

params [
    ["_name",           "Default",           [""]                ],

    ["_items",          [],                [[]]                  ],
    ["_backpacks",      [],                [[]]                  ],

    ["_params",         "404",               [createHashMap]     ]

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

private _entry = [] call zrn_supplyDrop_fnc_defaultEntry;

_entry set ["Name", _name];
_entry set ["items", _items];
_entry set ["backpacks", _backpacks];


if (_params isNotEqualTo "404") then { _entry merge [_params, true] };

if !(isClass (configFile >> "Cfgvehicles" >> _entry get "class_box"))  exitWith {diag_log "[CVO](debug)(fn_register) Failed: undefined class_box";};
if !(isClass (configFile >> "Cfgvehicles" >> _entry get "class_air"))  exitWith {diag_log "[CVO](debug)(fn_register) Failed: undefined class_air";};
if !(isClass (configFile >> "Cfgvehicles" >> _entry get "class_para")) exitWith {diag_log "[CVO](debug)(fn_register) Failed: undefined class_para";};


_catalog set [_name, _entry];

diag_log format ['[CVO](debug)(fn_register) keys _catalog: %1', keys _catalog];

true

