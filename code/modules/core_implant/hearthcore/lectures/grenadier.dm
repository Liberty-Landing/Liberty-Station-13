//Holds all the proj, guns and spells for the Grenadier. The Grenadier is essentially the risk taker. High damage and AOE attack, but constantly deals damage to themselves. Very risky to play.

//

/obj/item/gun/grenadier/siege_blazelance
	projectile_type = /obj/item/projectile/custodian_fireball 

/obj/item/projectile/grenadier/siege_blazelance
	name = "Siege Blaze lance"
	icon_state = "blazelance"
	var/list/explosion_values = list(0, 1, 2, 4) // Explosions strengths, same value as a regular missile.

/obj/item/projectile/grenadier/siege_blazelance/on_impact(atom/target)
	explosion(loc, explosion_values[1], explosion_values[2], explosion_values[3], explosion_values[4])
	return TRUE

/datum/lecture/hearthcore/sblazelance
	name = "Siege Blaze lance" //Normal attack that explodes after hit. It shouldn't be that hard. I ask you to nerf how long it spreads around! I just gotta be dangerous to the user and the person it hits
	phrase = "Oxidate Lecture: Siege Blazelance."
	desc = "The radiance needs more oxygen, the silvery neurons must be fed with your blood to enhance itself before sacrifice, to react as a minor FAE bomb with oxygen alone. If you hear your radiance trying to scream their nucleus out about this exploding in your hand in five seconds, well. It will. Throw it fast and good luck, Knight."
	power = 75
	blood_cost = 20

/datum/lecture/hearthcore/sblazelance/perform(mob/living/carbon/human/lecturer, obj/item/implant/core_implant/C)
	var/obj/item/gun/grenadier/siege_blazelance/flame = new /obj/item/gun/grenadier/siege_blazelance(src, lecturer)
	lecturer.visible_message(
		var/rob = holder.stats.getStat(STAT_ROB)
		if(rob > 40)
			"As [lecturer] speaks, their hand now covered with a strange, blood-red ionized metal that sparks with pure unstability.",
			to_chat(C, "<span class='info'>You struggle to keep hold of the radiance in your hand, as it struggles to not start melting your hand. \
			You can feel the cortisol your own silvery neurons being released, the fear that it might explode in your hand before you can even shoot it. You feel stressed. It slightly burns..</span>")
			//"NO. YOU NEED TO LAUNCH THIS SOMEWHERE. YOUR RADIANCE IS ACTIVELY PANICKING AND BOILING ON ITS SURFACE. EVER SINCE WHEN THIS FELT FEAR?!", //ask trilby to make this appear after 3 seconds - the thing will explode in 6 seconds. So essentially after this message, the player have three seconds to throw this thing
			)
			if(loc istype(human))
				addtimer(CALLBACK(src. /obj/item/projectile/grenadier/siege_blazelance/on_impact(atom/C, 6 seconds))
					var/turf/T = get_turf(src)
					explosion(T, 0, 1, 2, 4) 
					new /obj/effect/explosion(T)
						qdel(src)
					return
			return
		to_chat(C, "<span class='info'>It feels the same as adding a new color to the light spectrum. Your body does not have the robustness to train your silvery neurons, but this time you think this is for the best.</span>")
		return //You need 40 robustness at minimum to use this lecture
//Trilby, I request you to help me in making this lecture even more dangerous, on the sense that after you've used this lecture, you need to use it. Vanishing with Z won't work out, since the thing is by far too unstable.


	playsound(usr.loc, pick('sound/effects/sparks1.ogg','sound/effects/sparks2.ogg','sound/effects/sparks3.ogg'), 50, 1, -3)
	usr.put_in_hands(flame)
	return TRUE
	C.adjustFireLoss(10)
	C.adjustHalLoss(20)

/datum/lecture/hearthcore/uignite_flesh
	name = "Unstable Ignite Flesh"
	phrase = "Oxidate Lecture: Unstable Ignite Flesh."
	desc = "Deliver the lecture to ignite all nearby entities, encompassing both non-hearthcore users, other knights and yourself. It boasts a broader range than the typical Ignite Flesh."
	power = 60

/datum/lecture/hearthcore/uignite_flesh/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	for(var/mob/living/M in view(4, user)) //get everything alive in a 4-wide radius
		scorch_attack(M) //trigger scorch attack
	if(!(H == user)) //hurts the user
		C.adjustFireLoss(15)
		C.adjustHalLoss(25)
	user.visible_message(SPAN_DANGER("A unstable wave of flame escapes from the body of [user]!"))
	return TRUE

/datum/lecture/hearthcore/uignite_flesh 
	name = "Convert Flesh" //"Hurt yourself to improve radiance recharge"
	phrase = "Oxidate Lecture: Radiance, please remove my cancer cells."
	desc = "This lecture manipulates the Radiance by mimicking cancer cell signals, prompting a defensive response. The Radiance absorbs the affected tissue and amplify its radiance with the eaten matter. A dubious move, it's wise to conceal this lecture from your own radiance - otherwise they will no longer follow your orders. Forever with trust issues."
	power = 0

/datum/lecture/hearthcore/grenadier/perform(mob/living/carbon/human/lecturer, obj/item/implant/core_implant/C)
		CI.restore_power(100)
		C.adjustFireLoss(20)
		C.adjustHalLoss(25)
		return TRUE

/datum/lecture/hearthcore/grenadiercurse 
	name = "Cannoneer bombardement" //"RANDOM SH!T GOoOOOO!"
	phrase = "Oxidate Lecture: Cannoneer bombardement"
	desc = "The true essence of the Grenadier Knight in form of lecture, unstability beyond redemption. This power manifests pressured radiance with random portions of chemicals acquired from the body and air, which will react like no different of a grenade - beyond being literally any grenade at random, without having the right to choose."
	power = 70

	//still making. Make it a RnG grenade that pops anything at random.

//explosive object hehe
/obj/item/grenade/grenadier
    desc = "It is set to detonate in 5 seconds. It will unleash unleash an unspecified anomaly into the vicinity."
    name = "delivery grenade"
    icon = 'icons/obj/grenade.dmi'
    icon_state = "delivery"
    item_state = "flashbang"
    var/banglet = 0
    var/spawner_type = null // must be an object path
    var/deliveryamt = 1 // amount of type to deliver
    var/will_flash = TRUE
	var/random_effect =  rand(1,2,3,4,5,6,7)

/obj/item/grenade/spawnergrenade/prime()    // Prime now just handles the two loops that query for people in lockers and people who can see it.
    if(spawner_type && deliveryamt)
        // Make a quick flash
        var/turf/T = get_turf(src)
        playsound(T, 'sound/effects/phasein.ogg', 100, 1)
        for(var/mob/living/carbon/human/M in viewers(T, null))
            if(M.eyecheck() < FLASH_PROTECTION_MINOR && will_flash == TRUE)
                M.flash(0, FALSE , FALSE , FALSE , 0)

        for(var/i=1, i<=deliveryamt, i++)
            var/atom/movable/x = new spawner_type
			switch(random_effect)
				if(1)
					/obj/item/grenade/heatwave/prime()
						set waitfor = 0
						..()
						var/turf/O = get_turf(src)
						if(!O) return
						on_explosion(O)
						qdel(src)

					/obj/item/grenade/heatwave/proc/on_explosion(var/turf/O)
						heatwave(O, heavy_range, weak_range, heat_damage, fire_stacks, penetration)
				if(2) 
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

				if(3)
					/obj/item/grenade/chem_grenade/incendiary/Initialize()
						. = ..()
						var/obj/item/reagent_containers/glass/beaker/B1 = new(src)
						var/obj/item/reagent_containers/glass/beaker/B2 = new(src)

						B1.reagents.add_reagent("aluminum", 15)
						B1.reagents.add_reagent("fuel",20)
						B2.reagents.add_reagent("plasma", 15)
						B2.reagents.add_reagent("sacid", 15)
						B1.reagents.add_reagent("fuel",20)

						detonator = new/obj/item/device/assembly_holder/timer_igniter(src)

						beakers += B1
						beakers += B2
				if(4) //cleaner
					/obj/item/grenade/chem_grenade/cleaner/Initialize()
						. = ..()
						var/obj/item/reagent_containers/glass/beaker/B1 = new(src)
						var/obj/item/reagent_containers/glass/beaker/B2 = new(src)

						B1.reagents.add_reagent("surfactant", 40)
						B2.reagents.add_reagent("water", 40)
						B2.reagents.add_reagent("cleaner", 10)

						detonator = new/obj/item/device/assembly_holder/timer_igniter(src)

						beakers += B1
						beakers += B2
					if(5) //teargas
						/obj/item/grenade/chem_grenade/teargas/Initialize()
							. = ..()
							var/obj/item/reagent_containers/glass/beaker/large/B1 = new(src)
							var/obj/item/reagent_containers/glass/beaker/large/B2 = new(src)

							B1.reagents.add_reagent("phosphorus", 40)
							B1.reagents.add_reagent("potassium", 40)
							B1.reagents.add_reagent("condensedcapsaicin", 40)
							B2.reagents.add_reagent("sugar", 40)
							B2.reagents.add_reagent("condensedcapsaicin", 80)

							detonator = new/obj/item/device/assembly_holder/timer_igniter(src)

							beakers += B1
							beakers += B2
					if(6) //antiweed
						/obj/item/grenade/chem_grenade/antiweed/Initialize()
							. = ..()
							var/obj/item/reagent_containers/glass/beaker/B1 = new(src)
							var/obj/item/reagent_containers/glass/beaker/B2 = new(src)

							B1.reagents.add_reagent("surfactant", 40)
							B2.reagents.add_reagent("water", 40)
							B2.reagents.add_reagent("plantbgone", 10)

							detonator = new/obj/item/device/assembly_holder/timer_igniter(src)

							beakers += B1
							beakers += B2
							icon_state = "grenade"
					if(7) //radiance funny
						/obj/item/grenade/spawnergrenade/prime(/obj/item/grenade/spawnergrenade/manhacks/radiance)	// Prime now just handles the two loops that query for people in lockers and people who can see it.
							if(spawner_type && deliveryamt)
								// Make a quick flash
								var/turf/T = get_turf(src)
								playsound(T, 'sound/effects/phasein.ogg', 100, 1)
								for(var/mob/living/carbon/human/M in viewers(T, null))
									if(M.eyecheck() < FLASH_PROTECTION_MINOR && will_flash == TRUE)
										M.flash(0, FALSE , FALSE , FALSE , 0)
								for(var/i=1, i<=deliveryamt, i++)
									var/atom/movable/x = new spawner_type
									x.loc = T
									if(prob(50))
										for(var/j = 1, j <= rand(1, 3), j++)
											step(x, pick(NORTH,SOUTH,EAST,WEST))
									// spawn some hostile creatures
							qdel(src)
							return



/*            x.loc = T
            if(prob(50))
                for(var/j = 1, j <= rand(1, 3), j++)
                    step(x, pick(NORTH,SOUTH,EAST,WEST))
*/
            // Spawn some hostile syndicate critters