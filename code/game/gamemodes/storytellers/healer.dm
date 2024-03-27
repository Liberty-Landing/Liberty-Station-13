/datum/storyteller/petaline
	config_tag = "petaline"
	name = "Petaline Embrace"
	welcome = "A day of victory! The enemies has been dealt with by the Vanguard branch. Let's just forget that rebels were ignited by fire in a public place today! \
	Newspapers apart. This shift is ensured to be stable and safe, as the vanguard branch have enough time to curb down the maintenance plagues. "
	description = "The rebellions has been dealt with for today by the Vanguard Branch. There is no need to expect possible enemy presence on the colony. \
	Some may even consider that this peace is divine."

	gain_mult_mundane = 1.1
	gain_mult_moderate = 0.7
	gain_mult_major = 0.7
	gain_mult_roleset = 0.7

	repetition_multiplier = 0.95
	tag_weight_mults = list(TAG_COMBAT = 0.75, TAG_NEGATIVE = 0.5, TAG_POSITIVE = 2)

	//Petaline gives you half an hour to setup before any antags, perhaps she is just making an orgy or whatever
	points = list(
	EVENT_LEVEL_MUNDANE = 0, //Mundane
	EVENT_LEVEL_MODERATE = 0, //Moderate
	EVENT_LEVEL_MAJOR = 0, //Major
	EVENT_LEVEL_ROLESET = -999 //Roleset
	)
