/*
if (hasInterface) then {
    0 fadeRadio 0;
    0 fadeSound 0;

    [] spawn {
		"disclaimerLayer_Background" cutText ["", "BLACK FADED", 999, true, false];

        waitUntil{sleep 1; !(isNil "BIS_fnc_init")};

        sleep 8;

		"disclaimerLayer_Sponsor" cutText ["<img size='8' shadow='0' image='Images\opengroup_sponsor.paa'/>", "PLAIN DOWN", 5, true, true];

        "disclaimerLayer_Text" cutText  ["<t size='2'> Disclaimer: This is a work of fiction. Names, characters, businesses, places, events and incidents are either the products of the author's imagination or used in a fictitious manner. Any resemblance to actual persons, living or dead, or actual events is purely coincidental.</t>", "PLAIN", 5, true, true];
        
		sleep 20;
		
		"disclaimerLayer_Text" cutFadeout 0.5;
        "disclaimerLayer_Sponsor" cutFadeout 0.5;

		//To add more text parts simply uncomment the lines below, if you need a third then copy the lines below and give the layer a new name
		
		sleep 3;

        "disclaimerLayer_Extra1" cutText  ["<t size='1'>  <t font='EtelkaMonospacePro'>
1981, in response to the US ultimatum, Iranian officials rejected the release request of 53 hostages at the US Embassy in Tehran.<br/>
</t>", "PLAIN", 1, true, true];
        sleep 4;
        "disclaimerLayer_Extra2" cutText  ["<t size='1'> <t font='EtelkaMonospacePro'>
<br/>
<br/>
Following the breakdown of diplomacy, the US administration formally announced combat operations against the Iranian Army.<br/>
        </t>", "PLAIN", 1, true, true];
        sleep 8;
        "disclaimerLayer_Extra1" cutFadeout 0.5;
        sleep 2;
        "disclaimerLayer_Extra2" cutFadeout 0.5;
        sleep 4;

        "disclaimerLayer_Extra3" cutText  ["<t size='1'> <t font='EtelkaMonospacePro'>
24.09.1982, Operation Vigilant Hawk, reconnaissance element FOXTROT is tasked to locate Iranian positions for airstrikes.
</t>", "PLAIN", 1, true, true];
        sleep 6;
        "disclaimerLayer_Extra4" cutText  ["<t size='1'> <t font='EtelkaMonospacePro'>
<br/>
<br/>
0532 hours - FOXTROT requests resupply, and confirms delivery.
</t>", "PLAIN", 1, true, true];
        sleep 6;
        "disclaimerLayer_Extra5" cutText  ["<t size='1'> <t font='EtelkaMonospacePro'>
<br/>
<br/>
<br/>
0554 hours - Resupply flight, UH-60 flight WHISKEY, reports enemy contact, followed by mayday call.
</t>", "PLAIN", 1, true, true];
        sleep 6;
        "disclaimerLayer_Extra6" cutText  ["<t size='1'> <t font='EtelkaMonospacePro'>
<br/>
<br/>
<br/>
<br/>
<br/>
0600 hours - Operation Fallen Eagle, a standby procedure for CSAR operations in Iranian airspace, is authorized.
</t>", "PLAIN", 1, true, true];
        sleep 8;
        
        "disclaimerLayer_Extra3" cutFadeout 0.5;
        "disclaimerLayer_Extra4" cutFadeout 0.5;
        "disclaimerLayer_Extra5" cutFadeout 0.5;
        "disclaimerLayer_Extra6" cutFadeout 0.5;
        sleep 4;

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
        [missionNamespace, "AET_disclaimerDone", []] call BIS_fnc_callScriptedEventHandler;
    };

    [missionNamespace, "AET_disclaimerDone", {"dynamicBlur" ppEffectEnable false;}] call BIS_fnc_addScriptedEventHandler;
};
*/