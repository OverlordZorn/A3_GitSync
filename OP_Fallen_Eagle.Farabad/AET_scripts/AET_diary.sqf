// params: _player, _jip

//Credits

_player createDiaryRecord ["Diary", ["Credits","
Thanks and credits goes to: <br/><br/>
Frost'sBite from the Antistasi Dev Team for the friendly fire script https://github.com/official-antistasi-community/A3-FF-Punishment-Phantom<br/><br/>
Hakon from the Antistasi Dev Team for all the functions/scripts and help he provided the event team with.<br/><br/>
SkippieDippie from the Antistasi Event Team and 24th CHORNI VORON for all the functions/script and help he provided the event team with.<br/><br/>
Dmitry Yuri for the antiFlubber script.<br> <br/>
All the creator's of the mods that were used in this mission.<br/><br/>
OverLord Zorn for the testing settings for Death and Hit Reactions<br/><br/>
Yepperzz for the music pack<br/><br/>
Anyone who have contributed to the creation of this mission.<br/><br/>
"]]; 

//Briefing [All sides]

_player createDiaryRecord ["Diary", ["Signals","
	Main Communication Net: LR 77.0<br/><br/>
		Air Net: LR 76.0<br/><br/>
		UNIFORM Intercoms: SR 70.0<br/><br/>
		ALPHA Intercoms: SR 30.0<br/><br/>
		BRAVO Intercoms: SR 40.0<br/><br/>
	<br/><br/>"
]];

_player createDiaryRecord ["Diary", ["Additional","
	- Enemy has no air presence.<br/>
	- Enemy consists partly of Aziz era TKA forces. They may employ tactics and assets utilized by the former Takistan Army.<br/>
	- Civilians are present, but civilian traffic has been ordered to halt for the duration of the operation. As such, the enemy is aware of US forces moving in. Expect ambushes.<br/>
	- No IEDs have been seen in the conflict as insurgents aim to improve their civilian relations.<br/>
	- TEXAS will be available for resupply, medevac and checkpoint fortification delivery.<br/>
	- 3 additional early M1151 humvees are available if UNIFORM loses vehicles.<br/>
	- Supplies are packed into smaller crates. These can be loaded into a larger crate to be slingloaded, and then unloaded at dropzone. They can then also be loaded into the humvees to prevent insurgents acquiring US supplies.<br/>
	- Combat Engineers are designated drivers unless otherwise ordered by their leading element.<br/>
	- No element is to cross the redline, enemy presence and AA is beyond platoon UNIFORMs combat capability past the marked line.<br/>
	- ACE interact with medical personnel at FOB Hunter to heal all nearby personnel.<br/>


	<br/><br/>"
]];

_player createDiaryRecord ["Diary", ["Execution","
	1- Soft clear all sectors<br/>
	2- Confirm the situation at FOB Thompson<br/>
	3- Establish a checkpoint at marked position<br/>
	4- Prevent further insurgent movement at checkpoint<br/>

	<br/><br/>"
]];

_player createDiaryRecord ["Diary", ["Mission","
	Platoon UNIFORM will move into AO and begin soft-clearing all sectors. Enemy concentrations have been marked as Hotspots Alpha through Charlie. Focusing on these is recommended.<br/>
	A report on FOB Thompson is to be relayed to high command.<br/>
	Once Sector 3 has been seized, UNIFORM is to establish a checkpoint at crossroads and prevent further insurgent movement north, and to allow FOB Thompson to be re-garrison if needed.<br/>

	<br/><br/>"
]];

_player createDiaryRecord ["Diary", ["Situation","
	Recent developments in the fight against insurgents in North Takistan have taken a turn as insurgent elements have seized control of three more settlements.<br/>
	One of these settlements had USMC FOB Thompson situated inside it. A troops in contact report was received, however no communication has been had since.<br/>
	<br/><br/>"
]];

// Briefing [For different sides]
// Copy the content of the "West" case to other cases as needed and comment/delete the previous briefing code

/*

switch (side _player) do {

	case west:
	{
		_player createDiaryRecord ["Diary", ["Signals","
			Main Communication Net: LR 77.0<br/>
			Alpha Intercoms: SR 70.0<br/>
			Etc...<br/>"
		]];

		_player createDiaryRecord ["Diary", ["Execution","
			1- Move in into the outpost<br/>
			2- Hold the outpost until reinforcments arrive<br/>
			Etc...<br/>"
		]];

		_player createDiaryRecord ["Diary", ["Additional","
			1- There are still civilian population in the area<br/>
			2- There is active AAA around the outpost<br/>
			Etc...<br/>"
		]];

		_player createDiaryRecord ["Diary", ["Mission","
			We've lost contact with Red Star outpost north of Kavala, your mission is to move in and secure the outpost and wait for reinforcments to arrive, be aware that there is still active AAA that needs to be neutralized for reinforcments to move in.<br/>
			Once the outpost is secured, you are to returned to the FOB and clear a way for more reinforcments to arrive.<br/>
			Etc...<br/>"
		]];

		_player createDiaryRecord ["Diary", ["Situation","
			This morning at 10:15 we've lost contact with outpost Red Star after a heavy assault from rebel forces supported by CSAT.<br/>
			We've also detected that rebel forces moved into the town of Kavala and started barricading it.<br/>
			Etc...<br/>"
		]];
	};
	case east:
	{};
	case independent:
	{};
	case civilian:
	{};
};

*/