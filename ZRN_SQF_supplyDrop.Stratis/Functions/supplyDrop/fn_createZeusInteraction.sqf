/*
* Author: Zorn
* Function to Establish a dynamically filled Zeus Interaction to Request/Trigger a BIS_fnc_supplydrop
* Does only need to be executed once (when the first supplydrop is being registered)
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
    ["_varName",     "ZRN_supplyDrop_catalog", [""]]
];

_catalog = missionNamespace getVariable [_varName, "404"];
if (_catalog isEqualTo "404") exitWith {};

private _aceAction = [
    "Zeus_SupplyDrop",                  // * 0: Action name <STRING>
    "Dispatch Supplydrop",              //  * 1: Name of the action shown in the menu <STRING>
    "\A3\ui_f\data\igui\cfg\simpleTasks\types\rearm_ca.paa",                                 //  * 2: Icon <STRING> "\A3\ui_f\data\igui\cfg\simpleTasks\types\backpack_ca.paa"
    {""},                               //  * 3: Statement <CODE>
    {},                                 //  * 4: Condition <CODE>
    {                                   //  * 5: Insert children code <CODE> (Optional)
        params ["_target", "_player", "_params"];
        _params params ["_catalog"];

        private _actions = [];
        {
            private _keyName = _x;

            private _actionID = _keyName splitString " " joinString "_";
            private _actionTitle = _keyName;
            private _icon = "";

            private _statement = { ["ZRN_supplyDrop_EH_dispatch", _this] call CBA_fnc_serverEvent; };
            private _condition = { true };
            private _params = [_keyName];
            
            private _action = [_actionID, _actionTitle, _icon, _statement, _condition, {}, _params] call ace_interact_menu_fnc_createAction;
            _actions pushBack [_action, [], _target]; // New action, it's children, and the action's target
        } forEach keys _catalog;

        _actions
    },
    [_catalog]
] call ace_interact_menu_fnc_createAction;