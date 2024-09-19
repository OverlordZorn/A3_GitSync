//------------------------------------------------------------------------------------------------------------------------------MEDICAL
_code = {
    [{
        [
            "Receiving Treatment...",                  // Title of progressBar
            2,                                // Duration of progressBar in secounds
            {true},                            // Condition, will check every frame
            {
                private _HealThese = player nearEntities ["Man", 50];
                {
                [_x] call ace_medical_treatment_fnc_fullHealLocal;
                } Foreach _HealThese;
                                // The actual fucking code
            }                                  // codeblock to be executed on completion
        ] call CBA_fnc_progressBar;            // !!! Executing a CBA progressBar from an Ace Interaction results in crash. Delay execution by 1 frame !!!
    }] call CBA_fnc_execNextFrame;             // <- this will delay the execution by 1 Frame. 
}; 

// Here we create the action which we later attach to something
_cvo_fullAceHeal = [
    "CVO_FullHeal",                            // Action Name
    "Receive Medical Treatment",               // Name for the ACE Interaction Menu
    "",                                        // Statement - i have no fucking clue what that is supposed to mean
    _code,                                     // the coe you're executing
    {true}                                     // Condition
] call ace_interact_menu_fnc_createAction;

// Here we define where we want this action that we created to be attached to
[
    "B_support_Mort_F",                       // Class the action should be assigned to
    0,                                         // Type of action, 0 for action, 1 for self-actionIDs
    ["ACE_MainActions"],                       // Parent path of the new action <Array>, here its the root
    _cvo_fullAceHeal                           // The Action we want to attach
] call ace_interact_menu_fnc_addActionToClass;        // Alternative: ace_interact_menu_fnc_addActionToObject 
//-----------------------------------------------------------------------------------------------------------------------------3R