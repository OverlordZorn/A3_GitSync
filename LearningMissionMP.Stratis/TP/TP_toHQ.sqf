/*
object setPos pos

pos: Array - position in format PositionAGL or Position 2D



getPos object
returns Array Position AGLS

*/


cutText ["You make your way to HQ","BLACK",5];
sleep 10;
_this select 1 setPos (getPos(TP_HQ));
skipTime 0.5;
cutText ["Time to Go","BLACK IN", 5];
