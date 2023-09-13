if (player getVariable ["cvo_arsenal", "flase"]) {
	cvo_vitual_arsenal = "B_supplyCrate_F" createVehicleLocal [0,0,0];

	player setVariable ["cvo_arsenal", cvo_virtual_arsenal, false];

	[cvo_vitual_arsenal, false] 				call ace_dragging_fnc_setDraggable;			// Disables Dragging
	[cvo_vitual_arsenal, false] 				call ace_dragging_fnc_setCarryable;			// Disables Carrying
	[cvo_vitual_arsenal, -1] 					call ace_cargo_fnc_setSize;					// Disables Ace Cargo Loading
	cvo_vitual_arsenal setVariable ["ace_cargo_noRename", true];							// Disables Ace Cargo Renaming
	cvo_vitual_arsenal enableSimulation false;
	hideObject cvo_vitual_arsena;

} else { };