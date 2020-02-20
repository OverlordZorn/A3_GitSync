if (alive civ1 AND alive civ2) then {hint "keiner Tod"}; 
if ((!(alive civ1) && !(alive civ2))) then {hint "beide Tod"}; 
if ((alive civ1 OR alive civ2) AND !(alive civ1 AND alive civ2)) then {hint "einer Tod"}; 
 
