/datum/core_module/hearthcore/implant_type = /obj/item/implant/core_implant/hearthcore

/datum/core_module/hearthcore/cloning
	var/datum/dna/dna = null
	var/age = 30
	var/ckey = ""
	var/datum/mind/mind = null
	var/languages = list()
	var/flavor = ""
	var/datum/stat_holder/stats

/datum/core_module/hearthcore/cloning/proc/write_wearer(var/mob/living/carbon/human/H)
	dna = H.dna
	ckey = H.ckey
	mind = H.mind
	languages = H.languages
	flavor = H.flavor_text
	age = H.age
	stats = H.stats

/datum/core_module/hearthcore/cloning/preinstall()
	if(ishuman(implant.wearer))
		implant.remove_modules(HEARTHCORE_CLONING)

/datum/core_module/hearthcore/cloning/install()
	if(ishuman(implant.wearer))
		var/mob/living/carbon/human/H = implant.wearer
		dna = H.dna
		ckey = H.ckey
		mind = H.mind
		languages = H.languages
		flavor = H.flavor_text
		age = H.age
		stats = H.stats


/datum/core_module/hearthcore/neotheologyhud

/datum/core_module/hearthcore/neotheologyhud/proc/update_crucihud()
	if(implant.wearer.client)
		for(var/mob/living/carbon/human/christian in disciples)
			var/image/I = image('icons/mob/hud.dmi', christian, icon_state = "hudcyberchristian", layer = ABOVE_LIGHTING_LAYER)
			implant.wearer.client.images += I
		implant.use_power(1)
		if(implant.power < 1)
			to_chat(implant.wearer, SPAN_WARNING("Your hearthcore pings. Radiance is low."))
			implant.remove_module(src)

///////////

/datum/core_module/lectures/hearthcore
	implant_type = /obj/item/implant/core_implant/hearthcore
	var/list/ritual_types = list()

/datum/core_module/lectures/hearthcore/set_up()
	for (var/grouptype in ritual_types)
		for (var/rn in GLOB.all_lectures)
			var/datum/lecture/R = GLOB.all_lectures[rn]
			if (istype(R, grouptype))
				module_lectures |= R.name

/datum/core_module/lectures/hearthcore/base
	ritual_types = list(/datum/lecture/hearthcore/base,
	/datum/lecture/targeted/hearthcore/base,
	/datum/lecture/group/hearthcore,
	/datum/lecture/hearthcore/machines)

/datum/core_module/lectures/hearthcore/custodian
	ritual_types = list(/datum/lecture/hearthcore/custodian)

/datum/core_module/lectures/hearthcore/oathbound
	ritual_types = list(/datum/lecture/hearthcore/oathbound,
	/datum/lecture/targeted/hearthcore/oathbound)

/datum/core_module/lectures/hearthcore/enkindled
	ritual_types = list(/datum/lecture/hearthcore/enkindled,
	/datum/lecture/targeted/hearthcore/enkindled)

/datum/core_module/lectures/hearthcore/forgemaster
	ritual_types = list(/datum/lecture/hearthcore/forgemaster,
	/datum/lecture/targeted/hearthcore/forgemaster)

/datum/core_module/lectures/hearthcore/oathpledge
	ritual_types = list(/datum/lecture/hearthcore/oathpledge,
	/datum/lecture/targeted/hearthcore/oathpledge)

/datum/core_module/lectures/hearthcore/special
	ritual_types = list(/datum/lecture/hearthcore/special,
	/datum/lecture/targeted/hearthcore/special)


/datum/core_module/lectures/hearthcore/druzhina
	ritual_types = list(/datum/lecture/hearthcore/druzhina)

/datum/core_module/lectures/hearthcore/cataphract
	ritual_types = list(/datum/lecture/hearthcore/cataphract)

/datum/core_module/lectures/hearthcore/hussar
	ritual_types = list(/datum/lecture/hearthcore/hussar)

/datum/core_module/lectures/hearthcore/dragoon
//	ritual_types = list(/datum/lecture/hearthcore/dragoon)

/datum/core_module/lectures/hearthcore/grenadier
	ritual_types = list(/datum/lecture/hearthcore/grenadier)



/datum/core_module/lectures/hearthcore/anti_scrying

/datum/core_module/lectures/hearthcore/damaged


/* keeping this around as reference for future modules that work to upgrade the hearthcore's power stats
/datum/core_module/lectures/hearthcore/inquisitor
	access = list(access_nt_inquisitor)
	ritual_types = list(/datum/lecture/hearthcore/inquisitor,
	/datum/lecture/targeted/hearthcore/inquisitor)

/datum/core_module/lectures/hearthcore/inquisitor/install()
	..()
	implant.max_power += 50
	implant.power_regen += 0.5


/datum/core_module/lectures/hearthcore/inquisitor/uninstall()
	..()
	implant.max_power -= 50
	implant.power_regen -= 0.5
*/
