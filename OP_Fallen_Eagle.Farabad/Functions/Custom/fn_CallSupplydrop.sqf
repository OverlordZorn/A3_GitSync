//------------------------------------------------------------------------------------------------------------------------------SUPPLY DROP
supplyCount = 0;
_code6 = {
    [{
        [
            "Requesting Supply Drop...",                  // Title of progressBar
            5,                                // Duration of progressBar in secounds
            {supplyCount <= 10},                            // Condition, will check every frame
            {
                if (alive AA_1 || alive AA_2) then {
                ["SKYCRANE", "SKYCRANE to FOXTROT, be advised, resupply is not authorized at this time."] remoteExec ["BIS_fnc_showSubtitle", player];
                [player, "ResupNo"] remoteExec ["say3D", 0];
                } else {
                _SDpos = position player;
                ["SKYCRANE", "SKYCRANE to FOXTROT, resupply inbound, eta 3 mikes, out."] remoteExec ["BIS_fnc_showSubtitle", player];
                [player, "ResupYes"] remoteExec ["say3D", 0];
                [_SDpos] spawn AET_fnc_SupplyDrop;
                supplyCount = supplyCount + 1;
                };
                                // The actual fucking code
            }                                 // codeblock to be executed on completion

        ] call CBA_fnc_progressBar;            // !!! Executing a CBA progressBar from an Ace Interaction results in crash. Delay execution by 1 frame !!!
    }] call CBA_fnc_execNextFrame;             // <- this will delay the execution by 1 Frame. 
}; 

// Here we create the action which we later attach to something
_SupplyDrop = [
    "HOM_SupDrop",                            // Action Name
    "Request Supply Drop",                   // Name for the ACE Interaction Menu
    "",                                        // Statement - i have no fucking clue what that is supposed to mean
    _code6,                                     // the coe you're executing
    {supplyCount == 0 || supplyCount == 1}                                    // Condition
] call ace_interact_menu_fnc_createAction;

// Here we define where we want this action that we created to be attached to
[
    "B_RangeMaster_F",                       // Class the action should be assigned to
    1,                                         // Type of action, 0 for action, 1 for self-actionIDs
    ["ACE_SelfActions"],                       // Parent path of the new action <Array>, here its the root
    _SupplyDrop                         // The Action we want to attach
] call ace_interact_menu_fnc_addActionToClass;        // Alternative: ace_interact_menu_fnc_addActionToObject 