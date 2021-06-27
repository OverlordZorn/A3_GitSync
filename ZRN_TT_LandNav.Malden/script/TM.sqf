if (!tmUsed) then {
	
	tmUsed = true;
	publicVariable "tmUsed";

	removeAllActions tmTower;

	setTimeMultiplier 120;

	sleep 10;

	waitUntil {
	((daytime >= 3.75) && !(daytime > 20));
		}; 

	setTimeMultiplier 1; 
	
};