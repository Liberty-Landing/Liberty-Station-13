/datum/storyteller/turmoil
	config_tag = "turmoil"
	name = "Colonial Turmoil"
	welcome = "The political landscape is plunged into utter chaos. Rebels, mercenaries, cultists, and monsters run rampant! \
	Faction units are scattered everywhere, and major sovereigns are arming other colonies in their cosmic cold war! \
	What in the hell is happening?"
	description = "Essentially everything is happening at once. Higher amount of antagonist and monsters surrounds the colony, \
	the major factions may or may not be present on the colony in some way or another. You're sure you want this choice?"

	gain_mult_mundane = 1.2
	gain_mult_moderate = 1.2
	gain_mult_major = 1.2

	variance = 0.25
	repetition_multiplier = 0.65

	//turmoil generates lots of random events, but not so many antags
	points = list(
	EVENT_LEVEL_MUNDANE = 15, //Mundane
	EVENT_LEVEL_MODERATE = 35, //Moderate
	EVENT_LEVEL_MAJOR = 75, //Major
	EVENT_LEVEL_ROLESET = -999 //Roleset
	)
