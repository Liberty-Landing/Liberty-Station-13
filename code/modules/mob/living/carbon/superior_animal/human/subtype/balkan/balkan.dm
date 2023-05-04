/mob/living/carbon/superior_animal/human/balkan
	name = "unknown mercenary"
	desc = "An unknown assailant clad from head to toe in professional gear. Seemingly speaks in some foreign language."
	icon = 'icons/mob/mobs-humanoid.dmi'
	icon_state = "balkan_mercenary_boltgun"
	icon_dead = "balkan_mercenary_dead"
	drop_items = list(/obj/item/stack/dinar/random)
	stop_automated_movement_when_pulled = 1
	wander = 1
	maxHealth = 100
	health = 100

	armor = list(melee = 50, bullet = 50, energy = 45, bomb = 50, bio = 100, rad = 100)

	casingtype = null

    //range/ammo stuff
	ranged = TRUE
	viewRange = 10
	comfy_range = 7
	rapid = FALSE
	ranged_cooldown = 2
	projectiletype = /obj/item/projectile/bullet/rifle_75
	projectilesound = 'sound/weapons/guns/fire/mosin.ogg'
	limited_ammo = TRUE
	mag_drop = FALSE
	rounds_left = 5
	mag_type = /obj/item/ammo_magazine/speed_loader_rifle_75/empty
	mags_left = 6 //1+6
	delay_for_range = 1.0 SECONDS

	melee_damage_lower = 10
	melee_damage_upper = 15
	breath_required_type = 0 // Doesn't need to breath for event atmosphere purposes.
	breath_poison_type = 0 // Can't be poisoned
	min_air_pressure = 0 // Doesn't need pressure for event atmosphere purposes.
	attacktext = "punched"
	attack_sound = 'sound/weapons/punch1.ogg'
	meat_amount = 0
	meat_type = null
	leather_amount = 0
	bones_amount = 0

	breath_required_type = NONE
	breath_poison_type = NONE
	min_breath_required_type = 0
	min_breath_poison_type = 0

	min_air_pressure = 0
	min_bodytemperature = 0

	can_burrow = FALSE
	colony_friend = FALSE
	friendly_to_colony = FALSE

	never_stimulate_air = TRUE

	faction = "balkan" //Kill everything in sight including excelsior

/mob/living/carbon/superior_animal/human/balkan/doTargetMessage()
	. = ..()

	visible_emote("yells, \"[pick("Vidim protivnika!","Pod po mna!","Asistenciju!", "Pojdes tjed prasce!", "Chicpni!", "Ruka nahoru, hned!")]")
	playsound(src, 'sound/weapons/TargetOn.ogg', 50, 1, -3)

/mob/living/carbon/superior_animal/human/balkan/death()
	. = ..()
	playsound(loc, 'sound/death_gasps/balkan_death.ogg', 80)

/mob/living/carbon/superior_animal/human/balkan/sts
	icon_state = "balkan_mercenary_sts"


	//range/ammo stuff
	rapid = TRUE
	rapid_fire_shooting_amount = 3
	comfy_range = 4
	ranged_cooldown = 2
	projectiletype = /obj/item/projectile/bullet/rifle_75
	projectilesound = 'sound/weapons/guns/fire/ak.ogg'
	mag_type = /obj/item/ammo_magazine/rifle_75/empty
	mag_drop = TRUE
	rounds_left = 40
	mags_left = 3 //1+5

/mob/living/carbon/superior_animal/human/balkan/bren
	icon_state = "balkan_mercenary_bren"

	maxHealth = 125 //More than a normal person.
	health = 125

	comfy_range = 6
	rapid = TRUE
	rapid_fire_shooting_amount = 5
	ranged_cooldown = 3
	projectiletype = /obj/item/projectile/bullet/rifle_75
	projectilesound = 'sound/weapons/guns/fire/lmg_fire.ogg'
	limited_ammo = FALSE
	mag_drop = FALSE

/mob/living/carbon/superior_animal/human/balkan/space
	icon_state = "balkan_space"
	icon_dead = "balkan_dead"


	maxHealth = 125 //More than a normal person.
	health = 125

	armor = list(melee = 60, bullet = 70, energy = 50, bomb = 40, bio = 100, rad = 100)

	comfy_range = 6
	rapid = TRUE
	rapid_fire_shooting_amount = 5
	ranged_cooldown = 3
	projectiletype = /obj/item/projectile/bullet/rifle_75
	projectilesound = 'sound/weapons/guns/fire/lmg_fire.ogg'
	limited_ammo = FALSE
	mag_drop = FALSE
