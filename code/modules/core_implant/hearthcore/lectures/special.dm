/datum/lecture/hearthcore/special
	name = "Hearthcore"
	phrase = null
	implant_type = /obj/item/implant/core_implant/hearthcore
	fail_message = "Your silvery neurons grows resentful after you called them just to be ignored, so they fill your brain with cortisol. Rude."
	category = "Special"
	ignore_stuttering = TRUE //You are talking to your BRAIN

/datum/lecture/targeted/hearthcore/special
	name = "Hearthcore targeted"
	phrase = null
	implant_type = /obj/item/implant/core_implant/hearthcore
	category = "Special"
	ignore_stuttering = TRUE

/datum/lecture/hearthcore/special/develop
	name = "Neural Development"
	phrase = "Oxidate Lecture: Neural Development."
	desc = "Call your silvery neurons and grant them the memories of your training. They will react accordingly to serve you."
	power = 100

/datum/lecture/hearthcore/special/develop/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	if(C.get_module(HEARTHCORE_SPECIAL)) //You trained your synthetic neurons. They are not hungry for knowledgde anymore!
		to_chat(user, SPAN_NOTICE("Your brain and muscular memory feeds your silvery neurons with precious knowledge. You must choose which knowledge you've received in your trainings as a knight."))
		var/list/Listed_Options = list("Druzhina", "Cataphract", "Hussar", "Grenadier")
		whatever_var = input("Neural Specialization.", "Whisper the training secrets.", null, null) as null|anything in Listed_Options
		switch(whatever_var)
			if("Druzhina")
				C.add_module(new HEARTHCORE_DRUZHINA)
				to_chat(user, SPAN_NOTICE("The radiance weaves into the fabric of your strategic acumen, bolstering collective protection, while fortifying your cognitive framework. As a Druzhina Knight, you stand with allies, a beacon of power that punishes enemies without burning allies with your fiery wrath."))
			if("Cataphract")
				C.add_module(new HEARTHCORE_CATAPHRACT)
				to_chat(user, SPAN_NOTICE("The Radiance weaves into your physical form and mind, effortlessly shielding against the roaming plague. As a Cataphract, you embody eternal resilience, recalling ancient tactics. Safeguarding your comrades allows their survival under any condition."))
			if("Hussar")
				C.add_module(new HEARTHCORE_HUSSAR)
				to_chat(user, SPAN_NOTICE("The Radiance intertwines with your muscles, infusing your legs with oxygenated vitality that propels you beyond limits. As a Hussar, you embody swiftness and sophistication, executing dazzling feats to open holes in enemy defenses and seize the advantage."))
			if("Grenadier")
				C.add_module(new HEARTHCORE_GRENADIER)
				to_chat(user, SPAN_NOTICE("The Radiance weaves through your organs, refining your lungs to breath and fuel the fire within. As a Grenadier, you become a crucible of undying warrior spirit, embodying unparalleled versatility and risk. The pure, untamed fire becomes a force equally perilous to you, your allies and enemies alike."))
		C.remove_modules(HEARTHCORE_SPECIAL)
    return TRUE



#define HEARTHCORE_DHUZHINA /datum/core_module/lectures/hearthcore/druzhina
#define HEARTHCORE_CATAPHRACT /datum/core_module/lectures/hearthcore/cataphract
#define HEARTHCORE_HUSSAR /datum/core_module/lectures/hearthcore/hussar
#define HEARTHCORE_GRENADIER /datum/core_module/lectures/hearthcore/grenadier

/datum/lectures/hearthcore/druzhina/cblazelance
	name = "Compact Blazelance"
	phrase = "Oxidate Lecture: Compact Blazelance."
	desc = "By allowing your radiance to spread to the surface of your skin, it is possible to quickly release protective layer of silver from the skin pores heated up by the Hearthcore's internal plasma, which can be disparated against any enemy with great accuracy."
	power = 35

/obj/item/projectile/cblazelance //the fireball projectile used
	name = "Short blaze lance"
	icon_state = "fireball_lecture"
	damage_types = list(BURN = 25)
	mob_hit_sound = list('sound/effects/gore/sear.ogg')
	hitsound_wall = 'sound/weapons/guns/misc/laser_searwall.ogg'
	pass_flags = PASSTABLE | PASSGLASS | PASSGRILLE
	armor_penetration = 10 //Low AP. Not the focus of the compact Blaze Lance
	check_armour = ARMOR_ENERGY
	hitscan = 1
	invisibility = 101	//beam projectiles are invisible as they are rendered by the effect engine

	recoil = 1

	muzzle_type = /obj/effect/projectile/laser/cmuzzle
	tracer_type = /obj/effect/projectile/laser/ctracer
	impact_type = /obj/effect/projectile/laser/cimpact


/datum/lectures/hearthcore/druzhina/cblazelance/perform(mob/living/carbon/human/lecturer, obj/item/implant/core_implant/C)
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
	icon = 'icons/obj/guns/projectile/fireball.dmi'
	icon_state = "fireball_lecture"
	item_state = "fireball_lecture"
	origin_tech = list()
	fire_sound = 'sound/effects/magic/fireball.ogg' // Proper fireball firing sound courtesy of tg
	fire_sound_text = "fireball"
	max_upgrades = 0
	slot_flags = null
	w_class = ITEM_SIZE_HUGE
	damtype = BURN
	var/projectile_type = /obj/item/projectile/custodian_fireball // What does it shoot
	var/use_amount = 1 // How many times can it be used
	var/mob/living/carbon/holder // Used to delete when dropped
	serial_shown = FALSE
	safety = FALSE

/obj/item/gun/cblazelance/New(var/loc, var/mob/living/carbon/lecturer)
	..()
	holder = lecturer
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

/datum/lectures/hearthcore/druzhina/iblazelance
	name = "Infernal Blazelance"
	phrase = "Oxidate Lecture: Infernal Blazelance."
	desc = "By allowing your radiance to spread to the surface of your skin with a slim converging silver lense, it is possible to make your fiery radiance to spread out. Very low with accuracy."
	power = 50

/obj/item/projectile/iblazelance 
	name = "Infernal Blazelance"
	icon_state = "fireball_lecture"
	damage_types = list(BURN = 25)
	mob_hit_sound = list('sound/effects/gore/sear.ogg')
	hitsound_wall = 'sound/weapons/guns/misc/laser_searwall.ogg'
	pass_flags = PASSTABLE | PASSGLASS | PASSGRILLE
	armor_penetration = 0 // No AP. HIGH DPS
	check_armour = ARMOR_ENERGY
	hitscan = 1
	invisibility = 101	//beam projectiles are invisible as they are rendered by the effect engine
	init_firemodes = list(
		list(mode_name="3-round bursts", mode_desc="Your radiance craves it. Punish thy enemy thrice.", burst=3, fire_delay=0.2, move_delay=null, icon="burst"),
		)

	recoil = 1

	muzzle_type = /obj/effect/projectile/laser/cmuzzle
	tracer_type = /obj/effect/projectile/laser/ctracer
	impact_type = /obj/effect/projectile/laser/cimpact


/datum/lectures/hearthcore/druzhina/iblazelance/perform(mob/living/carbon/human/lecturer, obj/item/implant/core_implant/C)
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
	icon = 'icons/obj/guns/projectile/fireball.dmi'
	icon_state = "fireball_lecture"
	item_state = "fireball_lecture"
	origin_tech = list()
	fire_sound = 'sound/effects/magic/fireball.ogg' // Proper fireball firing sound courtesy of tg
	fire_sound_text = "fireball"
	max_upgrades = 0
	slot_flags = null
	w_class = ITEM_SIZE_HUGE
	damtype = BURN
	var/projectile_type = /obj/item/projectile/custodian_fireball // What does it shoot
	var/use_amount = 3 // How many times can it be used
	var/mob/living/carbon/holder // Used to delete when dropped
	serial_shown = FALSE
	safety = FALSE

/obj/item/gun/iblazelance/New(var/loc, var/mob/living/carbon/lecturer)
	..()
	holder = lecturer
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
	user.visible_message(SPAN_NOTICE("[user] closes their palm, letting the reddish metal sink into their skin."), SPAN_NOTICE("You close your hand and decide to allow \the [src] to go back into your bloodstream, disappointed for not being used."), "You hear the sounds of purification in progress.")
	STOP_PROCESSING(SSobj, src)
	qdel(src)
	return


/datum/lectures/hearthcore/druzhina/tblazelance
	name = "Trenchant Blazelance"
	phrase = "Oxidate Lecture: Trenchant Blazelance."
	desc = "By allowing your radiance to spread to the surface of your skin with a slim diverging silver lense, it is possible to make your fiery radiance to concentrate in one point, capable of destroying armor, but causing less damage in the flesh. Very high with accuracy."
	power = 50

/obj/item/projectile/tblazelance //the fireball projectile used
	name = "Trenchant Blazelance"
	icon_state = "fireball_lecture"
	damage_types = list(BURN = 20)
	mob_hit_sound = list('sound/effects/gore/sear.ogg')
	hitsound_wall = 'sound/weapons/guns/misc/laser_searwall.ogg'
	pass_flags = PASSTABLE | PASSGLASS | PASSGRILLE
	armor_penetration = 40 // Specialized solely in High AP
	check_armour = ARMOR_ENERGY
	hitscan = 1
	invisibility = 101	//beam projectiles are invisible as they are rendered by the effect engine

	recoil = 1

	muzzle_type = /obj/effect/projectile/laser/cmuzzle
	tracer_type = /obj/effect/projectile/laser/ctracer
	impact_type = /obj/effect/projectile/laser/cimpact


/datum/lectures/hearthcore/druzhina/tblazelance/perform(mob/living/carbon/human/lecturer, obj/item/implant/core_implant/C)
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
	icon = 'icons/obj/guns/projectile/fireball.dmi'
	icon_state = "fireball_lecture"
	item_state = "fireball_lecture"
	origin_tech = list()
	fire_sound = 'sound/effects/magic/fireball.ogg' // Proper fireball firing sound courtesy of tg
	fire_sound_text = "fireball"
	max_upgrades = 0
	slot_flags = null
	w_class = ITEM_SIZE_HUGE
	damtype = BURN
	var/projectile_type = /obj/item/projectile/custodian_fireball // What does it shoot
	var/use_amount = 1 // How many times can it be used
	var/mob/living/carbon/holder // Used to delete when dropped
	serial_shown = FALSE
	safety = FALSE

/obj/item/gun/tblazelance/New(var/loc, var/mob/living/carbon/lecturer)
	..()
	holder = lecturer
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
	user.visible_message(SPAN_NOTICE("[user] closes their palm, letting the metal sink into their skin."), SPAN_NOTICE("You close your hand and decide to allow \the [src] to go back into your bloodstream, disappointed for not being used."), "You hear the sounds of purification in progress.")
	STOP_PROCESSING(SSobj, src)
	qdel(src)
	return
