stations = [station, station_1, station_2, station_3, station_4, station_5];

{
	_x addAction ["Heal And Repair", "script\fnc_heal.sqf",nil,1.5,true,true,"","",2,false,"",""];
} forEach stations;