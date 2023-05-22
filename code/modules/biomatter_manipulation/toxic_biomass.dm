//burning biomass and a few procs used by biomatter manipulation machines


//biomatter attack proc, it's used for attacking people with checking their armor
/proc/scorch_attack(mob/living/victim, var/damage = rand(2, 4))
	if(istype(victim))
		var/T = get_turf(victim)
		var/hazard_damage = -100 + (victim.get_heat_protection() * 100)
		if(hazard_damage >= 0)
			return
		hazard_damage *= -1
		hazard_damage *= 0.003 //Are armor still does SMOTHING
		heatwave(T, 0, 0, 80 * hazard_damage, 3, 0)

//this proc spill some biomass on the floor
//dirs_to_spread - list with dirs where biomass should expand after creation
/proc/spill_biomass(turf/target_location, var/dirs_to_spread = null)
	if(locate(/obj/effect/decal/cleanable/scorch_puddle) in target_location)
		return
	new /obj/effect/decal/cleanable/scorch_puddle/aoe(target_location)
	playsound(target_location, 'sound/effects/blobattack.ogg', 70, 1)
	if(dirs_to_spread)
		for(var/direction in dirs_to_spread)
			var/blocked = FALSE
			var/turf/neighbor = get_step(target_location, direction)
			if(!neighbor.density && !(locate(/obj/effect/decal/cleanable/scorch_puddle/aoe) in neighbor))
				for(var/obj/O in neighbor)
					if(O.density)
						blocked = TRUE
						break
			else
				continue
			if(!blocked)
				var/obj/effect/decal/cleanable/scorch_puddle/aoe/new_one = new(target_location)
				spawn(1)
					new_one.forceMove(neighbor)


/obj/effect/decal/cleanable/scorch_puddle
	name = "scorch puddle"
	desc = "A dangerous scorch puddle, incredibly hot to the touch and dangerous to those not wearing protective gear."
	icon = 'icons/obj/bioreactor_misc.dmi'
	icon_state = "scorch-1"
	anchored = TRUE
	layer = TURF_LAYER + 0.6

/obj/effect/decal/cleanable/scorch_puddle/Crossed(mob/living/M as mob|obj)
	for(M in living_mobs_in_view(1, src))
		scorch_attack(M, rand(4, 8))

/obj/effect/decal/cleanable/scorch_puddle/Initialize()
	. = ..()
	icon_state = "scorch-[rand(1, 3)]"

/obj/effect/decal/cleanable/scorch_puddle/aoe //this puddle checks for mobs in a 3x3 square every Process() and triggers an attack
	name = "fresh scorch puddle"
	desc = "A dangerous scorch puddle, incredibly hot to the touch and dangerous to those not wearing protective gear. This one is fresh and is able to radiate heat in a small area."

/obj/effect/decal/cleanable/scorch_puddle/aoe/Initialize()
	. = ..()
	START_PROCESSING(SSprocessing, src)

/obj/effect/decal/cleanable/scorch_puddle/aoe/Destroy()
	STOP_PROCESSING(SSprocessing, src)
	return ..()


/obj/effect/decal/cleanable/scorch_puddle/aoe/Process()
	for(var/mob/living/creature in living_mobs_in_view(1, src))
		scorch_attack(creature, rand(8, 16))


/obj/effect/decal/cleanable/scorch_puddle/attackby(var/obj/item/I, var/mob/user)
	if(istype(I, /obj/item/mop) || istype(I, /obj/item/soap))
		to_chat(user, SPAN_NOTICE("You started removing this [src]. U-ugh. Disgusting..."))
		if(do_after(user, 3 SECONDS, src))
			to_chat(user, SPAN_NOTICE("You removed [src]."))
			scorch_attack(user, rand(25, 40))
			qdel(src)
