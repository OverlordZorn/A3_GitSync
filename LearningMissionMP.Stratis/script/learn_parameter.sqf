
_a = _this select 0;
_b = _this select 1;
_result = _a + _b;

hint format["%1",_result];
sleep 1;
hint format["%1",_this];
// the parameter die beim aufrufen des scripts übergeben werden sind im lokalen array: "_this" zu finden.