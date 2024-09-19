//------------------------------------------------------------------------------------------------------------------------------CARRIER TELEPORT
_code5 = {
    [{

        [

            "Calling Evac",

            60,

            {isNull objectParent player},

            {

                    if (isNull objectParent player) then {

                        ["TPLayer_Background", ["", "BLACK FADED", -1, true, false]] remoteExec ["cutText", player];
                        player setPosATL [759.055,4703.47,0];
                        ["TPLayer_Background", 10] remoteExec ["cutFadeout", player];

                    } else {

                        hint "Cannot evacuate while in vehicle!";

                    };


                                                
            }                                 

        ] call CBA_fnc_progressBar;  
    }] call CBA_fnc_execNextFrame;   
}; 

// Here we create the action which we later attach to something
_CarrierTP = [
    "HOM_CVTP",                            // Action Name
    "Call Evac",                   // Name for the ACE Interaction Menu
    "",                                        // Statement - i have no fucking clue what that is supposed to mean
    _code5,                                     // the coe you're executing
    {isNull objectParent player}                                     // Condition
] call ace_interact_menu_fnc_createAction;

// Here we define where we want this action that we created to be attached to
[
    "B_Pilot_F",                       // Class the action should be assigned to
    1,                                         // Type of action, 0 for action, 1 for self-actionIDs
    ["ACE_SelfActions"],                       // Parent path of the new action <Array>, here its the root
    _CarrierTP                           // The Action we want to attach
] call ace_interact_menu_fnc_addActionToClass;        // Alternative: ace_interact_menu_fnc_addActionToObject 