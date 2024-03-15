//Holds all the proj, guns and spells for the Grenadier. The Grenadier is essentially the risk taker. High damage and AOE attack, but constantly deals damage to themselves. Very risky to play.

/obj/item/gun/energy/siege_blazelance
	projectile_type = /obj/item/projectile/grenadier/siege_blazelance

/obj/item/projectile/grenadier/siege_blazelance
	name = "Siege Blaze lance"
	icon_state = "blazelance"
	var/list/explosion_values = list(0, 1, 2, 4) // Explosions strengths, same value as a regular missile.

/obj/item/projectile/grenadier/siege_blazelance/on_impact(atom/target)
	explosion(loc, explosion_values[1], explosion_values[2], explosion_values[3], explosion_values[4])
	return TRUE

/datum/lecture/hearthcore/grenadier
	name = "Grenadier"
	category = "Grenadier"
	phrase = null
	implant_type = /obj/item/implant/core_implant/hearthcore

/datum/lecture/hearthcore/grenadier/sblazelance
	name = "Siege Blaze lance" //Normal attack that explodes after hit. It shouldn't be that hard. I ask you to nerf how long it spreads around! I just gotta be dangerous to the user and the person it hits
	phrase = "Oxidate Lecture: Siege Blazelance."
	desc = "The radiance needs more oxygen, the silvery neurons must be fed with your blood to enhance itself before sacrifice, to react as a minor FAE bomb with oxygen alone. If you hear your radiance trying to scream their nucleus out about this exploding in your hand in six seconds, well. It will. Throw it fast and good luck, Knight."
	power = 75
	blood_cost = 20

/datum/lecture/hearthcore/grenadier/sblazelance/perform(mob/living/carbon/human/lecturer, obj/item/implant/core_implant/C)
	var/rob = lecturer.stats.getStat(STAT_ROB)
	if(rob >= 40) //You need 40 robustness at minimum to use this lecture
		var/flame = new /obj/item/gun/energy/siege_blazelance(src)
		if(lecturer.put_in_active_hand(flame))
			addtimer(CALLBACK(lecturer, /datum/lecture/hearthcore/grenadier/sblazelance/proc/warn_nuker, lecturer, flame), 3 SECONDS)

			lecturer.visible_message("As [lecturer] speaks, their hand now covered with a strange, blood-red ionized metal that sparks with pure unstability.")
			lecturer.adjustFireLoss(10)
			lecturer.adjustHalLoss(10)
			return TRUE
		qdel(flame)
		to_chat(lecturer, "<span class='info'>You need your active hand to be free!.</span>")
		return FALSE
	to_chat(lecturer, "<span class='info'>It feels the same as adding a new color to the light spectrum. Your body does not have the robustness to train your silvery neurons, but this time you think this is for the best.</span>")
	return FALSE

/datum/lecture/hearthcore/grenadier/sblazelance/proc/warn_nuker(mob/lecturer, obj/flame)
/*
	"NO. YOU NEED TO LAUNCH THIS SOMEWHERE.
	YOUR RADIANCE IS ACTIVELY PANICKING AND BOILING ON ITS SURFACE.
	EVER SINCE WHEN THIS FELT FEAR?!"

	The thing will explode in 6 seconds.
	So essentially after this message,
	the player have three seconds to throw this thing
*/
	if(ishuman(flame.loc))
		to_chat(lecturer, "<span class='info'>\
		You struggle to keep hold of the radiance in your hand, \
		as it struggles to not start melting your hand. \
		You can feel the cortisol your own silvery neurons being released, \
		the fear that it might explode in your hand before you can even shoot it. \
		You feel stressed. It slightly burns..</span>")

		addtimer(CALLBACK(lecturer, /datum/lecture/hearthcore/grenadier/sblazelance/proc/nukier_holder, lecturer, flame), 3 SECONDS)
	else
		playsound(usr.loc, pick('sound/effects/sparks1.ogg','sound/effects/sparks2.ogg','sound/effects/sparks3.ogg'), 50, 1, -3)
		new /obj/effect/explosion(flame.loc)
		qdel(flame)

/datum/lecture/hearthcore/grenadier/sblazelance/proc/nukier_holder(mob/lecturer, obj/flame)
	if(ishuman(flame.loc))
		var/mob/nukier_holder = flame.loc
		var/turf/T = get_turf(src)

		playsound(flame.loc, pick('sound/effects/sparks1.ogg','sound/effects/sparks2.ogg','sound/effects/sparks3.ogg'), 50, 1, -3)
		nukier_holder.unEquip(flame)
		explosion(T, 0, 1, 2, 4)
		new /obj/effect/explosion(T)
		qdel(flame)

/datum/lecture/hearthcore/grenadier/uignite_flesh
	name = "Unstable Ignite Flesh"
	phrase = "Oxidate Lecture: Unstable Ignite Flesh."
	desc = "Deliver the lecture to ignite all nearby entities, encompassing both non-hearthcore users, other knights and yourself. It boasts a broader range than the typical Ignite Flesh."
	power = 60

/datum/lecture/hearthcore/grenadier/uignite_flesh/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	for(var/mob/living/M in view(4, user)) //get everything alive in a 4-wide radius
		scorch_attack(M) //trigger scorch attack
		if(M != user) //hurts the user
			M.adjustFireLoss(15)
			M.adjustHalLoss(25)
	user.visible_message(SPAN_DANGER("A unstable wave of flame escapes from the body of [user]!"))
	return TRUE

/datum/lecture/hearthcore/grenadier/convert_flesh
	name = "Convert Flesh" //"Hurt yourself to improve radiance recharge"
	phrase = "Oxidate Lecture: Radiance, please remove my cancer cells."
	desc = "This lecture manipulates the Radiance by mimicking cancer cell signals, prompting a defensive response. The Radiance absorbs the affected tissue and amplify its radiance with the eaten matter. A dubious move, it's wise to conceal this lecture from your own radiance - otherwise they will no longer follow your orders. Forever with trust issues."
	power = 0

/datum/lecture/hearthcore/grenadier/convert_flesh/perform(mob/living/carbon/human/lecturer, obj/item/implant/core_implant/C)
	C.restore_power(100)
	lecturer.adjustFireLoss(20)
	lecturer.adjustHalLoss(25)
	return TRUE

/datum/lecture/hearthcore/grenadier/grenadiercurse
	name = "Cannoneer bombardement Prototype" //"RANDOM SH!T GOOOOO!"
	phrase = "Oxidate Lecture: Cannoneer bombardement"
	desc = "The true essence of the Grenadier Knight in form of lecture, unstability beyond redemption. This power manifests pressured radiance with random portions of chemicals acquired from the body and air, which will react like no different of a grenade - beyond being literally any grenade at random, without having the right to choose. \
	However, this lecture still is a prototype."
	power = 70
	var/list/spawn_list = list(/obj/item/grenade/spawnergrenade/manhacks/radiance,
	/obj/item/grenade/smokebomb/nt,
	/obj/item/grenade/empgrenade/low_yield/nt,
	/obj/item/grenade/flashbang/nt,
	/obj/item/grenade/frag/nt,
	/obj/item/grenade/heatwave/nt,
	/obj/item/grenade/explosive/nt,
	/obj/item/grenade/chem_grenade/teargas/nt,
	/obj/item/grenade/chem_grenade/cleaner/nt_cleaner)

/datum/lecture/hearthcore/grenadier/grenadiercurse/perform(mob/living/carbon/human/lecturer, obj/item/implant/core_implant/C)
	var/chosen_one = pick(spawn_list)
	var/grenadier_rng_nade = new chosen_one
	if(lecturer.equip_to_slot_if_possible(grenadier_rng_nade, lecturer.get_active_hand()))
		return TRUE
	to_chat(lecturer, "<span class='info'>You need your active hand to be free!.</span>")
	qdel(grenadier_rng_nade)
	return FALSE