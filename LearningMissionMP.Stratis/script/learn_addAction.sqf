sign1 addAction["AddAction Example","script\learn_addActionScript.sqf"];


TP_01 addAction["Travel to HQ","TP\TP_toHQ.sqf"];

TP_02 addAction["Travel to HQ","TP\TP_toHQ.sqf"];

TP_03 addAction["Travel to HQ","TP\TP_toHQ.sqf"];

TP_HQ addAction["Travel to TP01", "TP\TP_to01.sqf"];
TP_HQ addAction["Travel to TP02", "TP\TP_to02.sqf"];
TP_HQ addAction["Travel to TP03", "TP\TP_to03.sqf"];

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