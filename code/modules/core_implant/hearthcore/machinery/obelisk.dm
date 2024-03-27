GLOBAL_LIST_EMPTY(all_obelisk)

/obj/machinery/power/torchbearer
	name = "Bonfire torchbearer"
	desc = "The Torchbearer is an advanced piece of machinery that protects the bodies and calms the minds of the Hearthcore-implanted nearby."
	icon = 'icons/obj/custodian_structures.dmi'
	icon_state = "torchbearer"

	density = TRUE
	anchored = TRUE
	layer = 2.8

	use_power = IDLE_POWER_USE
	idle_power_usage = 30
	active_power_usage = 2500
	var/overrideFaithfulCheck = FALSE
	var/active = FALSE
	var/area_radius = 7
	var/damage = 20
	var/max_targets = 5
	var/nt_buff_power = 5
	var/nt_buff_cd = 3

	var/static/stat_buff
	var/list/currently_affected = list()
	var/force_active = 0

	var/ticks_to_next_process = 3

/obj/machinery/power/torchbearer/New()
	..()
	GLOB.all_obelisk |= src

/obj/machinery/power/torchbearer/Destroy()
	for(var/i in currently_affected)
		var/mob/living/carbon/human/H = i
		H.stats.removePerk(PERK_SANITYBOOST)
	currently_affected = null
	return ..()

/obj/machinery/power/torchbearer/attack_hand(mob/user)
	return

/obj/machinery/power/torchbearer/Process()
	..()
	if(stat)
		return
	var/list/affected = list()
	for(var/mob/living/carbon/human/H in GLOB.human_mob_list)
		if (H.z == src.z && get_dist(src, H) <= area_radius)
			affected.Add(H)
	active = check_for_faithful(affected) || overrideFaithfulCheck
	update_icon()

	if(force_active > 0)
		active = TRUE
	force_active--
	update_icon()

	if(!active)
		use_power = IDLE_POWER_USE
	else
		use_power = ACTIVE_POWER_USE

	if(ticks_to_next_process > 0)
		ticks_to_next_process--
		return
	else
		ticks_to_next_process = 3

	for(var/obj/structure/burrow/burrow in GLOB.all_burrows)
		if(get_dist(src, burrow) <= area_radius)
			if(!active)
				if(burrow.obelisk_around == any2ref(src))
					burrow.obelisk_around = null
			else
				if(!burrow.obelisk_around)
					burrow.obelisk_around = any2ref(src)

	if(active)
		var/list/affected_mobs = oview(area_radius, src)
		var/to_fire = max_targets
		for(var/mob/living/A in affected_mobs)
			if(!(get_dist(src, A) <= area_radius))
				continue
			if(istype(A, /mob/living/carbon/superior_animal))
				var/mob/living/carbon/superior_animal/animal = A
				if(animal.stat != DEAD &! animal.colony_friend) //got roach, spider, xenos, but not colony pets
					animal.take_overall_damage(damage)
					if(animal.stat == DEAD)
						eotp.addObservation(5)
					if(!--to_fire)
						return
			else if(istype(A, /mob/living/simple_animal/hostile))
				var/mob/living/simple_animal/hostile/animal = A
				if(animal.stat != DEAD &! animal.colony_friend) //got misc things like tango but not colony pets
					animal.take_overall_damage(damage)
					if(animal.stat == DEAD)
						eotp.addObservation(1)
					if(!--to_fire)
						return

		if(to_fire)//If there is anything else left, fuck up the plants
			for(var/obj/effect/plant/shroom in GLOB.all_maintshrooms)
				if(shroom.z == src.z && get_dist(src, shroom) <= area_radius)
					qdel(shroom)
					if(!--to_fire)
						return

/obj/machinery/power/torchbearer/proc/check_for_faithful(list/affected)
	var/got_neoteo = FALSE
	var/list/no_longer_affected = currently_affected - affected
	for(var/i in no_longer_affected)
		var/mob/living/carbon/human/H = i
		H.stats.removePerk(PERK_SANITYBOOST)
	currently_affected -= no_longer_affected
	for(var/mob/living/carbon/human/mob in affected)
		var/obj/item/implant/core_implant/I = mob.get_core_implant(/obj/item/implant/core_implant/hearthcore)
		if(!(mob in eotp.scanned))
			eotp.scanned |= mob
			if(I && I.active && I.wearer)
				eotp.addObservation(20)
			else if(is_carrion(mob))
				eotp.removeObservation(20)
			else
				eotp.addObservation(10)
		if(I && I.active && I.wearer)
			if(!(mob in currently_affected)) // the mob just entered the range of the obelisk
				mob.stats.addPerk(PERK_SANITYBOOST)
				currently_affected += mob
			I.restore_power(I.power_regen*2)
			for(var/r_tag in mob.personal_ritual_cooldowns)
				mob.personal_ritual_cooldowns[r_tag] -= nt_buff_cd

			if(stat_buff)
				var/buff_power = disciples.len
				var/message
				var/prev_stat
				for(var/stat in ALL_STATS)
					var/datum/stat_mod/SM = mob.stats.getTempStat(stat, "nt_obelisk")
					//if(mob.stats && mob.stats.getPerk(PERK_RADIANCE))
					//	buff_power = buff_power * 2  // Channeling gives +1 stat point per disciple so it amounts to * 2
					if(stat == stat_buff)
						if(!SM)
							message = "A wave of dizziness washes over you, and your mind is filled with a sudden insight into [stat]."
						else if(SM.value != buff_power) // buff power was changed
							message = "Your knowledge of [stat] feels slightly [SM.value > buff_power ? "lessened" : "broadened"]."
						else if(SM.time < world.time + 10 MINUTES) // less than 10 minutes of buff duration left
							message = "Your knowledge of [stat] feels renewed."
						mob.stats.addTempStat(stat, buff_power, 20 MINUTES, "nt_obelisk")
					else if(SM)
						prev_stat = stat
						mob.stats.removeTempStat(stat, "nt_obelisk")

				if(prev_stat) // buff stat was replaced
					message = "A wave of dizziness washes over you, and your mind is filled with a sudden insight into [stat_buff] as your knowledge of [prev_stat] feels lessened."
				if(message)
					to_chat(mob, SPAN_NOTICE(message))

			got_neoteo = TRUE
	return got_neoteo


/obj/machinery/power/torchbearer/update_icon()
	icon_state = "torchbearer[active?"_activate":""]"

//Experimental area to make the 'stand' boys. Still need a whole lot of help, but as far I see it, it's pretty much turning the player into a different, limited torchbearer that deals more damage, but only around the player, and the damage ATTACKS EVERYTHING around the user. That's all 

