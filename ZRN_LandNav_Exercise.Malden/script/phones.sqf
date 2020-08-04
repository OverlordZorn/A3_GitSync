text_start = composeText [
    "Hello my friend", lineBreak, lineBreak,
    "I am sorry but I cannot be here myself, things have become difficult.", lineBreak, 
    "We can't talk long, someone is following me.", lineBreak, lineBreak,
    "For now, do you see the two small belltowers behind you by the rocks?", lineBreak, lineBreak,
    "They are arranged to point towards Polaris, amazing stuff, isn't it?", lineBreak, lineBreak,
    "Now, lets not get distracted. Go towards the north, there you will find a small house with an old farming mashine!", lineBreak,lineBreak,
    "There is another phone, use it to call me!", lineBreak,lineBreak,
    "Oh by the way, behind this chapel, there is Garbage Container. (ACE INTERACT ARSENAL)",lineBreak,"I threw some stuff in there I wanted to give you.", lineBreak,lineBreak,
    "Good luck my friend!"
];
phone_start addAction ["Pick Up Ringing Phone", {[text_start, "Phone Call", false, "Lets go..."] call BIS_fnc_guiMessage}
,nil,1.5,true,true,"","",2,false,"",""];


text_compass = composeText [
    "Hello my friend", lineBreak,lineBreak,
    "Now, go inside this room, there is a Box with a Compass, take it and look out of the window next to the door by the carpet!", lineBreak, lineBreak,
    "There's a yellow building with a silo. Take the bearing of it in Mils and add 27 Mils to it.", lineBreak, lineBreak,
    "Then go in that direction. The light will show you your path!", lineBreak, lineBreak,
    "There's another phone!"
];
phone_compass addAction ["Call the Stranger", {[text_compass, "Phone Call", false, "Let's see..."] call BIS_fnc_guiMessage},nil,1.5,true,true,"","",2,false,"",""];


text_car = composeText [
    "Hey! They are getting closer, so we need to hurry!", lineBreak, lineBreak,
    "The light already helped you to find your path, but now you need to find the light...", lineBreak, lineBreak,
    "This light will cross your path again, turn left and left again. Skip the next two and then turn right!"
    ];
phone_car addAction ["Insert Coins", {[text_car, "Phone Call", false, "Let's see..."] call BIS_fnc_guiMessage},nil,1.5,true,true,"","",2,false,"",""];


text_map = composeText [
    "Great! You made it here! Take the Mapcase with the Map!", lineBreak, lineBreak,
    "You started at the chapel in Saint Martin.", lineBreak, lineBreak, 
    "Your next destination will be in the city of Chapoi, you will find another phone by one of the two...", lineBreak, lineBreak, 
    "... shit i need to leave"
    ];
phone_map addAction ["Insert Coins", {[text_map, "Phone Call", false, "Oh no!"] call BIS_fnc_guiMessage},nil,1.5,true,true,"","",2,false,"",""];

text_tools = composeText [
    "My friend, you didn't fall on your head. We could use a man with your capabilities", lineBreak, lineBreak,
    "Dont worry about me, there is a reason why i am followed but I am still alive.", lineBreak, lineBreak,
    "Behind one of the graves you will find a box, there is is Map Tool inside.", lineBreak, lineBreak, 
    "Write down the following: 327° 1.8km from here", lineBreak, lineBreak,
    "Soon we will meet but we need to get rid of your tail, so dont waste any time!"
    ];
phone_tools addAction ["Insert Coins", { [text_tools, "PhoneCall", false, "Let's see..."] call BIS_fnc_guiMessage },nil,1.5,true,true,"","",2,false,"",""];

text_dagr = composeText [
    "ACE SELF EQUIPMENT CONFIGURE DAGR", lineBreak, 
    "↑   ↑   ↑   ↑   ↑   ↓   ↓   ↓   SEL SEL ", lineBreak, 
    "MENU   ↓   ↓   SEL MARK", lineBreak,
    " ←   ↑   ↓   ↓   ↓   ↓   ↓", lineBreak,
    "←   ↑   ↑   ↑", lineBreak,
    "←   ↓   ↓   ↓   ↓", lineBreak, 
    "→     →     →     →     →     ↑   ↑   ↑   ↑", lineBreak,
    "←   ↑   ↑   ↑   →   →    ↑   ↑   ↑", lineBreak,
    "←   ←   ↑   ↑   →   →    ↑   ↑   ↑", lineBreak,    
    "MARK", lineBreak,
    "MENU ↓   SEL SEL PWR ACE DAGR TOGGLE"
    ];
phone_dagr addAction ["Insert Coins", { [text_dagr, "You hear a recorded message", false, "The fuck?"] call BIS_fnc_guiMessage },nil,1.5,true,true,"","",2,false,"",""];

text_bino = composeText [
    "My friend! Good you made it here! In the Box next to you there are some Binoculars. If you look through them you can see a crosshair!", lineBreak, lineBreak,
    "You know how to rangefind with a normal Sniperscope, right?", linebreak, "No? Its easy!", lineBreak, lineBreak,
    "Take the height of the object you are looking at and multiply by 1000", lineBreak, lineBreak,
    "Take that and devide it by the amount of MilDots you're seeing", lineBreak, 
    "BOOM you have the distance from here to there!", lineBreak,
    "Oh, One more thing!, The Marks on the Binoculars?", lineBreak, "They Stand for 10, not for 1!", lineBreak, lineBreak,
    "Now search for a tower of small, red shipping containers, One of these is 1.5m high!", lineBreak,
    "Meassure the distance between you and the Tower", lineBreak, "Make a line from you to the tower, remove 550m from the total length, at that point, go 90° relative right for 2.6 km", lineBreak, lineBreak,
    "At your next destination, you will find a place where Water is above the Ground", lineBreak, lineBreak, lineBreak,
    "(Real Height * 1000) / MIL DOTS = DISTANCE TO TARGET"
    ];
phone_bino addAction ["Investigate the Phone", { [text_bino, "You find a sticky note", false, "Ah Yes!"] call BIS_fnc_guiMessage },nil,1.5,true,true,"","",2,false,"",""];

text_next = composeText [
    "START CENTER BARN", lineBreak,
    "ABSOLUTE  40° 2000 METERS", lineBreak,
    "RELATIVE -90° 3540 METERS", lineBreak,
    "ABSOLUTE 180° 2000 METERS", lineBreak,
    "ABSOLUTE 129° 2740mm METERS"
    ];
phone_next addAction ["Insert Coins", {[text_next, "You hear a recorded message", false, "What?"] call BIS_fnc_guiMessage },nil,1.5,true,true,"","",2,false,"",""];

text_micro = composeText [
    "My Friend, very soon we will meet, but I have to make sure, no one is following you.", lineBreak,
    "In the little green trashcan behind you, you can find a MicroDAGR GPS, its the latest shit, can give position up to a meter!", lineBreak,
    "Even with the Map tools you can only get down to 10 meters", lineBreak, linebreak,
    "I hid a little cache for your efforts at the end, but be percise!", lineBreak,
    "After you found the cache, come to the market in Dourdan where we might finally meet", lineBreak,
    "But first, go to the next phone", lineBreak, lineBreak,
    "07109e - 08969n + 00105MSL", lineBreak, lineBreak,
    "Open your MicroDAGR and click on the Time at the Top to get to the Menu. Next you Set up your Waypoint. First you enter the longitute and latitute together, next is just a name, dont worry about it. Then SetWP", lineBreak,
    "The Mediean Sea Level I give to you, so you can make sure you are exactly at the right spot"
    ];
phone_micro addAction ["Insert Coins", { [text_micro, "Phone Call", false, "Nice"] call BIS_fnc_guiMessage },nil,1.5,true,true,"","",2,false,"",""];

text_final_1 = composeText [
    "06026e", lineBreak,
    "08614n", lineBreak,
    "00125 MSL", lineBreak
    ];
phone_final_1 addAction ["Insert Coins", {[text_final_1, "You hear a recorded message", false, "Again?"] call BIS_fnc_guiMessage},nil,1.5,true,true,"","",2,false,"",""];

text_final_2 = composeText [
    "07199e", lineBreak,
    "07875n", lineBreak,
    "00167 MSL", lineBreak
    ];
phone_final_2 addAction ["Insert Coins", {[text_final_2, "You hear a recorded message", false, "One more?"] call BIS_fnc_guiMessage},nil,1.5,true,true,"","",2,false,"",""];

text_final_3 = composeText [
    "07109e", lineBreak,
    "07860n", lineBreak,
    "00169 MSL", lineBreak
    ];
phone_final_3 addAction ["Insert Coins", {[text_final_3, "You hear a recorded message", false, "Oh God..."] call BIS_fnc_guiMessage},nil,1.5,true,true,"","",2,false,"",""];

text_radio1 = composeText [
    "My friend, you are a clever one, soon to become a brother!", lineBreak, lineBreak,
    "07028e", lineBreak,
    "08143n", lineBreak,
    "00173 MSL", lineBreak
    ];
radio1 addAction ["Listen to the Radio", { [text_radio1, "Radio Transmission", false, "Finally..."] call BIS_fnc_guiMessage },nil,1.5,true,true,"","",2,false,"",""];

text_radio2 = composeText [
    "My friend, I am proud of you!", lineBreak,
    "finally we can meet! Take what you need and come to our home!", lineBreak, lineBreak,
    "06666e - 06666n"
    ];
radio2 addAction ["Use Radio", {[text_radio2, "PhoneCall with the stranger", false, "Let's see..."] call BIS_fnc_guiMessage},nil,1.5,true,true,"","",2,false,"",""];

text_police = composeText [
    "You fool! I told you to be careful and percise....! Go back to the garage and check on top of the roof! Now quickly go before they get suspicous!"
    ];
phone_police addAction ["Insert Coins", {[ text_police, "PhoneCall with the stranger", false, "Let's see..."] call BIS_fnc_guiMessage },nil,1.5,true,true,"","",2,false,"",""];


// FailSafes

failsafes = [phone_wrong, phone_wrong_1, phone_wrong_2, phone_wrong_3, phone_wrong_4];

{
    _x addAction ["Insert Coins", {hint "This is not the droid you're looking for";},nil,1.5,true,true,"","",2,false,"",""];
} forEach failsafes;
