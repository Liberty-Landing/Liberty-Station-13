// Smol but fast variant of the golem
/mob/living/carbon/superior_animal/nacre_golem/runtling
	name = "nacre runtling"
	desc = "A weird creature made of nacre. It is smaller and weaker, but numerous and fast."
	icon_state = "golem_nacre_blue"
	health = 30
	maxHealth = 30
	move_to_delay = 1 // Very fast
	armor = list(melee = 20, bullet = 10, energy = 25, bomb = 15, bio = 100, rad = 100) //We want to be gunned down, not lasered
	drop_amount = 1
	size_factor = 0.75 // 25% Smaller
