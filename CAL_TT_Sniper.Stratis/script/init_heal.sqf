 healAttached = [healbox];

{
	_x addAction ["Heal And Repair", "script\fnc_heal.sqf",nil,1.5,true,true,"","",2,false,"",""];
} forEach healAttached;