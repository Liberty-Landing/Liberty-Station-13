/obj/item/grenade
	name = "grenade"
	desc = "A hand held grenade, with an adjustable timer."
	w_class = ITEM_SIZE_SMALL
	icon = 'icons/obj/grenade.dmi'
	icon_state = "grenade"
	item_state = "grenade"
	throw_speed = 4
	throw_range = 20
	flags = CONDUCT
	slot_flags = SLOT_BELT|SLOT_MASK
	var/active = 0
	var/det_time = 40
	var/loadable = TRUE
	var/variance = 0 //How much the fuse time varies up or down. Punishes cooking with makeshift nades, proper ones should have 0
	var/grenade_activation_sound = 'sound/weapons/armbomb.ogg'
	price_tag = 300

/obj/item/grenade/proc/clown_check(var/mob/living/user)
	if((CLUMSY in user.mutations) && prob(10))
		to_chat(user, SPAN_WARNING("Huh? ... HELL, I PRIMED THE GRENADE!"))

		activate(user)
		add_fingerprint(user)
		spawn(5)
			prime()
		return 0
	return 1

/obj/item/grenade/examine(mob/user)
	if(..(user, 0))
		if(det_time > 1)
			to_chat(user, "The timer is set to [det_time/10] seconds.")
			return
		if(det_time == null)
			return
		to_chat(user, "\The [src] is set for instant detonation.")


/obj/item/grenade/attack_self(mob/user as mob)
	if(!active)
		if(clown_check(user))
			to_chat(user, SPAN_WARNING("You prime \the [name]! [det_time/10] seconds!"))

			activate(user)
			add_fingerprint(user)
			if(iscarbon(user))
				var/mob/living/carbon/C = user
				C.throw_mode_on()
	return


/obj/item/grenade/proc/activate(mob/user as mob)
	if(active)
		return

	if(user)
		log_and_message_admins("primed \a [src]")
		user.attack_log += "\[[time_stamp()]\] <font color='red'>primed \a [src]</font>"

	icon_state = initial(icon_state) + "_active"
	active = 1
	playsound(loc, grenade_activation_sound, 75, 1, -3)
	update_icon()

	if(variance)
		det_time *= RAND_DECIMAL(1-variance, 1+variance)

	spawn(det_time)
		prime(user)
		return


/obj/item/grenade/proc/prime(mob/user)
	var/turf/T = get_turf(src)
	T.hotspot_expose(700,125)
	user.hud_used.updatePlaneMasters(user)


/obj/item/grenade/attackby(obj/item/I, mob/user as mob)
	if(QUALITY_SCREW_DRIVING in I.tool_qualities)
		if(I.use_tool(user, src, WORKTIME_NEAR_INSTANT, QUALITY_SCREW_DRIVING, FAILCHANCE_EASY, required_stat = STAT_COG))
			switch(det_time)
				if (1)
					det_time = 30
					to_chat(user, SPAN_NOTICE("You set the [name] for 3 second detonation time."))
				if (30)
					det_time = 40
					to_chat(user, SPAN_NOTICE("You set the [name] for 4 second detonation time."))
				if (40)
					det_time = 1
					to_chat(user, SPAN_NOTICE("You set the [name] for instant detonation."))
			add_fingerprint(user)
	..()
	return

// This abomination, amalgamation of variables on a single grenade, is proof of my sanity slipping
// This is a grenade that, upon initialization, picks a random kind of grenade to be, and then explodes accordingly.
// The type of grenade gets chosen at random, but all these variables are borrowed from other grenades in order for it to work
// May god forgive me for my sins on making this. - Seb

/obj/item/grenade/pocketchaos
	name = "Pocket Chaos" //Taking this name because I liked Sebastian's placeholder name.
	desc = "Derived from the very essence and blood of a grenadier, chaos is exuded. Neither the hearthcore nor the knight itself know what is to come from their cruor."
	price_tag = 0 // No, don't even think about it.
	icon_state = "chaos"
	item_state = "chaos"
	var/grenade_type = "manhack" // Which kind of grenade are we? Defaults to manhack, type changes according to Initialize()
	var/banglet = 0 // Don't even ask how this var works or wtf it does, putting it here as a failsafe //wtf it does? -Monochrome
	//Chem grenade vars below
	var/obj/item/device/assembly_holder/detonator // If we become a chem grenade, we need this to detonate
	var/list/beakers = new/list() // List of our beakers, leave empty for init to choose which ones we get
	var/list/allowed_containers = list(/obj/item/reagent_containers/glass/beaker)
	var/affected_area = 3 // Average affected area of chem grenades.
	// Manhack grenade vars
	var/spawner_type = /mob/living/simple_animal/hostile/viscerator/unstable_radiance // If a manhack type grenade, will spawn the assigned mob.
	var/deliveryamt = 4 // Amount of spawner_type entities to spawn
	var/will_flash = TRUE // For manhacks, if it will do a small flashbang effect upon activation
	// Smoke grenade var
	var/datum/effect/effect/system/smoke_spread/bad/smoke // Type of smoke used
	//Frag grenade vars below
	var/fragment_type = /obj/item/projectile/bullet/pellet/fragment/strong // Which shrapnel we use as a frag grenade


// If you have a better idea to make this work, you're welcome to try.
// Pick a random, non-weighted number between 1 and 9, and make the grenade become that type when initialized
// This makes sure every invocation of the grenade is random upon creation
/obj/item/grenade/pocketchaos/Initialize()
	switch(pick(1,2,3,4,5,6,7,8,9))
		if(1) // Manhack
			grenade_type = "manhack"
		if(2) // Smoke bomb
			grenade_type = "smoke"
			src.smoke = new
			src.smoke.attach(src)
		if(3) // Low yield EMP Grenade
			grenade_type = "emp"
		if(4) // Flashbang
			grenade_type = "flashbang"
		if(5) // Fragmentation grenade
			grenade_type = "frag"
		if(6) // Heatwave grenade
			grenade_type = "heatwave"
		if(7) // High Explosive grenade
			grenade_type = "explosive"
		if(8) // Teargas grenade
			grenade_type = "teargas"
			create_reagents(1000) // Reagents will only ever exist if this grenade type is chosen
			var/obj/item/reagent_containers/glass/beaker/large/B1 = new(src)
			var/obj/item/reagent_containers/glass/beaker/large/B2 = new(src)
			B1.reagents.add_reagent("phosphorus", 40)
			B1.reagents.add_reagent("potassium", 40)
			B1.reagents.add_reagent("condensedcapsaicin", 40)
			B2.reagents.add_reagent("sugar", 40)
			B2.reagents.add_reagent("condensedcapsaicin", 80)
			detonator = new/obj/item/device/assembly_holder/timer_igniter(src)
			beakers += B1
			beakers += B2
		if(9) // Cleaner grenade (goofy)
			grenade_type = "cleaner"
			create_reagents(1000) // Reagents will only ever exist if this grenade type is chosen
			var/obj/item/reagent_containers/glass/beaker/B1 = new(src)
			var/obj/item/reagent_containers/glass/beaker/B2 = new(src)
			B1.reagents.add_reagent("surfactant", 40)
			B2.reagents.add_reagent("water", 40)
			B2.reagents.add_reagent("cleaner", 10)
			detonator = new/obj/item/device/assembly_holder/timer_igniter(src)
			beakers += B1
			beakers += B2
	. = ..()

// Necessary to rewrite this proc for the chem grenade subtype
/obj/item/grenade/pocketchaos/activate(mob/user as mob)
	if(active)
		return
	if(grenade_type == "teargas" || grenade_type == "cleaner")
		if(detonator)
			if(!is_igniter(detonator.left_assembly))
				detonator.left_assembly.activate()
				active = TRUE
			if(!is_igniter(detonator.right_assembly))
				detonator.right_assembly.activate()
				active = TRUE
	if(user)
		log_and_message_admins("primed \a [src]")
		user.attack_log += "\[[time_stamp()]\] <font color='red'>primed \a [src]</font>"
	active = TRUE
	playsound(loc, grenade_activation_sound, 75, 1, -3)
	spawn(det_time)
		prime(user)
		return

// Finally, when the grenade gets primed and active, perform a different effect based on its grenade_type
// This will be a lengthy check. I'm so sorry about this abomination.
/obj/item/grenade/pocketchaos/prime(mob/user)
	var/turf/T = get_turf(src)
	T.hotspot_expose(700,125)
	user.hud_used.updatePlaneMasters(user)
	switch(grenade_type)
		if("manhack")
			if(spawner_type && deliveryamt) // Sanity
				playsound(T, 'sound/effects/phasein.ogg', 100, 1)
				// Flash people in sight
				for(var/mob/living/carbon/human/M in viewers(T, null))
					if(M.eyecheck() < FLASH_PROTECTION_MINOR && will_flash == TRUE)
						M.flash(0, FALSE , FALSE , FALSE , 0)
				for(var/i=1, i<=deliveryamt, i++)
					var/atom/movable/x = new spawner_type
					x.loc = T
					if(prob(50))
						for(var/j = 1, j <= rand(1, 3), j++)
							step(x, pick(NORTH,SOUTH,EAST,WEST))
			qdel(src)
			return
		if("smoke")
			playsound(src.loc, 'sound/effects/smoke.ogg', 50, 1, -3)
			src.smoke.set_up(10, 0, usr.loc)
			spawn(0)
				src.smoke.start()
				sleep(10)
				src.smoke.start()
				sleep(10)
				src.smoke.start()
				sleep(10)
				src.smoke.start()

			for(var/obj/effect/blob/B in view(8,src))
				var/damage = round(30/(get_dist(B,src)+1))
				B.take_damage(damage)
				B.update_icon()
			sleep(80)
			qdel(src)
			return
		if("emp")
			if(T)
				T.hotspot_expose(700,125)
			empulse(src, 4, 1)
			qdel(src)
			return
		if("flashbang")
			for(var/obj/structure/closet/L in hear(7, get_turf(src)))
				if(locate(/mob/living/carbon/, L))
					for(var/mob/living/carbon/M in L)
						flashbang_bang(get_turf(src), M)
			for(var/mob/living/carbon/M in hear(7, get_turf(src)))
				flashbang_bang(get_turf(src), M)
			for(var/mob/living/carbon/human/thermal_user in orange(9, loc))
				if(!thermal_user.glasses)
					return
				var/obj/item/clothing/glasses/potential_thermals = thermal_user.glasses
				if(potential_thermals.overlays == global_hud.thermal)
					flashbang_without_the_bang(get_turf(src), thermal_user)

			for(var/obj/effect/blob/B in hear(8,get_turf(src)))	// Damage blobs as a flashbang would
				var/damage = round(30/(get_dist(B,get_turf(src))+1))
				B.take_damage(damage)
				B.update_icon()
			new/obj/effect/sparks(loc)
			new/obj/effect/effect/smoke/illumination(loc, brightness=15)
			qdel(src)
			return
		if("frag") // Scratched custodian-tier frag grenade effect
			set waitfor = FALSE
			var/turf/O = get_turf(src)
			if(!O)
				return
			var/lying = FALSE // Is someone lying on top of the grenade when it goes off?
			if(isturf(src.loc))
				for(var/mob/living/M in O)
					if(M.lying)
						lying = TRUE
			if(!lying) // If no one is lying on top of the grenade, explosion effects as normal
				fragment_explosion(O, 7, fragment_type, 150, 7, 3)
			else // Otherwise, person lying on it eats all the shrapnel
				fragment_explosion(O, 0, fragment_type, 150, 7, 3)
			qdel(src)
			return
		if("heatwave")
			set waitfor = 0
			var/turf/O = get_turf(src)
			if(!O) // Heatwave grenades don't go off in space
				return
			heatwave(O, 2, 4, 50, TRUE, 25) // Custodian tier heatwave grenade effect
			qdel(src)
			return
		if("explosive")
			set waitfor = 0
			var/turf/O = get_turf(src)
			if(!O) // Explosive grenades don't go off in space
				return
			explosion(O, -1, 1.5, 5, 10) // Custodian tier explosive grenade effect
			qdel(src)
			return
		if("teargas", "cleaner")
			playsound(loc, 'sound/effects/bamf.ogg', 50, 1)

			for(var/obj/item/reagent_containers/glass/G in beakers)
				G.reagents.trans_to_obj(src, G.reagents.total_volume)

			if(reagents.total_volume) // Splash any access reagents on the area, if any
				chem_splash(get_turf(src), affected_area, list(reagents), extra_heat=10)

			if(iscarbon(loc))
				var/mob/living/carbon/C = loc
				C.drop_from_inventory(src)
				C.throw_mode_off()
			invisibility = INVISIBILITY_MAXIMUM
			spawn(50) // Give it time for the reagents to process
				qdel(src)
	return
