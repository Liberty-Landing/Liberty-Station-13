/mob/living/carbon/superior_animal/robot/custodians/faux_dummy
	name = "Radiant Faux Dummy"
	desc = "The Radiant Faux Dummy, a rather makeshifted pseudo-automaton of the Custodians, settled and built by any specialized Hussar Knight.\
	Inert, neutral and almost undestructible. The Radiance stresses itself as springs, as it releases heat and air to simulate breathing, so enemies will attack it instead of the knight."
	faction = "neutral"
	icon_state = "suzerain_automaton"
	icon_dead = "suzerain_automaton_dead"
	fleshcolor = "#964B00"
	bloodcolor = "#964B00"
	attacktext = "taunts"
	meat_amount = 0
	health = 350 //Need to ask trilby on a way to kill off the faux dummy after 5 minutes.
	maxHealth = 350
	melee_damage_lower = 0
	melee_damage_upper = 0
	armor = list(melee = 75, bullet = 75, energy = 75, bomb = 75, bio = 100, rad = 100, agony = 100)
	target_dummy = TRUE
	wander = FALSE // YOU ARE A DUMMY. YOU HAVE NO LEGS. STAY THERE.
	advance = FALSE // Don't chase after people
	advance_if_cant_see = FALSE // If they go out of sight, don't go after them
	wander_if_lost_sight = FALSE // We are a dummy, we are dummy
	move_to_delay = 10000		// Keeping this just in case it somehow still moves.

/mob/living/carbon/superior_animal/robot/custodians/faux_dummy/advance_towards(var/atom/target)
	return // Don't move from your spot even if you target, you are a turret
