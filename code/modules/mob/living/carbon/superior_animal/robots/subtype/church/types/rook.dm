/mob/living/carbon/superior_animal/robot/church/rook
	name = "Suzerain Automaton"
	desc = "The Suzerain, an automaton made by the Custodians and fashioned after a hulking behemoth, it's often attacked first by foes. \
	Slow, lumbering, but with the strength required to tear enemies apart."
	faction = "neutral"
	icon_state = "suzerain_automaton"
	fleshcolor = "#964B00"
	bloodcolor = "#964B00"
	attacktext = "pumbles"
	move_to_delay = 5 //Slowdown!
	turns_per_move = 5
	meat_amount = 3 // Chunky boi
	health = 550
	maxHealth = 550
	melee_damage_lower = 60 //Big slow things dont deal a lot do to bullet sponges
	melee_damage_upper = 75
	meat_type = /obj/item/stack/material/gold/random
	drop1 = /obj/item/stack/material/gold/random
	drop2 = /obj/item/book/ritual/cruciform
	armor = list(melee = 75, bullet = 25, energy = 20, bomb = 30, bio = 100, rad = 100, agony = 100)
	target_dummy = TRUE
