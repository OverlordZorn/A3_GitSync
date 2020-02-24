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


