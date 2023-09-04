//Biomatter tank
//Here we store our biomatter. This part consists of two things:
//Biomatter tank platform - it's a rail and pipes under it
//And our tank. It can be moved from one position to another
//Also tank have to positions. To port and default
//When it's at to port position, we pipes will be opened and somebody can clean it up
//Tank can be connected to portable canister (reagent_dispenser), but in this position, bioreactor can't process things
//Default position. Well, it's default position


//pipe contamination levels
#define DIRT_LVL_LOW 1
#define DIRT_LVL_MEDIUM 2
#define DIRT_LVL_HIGH 3

#define WEAROUT_CHANCE 50


/obj/machinery/multistructure/bonfire_part/scorchtank_platform
	name = "scorch slag tank platform"
	desc = "A huge railing platform that serves to change positions of the scorch tank for mass transport."
	icon_state = "tank_platform"
	layer = LOW_OBJ_LAYER
	idle_power_usage = 120
	pixel_y = -4
	var/obj/structure/biomatter_tank/biotank
	var/obj/canister
	var/pipes_opened = FALSE
	var/pipes_cleanness = 200


/obj/machinery/multistructure/bonfire_part/scorchtank_platform/Initialize()
	. = ..()
	biotank = new(get_turf(src))
	biotank.platform = src


/obj/machinery/multistructure/bonfire_part/scorchtank_platform/Destroy()
	if(biotank)
		biotank.platform = null
		qdel(biotank)
	return ..()


/obj/machinery/multistructure/bonfire_part/scorchtank_platform/examine(mob/user)
	..()
	if(!pipes_opened)
		return
	switch(get_dirtiness_level())
		if(DIRT_LVL_LOW)
			to_chat(user, SPAN_NOTICE("Pipes are a bit worn, it's also slightly dirty. You see a signs of scorch accumulation inside these pipes."))
		if(DIRT_LVL_MEDIUM)
			to_chat(user, SPAN_WARNING("It's very dirty. Solid scorch blocks at least half of space inside the pipes. Better to clean it up."))
		if(DIRT_LVL_HIGH)
			to_chat(user, SPAN_WARNING("You see a high amount of solidified scorch. Pipes are fully blocked. You need to clean this first if you want the Bonfire to work."))
		else
			to_chat(user, SPAN_NOTICE("Pipes looks clean."))


/obj/machinery/multistructure/bonfire_part/scorchtank_platform/update_icon()
	cut_overlays()
	if(pipes_cleanness <= 90)
		add_overlay("[icon_state]-dirty_[get_dirtiness_level()]")


/obj/machinery/multistructure/bonfire_part/scorchtank_platform/Process()
	if(!MS)
		return
	if(biotank.canister)
		biotank.reagents.trans_to_holder(biotank.canister.reagents, 10)


/obj/machinery/multistructure/bonfire_part/scorchtank_platform/attackby(var/obj/item/I, var/mob/user)
	if(istype(I, /obj/item/mop))
		var/dirtiness_lvl = get_dirtiness_level()
		to_chat(user, SPAN_NOTICE("You begin cleaning the pipes with your [I]... O-oof, what a smell!"))
		if(do_after(user, CLEANING_TIME * dirtiness_lvl, src))
			to_chat(user, SPAN_NOTICE("You cleaned up the pipes."))
			pipes_cleanness = initial(pipes_cleanness)

			if(dirtiness_lvl == DIRT_LVL_MEDIUM)
				spill_scorch(get_turf(user), cardinal)
			else if(dirtiness_lvl >= DIRT_LVL_HIGH)
				spill_scorch(get_turf(user), alldirs)
			scorch_attack(user)
		else
			to_chat(user, SPAN_WARNING("You need to stand still to clean it properly."))
		update_icon()
	..()


/obj/machinery/multistructure/bonfire_part/scorchtank_platform/proc/take_amount(var/amount)
	biotank.reagents.add_reagent("liquidscorch", amount)
	GLOB.biomatter_neothecnology_amt += amount


//Pipe wearout. Wearout var - is amount of 'dirt' that will be applied to our pipes
//Warning, when you apply wearout, there is only a chance that it will be applied. Use forced to avoid this check
/obj/machinery/multistructure/bonfire_part/scorchtank_platform/proc/pipes_wearout(var/wearout, var/forced = FALSE)
	if(forced || prob(WEAROUT_CHANCE))
		pipes_cleanness -= wearout
	if(pipes_cleanness <= 0)
		pipes_cleanness = 0
		for(var/obj/machinery/multistructure/bonfire_part/platform/P in MS_bioreactor.platforms)
			spill_scorch(P.loc)
	update_icon()


/obj/machinery/multistructure/bonfire_part/scorchtank_platform/proc/get_dirtiness_level()
	if(pipes_cleanness >= 70 && pipes_cleanness <=90)
		return DIRT_LVL_LOW
	else if(pipes_cleanness >= 40 && pipes_cleanness < 70)
		return DIRT_LVL_MEDIUM
	else if(pipes_cleanness < 40)
		return DIRT_LVL_HIGH


/obj/structure/biomatter_tank
	name = "scorch slag tank"
	desc = "A gigantic tank meant to transfer scorch from the platforms down to a canister connected to its loading port."
	icon = 'icons/obj/machines/bonfire.dmi'
	icon_state = "scorchslagtank"
	anchored = TRUE
	density = TRUE
	layer = ABOVE_MOB_LAYER + 0.05
	pixel_y = 16
	var/max_capacity = 10000
	var/obj/machinery/multistructure/bonfire_part/scorchtank_platform/platform
	var/obj/structure/reagent_dispensers/scorch/canister
	var/default_position = 16
	var/to_port_position = -20

/obj/structure/biomatter_tank/examine(mob/user)
	..()
	to_chat(user, SPAN_NOTICE("Use an empty hand to move it up or down. When it's down, use a tool with bolt turning quality to connect it to a canister placed south of it."))

/obj/structure/biomatter_tank/Initialize()
	. = ..()
	create_reagents(max_capacity)


/obj/structure/biomatter_tank/Destroy()
	if(platform)
		platform.biotank = null
		qdel(platform)
	if(canister)
		canister.anchored = initial(canister.anchored)
	return ..()


/obj/structure/biomatter_tank/update_icon()
	cut_overlays()
	if(canister && platform.pipes_opened)
		var/image/pipe_overlay = image(icon = 'icons/obj/machines/bonfire.dmi', icon_state = "port-pipe", pixel_y = -9)
		add_overlay(pipe_overlay)


/obj/structure/biomatter_tank/attack_hand(mob/user)
	user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN*2)
	if(!platform.MS)
		return
	if(canister)
		to_chat(user, SPAN_WARNING("You should disconnect it from the canister first!"))
		return
	if(platform.MS_bioreactor.chamber_solution)
		to_chat(user, SPAN_WARNING("You need to pump out solution first."))
		return
	if(!platform.pipes_opened)
		animate(src, pixel_y = to_port_position, 12, easing = CUBIC_EASING)
		platform.pipes_opened = TRUE
		to_chat(user, SPAN_NOTICE("You move [src] directly to the port. Platform pipes now opened."))
		playsound(loc, 'sound/machines/Custom_blastdooropen.ogg', 100, 1)
	else
		animate(src, pixel_y = default_position, 12, easing = CUBIC_EASING)
		platform.pipes_opened = FALSE
		to_chat(user, SPAN_NOTICE("You move [src] back to it's default location. Platform pipes are closed."))
		playsound(loc, 'sound/machines/Custom_blastdoorclose.ogg', 100, 1)


/obj/structure/biomatter_tank/attackby(var/obj/item/I, var/mob/user)
	var/tool_type = I.get_tool_type(user, list(QUALITY_BOLT_TURNING), src)
	switch(tool_type)
		if(QUALITY_BOLT_TURNING)
			if(!platform.pipes_opened)
				return
			var/obj/structure/reagent_dispensers/scorch/possible_canister = locate() in platform.MS_bioreactor.output_port.loc
			if(!possible_canister)
				to_chat(user, SPAN_WARNING("Nothing to connect to!"))
				return
			var/turf/user_interaction_loc = user.loc
			if(I.use_tool(user, src, WORKTIME_FAST, tool_type, FAILCHANCE_VERY_EASY,  required_stat = STAT_MEC))
				if(canister)
					unset_canister(canister)
				else
					set_canister(possible_canister)
				to_chat(user, SPAN_NOTICE("You [canister ? "connect [canister] to" : "disconnect [canister] from"] [src]."))
				scorch_attack(user)
			else
				to_chat(user, SPAN_WARNING("Ugh. You done something wrong!"))
				shake_animation()
				if(reagents.total_volume)
					scorch_attack(user)
					spill_scorch(user_interaction_loc)
			update_icon()


/obj/structure/biomatter_tank/proc/set_canister(obj/target_tank)
	target_tank.anchored = TRUE
	canister = target_tank
	platform.MS_bioreactor.metrics_screen.icon_state = "screen_process"
	flick("screen_activation", platform.MS_bioreactor.metrics_screen)
	playsound(platform.MS_bioreactor.output_port.loc, 'sound/machines/Custom_extin.ogg', 100, 1)


/obj/structure/biomatter_tank/proc/unset_canister(obj/target_tank)
	target_tank.anchored = FALSE
	canister = null
	platform.MS_bioreactor.metrics_screen.icon_state = initial(platform.MS_bioreactor.metrics_screen.icon_state)
	playsound(platform.MS_bioreactor.output_port.loc, 'sound/machines/Custom_extout.ogg', 100, 1)


#undef DIRT_LVL_LOW
#undef DIRT_LVL_MEDIUM
#undef DIRT_LVL_HIGH

#undef WEAROUT_CHANCE
