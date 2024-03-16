/mob/living/carbon/superior_animal/liberty
	name = "mob template"
	desc = "You should not be seeing this. Scream at the top of your lungs if you do."
	icon = 'icons/mob/mobs-monster.dmi'
	speak_emote = list("clicks")
	icon_state = "ventrofacius"
	icon_dead = "ventrofacius_dead"
	attacktext = "chomped"
	attack_sound = 'sound/weapons/bite.ogg'
	faction = "fauna"
	wander = TRUE
	fire_verb = "shoots"
	see_in_dark = 10
	sanity_damage = 1
	destroy_surroundings = TRUE

	ranged = FALSE

	maxHealth = 100
	health = 100

	melee_damage_lower = 10
	melee_damage_upper = 15

	armor = list(melee = 30, bullet = 40, energy = 35, bomb = 25, bio = 100, rad = 100)

	//inherent_mutations = list(MUTATION_BLINDNESS, MUTATION_DWARFISM, MUTATION_NERVOUSNESS, MUTATION_DEAF, MUTATION_IMBECILE) - Cant be used so dont track these
	contaminant_immunity = TRUE
	cold_protection = 1000
	heat_protection = 100
	breath_required_type = 0
	breath_poison_type = 0
	min_breath_required_type = 0
	min_breath_poison_type = 0
	min_air_pressure = 0 //below this, brute damage is dealt
	max_air_pressure = 10000 //above this, brute damage is dealt
	min_bodytemperature = 0 //below this, burn damage is dealt
	max_bodytemperature = 10000 //above this, burn damage is dealt
	friendly_to_colony = FALSE
	/* Armor related variables - Soj edit we have are own
	var/melee = 0
	var/bullet = 0
	var/energy = 0
	var/bomb = 0
	var/bio = 0
	var/rad = 0

	 Damage multiplier when destroying surroundings*/
	var/surrounds_mult = 0.5

	// The ennemy of all wurmkind
	//var/obj/machinery/mining/drill/DD

	//Controller that spawned the wurm
	//var/datum/wurm_controller/controller

	range_telegraph = "starts to wobble at"

/mob/living/carbon/superior_animal/liberty/ventrofacius
	name = "vicious Ventrofacius"
	desc = "This unusual creature suffered carcinification, with two reddish claws protruding from its furry, ceramic-like shell as an extension of what was previously an antenna. It lacks hands, and its mouth is located on its stomach."
	icon_state = "ventrofacius"
	icon_dead = "ventrofacius_dead"
	melee_damage_lower = 15
	melee_damage_upper = 20
	chitin_amount = 6	//Lil' bit of chitin for your efforts. Crob.
	maxHealth = 75 //Less health than a noraml person.
	health = 75
	move_to_delay = 3
	meat_type = /obj/item/reagent_containers/food/snacks/meat/carcinicated

/mob/living/carbon/superior_animal/liberty/magnibrachius
	name = "deranged Magnibrachius"
	desc = "A peculiar creature with a large brain and pair of long arms that replaces their short legs. It seems the short legs are becoming more and more vestigial each generation. \
	However, their arms are stronger than a earth's gorilla, and often squash bones and skulls for fun."
	icon_state = "magnibrachius"
	icon_dead = "magnibrachius_dead"
	attacktext = "smashed"
	attack_sound = 'sound/weapons/blunthit.ogg'
	melee_damage_lower = 25
	melee_damage_upper = 30
	maxHealth = 175 //More health than a noraml person.
	health = 175
	move_to_delay = 7
	meat_type = /obj/item/reagent_containers/food/snacks/meat/carcinicated

/mob/living/carbon/superior_animal/liberty/oculamia
	name = "antagonized creature"						//Medi suggested this be unnamed for now
	desc = "A strange serpentoid creature with three visible arms topped with curved hard tips, its fourth arm is broken off or otherwise malformed."
	icon_state = "oculamia"
	icon_dead = "oculamia_dead"

	ranged = TRUE
	ranged_cooldown = 1
	projectilesound = 'sound/effects/creatures/acid_spit.ogg'
	projectiletype = /obj/item/projectile/bullet/rock/ice
	rapid = FALSE
	comfy_range = 5

	melee_damage_lower = 10
	melee_damage_upper = 15
	darkbones_amount = 4	//Not very big, so not a lot of bones. Spineless..........
	maxHealth = 125 //More health than a noraml person.
	health = 125
	move_to_delay = 7
	meat_type = /obj/item/reagent_containers/food/snacks/meat/carcinicated

/mob/living/carbon/superior_animal/liberty/corrupted_pirs
	name = "Pollinated PIRS scientist"
	desc = "An unknown amalgamation of flesh and exotic flora, the corpse seemingly belonging to an PIRS employee. The flora completely took over the scientist's brain, replacing it with a scythe-like blade made of bones."
	icon_state = "neurophyta_pirs"
	icon_dead = "neurophyta_pirs_dead"
	attacktext = "slashed"
	attack_sound = 'sound/weapons/sharphit.ogg'
	melee_damage_lower = 25
	melee_damage_upper = 30
	move_to_delay = 4

	maxHealth = 125 //More health than a noraml person.
	health = 125
	meat_type = /obj/item/reagent_containers/food/snacks/meat/human

/mob/living/carbon/superior_animal/liberty/corrupted_watch
	name = "Pollinated  Watchman Neurophyta"
	desc = "A strange amalgamation of flesh and exotic flora, the body seemingly belonging to an member of the Colony's watch. Whatever may be taking over the body of this man or woman, it somehow takes advantage of the user's experience with guns."
	icon_state = "neurophyta_watch"
	icon_dead = "neurophyta_watch_dead"

	range_telegraph = "takes aim at"
	ranged = TRUE
	comfy_range = 7
	rapid = FALSE
	ranged_cooldown = 2
	projectiletype = /obj/item/projectile/bullet/rifle_75
	projectilesound = 'sound/weapons/guns/fire/lmg_fire.ogg'
	meat_type = /obj/item/reagent_containers/food/snacks/meat/human

/mob/living/carbon/superior_animal/liberty/corrupted_fontaine
	name = "Pollinated Fontaine Neurophyta"
	desc = "An unknown amalgamation of flesh and exotic flora, the corpse seemingly belonging to an fontaine employee. The right arm was absorbed and enlarged beyond recognition, putting too much weight on the entire body."
	icon_state = "neurophyta_fontaine"
	icon_dead = "neurophyta_fontaine_dead"

	maxHealth = 75 //Less health than a noraml person.
	health = 75

	attacktext = "smashed"
	attack_sound = 'sound/weapons/blunthit.ogg'
	melee_damage_lower = 35
	melee_damage_upper = 40
	move_to_delay = 6
	meat_type = /obj/item/reagent_containers/food/snacks/meat/human

/mob/living/carbon/superior_animal/liberty/corrupted_custodian
	name = "Pollinated Custodian Turret"
	desc = "A strange amalgamation of flesh and exotic flora, the corpse belonging to a Custodian knight or Dark Silver armored mercenary. The Hearthcore of the deceased tries to fight back against the usurper, reflecting blue plasma everywhere. There is no brain control as far you can see."
	icon_state = "neurophyta_custodianturret"
	icon_dead = "neurophyta_custodianturret_dead"
	// No modifiers that say muscle or something, and no Aggressive as that would make it chase after people
	allowed_stat_modifiers = list(
		/datum/stat_modifier/mob/living/carbon/superior_animal/durable = 5,
		/datum/stat_modifier/health/flat/negative/low = 5,
		/datum/stat_modifier/health/flat/positive/low = 5,
		/datum/stat_modifier/mob/living/carbon/superior_animal/armor/mult/negative/low = 5,
		/datum/stat_modifier/mob/living/damage/negative/mixed/flat/low = 5,
		/datum/stat_modifier/mob/living/carbon/superior_animal/deadeye = 5,
		/datum/stat_modifier/mob/living/carbon/superior_animal/slowaimed = 5,
		/datum/stat_modifier/mob/living/carbon/superior_animal/triggerfinger = 15,
		/datum/stat_modifier/mob/living/carbon/superior_animal/quickdraw = 5,
		/datum/stat_modifier/mob/living/carbon/superior_animal/slowdraw = 10,
	)

	range_telegraph = "attempts to reflect unstable plasma at"
	ranged = TRUE
	comfy_range = 7
	rapid = FALSE
	ranged_cooldown = 3
	projectiletype = /obj/item/projectile/flamer_lob		//For funny burning
	projectilesound = 'sound/weapons/energy/vaporize.ogg'
	wander = FALSE // Don't move from your spot, you are a turret
	advance = FALSE // Don't chase after people
	advance_if_cant_see = FALSE // If they go out of sight, don't go after them
	wander_if_lost_sight = FALSE // We are a turret, we don't move
	move_to_delay = 10000		// Keeping this just in case it somehow still moves.
	meat_type = /obj/item/reagent_containers/food/snacks/meat/human

/mob/living/carbon/superior_animal/liberty/corrupted_custodian/advance_towards(var/atom/target)
	return // Don't move from your spot even if you target, you are a turret

