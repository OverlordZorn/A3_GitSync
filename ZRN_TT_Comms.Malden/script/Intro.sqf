textInstructor = parseText " 
Welcome to the Communication Course made by Mr. Zorn.<br></br><br></br>   
You are an Instructor.<br></br><br></br> 
In this Course you will teach and supervise the stutents on how to Communicate and send them around the Stations on Malden Island. <br></br><br></br>
It is highly recommended to have the following documentation at hand to help youself around<br></br><br></br>
<a color='#0000ff' href='https://github.com/1337zorn/Arma-3-Guide/blob/master/Communication/Communication.md'> Communication Documentation</a> <br></br><br></br> 


Admin Logged in has Zeus he should hand out Zeus to all Instructors. <br></br><br></br>

Your stutents spawned in the middle of no where, their first task is to find the city of Arudy.<br></br>

This has been done to give you as instructors time to set up and to provide a staggered arrival of the students<br></br>

Once they arrive here send them to station 0 here by the tent next to you"; 

textStudent = parseText "
Welcome to the Communication Course made by Mr. Zorn<br></br><br></br>
You are a Student<br></br><br></br>
In this Course you will learn how to Communicate properly and visit Stations around Malden Island.<br></br><br></br>
It is highly recommended to have the following documentation at hand to help youself around:<br></br><br></br>
<a colorLink='#0000ff' href='https://github.com/1337zorn/Arma-3-Guide/blob/master/Communication/Communication.md'> Communication Documentation</a><br></br><br></br>
 
It is an early and foggy morning, your excercise will start very soon! Make your way to the City of Arudy. <br></br><br></br>
Once there, the Instructors will brief you on your next task!";


_playerRole = (_this#0) getVariable ["Role", "false"];

if (_playerRole == "Student") then {
	[textStudent, "Welcome to Comms", false, "Continue"] spawn BIS_fnc_guiMessage;
};
if (_playerRole == "Instructor") then {
	[textInstructor, "Welcome to Comms", false, "Continue"] spawn BIS_fnc_guiMessage;
};