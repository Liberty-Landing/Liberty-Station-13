/mob/living/carbon/superior_animal/roach
	name = "Overgrown Roach"
	desc = "A monstrous, dog-sized cockroach. These huge mutants can be everywhere where humans are, on ships, planets and stations."
	description_info = "Binomial Nomenclature: Blattaria Macropanesthia Perniciosas:\n\n\
						Like most of the giant insectoids within the colony, this one is under effects of Perniciosus viral agent. This viral agent was the second accomplished way to unpregulate key genes with viral cap-snatching process. \
						However, it had more compatibility with some species from the arthoproda phylum, such as arachnida and blattodea, rather than Eukaryotas. \
						With the disease going far and wide on colonial grounds, the mutated species became an severe nuance on any colonial effort, even causing colonies to break down from such pest. \
						On the roaches, the virus enhanced many characteritics, such as the respiration system with oxygen storage vesicles, muscular contractions to improve inner ventilation of the spiracles, and lung-like organs alongside the Tracheal system. \
						The chitin stays during the early days internally, acting like a endoskeleton before being replaced by a proper exoskeleton when matured, allowing a bigger size with mininal amount of shedding. \
						and, for last, a cellular proliferation override, allowing a uncontrollable growth that results in expansion of tissues and organs, but lowers the life expectacy and bring higher risk of cancer. \n\
						Everything else came natural with evolution in short years, the fastpaced reproduction rewarded the bold and most eusocial among the mutated roaches, as the shy ones starved and had their genepool exterminated. \
						Soon enough, roaches became an common sight alongside spiders and termites on the maintenance, competing for nourishment from trash or the flesh of fallen enemies. The roaches has the advantage of being omnivorous, allowing \
						these creatures to not rely entirely on meat, as they are by far the weakest Perniciosus mutants - essentially prey to others - but organic matter from trash and usage of swarming tactics keeps the existence of these roaches unbeatable."
	icon = 'icons/mob/mobs-roach.dmi'
	icon_state = "roach"

	mob_size = MOB_SMALL

	density = 0 //Swarming roaches! They also more robust that way.

	attack_sound = 'sound/voice/insect_battle_bite.ogg'
	emote_see = list("chirps loudly.", "cleans its whiskers with forelegs.")
	turns_per_move = 4
	turns_since_move = 0

	get_stat_modifier = TRUE //We get randomized addition armor

	armor = list(melee = 10, bullet = 5, energy = 0, bomb = 5, bio = 20, rad = 0, agony = 0)

	allowed_stat_modifiers = list(
		/datum/stat_modifier/mob/living/carbon/superior_animal/biosilicified = 26,
		/datum/stat_modifier/mob/living/carbon/superior_animal/lambertian = 16,
		/datum/stat_modifier/mob/living/carbon/superior_animal/durable = 42,
		/datum/stat_modifier/mob/living/speed/flat/positive/low = 9,
	)

	meat_type = /obj/item/reagent_containers/food/snacks/meat/roachmeat/kampfer
	meat_amount = 2
	leather_amount = 0
	bones_amount = 0

	maxHealth = 15
	health = 15

	var/blattedin_revives_left = 3 // how many times blattedin can get us back to life (as num for adminbus fun).
	//The common roach, gets to live 4 times, same as a roachling. They have so much to live for.
	melee_damage_lower = 5
	melee_damage_upper = 10 //Dogsized roach like come on
	var/knockdown_odds = 1 //1% KO odds

	min_breath_required_type = 3
	min_air_pressure = 15 //below this, brute damage is dealt

	faction = "roach"
	pass_flags = PASSTABLE
	acceptableTargetDistance = 3 //consider all targets within this range equally
	randpixel = 12
	overkill_gib = 16

	sanity_damage = 0.5

	fleshcolor = "#666600"
	bloodcolor = "#666600"

	var/taming_window = 30 //How long you have to tame this roach, once it's pacified.
	eating_time = 2 MINUTES // how long it will take to eat/lay egg
	var/busy_start_time // when it started eating/laying egg

	var/atom/eat_target // target that the roach wants to eat
	var/fed = 0 // roach gets fed after eating a corpse
	var/probability_egg_laying = 75 // probability to lay an egg

	var/snacker = FALSE

	do_friendly_fire_chance = 100

	colony_friend = FALSE
	friendly_to_colony = FALSE

	known_languages = list(LANGUAGE_CHTMANT)

	inherent_mutations = list(MUTATION_ROACH_BLOOD, MUTATION_DEAF, MUTATION_TOURETTES, MUTATION_EPILEPSY)

/mob/living/carbon/superior_animal/roach/New()
	..()

/mob/living/carbon/superior_animal/roach/isValidAttackTarget(var/atom/O)
	if (isliving(O))
		var/mob/living/L = O
		if(L.faction=="sproachder")
			return
	return ..(O)

//When roaches die near a leader, the leader may call for reinforcements
/mob/living/carbon/superior_animal/roach/death()
	.=..()
	if (.)
		for (var/mob/living/carbon/superior_animal/roach/fuhrer/F in range(src,8))
			F.distress_call()

/mob/living/carbon/superior_animal/roach/Destroy()
	eat_target = null //should fix the support roach GC fail

	. = ..()

/mob/living/carbon/superior_animal/roach/doTargetMessage()
	. = ..()

	playsound(src, 'sound/voice/insect_battle_screeching.ogg', 30, 1, -3)
