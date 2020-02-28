# Grundprinzip des MP Scripting

## Wieso?

IM MP gibt es eine komplett neue Struktur

        Server

Client   		player

Der server Steht zwischen den Clients und ist die Plattform auf der alle zueinander findNearestEnemy
Die spieler joinen gemeinsam auf den Server oder nacheinander (JIP).


## Lokalitäten

Lokalitäten spielen eine Rolle für Anweisungen.
Anweisungen sehen in der Regel so aus:

Argument - Anweisung - Argument -> Wert/Effekt

spieler1 setPos pos1 -> spieler1 wird auf Pos1 gesetzt

Argumente können in Variablen stehen 
Argumente können Werte oder Objekte sein.

spieler1 = Variable die das Objekt der Einheit des Spielers beinhaltet

pos1 = Variable, die den wert [x,y,z] hat.

Für eine Anweisung ist wichtig:

Sind mir meine Argumente zugänglich?

Eine Variable kann lokal, lokal global oder global global sein.

## Die Lokalität von Variablen

lokal (ich bin nur hier zugänglich)

lokal global (ich bin überall  auf einer maschine zugänglich)

global global (ich bin auf jeder maschine global zugänglich)

## Lokalitäten von Effekten und Objekten

### Lokalität von Objekten:

Lokales Objekt

globales Objekt

Lokalität eines Effekts:
lokal  (nur auf der maschine des auszuführenden)
global (auf allen maschinen ausgeführt )

Daher gibt es unterchiedliche Arten von Anweisungen, die jeweils unterschiedliche Lokalitäten von den ihnen übergebenen Objekten udn Effekten erwarten.