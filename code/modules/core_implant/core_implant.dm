/obj/item/implant/core_implant
	name = "core implant"
	icon = 'icons/obj/device.dmi'
	w_class = ITEM_SIZE_SMALL
	origin_tech = list(TECH_MATERIAL = 9, TECH_BIO = 9, TECH_DATA = 9, TECH_ENGINEERING = 12, TECH_COMBAT = 8)
	matter = list(MATERIAL_INDSTEEL = 20, MATERIAL_SILVER = 25, MATERIAL_CARBON_FIBER = 40, MATERIAL_BIO_SILK = 20)//changing materials to be more relatable to the current material-esque of hearthcores. I just hope this does force-include all other augments. I didn't found anywhere else to implement hearthcore-only materials. -Monochrome
	external = TRUE
	var/implant_type = /obj/item/implant/core_implant
	var/active = FALSE
	var/activated = FALSE			//true, if hearthcore was activated once

	var/security_clearance = CLEARANCE_NONE
	var/address = null
	var/power = 0
	var/max_power = 0
	var/power_regen = 0.5
	var/success_modifier = 1
	var/list/known_lectures = list() //A list of names of lectures which are recorded in this hearthcore
	//These are used to retrieve the actual lecture datums from the global all_lectures list

	var/list/modules = list()
	var/list/upgrades = list()

	var/list/access = list()	// Core implant can grant access levels to its user
	var/path = ""


/obj/item/implant/core_implant/Destroy()
	STOP_PROCESSING(SSobj, src)
	deactivate()
	. = ..()

/obj/item/implant/core_implant/uninstall()
	if(active)
		hard_eject()
		deactivate()
	..()

/obj/item/implant/core_implant/activate()
	if(!wearer || active)
		return
	active = TRUE
	activated = TRUE
	add_lecture_verbs()
	update_lectures()
	START_PROCESSING(SSobj, src)
	add_hearing()

/obj/item/implant/core_implant/deactivate()
	if(!active)
		return
	remove_hearing()
	active = FALSE
	remove_lecture_verbs()
	STOP_PROCESSING(SSobj, src)

/obj/item/implant/core_implant/proc/update_lectures()
	known_lectures = list()
	for(var/datum/core_module/lectures/M in modules)
		if(istype(src,M.implant_type))
			for(var/R in M.module_lectures)
				known_lectures |= R

/obj/item/implant/core_implant/proc/add_lecture_verbs()
	if(!wearer || !active)
		return

	for(var/r in known_lectures)
		if(ispath(r,/datum/lecture/mind))
			var/datum/lecture/mind/m = r
			wearer.verbs |= initial(m.activator_verb)

/obj/item/implant/core_implant/proc/remove_lecture_verbs()
	if(!wearer || !active)
		return

	for(var/r in known_lectures)
		if(ispath(r,/datum/lecture/mind))
			var/datum/lecture/mind/m = r
			wearer.verbs.Remove(initial(m.activator_verb))

/obj/item/implant/core_implant/malfunction()
	hard_eject()

/obj/item/implant/core_implant/proc/hard_eject()
	return

/obj/item/implant/core_implant/proc/update_address()
	if(!loc)
		address = null
		return

	if(wearer)
		address = wearer.real_name
		return

	var/area/A = get_area(src)
	if(istype(loc, /obj/machinery/capsa))
		address = "[loc.name] in [strip_improper(A.name)]"
		return

	address = null

/obj/item/implant/core_implant/GetAccess()
	if(!activated) // A brand new implant can't be used as an access card, but one pulled from a corpse can.
		return list()

	var/list/L = access.Copy()
	for(var/m in modules)
		var/datum/core_module/M = m
		L |= M.GetAccess()
	return L

/obj/item/implant/core_implant/hear_talk(mob/living/carbon/human/H, message, verb, datum/language/speaking, speech_volume, message_pre_problems)
	var/group_lecture_leader = FALSE
	for(var/datum/core_module/group_lecture/GR in src.modules)
		GR.hear(H, message)
		group_lecture_leader = TRUE

	if(wearer != H)
		if(H.get_core_implant() && !group_lecture_leader)
			addtimer(CALLBACK(src, .proc/hear_other, H, message), 0) // let H's own implant hear first
	else
		for(var/RT in known_lectures)
			var/datum/lecture/R = GLOB.all_lectures[RT]
			var/ture_message = message
			if(R.ignore_stuttering)
				ture_message = message_pre_problems
			if(R.compare(ture_message))
				if(R.power > src.power)
					to_chat(H, SPAN_DANGER("Your radiance are far too exhausted or low in numbers for the [R.name]."))
					return
				if(!R.is_allowed(src))
					to_chat(H, SPAN_DANGER("Your neural link struggles to perform [R.name], it doesn't feel natural to you, it feels the same as struggling to see a completely new color."))
					return
				R.activate(H, src, R.get_targets(ture_message))
				return

/obj/item/implant/core_implant/proc/hear_other(mob/living/carbon/human/H, message)
	var/datum/core_module/group_lecture/GR = H.get_core_implant().get_module(/datum/core_module/group_lecture)
	if(GR?.lecture.name in known_lectures)
		if(message == GR.phrases[1])
			if(do_after(wearer, length(message)*0.25))
				if(GR)
					GR.lecture.set_personal_cooldown(wearer)
				wearer.say(message)


/obj/item/implant/core_implant/proc/use_power(var/value)
	power = max(0, power - value)

/obj/item/implant/core_implant/proc/restore_power(var/value)
	power = min(max_power, power + value)

/obj/item/implant/core_implant/Process()
	if(!active)
		return
	if((!wearer || loc != wearer) && active)
		remove_hearing()
		active = FALSE
		STOP_PROCESSING(SSobj, src)
	restore_power(power_regen)

/obj/item/implant/core_implant/proc/get_module(var/m_type) //get specific module, if not present, FALSE, if present, return the module
	if(!ispath(m_type))
		return
	for(var/datum/core_module/CM in modules)
		if(istype(CM,m_type))
			return CM
	process_modules()

/obj/item/implant/core_implant/proc/add_module(var/datum/core_module/CM) //formatted like add_module(new DEFINEGOESHERE)
	if(!istype(src,CM.implant_type))
		return FALSE

	if(!CM.can_install(src))
		return FALSE

	if(CM.unique)
		for(var/datum/core_module/EM in modules) //cannot stack modules
			if(EM.type == CM.type)
				return FALSE

	CM.implant = src
	CM.set_up()
	CM.install_time = world.time
	CM.preinstall()
	modules.Add(CM)
	CM.install()
	return TRUE

/obj/item/implant/core_implant/proc/remove_module(var/datum/core_module/CM) //use remove_modules instead using the module defines
	if(istype(CM) && CM.implant == src)
		CM.uninstall()
		modules.Remove(CM)
		CM.implant = null
		qdel(CM)

/obj/item/implant/core_implant/proc/remove_modules(var/m_type) //use module defines here
	if(!ispath(m_type))
		return
	for(var/datum/core_module/CM in modules)
		if(istype(CM,m_type))
			remove_module(CM)

/obj/item/implant/core_implant/proc/install_default_modules_by_job(datum/job/J) //checks the job datum's core_upgrades list and adds those
	for(var/module_type in J.core_upgrades)
		add_module(new module_type)

/obj/item/implant/core_implant/proc/process_modules()
	for(var/datum/core_module/CM in modules)
		if(CM.time > 0 && CM.install_time + CM.time <= world.time)
			CM.uninstall()

/obj/item/implant/core_implant/proc/get_rituals()
	return known_lectures
