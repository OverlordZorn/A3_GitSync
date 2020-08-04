textInstructor = parseText " 
Welcome to the Land Navigation Course made by Mr. Zorn.<br></br><br></br>   
You are an Instructor.<br></br><br></br> 
In this Course you will teach and supervise the stutents on how to use the basic and advanced tools ACE provided and help them find their way around Malden Island. <br></br><br></br>
It is highly recommended to have the following documentation at hand to help youself around<br></br><br></br>
<a color='#0000ff' href='https://github.com/1337zorn/Arma-3-Guide/blob/master/LandNav/LandNav.md'> Land Navigation Documentation</a> <br></br><br></br> 

Behind the church, there is a big Garbage Container, it has an ACE Arsenal. Take with you what you might need on your journey <br></br><br></br>

Admin Logged in has Zeus he should hand out Zeus to all Instructors. <br></br><br></br>

Once you are ready, send them to the first Phone Booth and start their journey...</br>"; 

textStudent = parseText "
<t>Welcome to the Land Navigation Course made by Mr. Zorn<br></br><br></br>
You are a Student<br></br><br></br>
In this Course you will learn how to use the basic and advanced tools ACE provides and find you way around Malden Island.<br></br><br></br>
It is highly recommended to have the following documentation at hand to help youself around:<br></br><br></br>
<a colorLink='#0000ff' href='https://github.com/1337zorn/Arma-3-Guide/blob/master/LandNav/LandNav.md'> Land Navigation Documentation</a><br></br><br></br>
 Behind the church, there is a big Garbage Container, it has an ACE Arsenal. <br></br>Take with you what you might need on your journey <br></br><br></br>
 Once you are ready, go to the first Phone Booth and start your journey...</t>";


_playerRole = (_this#0) getVariable ["Role", "false"];

if (_playerRole === "Student") then {
	[textStudent, "Welcome to Land Nav", false, "Continue"] spawn BIS_fnc_guiMessage;
}
if (_playerRole === "Instructor") then {
	[textInstructor, "Welcome to Land Nav", false, "Continue"] spawn BIS_fnc_guiMessage;
};