/* Insert into init: FIA_SQL addAction ["Greet your Friend", "\train\FAK_01.sqf",0];
*/
_stage = _this select 3;
_actionID = _this select 2;
hintC format ["%1\n%2", _stage, _this];
sleep 1;


switch (_stage) do {
	case 0: {
		hintC format["Hello %1, Good to see you! And just at the right time!\nOne of our men got injured, he's a bad driver!\n Do you have a FirstAidKit we could use?",name (_this select 1)];
		_this select 0 removeAction _actionID;
		sleep 2;
		_this select 0 addAction ["Offer them a FAK", "train\FAK_01.sqf",1];
	};
	case 1: {
		_this select 0 removeAction _actionID;
		if (([_this select 1, "FirstAidKit"] call BIS_fnc_hasItem)) then {
			hintC format["Jesus Man you saved his ass!\n %1! Here, take this and go and take care of %2!\n Man, %2 ows his life to you, %3!\n Thank you very much my dude!\n Here, we have this crate we want to offer our graditute!" , name FIA_MED,name FIA_INJ,name (_this select 1)];
			_this select 1 removeItem "FirstAidKit";
			FIA_MED action ["HealSoldier", FIA_INJ];
			sleep 5;
			FIA_BOX setPos [2585.26,5487.09,0];
			

		} else {
			hintC format["Man %1, this is no FAK - we need a FAK! come again with a FAK!" , name (_this select 1)];
			sleep 10;
			_this select 0 addAction ["Offer them a FAK", "train\FAK_01.sqf",1];
		};
	};
};
