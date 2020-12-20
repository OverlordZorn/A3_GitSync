phones = [phone_start, phone_compass, phone_car, phone_map, phone_tools, phone_dagr, phone_bino, phone_next, phone_micro, phone_final_1, phone_final_2, phone_final_3, phone_police];

{
	_x addAction ["Heal And Repair", "script\fnc_heal.sqf",nil,1.5,true,true,"","",2,false,"",""];
} forEach phones;