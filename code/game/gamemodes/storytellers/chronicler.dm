//Epitaph is basically for antag vs antag fights.
/datum/storyteller/epitaph
	config_tag = "epitaph"
	name = "The Epitaph"
	welcome = "The colony is plunged into chaos with the emergence of internal foes. Rebels and mercenaries clash, exchanging gunfire in the streets. \
	Stay confined within your homes or departments and adhere to the Vanguard branches at all costs."
	description = "The Epitaph symbolizes the pinnacle of human civilization brought down by the bullet. \
	Aggressive political factions vie for power, mercenaries exploit the current instability to invade the colony, \
	and psionic power fuels the cultists. Certain factions deploy covert members for anti-spying measures and mete out punishments to traitors. \
	But antagonist enemies will only spawn if there is enough active players."


	gain_mult_mundane = 0.7
	gain_mult_moderate = 0.7
	gain_mult_major = 0.7
	gain_mult_roleset = 1.5

	//Less combat-oriented events, so that we'll not be fighting NPC monsters much
	tag_weight_mults = list(TAG_COMBAT = 0.5)

	repetition_multiplier = 0.9

	//Very large starting roleset. Will spawn an antag immediately, and another very soon
	points = list(
	EVENT_LEVEL_MUNDANE = 0, //Mundane
	EVENT_LEVEL_MODERATE = 0, //Moderate
	EVENT_LEVEL_MAJOR = 0, //Major
	EVENT_LEVEL_ROLESET = -999 //Roleset
	)
