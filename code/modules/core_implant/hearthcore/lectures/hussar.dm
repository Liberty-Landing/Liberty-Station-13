//Holds all the proj, guns and spells for the Hussars. The Hussars focuses on movement, rapid attacks and dealing pain. In overall, they are the specializations that focus on muscular improvement and spearheading any battle formation to quickly attack an enemy, and then fall back. They can deal pain and toxin damage (at the same time) to weaken enemies before clashing against them. In other hands, they may have an ranged approach with radiant bows.

/datum/lecture/hearthcore/hussar
	name = "Hussar"
	category = "Hussar"
	phrase = null
	implant_type = /obj/item/implant/core_implant/hearthcore


	//Lecture: Summon a Stand that attacks anything around the user
	//Summon a thing that just stays there, calling attention of mobs. (done)
	//make the Cataphract summon a shield
	//Talk with trilby if we can port the Eris's lecture that allows NeoTheology guys to remove their shrapnels, or something that can help Cataphracts to "hold the line" even after being VERY punished not with damage, but with surgery-related problems

/datum/lecture/hearthcore/hussar/skirmish
	name = "Skirmishing"
	phrase = "Oxidate Lecture: Skirmishing."
	desc = "Temporarily enable radiance to create internal alveoli, gathering oxygen from the surface of the skin and deliver it directly to the muscles. Simultaneously, the radiance filter out lactic acid, enhancing muscle function for increased speed and stamina."
	cooldown = TRUE
	cooldown_time = 30 MINUTES
	power = 35

datum/lecture/hearthcore/hussar/skirmish/perform(mob/living/carbon/human/lecturer, obj/item/implant/core_implant/C,list/targets)
	var/rob = lecturer.stats.getStat(STAT_ROB)
	if(rob >= 25)//You need 25 robustness at minimum to use this lecture
		to_chat(lecturer, "<span class='info'>The feeling of rejuvenation washes over you. You feel comfortable warmth on your muscles.</span>")
		lecturer.add_chemical_effect(CE_SPEEDBOOST, 0.3, 5, "skirmish")
		lecturer.add_chemical_effect(CE_OXYGENATED, 5)
		lecturer.updatehealth()
		return TRUE
	to_chat(lecturer, "<span class='info'>It feels the same as adding a new color to the light spectrum. Your body does not have the robustness to train your silvery neurons.</span>")
	return FALSE
//lecture that deals pain damage
//a lecture that spawns a silver bow that uses radiance to shoot
//(talk with Trilby to see what suits more. Making the Hussar invisible by human standards like the cloaker spiders, or have something that allows them to put a "teleporter" in a place(only one) which they can teleport into after a delay.

/*
			var/rob = holder.stats.getStat(STAT_ROB)
		if(rob >= 30)

			return
		to_chat(lecturer, "<span class='info'>It feels the same as adding a new color to the light spectrum. Your body does not have the robustness to train your silvery neurons.</span>")
		return //Not enough robustness to use this lecture.
*/

//
/obj/item/projectile/hussar
	damage_types = list(HALLOSS = WEAPON_FORCE_HARMLESS)
	mob_hit_sound = list('sound/effects/gore/sear.ogg')
	hitsound_wall = 'sound/weapons/guns/misc/laser_searwall.ogg'
	pass_flags = PASSTABLE | PASSGLASS | PASSGRILLE
	armor_penetration = list(ARMOR_PEN_GRAZING)
	check_armour = ARMOR_ENERGY
	hitscan = 1
	invisibility = 101	//beam projectiles are invisible as they are rendered by the effect engine

	recoil = 1

	//Temp for debug testing untill C-sprites are done
	muzzle_type = /obj/effect/projectile/stun/muzzle
	tracer_type = /obj/effect/projectile/stun/tracer
	impact_type = /obj/effect/projectile/stun/impact

//end of misery
/obj/item/projectile/misery/normal
	damage_types = list(HALLOSS = WEAPON_FORCE_NORMAL) //10 of damage
	armor_penetration = ARMOR_PEN_SHALLOW

/obj/item/projectile/misery/dangerous
	damage_types = list(HALLOSS = WEAPON_FORCE_DANGEROUS) //20 of damage
	armor_penetration = ARMOR_PEN_SHALLOW

/obj/item/projectile/misery/robust
	damage_types = list(HALLOSS = WEAPON_FORCE_ROBUST) //26 of damage
	armor_penetration = ARMOR_PEN_SHALLOW

/obj/item/projectile/misery/brutal
	damage_types = list(HALLOSS = WEAPON_FORCE_BRUTAL) //33 of damage
	armor_penetration = ARMOR_PEN_SHALLOW
//end of normal blazelances


/datum/lecture/hearthcore/hussar/misery
	name = "Misery from Malady"
	phrase = "Oxidate Lecture: Misery from Malady."
	desc = "Makes your radiance abuse the pain receptors of the enemy. Sometimes even making the pain relatable to ovarian or testicular torsion."
	power = 30

/datum/lecture/hearthcore/hussar/misery/perform(mob/living/carbon/human/lecturer, obj/item/implant/core_implant/C)
	var/obj/item/gun/misery/flame = new /obj/item/gun/misery(src, lecturer)
	lecturer.visible_message(
		"As [lecturer] speaks, their hand now covered with a strange, silvery ionized metal.",
		"The radiance completely covers one of your hands, willing to punish others. It seems to be laughing somehow."
		)
	playsound(usr.loc, pick('sound/effects/sparks1.ogg','sound/effects/sparks2.ogg','sound/effects/sparks3.ogg'), 50, 1, -3)
	usr.put_in_hands(flame)
	return TRUE

/obj/item/gun/misery //Miseries used by knights with Hussar specialization.
	name = "Pain Overloader"
	desc = "This radiance is curiously shaped, no longer shaped like a little hearthcore, but rather a Y. It seems to use this shape to overload the nerves of any creature to their biddings, sometimes making the pain relatable to ovarian or testicular torsion."
	icon = 'icons/obj/guns/projectile/firelance.dmi'
	icon_state = "firelance_discharger"
	item_state = "firelance_discharger"
	origin_tech = list()
	fire_sound = 'sound/effects/magic/fireball.ogg' // Proper fireball firing sound courtesy of tg
	fire_sound_text = "fireball"
	max_upgrades = 0
	slot_flags = null
	w_class = ITEM_SIZE_HUGE
	damtype = HALLOSS
	var/projectile_type = /obj/item/projectile/blazelance // What does it shoot
	var/use_amount = 1 // How many times can it be used
	var/mob/living/carbon/holder  // Used to delete when dropped
	var/changes_projectile = TRUE // Used to delete when dropped
	serial_shown = FALSE
	safety = FALSE

/obj/item/gun/misery/New(var/loc, var/mob/living/carbon/lecturer)
	..()
	holder = lecturer
	var/rob = holder.stats.getStat(STAT_ROB)
	if(changes_projectile)
		switch(rob)
			if(1 to 20)
				force = /obj/item/projectile/cblazelance/normal
			if(21 to 40)
				force = /obj/item/projectile/cblazelance/dangerous
			if(41 to 60)
				force = /obj/item/projectile/cblazelance/robust
			if(61 to INFINITY)
				force = /obj/item/projectile/cblazelance/brutal
			else
				force = /obj/item/projectile/cblazelance
	START_PROCESSING(SSobj, src)

/obj/item/gun/misery/consume_next_projectile()
	if(!ispath(projectile_type)) // Do we actually shoot something?
		return null
	if(use_amount <= 0) //Are we out of charges?
		return null
	use_amount -= 1
	return new projectile_type(src)

/obj/item/gun/misery/Process()
	if(loc != holder || (use_amount <= 0)) // We're no longer in the lecturer's hand or we're out of charges.
		visible_message("[src] is far too weak to stay outside a body.")
		STOP_PROCESSING(SSobj, src)
		qdel(src)
		return