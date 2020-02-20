string = string + "Test";
hint string;

_array1 = [1,2,3,4,5];
// Arrays kann man mischen, möchte man aber so gut wie es geht vermeiden.
_array2 = ["Hallo", 1, "Test", true];

// Arrays Index startet bei 0

// Arrays ansprechen

_array1 select 0 == 1; // true
_array 1 select 4 == 5; // true

// Arrays Verarbeiten

_arr1 = [1,2];
_arr2 = [3,4];
_arr3 = [2];

output_int = _arr1 select 0;    // -> 1
output_int2 = _arr2 select 2;   // returns nothing 

// Ich kann arrays: kopieren, addieren, subtrahieren und fragen, wie lange es isText

output_array1 = _array1 + _array2;  // -> [1,2,3,4]

// erweitern

