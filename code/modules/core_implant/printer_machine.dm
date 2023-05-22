/*
===============================================================================================================================================
CAPSA Implant Printer

A machine used by CAPSA to make various types of implants. This machine, just like the cloning vats, is intended to be for CAPSA production only.
This machine allows implants that are either Liberty Group brand, CAPSA brand, or reverse-engineered tech to be produced here.

These implants include the following types:
- Death Alarms, alerts medical and security channels to dead people(s). If none of said jobs are on, it will alert general channels. These are incompatible with other implants.
- Conciousness Backups, allows a person to be cloned via cloning vat found in CAPSA. Normally a timer of 20 minutes exists for those who need to be defibbed. This bypasses the timer, allowing cloning at any time. post-defib experation.
- Psionic Flesh, allows a person to become psionic. Needs to be changed to an organ-type instead of implant at some point.

PLANNED FEATURES
- Cybernetics Handlers, allows the user to be modified with advanced cybernetics; using nanites to aid in control of said enhancements.
===============================================================================================================================================
*/

#define LOAD "load"
#define WORK "work"
#define DONE "done"

/obj/machinery/neotheology/implantprinter
	name = "Implant Fabricator"
	desc = "This unique piece of technology can be fed biomatter, plasteel, silver, and gold in order to print various implants. \
			All implants produced by this machine are licenced or produced by CAPSA, subsidiary of Liberty Group. \
			Due to this machine's complexity, only CAPSA personnel are trained in its usage."
	icon = 'icons/obj/neotheology_machinery.dmi'
	icon_state = "implantforge"

	density = TRUE
	anchored = TRUE
	layer = 2.8

	var/power_cost = 250

	var/working = FALSE
	var/start_working
	var/work_time = 30 SECONDS
	var/storage_capacity = 250
	var/list/stored_material = list()
	var/list/needed_material = list(MATERIAL_BIOMATTER = 1, MATERIAL_PLASTEEL = 1, MATERIAL_GOLD = 1, MATERIAL_SILVER = 1, MATERIAL_GLASS = 3, MATERIAL_STEEL = 3)
	var/spawn_type = /obj/item/implant/death_alarm

	// A vis_contents hack for materials loading animation.
	var/tmp/obj/effect/flick_light_overlay/image_load
	var/list/options = list("Print Item", "Pick A Print")
	var/list/what_to_print = list("Death Alarm", "Conciousness Backup Implant", "Psionic Tumour")

/obj/machinery/neotheology/implantprinter/Initialize()
	. = ..()

	image_load = new(src)

	for(var/_material in needed_material)
		stored_material[_material] = rand(1, 10)

/obj/machinery/neotheology/implantprinter/attack_hand(mob/living/carbon/human/user as mob)
	if(!usr.stats?.getPerk(PERK_ADVANCED_MEDICAL) && !usr.stat_check(STAT_BIO, STAT_LEVEL_PROF) && !usr.stat_check(STAT_COG, 120))
		to_chat(user, SPAN_NOTICE("You're not sure how to use this without proper medical training or being able to read the advanced mumbo jumbo."))
		return
	var/choice = input(user, "Choose what to do", "Selection") as null|anything in options
	switch(choice)
		if("Print Item")
			if(perform(user))
				produce()
			return
		if("Pick A Print")
			var/new_print = input(user, "What do you want to print?", "Printing") as null|anything in what_to_print
			switch(new_print)
				if("Death Alarm")
					spawn_type = /obj/item/implant/death_alarm
					needed_material = list(MATERIAL_BIOMATTER = 0, MATERIAL_PLASTEEL = 0, MATERIAL_GOLD = 0, MATERIAL_SILVER = 0, MATERIAL_GLASS = 1, MATERIAL_STEEL = 1)
					to_chat(user, SPAN_NOTICE("Now printing Death Alarms"))
					to_chat(user, SPAN_NOTICE("Death Alarms Require: 1 Steel, 1 Glass"))
					return
				if("Conciousness Backup Implant")
					spawn_type = /obj/item/implant/conback
					needed_material = list(MATERIAL_BIOMATTER = 1, MATERIAL_PLASTEEL = 1, MATERIAL_GOLD = 1, MATERIAL_SILVER = 1, MATERIAL_GLASS = 3, MATERIAL_STEEL = 3)
					to_chat(user, SPAN_NOTICE("Now printing Conciousness Backup Implant"))
					to_chat(user, SPAN_NOTICE("Conciousness Backup Implants Require: 1 Biomatter, 1 Plasteel, 1 Steel, 3 Glass, 3 Gold, 3 Silver"))
					return
				if("Psionic Tumour")
					spawn_type = /obj/item/organ/internal/psionic_tumor
					needed_material = list(MATERIAL_BIOMATTER = 120, MATERIAL_PLASTEEL = 0, MATERIAL_GOLD = 1, MATERIAL_SILVER = 1, MATERIAL_GLASS = 0, MATERIAL_STEEL = 0)
					to_chat(user, SPAN_NOTICE("Now printing Psionic Tomours"))
					to_chat(user, SPAN_NOTICE("Psionic Tomours Require: 120 Biomatter, 1 Gold, 1 Silver"))
					return
				else // Why.
					spawn_type = /obj/item/implant/death_alarm
					needed_material = list(MATERIAL_BIOMATTER = 0, MATERIAL_PLASTEEL = 0, MATERIAL_GOLD = 0, MATERIAL_SILVER = 0, MATERIAL_GLASS = 1, MATERIAL_STEEL = 1)
					to_chat(user, SPAN_NOTICE("Now printing Death Alarms"))
					to_chat(user, SPAN_NOTICE("Death Alarms Require: 1 Steel, 1 Glass"))
					return
		else
			return

/obj/machinery/neotheology/implantprinter/examine(user)
	. = ..()

	var/list/matter_count_need = list()
	for(var/_material in needed_material)
		matter_count_need += "[needed_material[_material]] [_material]"

	var/list/matter_count = list()
	for(var/_material in stored_material)
		matter_count += " [stored_material[_material]] [_material]"

	to_chat(user, SPAN_NOTICE("Materials required: [english_list(matter_count_need)].\nIt contains: [english_list(matter_count)]."))

/obj/machinery/neotheology/implantprinter/attackby(obj/item/I, mob/user)
	if(istype(I, /obj/item/stack))
		eat(user, I)
		return
	. = ..()

/obj/machinery/neotheology/implantprinter/proc/produce()
	if(!perform())
		return
	for(var/_material in needed_material)
		stored_material[_material] -= needed_material[_material]

	use_power(power_cost)
	working = TRUE
	start_working = world.time
	flick_anim(WORK)

	START_PROCESSING(SSmachines, src)

/obj/machinery/neotheology/implantprinter/proc/perform(mob/user)
	if(working)
		to_chat(user, SPAN_NOTICE("[src] is already working!"))
		return FALSE

	if(stat & NOPOWER)
		to_chat(user, SPAN_NOTICE("[src] is off."))
		return FALSE

	for(var/_material in needed_material)
		if(!(_material in stored_material))
			to_chat(user, SPAN_NOTICE("[src] does not have the required [_material] to continue printing."))
			return FALSE

		if(needed_material[_material] > stored_material[_material])
			to_chat(user, SPAN_NOTICE("[src] does not have enough [_material] left to continue printing!"))
			return FALSE

	return TRUE

/obj/machinery/neotheology/implantprinter/Process()
	if(!working)
		STOP_PROCESSING(SSmachines, src)
		return

	if(world.time >= (start_working + work_time))
		flick_anim(DONE)
		new spawn_type(get_turf(src))
		working = FALSE
		STOP_PROCESSING(SSmachines, src)

/obj/machinery/neotheology/implantprinter/proc/eat(mob/living/user, obj/item/eating)

	if(!eating && istype(user))
		eating = user.get_active_hand()

	if(!istype(eating))
		return FALSE

	if(stat)
		return FALSE

	if(!Adjacent(user) && !Adjacent(eating))
		return FALSE

	if(is_robot_module(eating))
		return FALSE

	if(!istype(eating, /obj/item/stack/material))
		to_chat(user, SPAN_WARNING("[src] does not support this type of recycling."))
		return FALSE

	if(!length(eating.get_matter()))
		to_chat(user, SPAN_WARNING("\The [eating] does not contain significant amounts of useful materials and cannot be accepted."))
		return FALSE

	var/total_used = 0     // Amount of material used.
	var/obj/item/stack/material/stack = eating
	var/material = stack.default_type

	if(!(material in needed_material))
		to_chat(user, SPAN_WARNING("[src] does not support [material] recycle."))
		return FALSE

	if(stored_material[material] >= storage_capacity)
		to_chat(user, SPAN_WARNING("The [src] are full of [material]."))
		return FALSE

	if(stored_material[material] + stack.amount > storage_capacity)
		total_used = storage_capacity - stored_material[material]

	else
		total_used = stack.amount


	stored_material[material] += total_used

	if(!stack.use(total_used))
		qdel(stack)	// Protects against weirdness

	flick_anim(LOAD) // Play insertion animation.

	to_chat(user, SPAN_NOTICE("You add [total_used] stack\s of [stack] to \the [src]."))


/obj/machinery/neotheology/implantprinter/proc/flick_anim(var/animation)

	if(animation == WORK)
		flick("[initial(icon_state)]_start", src)
		icon_state = "[initial(icon_state)]_work"
		update_icon()

	if(animation == LOAD)
		flick("[initial(icon_state)]_load", image_load)
		return

	if(animation == DONE)
		flick("[initial(icon_state)]_finish", src)
		icon_state = "[initial(icon_state)]"
		update_icon()

#undef WORK
#undef LOAD
#undef DONE
