sleep 15;

_playerRole = (_this#0) getVariable ["Role", "false"];

if (_playerRole == "Survivor") then {
    [player] spawn ZRN_fnc_initUncon;
};