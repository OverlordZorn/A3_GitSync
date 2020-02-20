sign1 addAction["AddAction Example","script\learn_addActionScript.sqf"];
hint "addAction init done";


/*
Viele Möglichkeiten Scripte zu starten:

-execVM in Init, Auslöser, Konsole, init.sqf,...

Neue Möglichkeit: ActionMenü

_object addAction ["AnzeigeName der Aktion", "Pfad zum Script bzw. Script"];

ACHTUNG:

AddAction wird nur local ausgeführt und kann im MP daher unerwartete Probleme auftreten lassen.

Multiplayer: fügt AddAction in der Init Zeile hinzu.


*/