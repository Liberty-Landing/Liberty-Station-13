//basic spider mob, these generally guard nests
/mob/living/carbon/superior_animal/giant_spider
	name = "guardian spider"
	desc = "Oversized pest who draw blood from the local maintenance fauna. This one has deep red eyes and willing to taste flesh."
	description_info = "Binomial Nomenclature: Arachnida Tetrapulomonata Perniciosas:\n\n\
						Like most giant insectoids within the colony, this one is affected by the Perniciosus viral agent. This viral agent, achieved through a cap-snatching process, was the most successful method to unpregulate key genes. \n\n\
						On the spiders, the virus enhances various traits. Firstly, it alters respiration, relying less on book lungs and more on chitin-based oxygen-carrying structures resembling human lungs. \
						Secondly, the flexible chitin reinforces and grows with the spider, eliminating the need for shedding. \
						Finally, a cellular proliferation override leads to uncontrollable growth, expanding tissues and organs but reducing lifespan and increasing cancer risk. \n\n\
						Spiders adopted a eusocial behavior with a wasp-like hierarchy centered around empresses, the sole egg layers, and neutered workers. \
						They became common in abandoned regions, hunting prey due to their carnivorous nature and possessing superior strength and toxin specializations. \
						Their silk is prized for wound dressing and primitive skin grafts due to its antibiotic properties."
	icon = 'icons/mob/mobs-spider.dmi'
	icon_state = "guard"
	icon_living = "guard"
	pass_flags = PASSTABLE

	mob_size = MOB_MEDIUM

	maxHealth = 100
	health = 100

	attack_sound = 'sound/weapons/spiderlunge.ogg'
	speak_emote = list("chitters")
	emote_see = list("chitters.", "rubs its legs.")
	speak_chance = 5

	get_stat_modifier = TRUE //We get randomized addition armor
	armor_penetration = 5

	armor = list(melee = 5, bullet = 5, energy = 5, bomb = 5, bio = 10, rad = 25)

	allowed_stat_modifiers = list(
		/datum/stat_modifier/mob/living/carbon/superior_animal/lustrous = 33,
		/datum/stat_modifier/mob/living/carbon/superior_animal/padded/ = 17,
		/datum/stat_modifier/mob/living/carbon/superior_animal/durable/spider = 50,
		/datum/stat_modifier/mob/living/carbon/superior_animal/young/spider = 33,
		/datum/stat_modifier/mob/living/carbon/superior_animal/old/spider = 50,
		/datum/stat_modifier/mob/living/carbon/superior_animal/venomous = 1,
		/datum/stat_modifier/mob/living/carbon/superior_animal/brutish = 16,
	)

	move_to_delay = 4.5
	turns_per_move = 5
	see_in_dark = 10
	meat_type = /obj/item/reagent_containers/food/snacks/meat/spider
	meat_amount = 3
	leather_amount = 0
	bones_amount = 0
	stop_automated_movement_when_pulled = 1

	melee_damage_lower = 12
	melee_damage_upper = 17

	min_breath_required_type = 3
	min_air_pressure = 15 //below this, brute damage is dealt

	fleshcolor = "#1E536E"
	bloodcolor = "#1E536E"

	var/poison_per_bite = 2
	var/poison_type = "pararein"
	faction = "spiders"

	price_tag = 250 //in case you sell these???

	colony_friend = FALSE
	friendly_to_colony = FALSE

/mob/living/carbon/superior_animal/giant_spider/New(var/location, var/atom/parent)
	get_light_and_color(parent)
	..()

/mob/living/carbon/superior_animal/giant_spider/isValidAttackTarget(var/atom/O)
	if (isliving(O))
		var/mob/living/L = O
		if(L.faction=="sproachder")
			return
	return ..(O)
