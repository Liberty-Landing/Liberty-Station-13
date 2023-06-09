/datum/antagonist/excelsior
	id = ROLE_EXCELSIOR_REV
	role_text = "Excelsior Infiltrator"
	role_text_plural = "Infiltrators"
	bantype = ROLE_BANTYPE_EXCELSIOR
	welcome_text = "Viva la revolution!"
	antaghud_indicator = "hudexcelsior"

	faction_id = FACTION_EXCELSIOR
	allow_neotheology = FALSE //Implant causes head asplode


	stat_modifiers = list(
		STAT_ROB = 5,
		STAT_TGH = 5,
		STAT_MEC = 10,
		STAT_COG = 5,
		STAT_VIG = 15
	)

/datum/antagonist/excelsior/equip()
	.=..()

	var/mob/living/L = owner.current

	for(var/name in stat_modifiers)
		L.stats.changeStat(name, stat_modifiers[name])
