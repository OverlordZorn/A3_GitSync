/*
* Author: Zorn
* Init Function to setup basic framework.
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


// CBA Custom Events
private _cba_EH_ID = missionNamespace getVariable ["ZRN_supplyDrop_EH_ID_dispatch", "404"];
private _hashmap = missionNamespace getVariable ["ZRN_supplyDrop_catalog", "404"];

if (_cba_EH_ID isEqualTo "404") then {
    private _id = ["ZRN_supplyDrop_EH_dispatch", ZRN_supplyDrop_fnc_dispatch] call CBA_fnc_addEventHandler;
    missionNamespace setVariable ["ZRN_supplyDrop_EH_ID_dispatch", _id];
};


// hashmap

if (_hashmap isEqualTo "404") then { _hashmap = createHashMap };
missionNamespace setVariable ["ZRN_supplyDrop_catalog", _hashmap];


_hashMap