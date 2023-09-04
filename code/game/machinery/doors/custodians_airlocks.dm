/obj/machinery/door/bonfire
	name = "custodian hatchway"
	desc = "A door crafted by the Custodians that requires no power and doesn't seem to have a panel you could open."
	icon = 'icons/obj/doors/door_bonfire.dmi'
	icon_state = "door_closed"
	autoclose = 1
	var/next_beep_at = 0
	var/locked = 0
	var/minimal_holiness = CLEARANCE_COMMON // Compared with security_clearance on hearthcore
	var/open_sound_powered = 'sound/machines/airlock_open.ogg'
	var/close_sound = 'sound/machines/airlock_close.ogg'
	var/open_sound_unpowered = 'sound/machines/airlock_creaking.ogg'
	var/obj/item/wedged_item

/obj/machinery/door/bonfire/secure
	name = "custodian secure gate"
	desc = "A door crafted by the Custodians that requires no power and doesn't seem to have panel you could open. This one requires higher ranking in the Custodians to open."
	icon = 'icons/obj/doors/door_oathpledge.dmi'
	minimal_holiness = CLEARANCE_ORDER

/obj/item/forgesigil //This is an item that only serves as an all-access key for doors and a vendor or two for anyone
	name = "custodian forge sigil"
	desc = "A radiance-infused emblem forged by the Custodians. It allows access to Hearthcore-locked machinery."
	icon = 'icons/obj/items.dmi'
	icon_state = "forgesigil"
	item_state = "forgesigil"
	slot_flags = SLOT_BELT | SLOT_EARS
	throwforce = 0
	w_class = ITEM_SIZE_TINY
	throw_speed = 7
	throw_range = 15
	matter = list(MATERIAL_CARBON_FIBER = 1)

/obj/machinery/door/bonfire/New()
	GLOB.nt_doors += src
	..()

/obj/machinery/door/bonfire/Destroy()
	GLOB.nt_doors -= src
	..()

/obj/machinery/door/bonfire/take_damage(damage)
	if (isnum(damage) && locked)
		damage *= 0.66 //The bolts reinforce the door, reducing damage taken

	return ..(damage)

/obj/machinery/door/bonfire/attack_ai(mob/user)
	return

/obj/machinery/door/bonfire/allowed(mob/M)
	if(locked)
		return FALSE

	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		var/obj/item/implant/core_implant/hearthcore/CI = H.get_core_implant(/obj/item/implant/core_implant/hearthcore)
		if(CI && CI.security_clearance >= minimal_holiness)
			return TRUE

		if(istype(H.get_active_hand(), /obj/item/forgesigil))
			return TRUE


	return FALSE

/obj/machinery/door/bonfire/attack_hand(mob/user)
	user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
	if(allowed(user))
		if(density)
			open()
		else
			close()
	else
		do_animate("deny")

/obj/machinery/door/bonfire/Bumped(atom/AM)
	if(operating)
		return

	if(ismob(AM))
		var/mob/M = AM
		if(density)
			if(allowed(M))
				open()
			else
				do_animate("deny")
		return

	if(istype(AM, /obj/structure/bed/chair/wheelchair))
		var/obj/structure/bed/chair/wheelchair/wheel = AM
		if(density)
			if(wheel.pulling && (allowed(wheel.pulling)))
				open()
			else
				do_animate("deny")
		return

	do_animate("deny")
	return

/obj/machinery/door/bonfire/emag_act(remaining_charges)
	if(density)
		do_animate("spark")
		sleep(6)
		set_broken()
		return TRUE

/obj/machinery/door/bonfire/set_broken()
	if (!locked && !welded)
		visible_message(SPAN_WARNING("\The [src] breaks open!"))
		open()
		lock()
	else
		visible_message(SPAN_WARNING("\The [src] breaks!"))

	stat |= BROKEN
	update_icon()

/obj/machinery/door/bonfire/update_icon()
	set_light(0)

	if(overlays.len)
		cut_overlays()

	if(underlays.len)
		underlays.Cut()

	if(density)
		if(locked)
			icon_state = "door_locked"
			set_light(1.5, 0.5, COLOR_RED_LIGHT)
		else
			icon_state = "door_closed"
	else
		icon_state = "door_open"

	if(wedged_item)
		generate_wedge_overlay()

	if(welded)
		overlays += image(icon, "welded")

/obj/machinery/door/bonfire/do_animate(animation)
	switch(animation)
		if("opening")
			if(overlays.len)
				cut_overlays()
			flick("door_opening", src)
			update_icon()
		if("closing")
			if(overlays.len)
				cut_overlays()
			flick("door_closing", src)
			update_icon()
		if("spark")
			if(density)
				flick("door_spark", src)
		if("deny")
			if(density)
				flick("door_deny", src)
				playsound(loc, 'sound/machines/Custom_deny.ogg', 50, 1, -2)
	return

/obj/machinery/door/bonfire/attackby(obj/item/I, mob/user)
	if(istype(I, /obj/item/taperoll))
		return

	if(istype(I, /obj/item/forgesigil))
		open()
		return

	add_fingerprint(user)

	if(density && user.a_intent == I_HURT)
		hit(user, I)
		return

	var/tool_type = I.get_tool_type(user, list(QUALITY_PRYING, QUALITY_WELDING), src)
	switch(tool_type)
		if(QUALITY_PRYING)
			if(I.use_tool(user, src, WORKTIME_FAST, tool_type, FAILCHANCE_VERY_EASY,  required_stat = list(STAT_MEC, STAT_ROB)))
				if(locked)
					to_chat(user, SPAN_NOTICE("The door's bolts prevent it from being forced."))
				else if(stat & BROKEN)
					if(density)
						open(TRUE)
					else
						close(TRUE)
				else
					to_chat(user, SPAN_NOTICE("The door's motors resist your efforts to force it."))
			else
				..()
			return

		if(QUALITY_WELDING)
			if(!(operating > 0) && density)
				if(I.use_tool(user, src, WORKTIME_FAST, tool_type, FAILCHANCE_VERY_EASY, required_stat = STAT_MEC))
					if(!welded)
						welded = 1
					else
						welded = null
					update_icon()
			else
				..()
			return

		if(ABORT_CHECK)
			return

	if(istool(I))
		return attack_hand(user)

	else if(istype(I, /obj/item/pai_cable))
		to_chat(user, SPAN_NOTICE("There is no port for the cable."))
		return

	else
		..()
	return

/obj/machinery/door/bonfire/open(forced)
	if(!can_open(forced))
		return FALSE

	if(stat & BROKEN)
		var/obj/item/tool/T = forced
		if (istype(T) && T.item_flags & HONKING)
			playsound(loc, WORKSOUND_HONK, 70, 1, -2)
		else if (istype(T) && T.item_flags & SILENT)
			playsound(loc, open_sound_unpowered, 3, 1, -5)
		else if (istype(T) && T.item_flags & LOUD)
			playsound(loc, open_sound_unpowered, 500, 1, 10)
		else
			playsound(loc, open_sound_unpowered, 70, 1, -1)
	else
		playsound(loc, open_sound_powered, 70, 1, -2)

	return ..()

/obj/machinery/door/bonfire/can_open(forced)
	if(!density || locked || welded || operating)
		return FALSE

	return TRUE

/obj/machinery/door/bonfire/can_close(forced)
	if(density || locked || operating)
		return FALSE

	if(wedged_item)
		shake_animation(12)
		return FALSE

	return TRUE

/obj/machinery/door/bonfire/close(forced)
	if(!can_close(forced))
		return FALSE

	for(var/turf/turf in locs)
		for(var/atom/movable/AM in turf)
			if(AM.blocks_airlock())
				if(tryingToLock)
					addtimer(CALLBACK(src, .proc/close), 30 SECONDS)
				if(world.time > next_beep_at)
					playsound(loc, 'sound/machines/buzz-two.ogg', 30, 1, -1)
					next_beep_at = world.time + SecondsToTicks(10)
				return
			if(istool(AM))
				var/obj/item/tool/T = AM
				if(T.w_class >= ITEM_SIZE_NORMAL)
					operating = TRUE
					density = TRUE
					do_animate("closing")
					sleep(7)
					force_wedge_item(AM)
					playsound(loc, 'sound/machines/airlock_creaking.ogg', 75, 1)
					shake_animation(12)
					sleep(7)
					playsound(loc, 'sound/machines/buzz-two.ogg', 30, 1, -1)
					density = FALSE
					do_animate("opening")
					operating = FALSE
					return

	if(stat & BROKEN)
		var/obj/item/tool/T = forced
		if (istype(T) && T.item_flags & HONKING)
			playsound(loc, WORKSOUND_HONK, 70, 1, -2)
		else if (istype(T) && T.item_flags & SILENT)
			playsound(loc, open_sound_unpowered, 3, 1, -5)
		else if (istype(T) && T.item_flags & LOUD)
			playsound(loc, open_sound_unpowered, 500, 1, 10)
		else
			playsound(loc, open_sound_unpowered, 70, 1, -1)
	else
		playsound(loc, close_sound, 70, 1, -2)

	tryingToLock = FALSE

	..()

/obj/machinery/door/bonfire/proc/lock()
	if(locked || operating)
		return

	locked = TRUE
	playsound(loc, 'sound/machines/Custom_bolts.ogg', 40, 1, 5)
	for(var/mob/M in range(1,src))
		M.show_message("You hear a click from the bottom of the door.", 2)
	update_icon()
	return

/obj/machinery/door/bonfire/proc/unlock()
	if(!locked || operating)
		return

	locked = FALSE
	playsound(loc, 'sound/machines/Custom_boltsup.ogg', 40, 1, 5)
	for(var/mob/M in range(1,src))
		M.show_message("You hear a click from the bottom of the door.", 2)
	update_icon()
	return TRUE

// Wedge_item copypaste from airlock.dm
/obj/machinery/door/bonfire/attack_hand(mob/user as mob)
	if(user.a_intent == I_GRAB && wedged_item && !user.get_active_hand())
		take_out_wedged_item(user)
		return

	..(user)
	return

/obj/machinery/door/bonfire/proc/force_wedge_item(obj/item/tool/T)
	T.forceMove(src)
	wedged_item = T
	update_icon()
	verbs -= /obj/machinery/door/bonfire/proc/try_wedge_item
	verbs += /obj/machinery/door/bonfire/proc/take_out_wedged_item

/obj/machinery/door/bonfire/proc/try_wedge_item()
	set name = "Wedge item"
	set category = "Object"
	set src in view(1)

	if(!isliving(usr))
		to_chat(usr, SPAN_WARNING("You can't do this."))
		return
	var/obj/item/tool/T = usr.get_active_hand()
	if(istype(T) && T.w_class >= ITEM_SIZE_NORMAL)
		if(!density)
			usr.drop_item()
			force_wedge_item(T)
			to_chat(usr, SPAN_NOTICE("You wedge [T] into [src]."))
		else
			to_chat(usr, SPAN_NOTICE("[T] can't be wedged into [src], while [src] is closed."))

/obj/machinery/door/bonfire/proc/take_out_wedged_item()
	set name = "Remove Blockage"
	set category = "Object"
	set src in view(1)

	if(!isliving(usr) || !CanUseTopic(usr))
		return

	if(wedged_item)
		wedged_item.forceMove(drop_location())
		if(usr)
			usr.put_in_hands(wedged_item)
			to_chat(usr, SPAN_NOTICE("You took [wedged_item] out of [src]."))
		wedged_item = null
		verbs -= /obj/machinery/door/bonfire/proc/take_out_wedged_item
		verbs += /obj/machinery/door/bonfire/proc/try_wedge_item
		update_icon()

/obj/machinery/door/bonfire/AltClick(mob/user)
	if(Adjacent(user))
		wedged_item ? take_out_wedged_item() : try_wedge_item()

/obj/machinery/door/bonfire/MouseDrop(obj/over_object)
	if(ishuman(usr) && usr == over_object && !usr.incapacitated() && Adjacent(usr))
		take_out_wedged_item(usr)
		return
	return ..()

/obj/machinery/door/bonfire/proc/generate_wedge_overlay()
	var/cache_string = "[wedged_item.icon]||[wedged_item.icon_state]||[wedged_item.overlays.len]||[wedged_item.underlays.len]"

	if(!GLOB.wedge_icon_cache[cache_string])
		var/icon/I = getFlatIcon(wedged_item, SOUTH)

		I.Shift(SOUTH, 6)
		I.Shift(EAST, 14)
		I.Turn(45)

		GLOB.wedge_icon_cache[cache_string] = I
		underlays += I
	else
		underlays += GLOB.wedge_icon_cache[cache_string]

/obj/machinery/door/bonfire/examine(mob/user)
	..()
	if(wedged_item)
		to_chat(user, "You can see \icon[wedged_item] [wedged_item] wedged into it.")
