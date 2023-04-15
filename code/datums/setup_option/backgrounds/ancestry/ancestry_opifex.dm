/datum/category_item/setup_option/background/ancestry/opifex_mechanist
	name = "Mechanist"
	desc = "You are one of the many opifex trained in the ways of your craft by your scavenger fleet. Like your brothers you have a knack for adapting to new situations and using all things \
	mechanical. Sadly, separated from your fleet you do not have access to the many useful robots that make life so much easier. That said, you always keep your various tools stowed away in a \
	webbing smuggled on your person. As a rank and file you represent the best of the opifex ability and wear your tools with pride."

	restricted_to_species = list(FORM_OPIFEX)

	//perks = list()
	racial_implants = (/obj/item/organ_module/active/simple/opifex_pouch)

	stat_modifiers = list(
		STAT_ROB = 0,
		STAT_TGH = 0,
		STAT_VIG = 0,
		STAT_BIO = 0,
		STAT_MEC = 0,
		STAT_COG = 0
	)
