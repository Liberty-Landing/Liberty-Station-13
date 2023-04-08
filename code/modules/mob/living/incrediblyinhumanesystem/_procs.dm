/mob/living
	var/datum/ai_laws/laws = null
	var/list/additional_law_channels = list("State" = "")

/mob/living/proc/laws_sanity_check()
	if (!src.laws)
		laws = new base_law_type

/mob/living/proc/has_zeroth_law()
	return laws.zeroth_law != null

/mob/living/proc/set_zeroth_law(var/law, var/law_borg)
	laws_sanity_check()
	laws.set_zeroth_law(law, law_borg)
	log_law("has given [src] the zeroth law: '[law]'[law_borg ? " / '[law_borg]'" : ""]")

/mob/living/set_zeroth_law(var/law, var/law_borg)
	..()
	if(tracking_entities)
		to_chat(src, SPAN_WARNING("Internal camera is currently being accessed."))

/mob/living/proc/add_ion_law(var/law)
	laws_sanity_check()
	laws.add_ion_law(law)
	log_law("has given [src] the ion law: [law]")

/mob/living/proc/add_inherent_law(var/law)
	laws_sanity_check()
	laws.add_inherent_law(law)
	log_law("has given [src] the inherent law: [law]")

/mob/living/proc/add_supplied_law(var/number, var/law)
	laws_sanity_check()
	laws.add_supplied_law(number, law)
	log_law("has given [src] the supplied law: [law]")

/mob/living/proc/delete_law(var/datum/ai_law/law)
	laws_sanity_check()
	laws.delete_law(law)
	log_law("has deleted a law belonging to [src]: [law.law]")

/mob/living/proc/clear_inherent_laws(var/silent = 0)
	laws_sanity_check()
	laws.clear_inherent_laws()
	if(!silent)
		log_law("cleared the inherent laws of [src]")

/mob/living/proc/clear_ion_laws(var/silent = 0)
	laws_sanity_check()
	laws.clear_ion_laws()
	if(!silent)
		log_law("cleared the ion laws of [src]")

/mob/living/proc/clear_supplied_laws(var/silent = 0)
	laws_sanity_check()
	laws.clear_supplied_laws()
	if(!silent)
		log_law("cleared the supplied laws of [src]")

/mob/living/proc/statelaws(var/datum/ai_laws/laws)
	var/prefix = ""
	switch(lawchannel)
		if(MAIN_CHANNEL)
			prefix = ";"
		if("Binary")
			prefix = "[get_language_prefix()]b"
		else
			if((lawchannel in additional_law_channels))
				prefix = ":" + additional_law_channels[lawchannel]
			else
				prefix = ":" + get_radio_key_from_channel(lawchannel)

	dostatelaws(lawchannel, prefix, laws)

/mob/living/proc/dostatelaws(var/method, var/prefix, var/datum/ai_laws/laws)
	if(stating_laws[prefix])
		to_chat(src, SPAN_NOTICE("[method]: Already stating laws using this communication method."))
		return

	stating_laws[prefix] = 1

	var/can_state = statelaw("[prefix] Current Active Laws:")

	for(var/datum/ai_law/law in laws.laws_to_state())
		can_state = statelaw("[prefix][law.get_index()]. [law.law]")
		if(!can_state)
			break

	if(!can_state)
		to_chat(src, SPAN_DANGER("[method]: Unable to state laws. Communication method unavailable."))
	stating_laws[prefix] = 0

/mob/living/proc/statelaw(var/law)
	if(src.say(law))
		sleep(10)
		return 1

	return 0

/mob/living/proc/law_channels()
	var/list/channels = new()
	channels += MAIN_CHANNEL
	channels += common_radio.channels
	channels += additional_law_channels
	channels += "Binary"
	return channels

/mob/living/proc/sync()
	if(lawupdate && connected_ai)
		lawsync()
		photosync()

/mob/living/proc/lawsync()
	laws_sanity_check()
	laws.sort_laws()

/mob/living/proc/log_law(var/law_message)
	log_and_message_admins(law_message)
	lawchanges += "[stationtime2text()] - [usr ? "[key_name(usr)]" : "EVENT"] [law_message]"

/mob/living/proc/is_malf_or_contractor()
	return check_special_role(ROLE_CONTRACTOR) || check_special_role(ROLE_MALFUNCTION)

/mob/living/proc/show_laws()
	return

/mob/living/proc/show_laws_verb()
	set category = "Silicon Commands"
	set name = "Show Laws"
	src.show_laws()

/mob/living/show_laws(var/everyone = 0)
	var/who

	if (everyone)
		who = world
	else
		who = src
		to_chat(who, "<b>Obey these laws:</b>")

	src.laws_sanity_check()
	src.laws.show_laws(who)

/mob/living/add_ion_law(var/law)
	..()
	for(var/mob/living/R in SSmobs.mob_list)
		if(R.lawupdate && (R.connected_ai == src))
			R.show_laws()

/mob/living/silicon/proc/ai_checklaws()
	set category = "Silicon Commands"
	set name = "State Laws"
	open_subsystem(/datum/nano_module/law_manager)

/proc/islinked(var/mob/living/bot, var/mob/living/silicon/ai/ai)
	if(!istype(bot) || !istype(ai))
		return 0
	if (bot.connected_ai == ai)
		return 1
	return 0

/mob/living/proc/UnlinkSelf()
	disconnect_from_ai()
	lawupdate = FALSE
	lockcharge = 0
	canmove = TRUE
	scrambledcodes = 1
	//Disconnect it's camera so it's not so easily tracked.
	if(camera)
		camera.clear_all_networks()
