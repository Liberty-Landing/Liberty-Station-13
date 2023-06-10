/mob/living/carbon/superior_animal/robot/similacrum/roomba
	name = "Similacrum Robotics RMB-A unit"
	desc = "A small round drone, usually tasked with carrying out menial tasks. This one seems pretty harmless."
	icon_state = "roomba"
	move_to_delay = 3
	pass_flags = PASSTABLE

	allowed_stat_modifiers = list(
		/datum/stat_modifier/mob/living/carbon/superior_animal/young/robotic = 1,
		/datum/stat_modifier/mob/living/carbon/superior_animal/old/robotic = 5,
		/datum/stat_modifier/health/mult/positive/low = 10,
		/datum/stat_modifier/health/mult/positive/medium = 5,
		/datum/stat_modifier/health/mult/negative/medium = 5,
		/datum/stat_modifier/mob/living/carbon/superior_animal/brutish/robotic = 20,
		/datum/stat_modifier/mob/living/carbon/superior_animal/aggressive/ = 2,
		/datum/stat_modifier/mob/living/carbon/superior_animal/triggerfinger/robotic = 6,
		/datum/stat_modifier/mob/living/carbon/superior_animal/slowdraw = 6,
		/datum/stat_modifier/mob/living/speed/flat/positive/low = 5,
	)


/mob/living/carbon/superior_animal/robot/similacrum/roomba/slayer
	name = "Similacrum Robotics RMB-A unit"
	desc = "A small round drone, usually tasked with carrying out menial tasks. This one seems to have a knife taped to it..?"
	icon_state = "roomba_knife"
	health = 30
	maxHealth = 30
	melee_damage_lower = 12
	melee_damage_upper = 17
	natural_weapon = /obj/item/natural_weapon/roomba/knife
	drop2 = /obj/item/tool/knife

/mob/living/carbon/superior_animal/robot/similacrum/roomba/trip
	name = "Similacrum Robotics RMB-A unit"
	desc = "A small round drone, usually tasked with carrying out menial tasks. This one has a baton attached to it..."
	icon_state = "roomba_batton"
	health = 30
	maxHealth = 30
	move_to_delay = 2 //speedy boy!
	melee_damage_lower = 7
	melee_damage_upper = 12
	natural_weapon = /obj/item/natural_weapon/roomba/baton
	var/trip_odds = 15 //So admins can edit this
	drop2 = /obj/item/melee/telebaton

/mob/living/carbon/superior_animal/robot/similacrum/roomba/trip/UnarmedAttack(atom/A, proximity)
	if(isliving(A))
		var/mob/living/L = A

		if(istype(L) && !L.weakened && prob(trip_odds))
			if(L.stats.getPerk(PERK_ASS_OF_CONCRETE) || L.stats.getPerk(PERK_BRAWN))
				return
			L.Weaken(3)
			L.visible_message(SPAN_DANGER("\the [src] knocks down \the [L]!"))

	. = ..()

/mob/living/carbon/superior_animal/robot/similacrum/roomba/trip/armored
	name = "Similacrum Robotics RMB-SEC unit"
	desc = "A small blue round drone, usually tasked with carrying out menial tasks. This one has a baton attached to it and seems to have added armor..."
	icon_state = "roomba_IH_batton"
	health = 80
	maxHealth = 80
	move_to_delay = 2 //speedy boy!
	melee_damage_lower = 7
	melee_damage_upper = 12
	natural_weapon = /obj/item/natural_weapon/roomba/baton

/mob/living/carbon/superior_animal/robot/similacrum/roomba/boomba
	name = "Similacrum Robotics RMB-A unit"
	desc = "A small round drone, usually tasked with carrying out menial tasks. Is that a fucking anti-personel mine?!"
	icon_state = "boomba"
	health = 15
	maxHealth = 15
	move_to_delay = 4
	melee_damage_lower = 10
	melee_damage_upper = 10
	natural_weapon = /obj/item/natural_weapon/drone

	get_stat_modifier = FALSE // n o .

/mob/living/carbon/superior_animal/robot/similacrum/roomba/boomba/UnarmedAttack()
	. = ..()
	if(.) // If we succeeded in hitting.
		visible_message(SPAN_DANGER("\The [src] makes an odd warbling noise, fizzles, and explodes!"))
		explosion(get_turf(loc), 0, 0, 2, 3)
		death()

/mob/living/carbon/superior_animal/robot/similacrum/roomba/gun_ba
	name = "Similacrum Robotics RMB-A unit"
	desc = "A small round drone, usually tasked with carrying out menial tasks. And this one has a gun."
	icon_state = "roomba_lmg"
	health = 30
	maxHealth = 30
	melee_damage_lower = 5
	melee_damage_upper = 10
	natural_weapon = /obj/item/natural_weapon/drone
	ranged = TRUE
	limited_ammo = TRUE
	mag_drop = FALSE
	rounds_left = 16
	projectiletype = /obj/item/projectile/beam/midlaser
	mag_type = /obj/item/cell/medium/high/depleted
	mags_left = 0
	reload_message = "Beeps aggressively as it charges the gun!" //in case of addmins givng more then 1 load

/mob/living/carbon/superior_animal/robot/similacrum/roomba/gun_ba/New()
	..()
	if(prob(10))
		drop2 = /obj/item/gun/energy/cog
	if(prob(10))
		cell_drop = /obj/item/cell/medium

/mob/living/carbon/superior_animal/robot/similacrum/roomba/gun_ba/plasma
	name = "Similacrum Robotics RMB-SEC unit"
	desc = "A small blue round drone, usually tasked with carrying out menial tasks. And this one has a overclocked gun."
	icon_state = "roomba_lmg"
	health = 50
	maxHealth = 50
	melee_damage_lower = 5
	melee_damage_upper = 10
	rounds_left = 10 //takes more per shot!
	projectiletype = /obj/item/projectile/plasma/light

/mob/living/carbon/superior_animal/robot/similacrum/roomba/gun_ba/armored
	name = "Similacrum Robotics RMB-SEC unit"
	desc = "A small blue round drone, usually tasked with carrying out menial tasks. And this one has a gun and seems to have added armor."
	icon_state = "roomba_IH_lmg"
	health = 70
	maxHealth = 70
	melee_damage_lower = 5
	melee_damage_upper = 10

/mob/living/carbon/superior_animal/robot/similacrum/roomba/chemical
	name = "Similacrum Robotics RMB-MED unit"
	desc = "A small round drone, usually tasked with carrying out menial tasks. This one has a hypo on the top of it..."
	icon_state = "roomba_drugs"
	health = 20
	maxHealth = 20
	melee_damage_lower = 7
	melee_damage_upper = 12
	natural_weapon = /obj/item/natural_weapon/drone
	var/injection_per_hit = 2
	var/injection_type = "toxin"

/mob/living/carbon/superior_animal/robot/similacrum/roomba/chemical/UnarmedAttack(atom/A, proximity)
	. = ..()

	if(isliving(A))
		var/mob/living/L = A
		if(istype(L) && L.reagents)
			L.reagents.add_reagent(injection_type, injection_per_hit)

/mob/living/carbon/superior_animal/robot/similacrum/roomba/chemical/med
	name = "Similacrum Robotics RMB-MED unit"
	desc = "A small white round drone, usually tasked with carrying out menial tasks. This one has a hypo on the top of it..."
	icon_state = "roomba_medical_drugs"
	health = 20
	maxHealth = 20
	melee_damage_lower = 2
	melee_damage_upper = 3
	injection_per_hit = 1
	injection_type = "chloralhydrate"

/mob/living/carbon/superior_animal/robot/similacrum/roomba/chemical/med/healer
	name = "Similacrum Robotics RMB-MED unit"
	desc = "A small white round drone, usually tasked with carrying out menial tasks. This one has a hypo on the top of it..."
	icon_state = "roomba_medical_drugs"
	health = 20
	maxHealth = 20
	melee_damage_lower = 2
	melee_damage_upper = 3
	injection_per_hit = 3
	injection_type = "tricordrazine"
