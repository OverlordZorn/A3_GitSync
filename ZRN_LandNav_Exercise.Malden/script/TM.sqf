if (!tmUsed) then {

setTimeMultiplier 120;

waitUntil {sleep 1;(daytime >= 4) && !(daytime > 20);};

setTimeMultiplier 0.1;

tmUsed = true; publicVariable "tmUsed";
};