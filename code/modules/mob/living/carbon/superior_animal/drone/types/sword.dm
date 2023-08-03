// More armor, HP and damage, but move slower
/mob/living/carbon/superior_animal/handmade/sword
	name = "Custom-made Sword Drone"
	desc = "Built from the Phokorus Institute division's craftsmanship, and gathered designs of Simulacrum Robotics, each of these fully robotic automatons is a unique, handmade, heavily armored assembly."
	icon_state = "pi_sword_handmade"
	attack_sound = 'sound/weapons/blade1.ogg'
	health = 500
	maxHealth = 500
	melee_damage_lower = 40
	melee_damage_upper = 50
	natural_weapon = /obj/item/natural_weapon/knife
	move_to_delay = 4
	cell = new /obj/item/cell/large/moebius // Hold the drone's power cell, default to a cheap one.
	exam_message = "This one bears a large sword to cut problems in half."
