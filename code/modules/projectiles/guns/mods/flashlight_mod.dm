// This has become its own file because it's literally copypasting flashlight code over a gun mod
// This is done so that attachable flashlights can be removed once installed as any gunmod would

/obj/item/gun_upgrade/tacticool_flashlight
	name = "Attachable flashlight"
	desc = "A seclite that can be mounted into a firearm to provide directional light. Takes a small cell."
	icon = 'icons/obj/lighting.dmi'
	icon_state = "seclite"
	item_state = "seclite"
	flags = CONDUCT
	slot_flags = SLOT_BELT
	matter = list(MATERIAL_PLASTIC = 3, MATERIAL_GLASS = 1)
	cell = null
	suitable_cell = /obj/item/cell/small
	dir = WEST
	action_button_name = "Toggle Flashlight"
	var/on = FALSE
	var/brightness_on = 5
	var/turn_on_sound = 'sound/effects/Custom_flashlight.ogg'
	var/tick_cost = 0.2
	var/obj/effect/effect/light/light_spot
	var/radiance_power = 0.8
	var/light_spot_power = 2.5
	var/light_spot_radius = 3
	var/light_spot_range = 3
	var/spot_locked = FALSE
	var/light_direction
	var/lightspot_hitObstacle = FALSE

/obj/item/gun_upgrade/tacticool_flashlight/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.weapon_upgrades = list(
		GUN_UPGRADE_FLASHLIGHT = TRUE,
		UPGRADE_BULK = 1
		)
	I.gun_loc_tag = GUN_UNDERBARREL
	I.breakable = FALSE
	I.install_time = WORKTIME_NEAR_INSTANT
	I.removal_time = WORKTIME_INSTANT // Doesn't matter because being unbreakable makes it instant regardless
	I.removal_difficulty = FAILCHANCE_ZERO
	I.prefix = "tactical" // With the removal of rail attachments, the baton is passed to the flashlight! - Seb

/*		On second thought, let's not give a free small cell exploit out of empty seclites.

/obj/item/gun_upgrade/tacticool_flashlight/Initialize()
	. = ..()
	if(!cell && suitable_cell)
		cell = new suitable_cell(src)
*/

/obj/item/gun_upgrade/tacticool_flashlight/proc/turn_on(mob/user)
	if(!cell || !cell.check_charge(tick_cost))
		playsound(loc, 'sound/machines/button.ogg', 50, 1)
		to_chat(user, SPAN_WARNING("[src] battery is dead or missing."))
		return FALSE
	if(user && !isturf(user.loc))
		to_chat(user, "You cannot turn the light on while in this [user.loc].")
		return FALSE
	set_light(2,radiance_power)
	light_spot = new(get_turf(src),light_spot_radius, light_spot_power)
	light_spot.icon = 'icons/effects/64x64.dmi'
	light_spot.pixel_x = -16
	light_spot.pixel_y = -16
	light_spot.layer = ABOVE_OBJ_LAYER
	if (cell.percent() <= 25)
		apply_power_deficiency()
	calculate_dir()
	if(user)
		START_PROCESSING(SSobj, src)
		user.update_action_buttons()
	if(turn_on_sound)
		playsound(src.loc, turn_on_sound, 75, 1)
	on = TRUE
	update_icon()
	return TRUE

/obj/item/gun_upgrade/tacticool_flashlight/update_icon()
	if(on)
		icon_state = "[initial(icon_state)]-on"
		set_light(brightness_on)
	else
		icon_state = "[initial(icon_state)]"
		set_light(0)

/obj/item/gun_upgrade/tacticool_flashlight/attack_self(mob/user)
	if(on)
		turn_off(user)
	else
		turn_on(user)

/obj/item/gun_upgrade/tacticool_flashlight/proc/turn_off(var/mob/living/user)
	set_light(0)
	if(turn_on_sound)
		playsound(src.loc, turn_on_sound, 75, 1)
	qdel(light_spot)
	if(. && user)
		user.update_action_buttons()
	on = FALSE
	update_icon()
	return TRUE

/obj/item/gun_upgrade/tacticool_flashlight/Destroy()
	qdel(light_spot)
	return ..()

/obj/item/gun_upgrade/tacticool_flashlight/get_cell()
	return cell

/obj/item/gun_upgrade/tacticool_flashlight/handle_atom_del(atom/A)
	..()
	if(A == cell)
		cell = null
		update_icon()

/obj/item/gun_upgrade/tacticool_flashlight/proc/calculate_dir(var/turf/old_loc)
	if (istype(src.loc,/obj/item/storage) || istype(src.loc,/obj/structure/closet))
		return
	if (istype(src.loc,/mob/living))
		var/mob/living/L = src.loc
		set_dir(L.dir)
	if(istype(src.loc,/obj/item/gun))
		var/obj/item/gun/G = src.loc
		if(istype(G.loc,/mob/living))
			var/mob/living/L = G.loc
			set_dir(L.dir)

	else if (pulledby && old_loc)
		var/x_diff = src.x - old_loc.x
		var/y_diff = src.y - old_loc.y
		if (x_diff > 0)
			set_dir(EAST)
		else if (x_diff < 0)
			set_dir(WEST)
		else if (y_diff > 0)
			set_dir(NORTH)
		else if (y_diff < 0)
			set_dir(SOUTH)

/obj/item/gun_upgrade/tacticool_flashlight/set_dir(new_dir)
	var/turf/NT = get_turf(src)
	var/turf/L = get_turf(src)
	var/hitSomething = FALSE
	light_direction = new_dir

	if (istype(src.loc,/obj/item/storage) || istype(src.loc,/obj/structure/closet))
		place_lightspot(NT)
		return

	switch(light_direction)
		if(NORTH)
			for(var/i = 1,i <= light_spot_range, i++)
				var/turf/T = locate(L.x,L.y + i,L.z)
				if (lightSpotPassable(T))
					if(T.is_space())
						break
					NT = T
				else
					hitSomething = TRUE
					break
		if(SOUTH)
			for(var/i = 1,i <= light_spot_range, i++)
				var/turf/T = locate(L.x,L.y - i,L.z)
				if (lightSpotPassable(T))
					if(T?.is_space())
						break
					NT = T
				else
					hitSomething = TRUE
					break
		if(EAST)
			for(var/i = 1,i <= light_spot_range, i++)
				var/turf/T = locate(L.x + i,L.y,L.z)
				if (lightSpotPassable(T))
					if(T.is_space())
						break
					NT = T
				else
					hitSomething = TRUE
					break
		if(WEST)
			for(var/i = 1,i <= light_spot_range, i++)
				var/turf/T = locate(L.x - i,L.y,L.z)
				if (lightSpotPassable(T))
					if(T.is_space())
						break
					NT = T
				else
					hitSomething = TRUE
					break
	lightspot_hitObstacle = hitSomething
	place_lightspot(NT)

	if (!istype(src.loc,/mob/living))
		dir = new_dir

	if(istype(src.loc,/obj/item/gun))
		var/obj/item/gun/G = src.loc
		if(!istype(G.loc,/mob/living))
			dir = new_dir

/obj/item/gun_upgrade/tacticool_flashlight/proc/place_lightspot(var/turf/T, var/angle = null)
	if (light_spot && on && !T.is_space())
		light_spot.forceMove(T)
		light_spot.icon_state = "nothing"
		light_spot.set_light(light_spot_radius, light_spot_power)

		if (cell && cell.percent() <= 25)
			apply_power_deficiency()
		else if (lightspot_hitObstacle)
			light_spot.set_light(light_spot_radius + 1, light_spot_power * 1.25)

		if (lightSpotPlaceable(T) && !lightspot_hitObstacle)
			var/distance = get_dist(get_turf(src),T)
			switch(distance)
				if (1)
					light_spot.icon_state = "lightspot_vclose"
				if (2)
					light_spot.icon_state = "lightspot_close"
				if (3)
					light_spot.icon_state = "lightspot_medium"
				if (4)
					light_spot.icon_state = "lightspot_far"
		if(angle)
			light_spot.add_new_transformation(/datum/transform_type/modular, list(rotation = angle, flag = FLASHLIGHT_LIGHT_SPOT_ROTATION_TRANSFORM, priority = FLASHLIGHT_LIGHT_SPOT_ROTATION_TRANSFORM_PRIORITY, override = TRUE))
		else
			var/to_rotate = 0
			switch(light_direction)
				if (NORTH)
					to_rotate = 0
				if(SOUTH)
					to_rotate = 180
				if(EAST)
					to_rotate = 90
				if(WEST)
					to_rotate = 270

			light_spot.add_new_transformation(/datum/transform_type/modular, list(rotation = to_rotate, flag = FLASHLIGHT_LIGHT_SPOT_ROTATION_TRANSFORM, priority = FLASHLIGHT_LIGHT_SPOT_ROTATION_TRANSFORM_PRIORITY, override = TRUE))

/obj/item/gun_upgrade/tacticool_flashlight/proc/lightSpotPassable(var/turf/T)
	if (is_opaque(T))
		return FALSE
	return TRUE

/obj/item/gun_upgrade/tacticool_flashlight/proc/lightSpotPlaceable(var/turf/T)
	if(T == get_turf(src) || !isfloor(T))
		return FALSE
	for(var/obj/O in T)
		if(istype(O, /obj/structure/window))
			return FALSE
	return TRUE

/obj/item/gun_upgrade/tacticool_flashlight/moved(mob/user, old_loc)
	spot_locked = FALSE
	calculate_dir(old_loc)

/obj/item/gun_upgrade/tacticool_flashlight/entered_with_container()
	spot_locked = FALSE
	calculate_dir()

/obj/item/gun_upgrade/tacticool_flashlight/container_dir_changed(new_dir)
	spot_locked = FALSE
	set_dir(new_dir)

/obj/item/gun_upgrade/tacticool_flashlight/pre_pickup(mob/user)
	calculate_dir()
	dir = WEST
	return ..()

/obj/item/gun_upgrade/tacticool_flashlight/dropped(mob/user as mob)
	if(light_direction)
		set_dir(light_direction)

/obj/item/gun_upgrade/tacticool_flashlight/afterattack(atom/A, mob/user)
	var/turf/T = get_turf(A)
	if(can_see(user,T) && light_spot_range >= get_dist(get_turf(src),T))
		lightspot_hitObstacle = FALSE
		if (!lightSpotPassable(T))
			lightspot_hitObstacle = TRUE
			T = get_step_towards(T,get_turf(src))
			if(!lightSpotPassable(T))
				return
		spot_locked = TRUE
		light_direction = get_dir(src,T)
		place_lightspot(T,Get_Angle(get_turf(src),T))

/obj/item/gun_upgrade/tacticool_flashlight/proc/apply_power_deficiency()
	if (!cell || !light_spot)
		return
	var/hit_brightness_multiplier = 1
	var/hit_radius_addition = 0
	if(lightspot_hitObstacle)
		hit_brightness_multiplier = 1.25
		hit_radius_addition = 1

	switch (cell.percent())
		if(0 to 10)
			light_spot.set_light(max(2, round(light_spot_radius/100 * 15) + hit_radius_addition), light_spot_power/100 * 30 * hit_brightness_multiplier)
			set_light(l_power = radiance_power/100 * 15)
		if(10 to 15)
			light_spot.set_light(max(2, round(light_spot_radius/100 * 40) + hit_radius_addition), light_spot_power/100 * 50 * hit_brightness_multiplier)
			set_light(l_power = radiance_power/100 * 40)
		if(15 to 25)
			light_spot.set_light(max(2, round(light_spot_radius/100 * 70) + hit_radius_addition), light_spot_power/100 * 70 * hit_brightness_multiplier)
			set_light(l_power = radiance_power/100 * 70)

/obj/item/gun_upgrade/tacticool_flashlight/Process()
	if(on)
		if(!spot_locked)
			calculate_dir()
		if(!cell || !cell.checked_use(tick_cost))
			if(ismob(src.loc))
				to_chat(src.loc, SPAN_WARNING("The attached flashlight fades out, powerless."))
			turn_off()
		else if (cell.percent() <= 25)
			apply_power_deficiency()

/obj/item/gun_upgrade/tacticool_flashlight/MouseDrop(over_object)
	if((src.loc == usr) && istype(over_object, /obj/screen/inventory/hand) && eject_item(cell, usr))
		cell = null
		if(on)
			turn_off(over_object) // Cringe way to prevent an exploit.
	else
		return ..()

/obj/item/gun_upgrade/tacticool_flashlight/attackby(obj/item/C, mob/living/user)
	if(istype(C, suitable_cell) && !cell && insert_item(C, user))
		src.cell = C

/obj/item/gun_upgrade/tacticool_flashlight/attack(mob/living/M, mob/living/user)
	add_fingerprint(user)
	if(on && user.targeted_organ == BP_EYES)

		if((CLUMSY in user.mutations) && prob(15))	//too dumb to use flashlight properly
			return ..()	//just hit them in the head

		var/mob/living/carbon/human/H = M	//mob has protective eyewear
		if(istype(H))
			for(var/obj/item/clothing/C in list(H.head,H.wear_mask,H.glasses))
				if(istype(C) && (C.body_parts_covered & EYES) && C.flash_protection > 0)
					to_chat(user, SPAN_WARNING("You're going to need to remove [C.name] first."))
					return

			var/obj/item/organ/vision
			if(H.species.vision_organ)
				vision = H.random_organ_by_process(H.species.vision_organ)
			if(!vision)
				to_chat(user, "<span class='warning'>You can't find any [H.species.vision_organ ? H.species.vision_organ : BP_EYES] on [H]!</span>")
				return

			user.visible_message(SPAN_NOTICE("\The [user] directs [src] to [M]'s eyes."), \
							 	 SPAN_NOTICE("You direct [src] to [M]'s eyes."))
			if(H != user)	//can't look into your own eyes buster
				if(M.stat == DEAD || M.blinded)	//mob is dead or fully blind
					to_chat(user, SPAN_WARNING("\The [M]'s pupils do not react to the light!"))
					return
				if(XRAY in M.mutations)
					to_chat(user, SPAN_NOTICE("\The [M] pupils give an eerie glow!"))
				if(vision.damage)
					to_chat(user, SPAN_WARNING("There's visible damage to [M]'s [vision.name]!"))
				else if(M.eye_blurry)
					to_chat(user, SPAN_NOTICE("\The [M]'s pupils react slower than normally."))
				if(M.getBrainLoss() > 15)
					to_chat(user, SPAN_NOTICE("There's visible lag between left and right pupils' reactions."))

				var/list/pinpoint = list("oxycodone"=1,"tramadol"=5)
				var/list/dilating = list("space_drugs"=5,"mindbreaker"=1)
				if(M.reagents.has_any_reagent(pinpoint) || H.ingested.has_any_reagent(pinpoint))
					to_chat(user, SPAN_NOTICE("\The [M]'s pupils are already pinpoint and cannot narrow any more."))
				else if(M.reagents.has_any_reagent(dilating) || H.ingested.has_any_reagent(dilating))
					to_chat(user, SPAN_NOTICE("\The [M]'s pupils narrow slightly, but are still very dilated."))
				else
					to_chat(user, SPAN_NOTICE("\The [M]'s pupils narrow."))

				if(user.a_intent == I_HURT)
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN) //can be used offensively
					M.flash(0, FALSE , FALSE , FALSE, 2)
					return

			if(user.a_intent == I_HURT)
				user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN) //can be used offensively
				M.flash(0, FALSE , FALSE , FALSE)
	else
		return ..()

