hint "Action sucessfully executed";

sleep 1;
hint format["Output This: %1", _this];
sleep 1;

hintC "This is a hintC with a simple String";


Sleep 1;


hintC "This is a hintC with a simple String without the usual hint window by unloading it via the hintC event handler";

hintC_EH = findDisplay 57 displayAddEventHandler ["unload", {
	0 = _this spawn {
		_this select 0 displayRemoveEventHandler ["unload", hintC_EH];
		hintSilent "";
	};
}];
sleep 1;
hintC "and once more a normal hint";
sleep 1;
hint "Hint with a Linebrake.\nIsn't it great?";
sleep 2;
hint format ["Hello, i am using format to show your name!\n
			Player: %1\n 
			This shows Side, SquadName,#inSQ and (Name)
			\nOnly Name: %2
			\nOnly Group: %3", player, name player, group player]; 