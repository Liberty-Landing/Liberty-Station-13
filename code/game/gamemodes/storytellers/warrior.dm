/datum/storyteller/wrathful
	config_tag = "wrathful"
	name = "Wrathful Chronicles"
	welcome = "Unearthed encrypted messages hints at potential aggressive engagement from enemy units. \
	Stay vigilant, colonists, and good luck."
	description = "Perilous precursor psionic rays cultivate numerous threats within and beyond the maintenance areas. \
	Meanwhile, mercenaries and enemies of the colony receive substantial funding from an unidentified major power. \
	The fate of this shift is marred by internal and external conflicts, as well as the simultaneous presence of monsters. \
	But antagonist enemies will only spawn if there is enough active players."

	gain_mult_moderate = 1.1
	gain_mult_major = 1.1
	gain_mult_roleset = 1.1

	tag_weight_mults = list(TAG_COMBAT = 1.75)

	//Wrathful has starting values that will cause moderate and major events very early in the round, clearly because Crustor wants blood so badly
	points = list(
	EVENT_LEVEL_MUNDANE = 0, //Mundane
	EVENT_LEVEL_MODERATE = 35, //Moderate
	EVENT_LEVEL_MAJOR = 75, //Major
	EVENT_LEVEL_ROLESET = -999 //Roleset
	)
