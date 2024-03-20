//Holds all the proj, guns and spells for the Druzhina

//
/obj/item/projectile/druzhina
	damage_types = list(BURN = WEAPON_FORCE_HARMLESS)
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

/*
	muzzle_type = /obj/effect/projectile/laser/cmuzzle
	tracer_type = /obj/effect/projectile/laser/ctracer
	impact_type = /obj/effect/projectile/laser/cimpact
*/

//end of normal blazelances
/obj/item/projectile/cblazelance/normal
	damage_types = list(BRUTE = WEAPON_FORCE_NORMAL) //10 of damage
	armor_penetration = ARMOR_PEN_SHALLOW

/obj/item/projectile/cblazelance/dangerous
	damage_types = list(BRUTE = WEAPON_FORCE_DANGEROUS) //20 of damage
	armor_penetration = ARMOR_PEN_SHALLOW

/obj/item/projectile/cblazelance/robust
	damage_types = list(BRUTE = WEAPON_FORCE_ROBUST) //26 of damage
	armor_penetration = ARMOR_PEN_SHALLOW

/obj/item/projectile/cblazelance/brutal
	damage_types = list(BRUTE = WEAPON_FORCE_BRUTAL) //33 of damage
	armor_penetration = ARMOR_PEN_MASSIVE
//end of normal blazelances

//armor penetration blazelances
/obj/item/projectile/tblazelance/normal
	damage_types = list(BRUTE = WEAPON_FORCE_NORMAL) //10 of damage
	armor_penetration = ARMOR_PEN_MASSIVE

/obj/item/projectile/tblazelance/dangerous
	damage_types = list(BRUTE = WEAPON_FORCE_DANGEROUS) //20 of damage
	armor_penetration = ARMOR_PEN_MASSIVE

/obj/item/projectile/tblazelance/robust
	damage_types = list(BRUTE = WEAPON_FORCE_ROBUST) //26 of damage
	armor_penetration = ARMOR_PEN_MASSIVE

/obj/item/projectile/tblazelance/brutal
	damage_types = list(BRUTE = WEAPON_FORCE_BRUTAL) //33 of damage
	armor_penetration = ARMOR_PEN_MASSIVE
//end of armor penetration blazelances

/*
/obj/item/projectile/druzhina/cblazelance
	name = "Short blaze lance"
	icon_state = "fireball_lecture"

/obj/item/projectile/druzhina/iblazelance
	name = "Infernal Blazelance"
	icon_state = "fireball_lecture"

/obj/item/projectile/druzhina/tblazelance
	name = "Trenchant Blazelance"
	icon_state = "fireball_lecture"
*/

/datum/lecture/hearthcore/druzhina
	name = "Druzhina"
	category = "Druzhina"
	phrase = null
	implant_type = /obj/item/implant/core_implant/hearthcore

/datum/lecture/hearthcore/druzhina/blazelance
	name = "Compact Blazelance"
	phrase = "Oxidate Lecture: Compact Blazelance."
	desc = "By allowing your radiance to spread to the surface of your skin, it is possible to quickly release protective layer of silver from the skin pores heated up by the Hearthcore's internal plasma, which can be disparated against any enemy with great accuracy."
	power = 35

/datum/lecture/hearthcore/druzhina/blazelance/perform(mob/living/carbon/human/lecturer, obj/item/implant/core_implant/C)
	var/obj/item/gun/cblazelance/flame = new /obj/item/gun/cblazelance(src, lecturer)
	lecturer.visible_message(
		"As [lecturer] speaks, their hand now covered with a strange, silvery ionized metal.",
		"The radiance completely covers one of your hands, willing to sacrifice itself to punish others as you see fit."
		)
	playsound(usr.loc, pick('sound/effects/sparks1.ogg','sound/effects/sparks2.ogg','sound/effects/sparks3.ogg'), 50, 1, -3)
	usr.put_in_hands(flame)
	return TRUE

/obj/item/gun/cblazelance //compact blazelance used by knights with Druzhina specialization.
	name = "Compact Blaze Lance"
	desc = "Radiance in aggressive form, absurdly ionized and ready to deliver all its heat against an enemy. It does not ignite people. It disappears if dropped, or by closing the hand."
	icon = 'icons/obj/guns/projectile/firelance.dmi'
	icon_state = "firelance_discharger"
	item_state = "firelance_discharger"
	origin_tech = list()
	fire_sound = 'sound/effects/magic/fireball.ogg' // Proper fireball firing sound courtesy of tg
	fire_sound_text = "fireball"
	max_upgrades = 0
	slot_flags = null
	w_class = ITEM_SIZE_HUGE
	damtype = BURN
	var/projectile_type = /obj/item/projectile/blazelance // What does it shoot
	var/use_amount = 1 // How many times can it be used
	var/mob/living/carbon/holder  // Used to delete when dropped
	var/changes_projectile = TRUE // Used to delete when dropped
	serial_shown = FALSE
	safety = FALSE

/obj/item/gun/cblazelance/New(var/loc, var/mob/living/carbon/lecturer)
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

/obj/item/gun/cblazelance/consume_next_projectile()
	if(!ispath(projectile_type)) // Do we actually shoot something?
		return null
	if(use_amount <= 0) //Are we out of charges?
		return null
	use_amount -= 1
	return new projectile_type(src)

/obj/item/gun/cblazelance/Process()
	if(loc != holder || (use_amount <= 0)) // We're no longer in the lecturer's hand or we're out of charges.
		visible_message("[src] is far too weak to stay outside a body.")
		STOP_PROCESSING(SSobj, src)
		qdel(src)
		return

// Alternative to drop it: Use in hand to extinguish
/obj/item/gun/cblazelance/attack_self(mob/user)
	user.visible_message(SPAN_NOTICE("[user] closes their palm, letting the silvery metal sink into their skin."), SPAN_NOTICE("You close your hand and decide to allow \the [src] to go back into your bloodstream, deionized."), "You hear the sounds of purification in progress.")
	STOP_PROCESSING(SSobj, src)
	qdel(src)
	return

/datum/lecture/hearthcore/druzhina/iblazelance
	name = "Infernal Blazelance"
	phrase = "Oxidate Lecture: Infernal Blazelance."
	desc = "By allowing your radiance to spread to the surface of your skin with a slim converging silver lense, it is possible to make your fiery radiance to spread out. Very low with accuracy."
	power = 50

/datum/lecture/hearthcore/druzhina/iblazelance/perform(mob/living/carbon/human/lecturer, obj/item/implant/core_implant/C)
	var/obj/item/gun/iblazelance/flame = new /obj/item/gun/iblazelance(src, lecturer)
	lecturer.visible_message(
		"As [lecturer] speaks, their hand now covered with a strange, reddish ionized metal.",
		"The radiance completely covers one of your hands, seeking nothing but blood of the impure."
		)
	playsound(usr.loc, pick('sound/effects/sparks1.ogg','sound/effects/sparks2.ogg','sound/effects/sparks3.ogg'), 50, 1, -3)
	usr.put_in_hands(flame)
	return TRUE

/obj/item/gun/iblazelance //A burst of blazelances used by knights with Druzhina specialization.
	name = "Infernal Blazelance"
	desc = "Radiance in a very aggressive form, absurdly ionised and with gaseous splits with hydrogen so it can spread on the battlefield, just to deliver all its heat against many enemy or pin them down. It does not ignite people. It disappears if dropped, or by closing the hand."
	icon = 'icons/obj/guns/projectile/firelance.dmi'
	icon_state = "firelance_discharger"
	item_state = "firelance_discharger"
	origin_tech = list()
	fire_sound = 'sound/effects/magic/fireball.ogg' // Proper fireball firing sound courtesy of tg
	fire_sound_text = "fireball"
	max_upgrades = 0
	slot_flags = null
	w_class = ITEM_SIZE_HUGE
	damtype = BURN
	var/projectile_type = /obj/item/projectile/blazelance // What does it shoot
	var/use_amount = 3 // How many times can it be used
	var/mob/living/carbon/holder  // Used to delete when dropped
	var/changes_projectile = TRUE // If we change are bullet type on spawn
	serial_shown = FALSE
	safety = FALSE
	init_firemodes = list(
		list(mode_name="3-round bursts", mode_desc="Your radiance craves it. Punish thy enemy thrice.", burst=3, fire_delay=0.2, move_delay=null, icon="burst"),
		)

/obj/item/gun/iblazelance/New(loc, mob/living/carbon/lecturer)
	..()
	holder = lecturer
	var/rob = holder.stats.getStat(STAT_ROB)
	if(changes_projectile)
		switch(rob)
			if(5 to 30)
				force = /obj/item/projectile/cblazelance/normal
			if(30 to 55)
				force = /obj/item/projectile/cblazelance/dangerous
			if(56 to 79)
				force = /obj/item/projectile/cblazelance/robust
			if(80 to INFINITY)
				force = /obj/item/projectile/cblazelance/brutal
			else
				force = /obj/item/projectile/cblazelance
	START_PROCESSING(SSobj, src)

/obj/item/gun/iblazelance/consume_next_projectile()
	if(!ispath(projectile_type)) // Do we actually shoot something?
		return null
	if(use_amount <= 0) //Are we out of charges?
		return null
	use_amount -= 1
	return new projectile_type(src)

/obj/item/gun/iblazelance/Process()
	if(loc != holder || (use_amount <= 0)) // We're no longer in the lecturer's hand or we're out of charges.
		visible_message("[src] is far too weak to stay outside a body.")
		STOP_PROCESSING(SSobj, src)
		qdel(src)
		return

// Alternative to drop it: Use in hand to extinguish
/obj/item/gun/iblazelance/attack_self(mob/user)
	user.unEquip(src)
	user.visible_message(SPAN_NOTICE("[user] closes their palm, letting the reddish metal sink into their skin."), SPAN_NOTICE("You close your hand and decide to allow \the [src] to go back into your bloodstream, disappointed for not being used."), "You hear the sounds of purification in progress.")
	STOP_PROCESSING(SSobj, src)
	qdel(src)
	return

/datum/lecture/hearthcore/druzhina/tblazelance
	name = "Trenchant Blazelance"
	phrase = "Oxidate Lecture: Trenchant Blazelance."
	desc = "By allowing your radiance to spread to the surface of your skin with a slim diverging silver lense, it is possible to make your fiery radiance to concentrate in one point, capable of destroying armor, but causing less damage in the flesh. Very high with accuracy."
	power = 50

/datum/lecture/hearthcore/druzhina/tblazelance/perform(mob/living/carbon/human/lecturer, obj/item/implant/core_implant/C)
	var/obj/item/gun/tblazelance/flame = new /obj/item/gun/tblazelance(src, lecturer)
	lecturer.visible_message(
		"As [lecturer] speaks, their hand now covered with a strange, bluish ionized metal.",
		"The radiance completely covers one of your hands, seeking to show how unprotected the enemy is"
		)
	playsound(usr.loc, pick('sound/effects/sparks1.ogg','sound/effects/sparks2.ogg','sound/effects/sparks3.ogg'), 50, 1, -3)
	usr.put_in_hands(flame)
	return TRUE

/obj/item/gun/tblazelance //A burst of blazelances used by knights with Druzhina specialization.
	name = "Trenchant Blazelance"
	desc = "Radiance in a compressed form, absurdly ionised and under the effect of lenses so it can most efficiently ignore enemy armor, just to deliver all its heat against one armored enemy. It does not ignite people. It disappears if dropped, or by closing the hand."
	icon = 'icons/obj/guns/projectile/firelance.dmi'
	icon_state = "firelance_discharger"
	item_state = "firelance_discharger"
	origin_tech = list()
	fire_sound = 'sound/effects/magic/fireball.ogg' // Proper fireball firing sound courtesy of tg
	fire_sound_text = "fireball"
	max_upgrades = 0
	slot_flags = null
	w_class = ITEM_SIZE_HUGE
	damtype = BURN
	var/projectile_type = /obj/item/projectile/blazelance // What does it shoot
	var/use_amount = 1 // How many times can it be used
	var/mob/living/carbon/holder  // Used to delete when dropped
	var/changes_projectile = TRUE // Used to delete when dropped
	serial_shown = FALSE
	safety = FALSE

/obj/item/gun/tblazelance/New(var/loc, var/mob/living/carbon/lecturer)
	..()
	holder = lecturer
	var/rob = holder.stats.getStat(STAT_ROB)
	if(changes_projectile)
		switch(rob)
			if(1 to 20)
				force = /obj/item/projectile/tblazelance/normal
			if(21 to 40)
				force = /obj/item/projectile/tblazelance/dangerous
			if(41 to 60)
				force = /obj/item/projectile/tblazelance/robust
			if(61 to INFINITY)
				force = /obj/item/projectile/tblazelance/brutal
			else
				force = /obj/item/projectile/tblazelance
	START_PROCESSING(SSobj, src)

/obj/item/gun/tblazelance/consume_next_projectile()
	if(!ispath(projectile_type)) // Do we actually shoot something?
		return null
	if(use_amount <= 0) //Are we out of charges?
		return null
	use_amount -= 1
	return new projectile_type(src)

/obj/item/gun/tblazelance/Process()
	if(loc != holder || (use_amount <= 0)) // We're no longer in the lecturer's hand or we're out of charges.
		visible_message("[src] is far too weak to stay outside a body.")
		STOP_PROCESSING(SSobj, src)
		qdel(src)
		return

// Alternative to drop it: Use in hand to extinguish
/obj/item/gun/tblazelance/attack_self(mob/user)
	user.unEquip(src)
	user.visible_message(SPAN_NOTICE("[user] closes their palm, letting the metal sink into their skin."), SPAN_NOTICE("You close your hand and decide to allow \the [src] to go back into your bloodstream, disappointed for not being used."), "You hear the sounds of purification in progress.")
	STOP_PROCESSING(SSobj, src)
	qdel(src)
	return

/datum/lecture/hearthcore/druzhina/flamecestus
	name = "Produce Flame Cestus"
	phrase = "Oxidate Lecture: Produce Flame Cestus."
	desc = "By performing deionisation of the silver in the hands with a hollow pathway for the radiance, it is possible to make Flame Cestus. Each punch covers the enemy in fiery radiance, igniting them."
	power = 100
	cooldown = TRUE
	cooldown_time = 4 HOURS
	cooldown_category = "flamecestus"

/datum/lecture/hearthcore/druzhina/flamecestus/perform(mob/living/carbon/human/lecturer, obj/item/implant/core_implant/C)
	var/rob = lecturer.stats.getStat(STAT_ROB)
	if(rob >= 30) //You need 30 robustness at minimum to use this lecture
		var/flame = new /obj/item/clothing/gloves/dusters/flamecestus(src, lecturer)
		usr.put_in_hands(flame)
		lecturer.visible_message(
		"As [lecturer] chants, a flame cestus appears out of thin air on [lecturer.get_gender() == MALE ? "his" : lecturer.get_gender() == FEMALE ? "her" : "their"] hands.",
		"A fiery cestus materializes itself unto your hands."
		)
		return TRUE
	else
		to_chat(lecturer, "<span class='info'>It feels the same as adding a new color to the light spectrum. Your body does not have the robustness to train your silvery neurons.</span>")
		return FALSE
