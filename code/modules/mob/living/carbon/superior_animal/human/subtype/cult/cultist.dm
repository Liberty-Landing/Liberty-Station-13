/mob/living/carbon/superior_animal/human/lighteater_cultist
	name = "Lighteater Vehement Cultist"
	desc = "Zealous cultist consumed by a haunting reminder of the terror lurking beneath the ice, subjected to unholy transformation \
			- its body fused with chitinous, crab-like limbs. The smell of pollen is too strong to endure."
	icon = 'icons/mob/mobs-humanoid.dmi'
	icon_state = "lighteater_cultist"
	icon_dead = "lighteater_cultist_dead"
	stop_automated_movement_when_pulled = 0
	maxHealth = 125
	health = 125
	armor = list(melee = 40, bullet = 10, energy = 5, bomb = 40, bio = 100, rad = 100)
	melee_damage_lower = 40
	melee_damage_upper = 50 // VERY hard hitting, beware!
	chitin_amount = 3	//Crobby???? Mayhaps.
	min_air_pressure = 0 // Chitinous crab structure makes them spaceproof, but they can be poisoned as normal humans
	attacktext = "slashed"
	attack_sound = 'sound/weapons/renderslash.ogg'
	wander = TRUE
	turns_per_move = 4 // Groggy and slow by nature, but strong in melee
	sanity_damage = 4 // It's a demoralizing abomination of man and crab
	casingtype = null
	deathmessage = "emits an agonizing scream as it falls to its knees and dies!"
	target_telegraph = "readies their arms, preparing to engage"
	rush_target_telegraph = "groggily snaps their aim towards"
	meat_amount = 4 // For genetics purposes they will be encouraged to bring back flesh samples
	meat_type = /obj/item/reagent_containers/food/snacks/meat/human // They were human to begin with...
	inherent_mutations = list(MUTATION_RAND_UNSTABLE, MUTATION_BLOOD_BANK, MUTATION_G_SAC, MUTATION_HEART, MUTATION_G_LUNG, MUTATION_G_LIVER, MUTATION_E_BLOOD_VESSEL, MUTATION_S_MUSCLES, MUTATION_S_NERVES, MUTATION_ECHOLOCATION)
	get_stat_modifier = TRUE // They won't receive quickening modifiers for balance purposes, shotguns are too strong and ballistic mobs are cancer, pun intended
	allowed_stat_modifiers = list(
		/datum/stat_modifier/mob/living/carbon/superior_animal/durable = 5,
		/datum/stat_modifier/health/flat/negative/low = 5,
		/datum/stat_modifier/mob/living/carbon/superior_animal/armor/mult/negative/low = 5,
		/datum/stat_modifier/mob/living/carbon/superior_animal/young = 12,
		/datum/stat_modifier/mob/living/carbon/superior_animal/old = 5,
		/datum/stat_modifier/mob/living/carbon/superior_animal/brutish = 5,
		/datum/stat_modifier/mob/living/damage/negative/mixed/flat/low = 5,
		/datum/stat_modifier/mob/living/carbon/superior_animal/brutal = 5,
		/datum/stat_modifier/mob/living/carbon/superior_animal/aggressive/savage = 1,
		/datum/stat_modifier/mob/living/carbon/superior_animal/aggressive = 10,
		/datum/stat_modifier/mob/living/carbon/superior_animal/slowaimed = 5,
		/datum/stat_modifier/mob/living/carbon/superior_animal/slowdraw = 10,
	)
	viewRange = 6 // Reduced vision, they can locate you through other means...
	comfy_range = 5 // We wield shotguns, we want to be as close up and personal as possible.
	delay_for_range = 2.0 SECONDS
	breath_required_type = 0 // Balance purposes, considering cold air would hurt them.
	min_air_pressure = 0 // Doesn't need pressure for event atmosphere purposes.
	leather_amount = 0 // TODO: Maybe add chitin plates down the line, when crab cultists are expanded upon
	bones_amount = 0 // No bones, not even human. Only crab chitin.
	can_burrow = FALSE
	colony_friend = FALSE
	friendly_to_colony = FALSE
	min_air_pressure = 0
	min_bodytemperature = 0
	never_stimulate_air = TRUE
	faction = "circhosian" // From Circhos, a misstranslation of half-crab men in scandinavian myth

/mob/living/carbon/superior_animal/human/lighteater_cultist/handle_environment(var/datum/gas_mixture/environment)
	return // Chitinous armor as strong as a voidsuit

/mob/living/carbon/superior_animal/human/lighteater_cultist/start_pulling(var/atom/movable/AM)
	to_chat(src, SPAN_WARNING("\The [src] slaps your wrist, preventing you from dragging it!"))
	return

// They possess nothing technological to be fried
/mob/living/carbon/superior_animal/human/lighteater_cultist/emp_act(severity)
	return

/mob/living/carbon/superior_animal/human/lighteater_cultist/doTargetMessage()
	. = ..()
	visible_emote("yells, \"[pick("Consume...","Assimilate...","Blot out the light...", "CRUDUX CRUO!!!", "Join us...", "Louhi opasta minua!")]")
	playsound(src, 'sound/items/biotransform.ogg', 50, 1, -3)

/mob/living/carbon/superior_animal/human/lighteater_cultist/death()
	. = ..()
	playsound(loc, 'sound/hallucinations/wail.ogg', 80)
	drop_death_loot()


/mob/living/carbon/superior_animal/human/lighteater_cultist/ranged
	name = "Ranged Lighteater Vehement Cultist"
	desc = "Zealous cultist consumed by a haunting reminder of the terror lurking beneath the ice, subjected to unholy transformation \
			- its body fused with chitinous, crab-like limbs. The smell of pollen is too strong to endure. \
			This one appears to have kept the ability to crudely handle a shotgun in its meaty claws."
	icon_state = "lighteater_cultist_range"
	icon_dead = "lighteater_cultist_range_dead"
	maxHealth = 100
	health = 100
	melee_damage_lower = 25
	melee_damage_upper = 30 // They hit you with the butt of their shotgun but still hurt so that they're not useless
	chitin_amount = 3	//Crobby???? Mayhaps.
	attacktext = "bashed"
	attack_sound = 'sound/weapons/blunthit.ogg' // Hitting you with the shotgun once empty
	deathmessage = "emits an agonizing scream as it falls to the floor and dies!"
	ranged = TRUE
	inherent_mutations = list(MUTATION_RAND_UNSTABLE, MUTATION_G_SAC, MUTATION_HEART, MUTATION_G_LUNG, MUTATION_G_LIVER, MUTATION_E_BLOOD_VESSEL, MUTATION_S_MUSCLES, MUTATION_S_NERVES, MUTATION_CAT_EYES)
	ranged_cooldown = 4 // Shotguns are strong, need a longer delay
	projectiletype = /obj/item/projectile/bullet/pellet/shotgun
	drop_items = list(/obj/item/gun/projectile/boltgun/lever/shotgun)
	limited_ammo = TRUE
	mag_drop = TRUE
	rounds_left = 6 // Same as the shotgun they hold
	mag_type = /obj/item/ammo_magazine/speed_loader_shotgun/empty
	mags_left = 2 // They have overall less total ammo, make them count

/mob/living/carbon/superior_animal/human/lighteater_cultist/ranged/New()
	..()
	reload_message = "[name] tosses their speedloader and quickly reloads their shotgun!"

