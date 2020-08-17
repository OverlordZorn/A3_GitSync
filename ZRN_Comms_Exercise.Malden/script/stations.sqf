text_0 = composeText [
    "Welcome to the course.", lineBreak, lineBreak,
    "In this excercise you will complete 5 stations.", lineBreak,
    "Each station will have a task that will require you to make a radio call towards HQ CROSSROADS on TaskNet.", lineBreak,
    "These task's will be transmitted via the longrange radio you can find in the shipping container.", lineBreak, lineBreak,

    "We will operate on two Frequencies:", lineBreak,
    "Frequency 30MHz will be the TaskNet, here you will tranmit the tasks provided at the Stations.", lineBreak,
    "Please use all Procedures & Rules on this network as this is the core of this excercise.", lineBreak, lineBreak,

    "Frequency 87MHz will be the HelpNet, here you can ask for help and we will get to you.", lineBreak,
    "If nothing is working just use SideChat to get our attention or ping for Zeus.", lineBreak, lineBreak,

    "The order of the stations will be provided by the Instructors on TaskNet.", lineBreak, lineBreak,
    "Your first step will be to take your vehicle and leave the Station Area, call HQ CROSSROADS on TaskNet and state your readiness.", lineBreak, lineBreak,

    "After the completion of a station, wait a few moments and call in on TaskNet and state that you are ready for new tasking, HQ CROSSROADS will let you know where to go next then", lineBreak, lineBreak,

    "Be careful! The terrain might disrupt your communication with HQ, if that is the case, relocate to a better position!", lineBreak, lineBreak,

    "Stations:", lineBreak,
    "Station 1 - Radio Check" , lineBreak,
    "Station 2 - Contact Report" , lineBreak,
    "Station 3 - SITREP" , lineBreak,
    "Station 4 - MEDEVAC" , lineBreak,
    "Station 5 - IDF SUPPORT", lineBreak, lineBreak,

    "Once you completed all stations return to Arudy", lineBreak, lineBreak,

    
    "Good luck and enjoy your adventure!"
];

text_1 = composeText [
    "Station 1: Radio Check", lineBreak, lineBreak,

    "Your Task is to execute a RadioCheck with HQ Crossroads!", lineBreak, lineBreak,

    "Once delivered, execute a Radiocheck with another Student! Ask HQ for whom you should contact!"
];

text_2 = composeText [
    "Station 2: Contact Report", lineBreak, lineBreak,

    "Your Task is to deliver a Contact Report towards HQ Crossroads!", lineBreak, lineBreak,

    "There are no Contacts around, but be creative!", lineBreak, 
    "Look at the examples in the Communication Document for Inspiration!"
];

text_3 = composeText [
    "Station 3: SITREP", lineBreak, lineBreak,

    "Give a Detailed SITREP including an ACE Report and your position to HQ Crossroads!", lineBreak, lineBreak,

    "Once delivered, request another Student for their current position! Ask HQ for whom you should contact"
];

text_4 = composeText [
    "Station 4: Request Pickup", lineBreak, lineBreak,

    "Your Task is to request a MEDEVAC! Find a suitable LZ nearby, mark it on the Map and contact HQ for it.", lineBreak, lineBreak, 

    "This is a priority message, deliver it as such!", lineBreak, lineBreak,

    "Sadly, there wont be any helicopter to pick you up. Once the call is completed, ask HQ for new task."
];

text_5 = composeText [
    "Station 5: Request Mortar Support", lineBreak, lineBreak,

    "Your Task is to request Mortar Support from HQ CROSSROADS!", lineBreak,
    "Mark an Target Reference Point, name it and request a firemission via HQ CROSSRAODS.", lineBreak, lineBreak,

    "Sadly, there wont be any Indirect Fire. Once the call is completed, ask HQ for a new task."
];

station addAction ["Review Station Task", {[text_0, "Station 0", false, "Lets go..."] call BIS_fnc_guiMessage}
,nil,1.5,true,true,"","",2,false,"",""];


station_1 addAction ["Review Station Task", {[text_1, "Station 1", false, "Lets go..."] call BIS_fnc_guiMessage}
,nil,1.5,true,true,"","",2,false,"",""];


station_2 addAction ["Review Station Task", {[text_2, "Station 2", false, "Lets go..."] call BIS_fnc_guiMessage}
,nil,1.5,true,true,"","",2,false,"",""];

station_3 addAction ["Review Station Task", {[text_3, "Station 3", false, "Lets go..."] call BIS_fnc_guiMessage}
,nil,1.5,true,true,"","",2,false,"",""];

station_4 addAction ["Review Station Task", {[text_4, "Station 4", false, "Lets go..."] call BIS_fnc_guiMessage}
,nil,1.5,true,true,"","",2,false,"",""];

station_5 addAction ["Review Station Task", {[text_5, "Station 5", false, "Lets go..."] call BIS_fnc_guiMessage}
,nil,1.5,true,true,"","",2,false,"",""];

