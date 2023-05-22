/* Humans shouldn't start with any major bonus stats from backgrounds as they already get them baked into the race*/
//Baseline
/datum/category_item/setup_option/background/ancestry/human_sol
	name = "Solarian"
	desc = "You come from the cradle of civilization - Sol, known as Earth and Mars in the old days to it's residents. \
			Since then it has massively expanded its borders way past just the two planets reaching the status of a galactic superpower.\
			You however were born in heart of this empire leaving you completely unprepared for the horrors lying within the reach of borders."

	restricted_to_species = list(FORM_HUMAN)

	stat_modifiers = list(STAT_COG = 3, STAT_BIO = 3, STAT_MEC = 3) //Pretty bad perk baked into this so

	perks = list(PERK_SOLBORN)

/datum/category_item/setup_option/background/ancestry/human_periphery
	name = "Periphery Resident"
	desc = "While not an official term on how to refer to residents of the edges of human space it is generally accepted as a colloquial term for such. \
			Hardy space-farers, pirates, mercenaries looking out for their next hit or even just unfortunate souls trying to live outside of centralized government, all of these find home here. \
			You are one such person, what brought you there in first place is noone's question, what you became is what matters living in such conditions."

	restricted_to_species = list(FORM_HUMAN)

	stat_modifiers = list(STAT_TGH = 3)

/datum/category_item/setup_option/background/ancestry/human_pallatian
	name = "Pallatian"
	desc = "You hail from the Pallas Coalition, commonly called 'Pallatians' or 'Coalitioners'. The Coalition's culture is a melting pot of old Earth cultures isolated in the far stars. \
			The Coalition is commonly at odds with the Terran Federation, being one of the three main gallactic powers. This has left many of its residents expecting an inevitable fight. \
			Due to this you find yourself more prepared for the frontiers of space, though the lower living standards in the Coalition has left its mark on your upbringing."

	restricted_to_species = list(FORM_HUMAN)

	stat_modifiers = list(STAT_ROB = 3, STAT_BIO = -3)

/datum/category_item/setup_option/background/ancestry/human_coalition
	name = "Free Worlder"
	desc = "The term 'Free Worlder' is an odd one to you. You were born under the 'state', if one could call it that, of the Union of Free Worlds. \
			Your life has been undoubtedly rough, sporting the scars of a war-torn region locked between the Kriosan Hegemony and the Pallas Coalition. But you live as free as can be. \
			Your life may have been hard, but the freedom from centralized government, freedom from corportations, and the endless frontiers of humanity have prepared you for struggle."

	restricted_to_species = list(FORM_HUMAN)

	stat_modifiers = list(STAT_VIG = 3, STAT_COG = -3)

/datum/category_item/setup_option/background/ancestry/human_vatgrown
	name = "Vatgrown Humanoid"
	desc = "You are a Vatgrown, also sometimes known as 'Flashgrown', human. Your kind are commonly made by corpotations, criminal organizations, and sometimes even governments. \
			Why, you may ask? Simple. Cheap, exploitable, and importantly 'self-thinking' labor. Unlike FBPs Vatgrowns have typically more limited life spans and capable of inovation. \
			This makes the vast majority of Vatgrowns debtors, owing their creation to the relevant company responsible for their creation."

	restricted_depts = COMMAND

	restricted_to_species = list(FORM_HUMAN)

	stat_modifiers = list(STAT_BIO = -3, STAT_MEC = 3, STAT_VIG = -3, STAT_COG = 3)

	perks = list(PERK_DEBTOR)
