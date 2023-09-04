

//THE Bonfire.
//This huge multistructure takes objects with biomatter and carbon mobs to dissolve them into usable liquid scorch
//There are six various machines where multistructure datum is just a holder, each part proccess almost independently

#define CLEANING_TIME 2 SECONDS
#define BONFIRE_DAMAGE_PER_TICK 20


/datum/multistructure/bonfire
	structure = list(
		list(/obj/machinery/multistructure/bonfire_part/platform, /obj/machinery/multistructure/bonfire_part/platform, /obj/machinery/multistructure/bonfire_part/unloader),
		list(/obj/machinery/multistructure/bonfire_part/platform, /obj/machinery/multistructure/bonfire_part/platform, /obj/machinery/multistructure/bonfire_part/scorchtank_platform),
		list(/obj/machinery/multistructure/bonfire_part/loader, /obj/machinery/multistructure/bonfire_part/console, /obj/machinery/multistructure/bonfire_part/port)
					)
	var/obj/machinery/multistructure/bonfire_part/loader/item_loader
	var/obj/machinery/multistructure/bonfire_part/scorchtank_platform/biotank_platform
	var/obj/machinery/multistructure/bonfire_part/unloader/misc_output
	var/obj/machinery/multistructure/bonfire_part/port/output_port
	var/obj/machinery/multistructure/bonfire_part/console/metrics_screen


	var/list/obj/machinery/multistructure/bonfire_part/platform/platforms = list()
	var/platform_enter_side = WEST		//this one represent 'door' side, used by various checks
	var/chamber_closed = TRUE
	var/chamber_solution = FALSE
	var/chamber_breached = FALSE
	var/obj/effect/overlay/bonfire_solution/solution


/datum/multistructure/bonfire/connect_elements()
	..()
	item_loader = locate() in elements
	biotank_platform = locate() in elements
	output_port = locate() in elements
	metrics_screen = locate() in elements
	misc_output = locate() in elements
	for(var/obj/machinery/multistructure/bonfire_part/part in elements)
		part.MS_bioreactor = src
		if(istype(part, /obj/machinery/multistructure/bonfire_part/platform))
			var/obj/machinery/multistructure/bonfire_part/platform/C = part
			C.update_icon()
			if(C.make_glasswalls_after_creation)
				C.make_windows()
			platforms += part
	solution = new(platforms[1].loc)
	solution.icon_state = ""
	solution.pixel_y = -26


/datum/multistructure/bonfire/disconnect_elements()
	toggle_platform_door()
	for(var/obj/machinery/multistructure/bonfire_part/element in elements)
		element.MS = null
		element.MS_bioreactor = null
	qdel(solution)
	solution = null


/datum/multistructure/bonfire/is_operational()
	. = ..()
	if(!.)
		return FALSE

	if(!item_loader || !biotank_platform || !misc_output || !output_port || !metrics_screen)
		Destroy()
		return FALSE

	if(!chamber_closed || chamber_breached)
		return FALSE

	if(biotank_platform.pipes_opened || !biotank_platform.pipes_cleanness)
		return FALSE

	return TRUE


/datum/multistructure/bonfire/proc/get_unoccupied_platform()
	for(var/obj/machinery/multistructure/bonfire_part/platform/platform in platforms)
		var/empty = TRUE
		for(var/obj/O in platform.loc)
			if(!O.anchored)
				empty = FALSE
				break
		if(empty)
			return platform


/datum/multistructure/bonfire/proc/toggle_platform_door()
	if(chamber_solution && is_operational())
		return
	for(var/obj/machinery/multistructure/bonfire_part/platform/platform in platforms)
		for(var/obj/structure/window/reinforced/glass in platform.loc)
			if(glass.dir == platform_enter_side)
				if(chamber_closed)
					glass.icon_state = ""
					glass.density = FALSE
					flick("glassdoor_open", glass)
				else
					glass.icon_state = "platform_door"
					glass.density = initial(glass.density)
					flick("glassdoor_close", glass)
				playsound(glass.loc, 'sound/machines/windowdoor.ogg', 100, 1)
	chamber_closed = !chamber_closed


/datum/multistructure/bonfire/proc/pump_solution()
	if(!chamber_closed || !is_operational())
		return
	if(chamber_solution)
		solution.icon_state = ""
		flick("solution_pump_out_temporary", solution)
		for(var/obj/machinery/multistructure/bonfire_part/platform/platform in platforms)
			platform.set_light(0)
	else
		solution.icon_state = initial(solution.icon_state)
		flick("solution_pump_in_temporary", solution)
		for(var/obj/machinery/multistructure/bonfire_part/platform/platform in platforms)
			platform.set_light(1, 3, COLOR_LIGHTING_ORANGE_DARK)
	chamber_solution = !chamber_solution
	playsound(solution.loc, 'sound/effects/slosh.ogg', 100, 1)


/obj/machinery/multistructure/bonfire_part
	name = "bonfire part"
	icon = 'icons/obj/machines/bonfire.dmi'
	icon_state = "biomassconsole1"
	anchored = TRUE
	density = TRUE
	MS_type = /datum/multistructure/bonfire
	var/datum/multistructure/bonfire/MS_bioreactor




//#####################################
/obj/structure/reagent_dispensers/scorch
	name = "medium scorch canister"
	desc = "A canister used by the Custodians to transport volumes of Liquid Scorch."
	icon = 'icons/obj/bonfire_misc.dmi'
	icon_state = "scorch_tank_medium"
	amount_per_transfer_from_this = 50
	volume = 400
	climbable = TRUE


/obj/structure/reagent_dispensers/scorch/large
	name = "large scorch canister"
	desc = "A large canister used by the Custodians to transport immense volumes of Liquid Scorch."
	icon_state = "scorch_tank_large"
	volume = 800
	climbable = null


/obj/effect/overlay/bonfire_solution
	name = "solution"
	icon = 'icons/obj/machines/bonfire.dmi'
	icon_state = "solution_temporary"
	layer = ABOVE_MOB_LAYER
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
