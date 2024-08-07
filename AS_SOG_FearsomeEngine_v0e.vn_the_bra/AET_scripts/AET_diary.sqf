// params: _player, _jip

//Credits

_player createDiaryRecord ["Diary", ["Credits","
Thanks and credits goes to: <br/><br/>
Frost'sBite from the Antistasi Dev Team for the friendly fire script https://github.com/official-antistasi-community/A3-FF-Punishment-Phantom<br/><br/>
Hakon from the Antistasi Dev Team for all the functions/scripts and help he provided the event team with.<br/><br/>
SkippieDippie from the Antistasi Event Team and 24th CHORNI VORON for all the functions/script and help he provided the event team with.<br/><br/>
Dmitry Yuri for the antiFlubber script.<br> <br/>
Zorn for the XXXLPLOSION script (my name for it, not his - Big Boom script)<br/><br/>
All the creator's of the mods that were used in this mission.<br/><br/>
Anyone who have contributed to the creation of this mission.<br/><br/>
"]]; 

//Briefing [All sides]

_player createDiaryRecord ["Diary", ["Signals","
	COMMS NET: LR 77.0<br/>"
]];

_player createDiaryRecord ["Diary", ["Additional","
	1 - Mission will begin properly once all players are close to the helicopters..<br/><br/>
	2 - Rifleman and TLs have satchel charges to destroy the caches.<br/><br/>
	3 - Recommended you avoid explosives and fire support near the caches in case POWs are being held there.<br/><br/>
	4 - You have artillery fire support and resupply available through your PLT RTO.<br/><br/>"
]];

_player createDiaryRecord ["Diary", ["Execution","
	1 - Secure LZ Pacer.<br/><br/>
	2 - Search the Hamlet for weapons.<br/><br/>
	3 - Locate the river crossing. Do not attempt to swim over the river. It is dangerous.<br/><br/>
	4 - Locate and Destroy the three suspected cache locations.<br/><br/>
	5 - If possible, locate and safely extract any American POWs you find.<br/><br/>"
]];

_player createDiaryRecord ["Diary", ["Mission","
	Your platoon will be deployed north of the suspected cache locations. You will search a nearby Hamlet for weapons caches we believe are being provided by the NVA to local VC guerillas, before heading south to locate a safe river crossing. Recent flooding has made the river dangerous, but we have reports of a bridge constructed by the local population. Find it. Once you reach the southern side of the river, move to locate and destroy the ammo caches. Additional: a USMC helicopter crashed in the area south of the river just a couple of days ago. Keep an eye out for friendly POWs."
]];

_player createDiaryRecord ["Diary", ["Situation","
	Earlier this week a team of Navy SEALS managed to capture a high ranking NVA officer on a snatch & grab op. After some gentle questioning by some spooks, the NVA officer dropped some hints. He has revealed the NVA are planning a large-scale attack in the Quang Ngai province in the coming weeks, and pointed out three likely locations for concealed storage depots where the NVA are stocking up ammo and weapons. Under the cover of night, the NVA are moving convoys of supplies into this area."
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