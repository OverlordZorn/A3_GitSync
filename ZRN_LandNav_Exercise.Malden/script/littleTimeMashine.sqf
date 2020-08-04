if (!tmUsed) {

setTimeMultiplier 120;
waitUntil {
	sleep 1;
	(daytime >= 4) && !(daytime > 20); 
};
setTimeMultiplier 10;

tmUsed = true;
publicVariable "tmUsed";
};