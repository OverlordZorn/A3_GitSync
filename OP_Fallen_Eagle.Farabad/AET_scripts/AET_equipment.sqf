/*
Notes for mission makers editing this:

1. Settings - Disable all uniform items if ACE is not loaded
2. Change to false if you'd like to turn a setting off
3. Leave the classname strings there even if you turn the boolean to false
4. The following items [Binoculars, Maps, GPSss, Compasses, Watches, Radios, and MicroDAGR if a radio doesn't need it] will not be replaced by this script
5. Radio programmers take priority over hand watches if _radioProgrammersForEveryone is set to true
6. Radio Programmers will only be added if the player has a radio that needs the programmer
7. If you are switching the binculars for a laser designator, make sure to enable the batteries setting
*/

private _binocularsForEveryone = ["Binocular", true];
private _mapsForEveryone = ["ItemMap", true];
private _GPSsForEveryone = ["ItemGPS", false];
private _radiosForEveryone = ["TFAR_anprc148jem", true];
private _compassesForEveryone = ["ItemCompass", true];
private _handWatchesForEveryone = ["ItemWatch", true];
private _radioProgrammersForEveryone = false;
private _medicalAndMiscForEveryone = true;
private _laserDesignatorBatteryForEveryone = false;

// Uniform - The string is the item's classname, the number is the amount
private _uniformItems = [
	// Misc Equipment
	["ACE_EarPlugs", 1], // Earplugs
	["ACE_Flashlight_XL50", 1], // Map Flash Light
	["ACE_MapTools", 1], // Map Tools
	["acex_intelitems_notepad", 1], // Notepad
	["ACE_CableTie", 2], // Cable Tie
	["ACE_Canteen", 1], // Canteen
	["ACE_SpraypaintBlack", 1], // Spray Paint (Black)
	["ACE_SpraypaintBlue", 1], // Spray Paint (Blue)
	["ACE_SpraypaintGreen", 1], // Spray Paint (Green)	
	["ACE_SpraypaintRed", 1], // Spray Paint (Red)
	["ACE_EntrenchingTool", 0], // Entrenching Tool
	// Medical
	["ACE_fieldDressing", 0], // Bandage (Basic)
	["ACE_elasticBandage", 8], // Bandage (Elastic)
	["ACE_packingBandage", 8], // Bandage (Packing)
	["ACE_quikclot", 8], // Bandage (QuickClot)
	["ACE_epinephrine", 1], // Epinephrine
	["ACE_morphine", 1], // Morphine
	["ACE_bloodIV_250", 0], // Blood IV 250ml
	["ACE_bloodIV_500", 0], // Blood IV 500ml
	["ACE_bloodIV", 0], // Blood IV 1000ml
	["ACE_personalAidKit", 1], // Personal Aid Kit
	["ACE_splint", 1], // Splint
	["ACE_tourniquet", 2] // Tourniquet
];

[_binocularsForEveryone, _mapsForEveryone, _GPSsForEveryone, _radiosForEveryone, _compassesForEveryone, _handWatchesForEveryone, _radioProgrammersForEveryone, _medicalAndMiscForEveryone, _laserDesignatorBatteryForEveryone, _uniformItems] call AET_fnc_basicEquipment;