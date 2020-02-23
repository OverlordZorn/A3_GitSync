sign_1 addAction["AddAction Example","script\learn_addActionScript.sqf"];
sign_2 addAction["AddAction Example","script\learn_addActionScript2.sqf"];
sign_2 addAction["AddAction Example Nr. 2","script\learn_addActionScript2.sqf"];

_tp_init = ["init"] execVM "TP\TP.sqf";

FIA_SQL addAction ["Offer Help", "train\FAK_01.sqf",0];

/*
Viele Möglichkeiten Scripte zu starten:

-execVM in Init, Auslöser, Konsole, init.sqf,...

Neue Möglichkeit: ActionMenü

_object addAction ["AnzeigeName der Aktion", "Pfad zum Script bzw. Script"];

ACHTUNG:

AddAction wird nur local ausgeführt und kann im MP daher unerwartete Probleme auftreten lassen.

Multiplayer: fügt AddAction in der Init Zeile hinzu.


*/