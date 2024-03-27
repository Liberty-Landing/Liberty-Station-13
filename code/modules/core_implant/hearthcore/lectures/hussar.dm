//Holds all the proj, guns and spells for the Hussars. The Hussars focuses on movement, rapid attacks and dealing pain. In overall, they are the specializations that focus on muscular improvement and spearheading any battle formation to quickly attack an enemy, and then fall back. They can deal pain and toxin damage (at the same time) to weaken enemies before clashing against them. In other hands, they may have an ranged approach with radiant bows.

/datum/lecture/hearthcore/hussar
	name = "Hussar"
	category = "Hussar"
	phrase = null
	implant_type = /obj/item/implant/core_implant/hearthcore

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
	icon = 'icons/obj/guns/projectile/blazelance.dmi'
	icon_state = "blazelance"
	item_state = "blazelance"
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

/datum/lecture/hearthcore/hussar/radiantbow
	name = "Radiance Bow Prototype"
	phrase = "Radiance, assemble the Radiance Bow"
	desc = "A sniper-bow prototype. Meant to be an bow that produces arrows from the knight's own radiance, however, the forgemasters are still working on this."
	power = 100
	cooldown = TRUE
	cooldown_time = 4 HOURS
	cooldown_category = "radiance_bow"

/datum/lecture/hearthcore/hussar/radiantbow/perform(mob/living/carbon/human/lecturer, obj/item/implant/core_implant/C)
	var/rob = lecturer.stats.getStat(STAT_ROB)
	if(rob >= 40) //You need 40 robustness at minimum to use this lecture
		var/flame = new /obj/item/gun/projectile/bow/radiantbow(lecturer)
		if(lecturer.put_in_active_hand(flame))
			lecturer.visible_message(
			"As [lecturer] chants, silvery nanites floods their veins, escaping and forging a silvery bow on [lecturer.get_gender() == MALE ? "his" : lecturer.get_gender() == FEMALE ? "her" : "their"] hands.",
			"The radiance sacrificed itself forging a new bow for your use, materializing unto your hands. Your hearthcore is tired. You cannot do this lecture again any time soon."
			)
			return TRUE
		qdel(flame)
		to_chat(lecturer, "<span class='info'>You need your active hand to be free!.</span>")
		return FALSE
	to_chat(lecturer, "<span class='info'>It feels the same as adding a new color to the light spectrum. Your body does not have the robustness to train your silvery neurons, but this time you think this is for the best.</span>")
	return FALSE


/datum/lecture/hearthcore/hussar/flamecestus
	name = "Produce Flame Cestus"
	phrase = "Oxidate Lecture: Produce Flame Cestus."
	desc = "By performing deionisation of the silver in the hands with a hollow pathway for the radiance, it is possible to make Flame Cestus. Each punch covers the enemy in fiery radiance, igniting them."
	power = 100
	cooldown = TRUE
	cooldown_time = 4 HOURS
	cooldown_category = "flamecestus"

/datum/lecture/hearthcore/hussar/flamecestus/perform(mob/living/carbon/human/lecturer, obj/item/implant/core_implant/C)
	var/rob = lecturer.stats.getStat(STAT_ROB)
	if(rob >= 30) //You need 30 robustness at minimum to use this lecture
		var/flame = new /obj/item/clothing/gloves/dusters/flamecestus(src, lecturer)
		usr.put_in_hands(flame)
		lecturer.visible_message(
		"As [lecturer] chants, a flame cestus materializes from their bloodstream, covering [lecturer.get_gender() == MALE ? "his" : lecturer.get_gender() == FEMALE ? "her" : "their"] hands in fiery layers of silver.",
		"The radiance sacrificed itself forging a new cestus for your use, materializing unto your hands. Your hearthcore is tired. You cannot do this lecture again any time soon."
		)
		return TRUE
	else
		to_chat(lecturer, "<span class='info'>It feels the same as adding a new color to the light spectrum. Your body does not have the robustness to train your silvery neurons.</span>")
		return FALSE

