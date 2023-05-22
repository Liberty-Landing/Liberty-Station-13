/datum/core_module/cruciform/implant_type = /obj/item/implant/core_implant/cruciform

/datum/core_module/cruciform/cloning
	var/datum/dna/dna = null
	var/age = 30
	var/ckey = ""
	var/datum/mind/mind = null
	var/languages = list()
	var/flavor = ""
	var/datum/stat_holder/stats

/datum/core_module/cruciform/cloning/proc/write_wearer(var/mob/living/carbon/human/H)
	dna = H.dna
	ckey = H.ckey
	mind = H.mind
	languages = H.languages
	flavor = H.flavor_text
	age = H.age
	stats = H.stats

/datum/core_module/cruciform/cloning/preinstall()
	if(ishuman(implant.wearer))
		implant.remove_modules(CRUCIFORM_CLONING)

/datum/core_module/cruciform/cloning/install()
	if(ishuman(implant.wearer))
		var/mob/living/carbon/human/H = implant.wearer
		dna = H.dna
		ckey = H.ckey
		mind = H.mind
		languages = H.languages
		flavor = H.flavor_text
		age = H.age
		stats = H.stats


/datum/core_module/cruciform/neotheologyhud

/datum/core_module/cruciform/neotheologyhud/proc/update_crucihud()
	if(implant.wearer.client)
		for(var/mob/living/carbon/human/christian in disciples)
			var/image/I = image('icons/mob/hud.dmi', christian, icon_state = "hudcyberchristian", layer = ABOVE_LIGHTING_LAYER)
			implant.wearer.client.images += I
		implant.use_power(1)
		if(implant.power < 1)
			to_chat(implant.wearer, SPAN_WARNING("Your cruciform pings. The energy is low."))
			implant.remove_module(src)

///////////

/datum/core_module/rituals/cruciform
	implant_type = /obj/item/implant/core_implant/cruciform
	var/list/ritual_types = list()

/datum/core_module/rituals/cruciform/set_up()
	for (var/grouptype in ritual_types)
		for (var/rn in GLOB.all_rituals)
			var/datum/ritual/R = GLOB.all_rituals[rn]
			if (istype(R, grouptype))
				module_rituals |= R.name

/datum/core_module/rituals/cruciform/base
	ritual_types = list(/datum/ritual/cruciform/base,
	/datum/ritual/targeted/cruciform/base,
	/datum/ritual/group/cruciform,
	/datum/ritual/cruciform/machines)

/datum/core_module/rituals/cruciform/custodian
	ritual_types = list(/datum/ritual/cruciform/custodian)

/datum/core_module/rituals/cruciform/oathbound
	ritual_types = list(/datum/ritual/cruciform/oathbound,
	/datum/ritual/targeted/cruciform/oathbound)

/datum/core_module/rituals/cruciform/enkindled
	ritual_types = list(/datum/ritual/cruciform/enkindled,
	/datum/ritual/targeted/cruciform/enkindled)

/datum/core_module/rituals/cruciform/forgemaster
	ritual_types = list(/datum/ritual/cruciform/forgemaster,
	/datum/ritual/targeted/cruciform/forgemaster)

/datum/core_module/rituals/cruciform/oathpledge
	ritual_types = list(/datum/ritual/cruciform/oathpledge,
	/datum/ritual/targeted/cruciform/oathpledge)

/datum/core_module/rituals/cruciform/anti_scrying

/datum/core_module/rituals/cruciform/damaged


/* keeping this around as reference for future modules that work to upgrade the hearthcore's power stats
/datum/core_module/rituals/cruciform/inquisitor
	access = list(access_nt_inquisitor)
	ritual_types = list(/datum/ritual/cruciform/inquisitor,
	/datum/ritual/targeted/cruciform/inquisitor)

/datum/core_module/rituals/cruciform/inquisitor/install()
	..()
	implant.max_power += 50
	implant.power_regen += 0.5


/datum/core_module/rituals/cruciform/inquisitor/uninstall()
	..()
	implant.max_power -= 50
	implant.power_regen -= 0.5
*/
