//basic spider mob, these generally guard nests
/mob/living/carbon/superior_animal/giant_spider
	name = "guardian spider"
	desc = "Furry and black, it makes you shudder to look at it. This one has deep red eyes."
	description_info = "Binomial Nomenclature: Arachnida Tetrapulomonata Perniciosas:\n\n\
						Like most of the giant insectoids within the colony, this one is under effects of Perniciosus viral agent. This viral agent was the second accomplished way to unpregulate key genes with viral cap-snatching process. \
						However, it had more compatibility with some species from the arthoproda phylum, such as arachnida and blattodea, rather than Eukaryotas. \
						With the disease going far and wide on colonial grounds, the mutated species became an severe nuance on any colonial effort, even causing colonies to break down from such pest. \
						On the spiders, the virus enhanced many characteritics, such as the respiration system relying less on the book lungs, and more on oxygen-carrying molecules from active ventilation structures on the chitin, and human-like lungs. \
						the chitin is made of a different material, flexible and reinforces itself as the spider grows, adding more material and bending depending of necessity, resulting in no need for shedding. \
						and, for last, a cellular proliferation override, allowing a uncontrollable growth that results in expansion of tissues and organs, but lowers the life expectacy and bring higher risk of cancer. \n\
						The spiders, for the sake of survival, became eusocial and started having a curious wasp-like hierarchy system depending of fed hormones on a webhive, where empress are the only ones with capacity to lay eggs. The rest, beyond the emperor spider, is neutered. \
						Soon enough, spiders became an common sight alongside roaches and termites on the maintenance, hunting down fallen enemies due to its carnivorous nature. The spiders are stronger than the other insectoid mutants, and have different toxin specializations to fit its needs. \
						The silk of these specimens are valuable for wound-dressing of burns, due to its antibiotic nature, and primitive skin grafts."
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
