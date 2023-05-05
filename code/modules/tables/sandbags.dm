// Are these technically a table? No. This should be relocated somewhere else at some point; but I'm too lazy to make a new file-list rn.
// Why are they here? Because I need these to act similar to a flipped table. So - yeah.

/obj/structure/sandbags
	name = "sandbag fortification"
	desc = "A half-wall of sandbags piled to act as a fortification."
	icon = 'icons/obj/structures/barricades.dmi'
	icon_state = "sandbags"
	density = 1
	anchored = 1
	climbable = 1
	layer = PROJECTILE_HIT_THRESHHOLD_LAYER
	throwpass = 1
	maxHealth = 50
	health = 50

	matter = list(MATERIAL_SANDBAG = 2)

	var/base_blocking = 50
	var/base_cover = 50

/obj/structure/sandbags/update_icon()
	icon_state = "sandbag_0"

/obj/structure/sandbags/proc/damage(damage)
	health -= damage
	if(health < 40)
		icon_state = "sandbag_0"
	if(health < 30)
		icon_state = "sandbag_1"
	if(health < 20)
		icon_state = "sandbag_2"
	if(health < 10)
		icon_state = "sandbag_3"
	if(health < 1)
		qdel(src)

// Rest of this code is copied from the Bastion Shield object. Mild changes are made, however, such as how to repair this structure vs the Shield.
/obj/structure/sandbags/attackby(obj/item/I, mob/living/user)
	.=..()
	if(user.a_intent == I_HELP && istype(I, /obj/item/gun))
		var/obj/item/gun/G = I
		G.gun_brace(user, src)
		return
	if(attackby(/obj/item/stack/material/sandbag))
		if(health == maxHealth)
			to_chat(user, SPAN_NOTICE("\The [src] is already fully repaired!"))
			return
		if(health < maxHealth)
			to_chat(user, SPAN_NOTICE("You start reparing \the [src]."))
			if(do_after(user, 30))
				health = maxHealth
				to_chat(user, SPAN_NOTICE("\The [src] is now fully repaired!"))
				return
	if(I.has_quality(QUALITY_BOLT_TURNING))
		if(get_dir(loc, usr) == dir)
			return

/obj/structure/sandbags/attack_generic(var/mob/user, var/damage, var/attack_message = "smashes", var/wallbreaker)//Occulus Edit
	if(damage)//Occulus edit
		damage(damage)//Occulus Edit
		attack_animation(user)
		visible_message(SPAN_DANGER("[user] [attack_message] the [src]!"))
		return 1

/obj/structure/sandbags/CanPass(atom/movable/mover, turf/target, height=0, air_group=0)
	if(air_group || (height==0))
		return 1
	if(istype(mover,/obj/item/projectile))

		var/obj/item/projectile/P = mover
		var/chance = base_blocking

		if(locate(/mob/living/) in get_turf(loc))
			return (check_cover(P,target))
		if(get_dist(P.starting, loc) <= 1)
			return 1
		if(istype(P, /obj/item/projectile/test) || P.testing) // Turrets need to try to kill the shield and so their test bullet needs to penetrate.
			return 1
		var/bad_arc = reverse_direction(dir) // Arc of directions from which we cannot block.
		if(!check_parry_arc(src, bad_arc, P)) // This is actually for mobs but it will work for our purposes as well.
			return 1

		if(health >= 1)
			if((prob(chance)) && (!(P.testing)))
				damage(P.get_structure_damage())
				visible_message(SPAN_WARNING("[P] hits \the [src]!"))
				qdel(P)
				return 0
		else
			return 1
	if(health >= 1)
		if (get_dir(loc, target) == dir)
			return !density
		else
			return 1
	if(istype(mover) && mover.checkpass(PASSTABLE))
		return 1
	if(locate(/obj/structure/sandbags) in get_turf(mover))
		return 1
	return 0

/obj/structure/sandbags/proc/check_cover(obj/item/projectile/P, turf/from)
	var/turf/cover
	if(health >= 1)
		cover = get_turf(src)
	else if(health == 0)
		cover = get_step(loc, get_dir(from, loc))
	if(!cover)
		return 1
	if(get_dist(P.starting, loc) <= 1) //Tables won't help you if people are THIS close
		return 1

	if(istype(P, /obj/item/projectile/test) || P.testing) // Turrets need to try to kill the shield and so their test bullet needs to penetrate.
		return 1

	var/bad_arc = reverse_direction(dir) // Arc of directions from which we cannot block.
	if(!check_parry_arc(src, bad_arc, P)) // This is actually for mobs but it will work for our purposes as well.
		return 1

	var/chance = base_cover
	if((prob(chance)) && (!(P.testing)))
		damage(P.get_structure_damage())
		if (health > 0)
			visible_message(SPAN_WARNING("[P] hits \the [src]!"))
			qdel(P)
			return 0
		else
			//visible_message(SPAN_WARNING("[src] breaks down!"))
			//break_to_parts()
			return 1

	return 1

/obj/structure/sandbags/CheckExit(atom/movable/O as mob|obj, target as turf)
	if(istype(O) && O.checkpass(PASSTABLE))
		return 1
	if (get_dir(loc, target) == dir)
		return !density
	else
		return 1

/obj/structure/sandbags/do_climb(var/mob/living/user)
	if(!can_climb(user))
		return

	usr.visible_message(SPAN_WARNING("[user] starts climbing onto \the [src]!"))
	climbers |= user

	var/delay = (issmall(user) ? 20 : 34) * user.mod_climb_delay
	var/duration = max(delay * user.stats.getMult(STAT_VIG, STAT_LEVEL_EXPERT), delay * 0.66)
	if(!do_after(user, duration))
		climbers -= user
		return

	if(!can_climb(user, post_climb_check=1))
		climbers -= user
		return

	if(!neighbor_turf_passable())
		to_chat(user, SPAN_DANGER("You can't climb there, the way is blocked."))
		climbers -= user
		return

	if(get_turf(user) == get_turf(src))
		usr.forceMove(get_step(src, src.dir))
	else
		usr.forceMove(get_turf(src))

	usr.visible_message(SPAN_WARNING("[user] climbed over \the [src]!"))
	climbers -= user
