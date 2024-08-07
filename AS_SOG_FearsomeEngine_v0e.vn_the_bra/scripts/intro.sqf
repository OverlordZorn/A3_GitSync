// Enable sim for helicopters...
h_0 enableSimulationGlobal true;
h_1 enableSimulationGlobal true;
h_2 enableSimulationGlobal true;
h_3 enableSimulationGlobal true;
CAS1 enableSimulationGlobal true;
CAS2 enableSimulationGlobal true;

if (hasInterface) then {
    0 fadeRadio 0;
    5 fadeSound 0;

    [] spawn {
		"disclaimerLayer_Background" cutText ["", "BLACK OUT", 6, true, false];

        //waitUntil{sleep 1; !(isNil "BIS_fnc_init")};
		//playmusic "YepperzzMusicPackSong25"; // California Dreamin'
        sleep 6;


		// Teleport players to helo cargo slots.
		{_x moveInCargo h_0 } forEach (units P_1);
		{_x moveInCargo h_1 } forEach (units A_0);
		{_x moveInCargo h_2 } forEach (units B_0);
		{_x moveInCargo h_3 } forEach (units C_0);

		// "disclaimerLayer_Sponsor" cutText ["<img size='8' shadow='0' image='Images\opengroup_sponsor.paa'/>", "PLAIN DOWN", 5, true, true];

        "disclaimerLayer_Text" cutText  ["<t size='2'> Quang Ngai province, Republic of South Vietnam, 1968...</t>", "PLAIN", 5, true, true];
        
		sleep 8;
		
		"disclaimerLayer_Text" cutFadeout 0.5;

		//To add more text parts simply uncomment the lines below, if you need a third then copy the lines below and give the layer a new name
		/*
		sleep 3;
		
		"disclaimerLayer_Extra" cutText  ["<t size='2'> This is the second text wall, the rason this is being shown to you is so we can tell if the descilaimer is working or not, as you can see my writing is not perfect cause this is not exactly important, the important part is the timing of it.\n May the land of our lords be free.</t>", "PLAIN", 5, true, true];
		
		sleep 12;
		
		"disclaimerLayer_Extra" cutFadeout 0.5;
		*/

		//"disclaimerLayer_Sponsor" cutFadeout 0.5;

		sleep 3;

		"disclaimerLayer_Background" cutText ["", "BLACK FADED", -1, true, false];
        "disclaimerLayer_Background" cutFadeout 5;

        "dynamicBlur" ppEffectEnable true;
        "dynamicBlur" ppEffectAdjust [6];
        "dynamicBlur" ppEffectCommit 0;
        "dynamicBlur" ppEffectAdjust [0.0];
        "dynamicBlur" ppEffectCommit 5;

        5 fadeSound 1;
        5 fadeRadio 1;

        sleep 5;
        //[missionNamespace, "AET_disclaimerDone", []] call BIS_fnc_callScriptedEventHandler;
    };

    [missionNamespace, "AET_disclaimerDone", {"dynamicBlur" ppEffectEnable false;}] call BIS_fnc_addScriptedEventHandler;
};


