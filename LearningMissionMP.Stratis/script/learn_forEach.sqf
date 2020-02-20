_crew = [s1, s2, s3];

{
	_x moveInCargo car1;
	hint format["moving %1", _x];
	sleep 1;
}foreach _crew;



//  innerhalb der for each schleife ist die lokale instanzvariable: "_x"