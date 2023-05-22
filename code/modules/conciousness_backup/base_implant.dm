/*
Conciousness backup base implant. All base functions are held here.
The module base code is held in module.dm

This should be identical to NEV's Soulcrypt; credit to them for this code.
*/

/obj/item/implant/conback
	name = "conciousness backup"
	desc = "A small, immensely complex biocompatible computer. Basic functions include DNA sequence storage, neural engram backups, access transceiver functions, and a backup internal fuel cell in case the host's nutrients are low."
	icon = 'icons/obj/conback.dmi'
	icon_state = "frame"
	w_class = ITEM_SIZE_SMALL
	origin_tech = list(TECH_MATERIAL=2, TECH_BIO=7, TECH_DATA=5)
	matter = list(MATERIAL_BIOMATTER = 1, MATERIAL_PLASTEEL = 1, MATERIAL_GOLD = 1, MATERIAL_SILVER = 1, MATERIAL_GLASS = 3, MATERIAL_STEEL = 3)

	var/host_dead = FALSE //Our host is dead. Or not? Binary doesn't care for philosphy.
	var/was_emp  = FALSE//Were we emp'd? This triggers the longer memory gap message.
	var/sent_revive_notice  = FALSE //We've sent the revive notice to our host, so we're not going to send it again. Until they die again, at least...
	var/has_stored_info = FALSE

	var/energy = 100 //How much energy do we have stored up from user nutrition?
	var/max_energy = 100 //The maximum amount of energy we can have stored.
	var/integrity = 100 //How much integrity we have - this is used pretty rarely, but certain modules might use it.
	var/max_integrity = 100 //Maximum integrity.
	var/next_energy_warning //In deciseconds.
	var/next_integrity_warning //In deciseconds.
	var/host_death_time //What time did our host die - if null, our host has not yet died, or the revive notice has been sent.
	var/max_programs = 5 //Maximum amount of programs a conciousness backup can have. add_programs ignores this, but it's only called when the conciousness backup is created.
	var/hacked_snatcher = FALSE //Can this override minds?

	var/nutrition_usage_setting = NUTRITION_USAGE_LOW //These can be found in conback.dm, under DEFINES.

	//var/stat//Status.
	//Host variables, stored for cloning.

	external = FALSE
	var/host_ckey
	var/datum/dna/host_dna
	var/datum/mind/host_mind
	var/host_age
	var/host_flavor_text
	var/list/host_languages = list()
	var/host_name

	var/datum/conback_module/filemanager

	var/low_nutrition_message = "Host malnutrition detected; fuel cell disengaged. Running on internal reserves. Disengage modules to preserve reserves."
	var/low_energy_input_message = "Warning: Current energy usage exceeds fuel cell input. Reduce usage to avoid module shutdown."
	var/integrity_warning_message = "Warning: system integrity low. Service required soon."

	var/list/starting_modules = list(/datum/conback_module/prosthetic_debug)
	var/list/modules = list()
	var/list/access = list()

	var/good_sound = 'sound/machines/synth_yes.ogg'
	var/bad_sound = 'sound/machines/synth_no.ogg'
	var/very_bad_sound = 'sound/machines/warning-buzzer.ogg'
	is_deathalarm = TRUE

//Inherited procs

/obj/item/implant/conback/Initialize()
	. = ..()
	add_modules(starting_modules)
	update_icon()

/obj/item/implant/conback/update_icon()
	cut_overlays()
	if(host_mind && host_dna)
		add_overlay("conback_active")
	else
		add_overlay("conback_inactive")

/obj/item/implant/conback/examine(mob/user)
	. = ..()
	if(host_name)
		to_chat(user, SPAN_NOTICE("This one appears to belong to [host_name]."))
	if(hacked_snatcher)
		to_chat(user, SPAN_DANGER("Debug mode light is on."))

/obj/item/implant/conback/emag_act(mob/user)
	if(hacked_snatcher)
		to_chat(user, SPAN_NOTICE("You disable [src]'s debug mode."))
		hacked_snatcher = FALSE
		return 1
	else
		to_chat(user, SPAN_NOTICE("You enable [src]'s debug mode. It can now override minds."))
		hacked_snatcher = TRUE
		return 1

/obj/item/implant/conback/on_install()
	if(is_dead(wearer))
		for(var/mob/O in hearers(3, wearer))
			O.show_message("\icon[src] <span class = 'notice'>ERROR, NO LIVE CONSCIOUSNESS DETECTED.</span>", 2)
		return

	if(!clean_of_death_alarms())
		for(var/mob/O in hearers(3, wearer))
			O.show_message("\icon[src] <span class = 'notice'>ERROR, DEATH ALARM OR OTHER OS DETECTED.</span>", 2)
		return

	if(!clean_of_hearthcore())
		for(var/mob/O in hearers(3, wearer))
			O.show_message("\icon[src] <span class = 'notice'>ERROR, INTERFERING HARDWARE DETECTED.</span>", 2)
		return

	activate()
	wearer.conciousness_pres = src

/obj/item/implant/conback/on_uninstall()
	. = ..()
	wearer.conciousness_pres = null

/obj/item/implant/conback/activate()
	if(!has_stored_info)
		host_mind = wearer.mind
		host_dna = wearer.dna.Clone()
		host_age = wearer.age
		host_flavor_text = wearer.flavor_text
		has_stored_info = TRUE
		host_name = wearer.dna.real_name
		host_ckey = wearer.client
		store_host_languages()
	stat = CONBACK_ONLINE
	if(!wearer.mind || hacked_snatcher) //We're in a blank body. Or we're a bad person.

		if(!hacked_snatcher)
			for(var/mob/M in GLOB.player_list) //If they've respawned, we don't want to yoink them out of their current body.
				if(M.ckey == host_mind.key)
					if(M.stat != DEAD)
						return

		for(var/mob/M in GLOB.player_list) //If they've respawned, we don't want to yoink them out of their current body.
			if(M.ckey == host_mind.key)
				if(M.stat != DEAD)
					return

		if(wearer.dna.unique_enzymes == host_dna.unique_enzymes) //It's a clone of our original.
			host_mind.transfer_to(wearer)
			wearer.ckey = host_mind.key
			send_revive_notice()
			for(var/L in host_languages)
				wearer.add_language(L)

	if(!is_processing)
		START_PROCESSING(SSobj, src)

	if(!hacked_snatcher)
		send_host_message("Conciousness backup online: neural backup completed. Welcome to SoulOS v1.71 rev 1.")
	else
		send_host_message("CONCIOUSNESS BACKUP ONLINE. DEBUG MODE INITIATED. MIND TRANSFER COMPLETE. WELCOME TO SOULOS V1.71 REV 1 (DEBUG)")

/obj/item/implant/conback/deactivate()
	deactivate_modules()
	STOP_PROCESSING(SSobj, src)

/obj/item/implant/conback/GetAccess()
	return access

/obj/item/implant/conback/emp_act()
	was_emp = TRUE
	deactivate_modules()

/obj/item/implant/conback/Process()
	if(!wearer)
		return
	heartbeat()
	handle_energy()
	handle_integrity()
	handle_modules()


//Unique procs

/obj/item/implant/conback/proc/heartbeat() //Pretty much just checks if the host is alive or dead and does things from there.
	if(wearer.stat == DEAD && !host_dead)
		host_death_time = world.time
		host_dead = TRUE
		send_death_message()

	if(wearer.stat != DEAD && host_dead)
		host_death_time = null
		host_dead = FALSE
//We use hostmind.current here because the odds are, whoever it is is a ghost.

/obj/item/implant/conback/proc/send_death_message() //Sends the death message whenever the person who has this dies.
	to_chat(host_mind.current, SPAN_NOTICE("You are dead, whatever the cause, you are dead. With luck, someone will retrieve your conciousness backup and clone you - otherwise, welcome to purgatory."))
	switch(was_emp)
		if(TRUE)
			to_chat(host_mind.current, SPAN_WARNING("Your conciousness backup has been subjected to an electromagnetic pulse, and thus your neural engrams are unreliable. It's automatically pruning the unsalvagable memories, about five minutes worth. Perhaps more."))
		if(FALSE)
			to_chat(host_mind.current, SPAN_NOTICE("Luckily, your conciousness backup takes neural backups every thirty seconds. When you're cloned, you'll remember everything up to thirty seconds before your death."))

/obj/item/implant/conback/proc/send_revive_notice() //Triggered by implantation into a mindless mob.
	to_chat(host_mind.current, SPAN_NOTICE("Congratulations on a new lease on life, you're being cloned."))
	switch(was_emp)
		if(TRUE)
			to_chat(host_mind.current, SPAN_WARNING("Your conciousness backup has been subjected to an electromagnetic pulse, and you're missing about five minutes of memory from before your death."))
		if(FALSE)
			to_chat(host_mind.current, SPAN_NOTICE("As your conciousness slowly emerges from the muck of resurrection, you remember everything that's occured up to about thirty seconds before your death."))

/obj/item/implant/conback/proc/handle_modules() //Loops through the modules in the modules list, and handles their effects.
	for(var/datum/conback_module/M in modules)
		if(M.active)
			if(energy <= 0) //No energy, just deactivate all the modules.
				M.deactivate()
				continue
			M.handle_effects()

/obj/item/implant/conback/proc/add_modules(var/starting_list) //Adds modules from a list.
	for(var/M in starting_list)
		add_module(M)

/obj/item/implant/conback/proc/add_module(var/module_path)
	for(var/datum/conback_module/M in modules)
		if(M.type == module_path)
			return //Prevent adding duplicates.
	var/datum/conback_module/module = new module_path
	modules += module
	module.owner = src

/obj/item/implant/conback/proc/remove_module(var/datum/conback_module/module) //Removes a module from the implant.
	module.owner = null
	qdel(module)

/obj/item/implant/conback/proc/deactivate_modules() //Deactivates all active modules.
	for(var/datum/conback_module/M in modules)
		if(M.active)
			M.deactivate()

/obj/item/implant/conback/proc/handle_energy() //Take some nutrition, provide energy. Remove the energy used by any active modules from this amount.
	var/energy_to_add = 0
	var/active_module_drain = 0
	var/nutrition_to_remove = 0
	var/user_starving = FALSE

	if(energy >= max_energy)
		return

	if(wearer.stat == DEAD)
		deactivate_modules()
		return

	for(var/datum/conback_module/M in modules) //Loop through modules that are active and have an upkeep cost, figure out how much the active drain will take from the energy we have.
		if(M.active && M.has_energy_upkeep)
			active_module_drain += M.energy_cost

	if(wearer.nutrition < (wearer.max_nutrition / 2))
		if(next_energy_warning < world.time + ENERGY_WARNING_DELAY)
			send_host_message(low_nutrition_message, MESSAGE_DANGER)
			next_energy_warning = world.time + ENERGY_WARNING_DELAY
		user_starving = TRUE

	switch(nutrition_usage_setting) //Get how much nutrition we use per tick.
		if(NUTRITION_USAGE_LOW)
			nutrition_to_remove = 1
		if(NUTRITION_USAGE_MEDIUM)
			nutrition_to_remove = 2
		if(NUTRITION_USAGE_HIGH)
			nutrition_to_remove = 3

	if(!user_starving)
		energy_to_add = nutrition_to_remove * CONBACK_ENERGY_PER_NUTRITION //Simple maths to figure out what our energy budget is.

	energy_to_add -= active_module_drain

	if(active_module_drain > energy_to_add && (next_energy_warning < world.time + ENERGY_WARNING_DELAY) && !user_starving)
		send_host_message(low_energy_input_message, MESSAGE_WARNING)
		next_energy_warning = world.time + ENERGY_WARNING_DELAY

	energy += energy_to_add
	energy = CLAMP(energy, 0, 100)

	wearer.adjustNutrition(nutrition_to_remove)

/obj/item/implant/conback/proc/handle_integrity()
	var/integrity_loss = 0

	for(var/datum/conback_module/M in modules)
		if(M.active && M.causes_wear)
			integrity_loss += M.wear_cause_amount

	if(integrity < (max_integrity / 2) && (next_integrity_warning < world.time + INTEGRITY_WARNING_DELAY))
		send_host_message(integrity_warning_message, MESSAGE_WARNING)
		next_integrity_warning = world.time + INTEGRITY_WARNING_DELAY

	integrity -= integrity_loss
	integrity = CLAMP(integrity, 0, 100)

/obj/item/implant/conback/proc/send_host_message(var/message, var/message_type = MESSAGE_NOTICE)
	switch(message_type)
		if(MESSAGE_NOTICE)
			to_chat(wearer, SPAN_NOTICE("\icon[src] [src] transmits calmly, '[message]'"))
			wearer << good_sound
		if(MESSAGE_WARNING)
			to_chat(wearer, SPAN_WARNING("\icon[src] [src] transmits urgently, '[message]'"))
			wearer << bad_sound
		if(MESSAGE_DANGER)
			to_chat(wearer, SPAN_DANGER("\icon[src] [src] transmits urgently, '[message]'"))
			wearer << very_bad_sound

/obj/item/implant/conback/proc/find_module_by_name(var/name)
	for(var/datum/conback_module/M in modules)
		if(M.name == name)
			return M

/obj/item/implant/conback/proc/store_host_languages()
	for(var/datum/language/L in wearer.languages)
		host_languages += L.name
/*
/mob/living/carbon/human/verb/open_filemanager()
	set name = "Open Filemanager"
	set desc = "Opens the Conback's filemanager."
	set category = "Conback"
	var/obj/item/implant/conback/SC = locate(/obj/item/implant/conback) in src.contents
	if(!SC)
		to_chat(src, SPAN_WARNING("You don't have a conback, somehow."))
	if(SC.filemanager)
		SC.filemanager.activate(src)
	else
		SC.find_filemanager()
*/
