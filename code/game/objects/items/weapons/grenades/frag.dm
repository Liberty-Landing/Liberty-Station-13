/obj/item/grenade/frag
	name = "\"Pitbull\" Fragmentation Grenade"
	desc = "A military-grade Defensive Fragmentation Grenade, designed to be thrown from cover."
	icon_state = "frag"
	item_state = "frggrenade"
	loadable = TRUE

	var/fragment_type = /obj/item/projectile/bullet/pellet/fragment/strong
	var/num_fragments = 150  //total number of fragments produced by the grenade
	var/fragment_damage = 5
	var/damage_step = 2      //projectiles lose a fragment each time they travel this distance. Can be a non-integer.

	//The radius of the circle used to launch projectiles. Lower values mean less projectiles are used but if set too low gaps may appear in the spread pattern
	var/spread_range = 7

/obj/item/grenade/frag/prime()
	set waitfor = 0
	..()

	var/turf/O = get_turf(src)
	if(!O) return

	if(num_fragments)
		var/lying = FALSE
		if(isturf(src.loc))
			for(var/mob/living/M in O)
				//lying on a frag grenade while the grenade is on the ground causes you to absorb most of the shrapnel.
				//you will most likely be dead, but others nearby will be spared the fragments that hit you instead.
				if(M.lying)
					lying = TRUE

		if(!lying)
			fragment_explosion(O, spread_range, fragment_type, num_fragments, fragment_damage, damage_step)
		else
			fragment_explosion(O, 0, fragment_type, num_fragments, fragment_damage, damage_step)

	qdel(src)

 // Old NeoTheo leftover grenade
 /*
/obj/item/grenade/frag/nt
	name = "NT DF grenade \"Holy Thunder\""
	desc = "A military-grade defensive fragmentation grenade, designed to be thrown from cover."
	icon_state = "frag_nt"
	item_state = "frggrenade_nt"
	matter = list(MATERIAL_BIOMATTER = 75)
	fragment_damage = 7
	damage_step = 3
*/

/obj/item/grenade/frag/stinger
	name = "\"Stinger\" Rubber Fragmentation Grenade"
	desc = "A repurposed fragmentation grenade loaded with rubber pellets, ready to serve the public trust. Still lethal if caught in its epicenter."
	icon_state = "stinger"
	item_state = "stinger"
	loadable = TRUE
	num_fragments = 70
	fragment_type = /obj/item/projectile/bullet/pellet/fragment/rubber

/obj/item/grenade/frag/pipebomb
	name = "improvised pipebomb"
	desc = "A jury rigged small cell filled with hydrogen plasma. Throw at authorities."
	icon_state = "frag_pipebomb"
	item_state = "fraggrenade_pipebomb"
	matter = list(MATERIAL_ALUMINIUM = 2, MATERIAL_INDSTEEL = 2, MATERIAL_HYDROGENC = 2, MATERIAL_PLASTIC = 3, MATERIAL_SILVER = 2)
	num_fragments = 65 // Almost half the normal one, to not be worthless
	fragment_damage = 10
	damage_step = 5

/obj/item/grenade/frag/white_phosphorous
	name = "\"Sabac\" Incendiary Grenade"
	desc = "A modernized incendiary grenade, carrying a dangerous pyrophoric payload. Use with care, highly flammable."
	icon_state = "white_phos"
	item_state = "fraggrenade"
	fragment_type = /obj/item/projectile/bullet/pellet/fragment/ember
	num_fragments = 10
	fragment_damage = 5
	damage_step = 5
	spread_range = 7
	var/datum/effect/effect/system/smoke_spread/white_phosphorous/smoke

/obj/item/grenade/frag/white_phosphorous/prime()
	playsound(loc, 'sound/effects/smoke.ogg', 50, 1, -3)
	smoke.set_up(5, 0, usr.loc)
	smoke.set_up(5, 0, get_turf(loc))
	smoke.start()
	..()

/obj/item/grenade/frag/white_phosphorous/New()
	..()
	smoke = new
	smoke.attach(src)

/obj/item/grenade/frag/white_phosphorous/Destroy()
	qdel(smoke)
	smoke = null
	return ..()
