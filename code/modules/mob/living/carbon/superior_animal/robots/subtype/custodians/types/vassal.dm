// Basic Custodian construct. Average speed, tankyness and damage.
/mob/living/carbon/superior_animal/robot/custodians/vassal
	name = "Vassal Automaton"
	desc = "The Vassal, an Automaton made by the Custodians and fashioned after a solemn warrior. Reliable, strong, and quite sturdy."
	faction = "neutral"
	icon_state = "vassal_automaton"
	icon_dead = "vassal_automaton_dead"
	attacktext = "striken"
	fleshcolor = "#964B00"
	bloodcolor = "#964B00"
	move_to_delay = 3
	turns_per_move = 3
	pass_flags = PASSTABLE
	meat_amount = 1 // ONE stack of a RANDOM amount of plasteel
	health = 400
	maxHealth = 400
	melee_damage_lower = 45
	melee_damage_upper = 55
	meat_type = /obj/item/stack/material/plasteel/random
	drop1 = /obj/item/tool/sword/custodian/shortsword
	drop2 = /obj/item/book/lectures/hearthlantern
	armor = list(melee = 50, bullet = 50, energy = 10, bomb = 15, bio = 100, rad = 100, agony = 100)
