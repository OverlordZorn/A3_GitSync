 healAttached = [healbox, healbox_1,healbox_2,healbox_3,healbox_4, healhouse, healcar];

{
	_x addAction ["Heal And Repair", "script\fnc_heal.sqf",nil,1.5,true,true,"","",2,false,"",""];
} forEach healAttached;