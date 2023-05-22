#define REPAIR_DOOR_AMOUNT 2

/datum/ritual/cruciform/machines
	name = "machines"
	phrase = null
	implant_type = /obj/item/implant/core_implant/cruciform
	fail_message = "The Cruciform feels cold against your chest."
	category = "Machinery"
	ignore_stuttering = TRUE

/*
//Cloning
/datum/ritual/cruciform/machines/resurrection
	name = "Resurrection"
	phrase = "Qui fuit, et crediderunt in me non morietur in aeternum"
	desc = "A ritual of formation of a new body in a speclially designed machine.  Deceased person's cruciform has to be placed on the scanner then a prayer is to be uttered over the apparatus."

/datum/ritual/cruciform/machines/resurrection/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	var/list/OBJS = get_front(user)

	var/obj/machinery/neotheology/cloner/pod = locate(/obj/machinery/neotheology/cloner) in OBJS

	if(!pod)
		fail("You fail to find any cloner here.", user, C)
		return FALSE

	if(pod.cloning)
		fail("Cloner is already cloning.", user, C)
		return FALSE

	if(pod.stat & NOPOWER)
		fail("Cloner is off.", user, C)
		return FALSE

	pod.start()
	return TRUE
*/

//Airlocks

/datum/ritual/cruciform/machines/lock_door
	name = "Activate Hatchway"
	phrase = "Oxidate Lecture: Activate Hatchway"
	desc = "Commands a nearby hatchway to be locked or unlocked."

/datum/ritual/cruciform/machines/lock_door/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	var/list/O = get_front(user)

	var/obj/machinery/door/holy/door = locate(/obj/machinery/door/holy) in O

	if(!door)
		fail("You fail to find a compatible door here.", user, C)
		return FALSE

	if(door.stat & (BROKEN))
		fail("[door] is off.", user, C)
		return FALSE

	door.locked ? door.unlock() : door.lock()
	return TRUE

/datum/ritual/cruciform/forgemaster/repair_door
	name = "Repair Hatchway"
	phrase = "Oxidate Lecture: Repair Hatchway"
	desc = "Repairs a nearby hatchway at the cost of some carbon fiber."

/datum/ritual/cruciform/forgemaster/repair_door/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	var/list/O = get_front(user)

	var/obj/machinery/door/holy/door = locate(/obj/machinery/door/holy) in O
	var/obj/item/stack/material/carbon_fiber/consumable

	if(!door)
		fail("You fail to find a compatible hatchway here.", user, C)
		return FALSE

	if(door.health == door.maxHealth)
		fail("This hatchway doesn\'t need repair.", user, C)
		return FALSE

	var/turf/target_turf = get_step(user, user.dir)
	var/turf/user_turf = get_turf(user)

	for(var/obj/item/stack/material/carbon_fiber/B in target_turf.contents)
		if(B.amount >= REPAIR_DOOR_AMOUNT)
			consumable = B
			break

	if(!consumable)
		for(var/obj/item/stack/material/carbon_fiber/B in user_turf.contents)
			if(B.amount >= REPAIR_DOOR_AMOUNT)
				consumable = B
				break

	if(consumable)
		consumable.use(REPAIR_DOOR_AMOUNT)
		var/obj/effect/overlay/nt_construction/effect = new(target_turf, 50)
		sleep(50)
		door.stat -= BROKEN
		door.health = door.maxHealth
		door.unlock()
		door.close()
		effect.success()
		return TRUE
	else
		fail("Not enough carbon fiber found to repair the hatchway, you need at least [REPAIR_DOOR_AMOUNT].", user, C)
		return FALSE

////////////////////////SCORCH MULTI MACHINES RITUALS

////////////////Bonfire commands

/datum/ritual/cruciform/machines/bioreactor
	name = "Bonfire command"

/datum/ritual/cruciform/machines/bioreactor/perform(mob/living/carbon/human/H, obj/item/implant/core_implant/C)
	var/obj/machinery/multistructure/bioreactor_part/console/bioreactor_screen = locate() in range(4, H)
	if(bioreactor_screen && bioreactor_screen.MS)
		var/datum/multistructure/bioreactor/bioreactor = bioreactor_screen.MS
		//to prevent any copypaste
		//let's make it a bit better
		var/success = perform_command(bioreactor)
		if(H.species?.reagent_tag != IS_SYNTHETIC)
			if(H.nutrition >= nutri_cost)
				H.nutrition -= nutri_cost
			else
				to_chat(H, SPAN_WARNING("You manage to cast the litany at a cost. The physical body consumes itself..."))
				H.vessel.remove_reagent("blood",blood_cost)
		return success

	fail("You should be near the bonfire metrics screen.", H, C)
	return FALSE

//There we perform any manipulations with our bioreactor
//Since console finder code is similar for both rituals
/datum/ritual/cruciform/machines/bioreactor/proc/perform_command(datum/multistructure/bioreactor/bioreactor)
	return

///////////////>Bioreactor pump solution ritual<//////////////////

/datum/ritual/cruciform/machines/bioreactor/solution
	name = "Solution Pumping"
	phrase = "Oxidate Lecture: Solution Pumping"
	desc = "This lecture pumps solution in or out of the Bonfire. Requires you to be near its console."

/datum/ritual/cruciform/machines/bioreactor/solution/perform_command(datum/multistructure/bioreactor/bioreactor)
	if(!bioreactor.chamber_closed)
		return FALSE
	bioreactor.pump_solution()
	var/obj/machinery/multistructure/bioreactor_part/console/bioreactor_console = bioreactor.metrics_screen
	bioreactor_console.ping()
	bioreactor_console.visible_message("The Bonfire produces an echoing click. The platforms pumps start buzzing.")
	return TRUE



///////////////>Bioreactor chamber opening song<////////////////

/datum/ritual/cruciform/machines/bioreactor/chamber_doors
	name = "Chamber Word"
	phrase = "Oxidate Lecture: Chamber Word"
	desc = "This lecture opens or closes the Bonfire's chamber. You should stay nearby its screen."
/datum/ritual/cruciform/machines/bioreactor/chamber_doors/perform_command(datum/multistructure/bioreactor/bioreactor)
	if(bioreactor.chamber_solution)
		return FALSE
	bioreactor.toggle_platform_door()
	var/obj/machinery/multistructure/bioreactor_part/console/bioreactor_console = bioreactor.metrics_screen
	bioreactor_console.ping()
	bioreactor_console.visible_message("You hear a loud BANG. Then a pause... The chamber's door mechanism moves its position with a quiet grace.")
