/*
Was ist eine Funktion?
	Mathematisch gesehn ist eine Funktion die Abbildung eines Def. Bereiches (D) auf einen Wertebereich (W).

Umgangsprachlich
	Input -> Funktion -> Output

Warum Functions in ArmA?
	Code sauber zu halten
	Übersicht zu wahren
	Dopplungen von Prozessen zu vermeiden
	Performance zu verbessern

Es gibt zwei möglichkeiten in ArmA functions zu erstellen
	Die Inline Function
und 
	Functions Extern in einer Datei

	Inline
###
myFunction {
	_parameter = _this
	mein code;
	_return;
}
###
"to call a function"
_result = [_parameter]call myFunction;

Unterschied zwischen call und spawn

*/


/*
private ["_number1", "_number2", "_return"];
^ dies macht die genannten lokalen variablen von außerhalb unzugänglich, es "begrenzt" den "scope".
Sie bleiben für die Funktion exklusive.
*/

/*
[] call myfunction -> Script wartet auf RÜckgabewert

[] spawn myFunction -> Script wartet nicht auf Rückgabewert, weshalb dieser nicht zugänglich ist.

Damit ist spawn der Befehl um eine Function wie ein Procedure zu nutzen.(neu: void Methode).

In einer Procedure wird etwas gemacht, ohne etwas zurückzugebben (spawne eine Einheit, gebe einen hint aus, setze Einheit auf Position xyz etc.)
*/