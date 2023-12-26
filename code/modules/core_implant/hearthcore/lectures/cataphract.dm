/datum/lecture/hearthcore/Cataphract
	name = "Cataphract"
	category = "Cataphract"
	phrase = null
	implant_type = /obj/item/implant/core_implant/hearthcore

//Holds all the proj, guns and spells for the Cataphract. The Cataphract focus on defense and defending others, while making use of radiance to manifest ways to counter enemy's move in the battlefield. They make ~stands~ (automatons) to supply their defensive capacity and area-negating capacity.

/datum/lecture/hearthcore/cataphract/cataphract_personal
	name = "Energy Personal Shield Prototype"
	phrase = "Oxidate Lecture: Energy Personal Shield."
	desc = "This shield is merely a prototype, so it does not work as it should, and will still be changed in the following days by the Custodians."
	power = 40

/datum/lecture/hearthcore/cataphract/cataphract_personal/perform(mob/living/carbon/human/lecturer, obj/item/implant/core_implant/C)
	var/obj/item/shield_projector/rectangle/cataphract_personal/flame = new /obj/item/shield_projector/rectangle/cataphract_personal(src, lecturer)
	lecturer.visible_message(
		"As [lecturer] speaks, their hand now covered with a strange, bluish ionized metal.",
		"The radiance completely covers one of your hands, seeking to show how unprotected the enemy is"
		)
	playsound(usr.loc, pick('sound/effects/sparks1.ogg','sound/effects/sparks2.ogg','sound/effects/sparks3.ogg'), 50, 1, -3)
	usr.put_in_hands(flame)
	return TRUE

/obj/item/shield_projector/rectangle/cataphract_personal
	name = "Cataphract personal shield Prototype"
	description_info = "A fast deploying, personal energy shield. Powered by the Hearthcore internal plasma and delivered and manifested by radiance, it ensures the protection of the user when attacked by surprise. Not the best option, but what you can have any time. \
	This is only a mere prototype, and is being worked on by Custodian Forgemasters and Enkindleds to properly work as intended. \
	The shield also cannot block certain effects which take place over an area, such as flashbangs or explosions."
	icon_state = "last_shelter"
	high_color = "#FFFFFF"
	shield_health = 2
	max_shield_health = 2
	size_x = 1
	size_y = 1
	var/mob/living/carbon/holder  // Used to delete when dropped
	var/obj/item/implant/core_implant/hearthcore/linked_hearthcore

//Still need to make the shield delete itself when it disactivates (after the power reaches 0), and when the holder dropsit
/*
/obj/item/shield_projector/rectangle/cataphract_personal/Process()
	if(loc != holder || ([put Power here]<= 0))
		visible_message("[src] has been broken! The struggling radiance sinks into your skin to breath after so much punishment.")
		STOP_PROCESSING(SSobj, src)
		qdel(src)
		return
*/

// All the shields tied to their projector are one 'unit', and don't have individualized health values like most other shields.
/obj/effect/directional_shield/cataphract_personal/adjust_health(amount)
	if(projector)
		projector.adjust_health(amount)

/obj/item/shield_projector/rectangle/cataphract_personal/create_shield(newloc, new_dir)
	var/obj/effect/directional_shield/cataphract_personal/S = new(newloc, src)
	S.dir = new_dir
	active_shields += S

//fill the gaps
/obj/item/shield_projector/rectangle/cataphract_personal/attack_hand(mob/living/carbon/human/user as mob)
	if(!user.get_core_implant(/obj/item/implant/core_implant/hearthcore))
		qdel(src)
		return
	var/obj/item/implant/core_implant/hearthcore/C = user.get_core_implant(/obj/item/implant/core_implant/hearthcore)
	if(C.power <= 0)
		qdel(src)
		return
	shield_health = C.power
	max_shield_health = C.max_power
	linked_hearthcore = C

/obj/item/shield_projector/rectangle/cataphract_personal/adjust_health(amount)
	..()
	if(linked_hearthcore.power <= 0)
		destroy_shields()

/datum/lecture/hearthcore/cataphract/purification
	name = "Genuine Purification"
	phrase = "Oxidate Lecture: Genuine Purification."
	desc = "By allowing the radiance to spread towards the surface of the hand and sacrifice itself as it ignites, it allows the Knight to use the leftover radiance like oil and spread it in the battlefield in a flamethrower."
	power = 90

/datum/lecture/hearthcore/cataphract/purification/perform(mob/living/carbon/human/lecturer, obj/item/implant/core_implant/C)
	var/obj/item/gun/purification/flame = new /obj/item/gun/purification(src, lecturer)
	lecturer.visible_message(
		"As [lecturer] speaks, their hand now covered with a strange, silvery ionized metal.",
		"The radiance completely covers one of your hands, willing to sacrifice itself to punish others as you see fit."
		)
	playsound(usr.loc, pick('sound/effects/sparks1.ogg','sound/effects/sparks2.ogg','sound/effects/sparks3.ogg'), 50, 1, -3)
	usr.put_in_hands(flame)
	return TRUE

/obj/item/gun/purification //It works now. Whoever, it does not disappear when dropped or when the amount is zero. Attackself destroys it (intended). Need help to fix this.
	name = "Genuine Purification Prototype"
	desc = "The beloved, benevolent purification of the body, to allow these maintenance pests and mutants to finally rest in piece. \
	However, it is still a prototype. After spending the radiance, it does not get back to your bloodstream. Somehow, the radiance becomes alveolar cells and just remains there."
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
	var/projectile_type = /obj/item/projectile/flamer_lob/flamethrower // What does it shoot
	var/use_amount = 50 // How much fuel is used per shot
	var/fuel_type = "fuel" // What kind of chem do we use?
	var/obj/item/weldpack/canister/fuel_can = null // The canister the gun use for ammo
	var/mob/living/carbon/holder  // Used to delete when dropped
	serial_shown = FALSE
	safety = FALSE
	fire_sound = 'sound/weapons/flamethrower_fire.ogg'

/obj/item/gun/purification/consume_next_projectile()
	if(!ispath(projectile_type)) // Do we actually shoot something?
		return null
	if(use_amount <= 0) //Are we out of charges?
		return null
	use_amount -= 1
	return new projectile_type(src)

// Alternative to drop it: Use in hand to extinguish
/obj/item/gun/purification/attack_self(mob/user)
	user.visible_message(SPAN_NOTICE("[user] closes their palm, letting the silvery metal sink into their skin."), SPAN_NOTICE("You close your hand and decide to allow \the [src] to go back into your bloodstream, deionized."), "You hear the sounds of purification in progress.")
	STOP_PROCESSING(SSobj, src)
	qdel(src)
	return

/obj/item/gun/purification/Process()
	if(loc != holder || (use_amount <= 0)) // We're no longer in the lecturer's hand or we're out of charges.
		visible_message("[src] is far too weak to stay outside a body.")
		STOP_PROCESSING(SSobj, src)
		qdel(src)
		return

/obj/item/gun/purification/Initialize()
	..()
	fuel_can = new /obj/item/weldpack/canister/flamethrower(src) // Give the gun a new flask when mapped in.

/obj/item/gun/purification/examine(mob/user)
	..(user)
	if(!fuel_can)
		to_chat(user, SPAN_NOTICE("The radiance seems fairly calm."))
		return
	if(use_amount) // In case we don't use any ammo
		to_chat(user, "The radiance seems angry enough for another shot.")
	return

/obj/item/gun/purification/examine(mob/user)
	..(user)
	if(!fuel_can)
		to_chat(user, SPAN_NOTICE("The radiances are calm. They are likely to get back to your bloodstream soon enough."))
		return
	if(use_amount) // In case we don't use any ammo
		var/shots_remaining = round(fuel_can.reagents.total_volume / use_amount)
		to_chat(user, "The [src.name] has agitated radiances, allowing [shots_remaining] manifestation\s of purying neural goods.")
	return

/obj/item/gun/purification/New()
	..()

/obj/item/gun/purification/consume_next_projectile()
	if(!fuel_can) // Do we have a fuel can?
		return null
	if(!ispath(projectile_type)) // Do we actually shoot something?
		return null
	if(!fuel_can.reagents.remove_reagent(fuel_type, use_amount)) // Do we have enough fuel? (Also consume the fuel if we have enough)
		return null
	return new projectile_type(src)

/datum/lecture/hearthcore/cataphract/dummy
	name = "Assemble: Taunting Dummy"
	phrase = "Radiance, hear me. Assemble the Taunting Dummy."
	desc = "Assemble with your own radiance a thin, taunting dummy. It looks like a moving body to animalistic enemies, may not work for people. Can still be used as a living shield."
	cooldown = TRUE
	cooldown_time = 15 MINUTES
	power = 35

/datum/lecture/hearthcore/cataphract/dummy/perform(mob/living/carbon/human/lecturer, obj/item/implant/core_implant/C)
	var/rob = lecturer.stats.getStat(STAT_ROB)
	if(rob > 30)
		to_chat(lecturer, "<span class='info'>You quickly deploy an radiance dummy from your bloodstream. What a sight!.</span>")
		new /mob/living/carbon/superior_animal/robot/custodians/faux_dummy(lecturer.loc)
		return TRUE
	to_chat(lecturer, "<span class='info'>It feels the same as adding a new color to the light spectrum. Your body does not have the robustness to train your silvery neurons.</span>")
	return FALSE//Not enough robustness to use this lecture.



/datum/lecture/hearthcore/cataphract/dummy/perform(mob/living/carbon/human/lecturer, obj/item/implant/core_implant/C)
	var/rob = lecturer.stats.getStat(STAT_ROB)
	if(rob > 30)
		to_chat(lecturer, "<span class='info'>You quickly deploy an radiance dummy from your bloodstream. What a sight!.</span>")
		new /mob/living/carbon/superior_animal/robot/custodians/faux_dummy(lecturer.loc)
		return TRUE
	to_chat(lecturer, "<span class='info'>It feels the same as adding a new color to the light spectrum. Your body does not have the robustness to train your silvery neurons.</span>")
	return FALSE//Not enough robustness to use this lecture.


/datum/lecture/hearthcore/cataphract/stonemason
	name = "Assemble: The Stone Mason Prototype"
	phrase = "Radiance, hear me. Assemble the Stone Mason."
	desc = "Assemble with your own radiance a strong, floating automaton on top of the user's presence. Sadly, this area-denier is an non-functional prototype, so avoid using it."
	cooldown = TRUE
	cooldown_time = 30 MINUTES
	power = 75

/*
/obj/machinery/power/stonemason
	name = "Bonfire Stonemason"
	desc = "The Stonemason."
	icon = 'icons/obj/custodian_structures.dmi'
	icon_state = "torchbearer"

	density = FALSE
	anchored = FALSE
	layer = 2.8

	use_power = IDLE_POWER_USE
	idle_power_usage = 0
	active_power_usage = 0
	var/overrideFaithfulCheck = FALSE
	var/active = FALSE
	var/area_radius = 7
	var/damage = 20
	var/max_targets = 5
	var/nt_buff_power = 5
	var/nt_buff_cd = 3

	var/static/stat_buff
	var/list/currently_affected = list()
	var/force_active = 0

	var/ticks_to_next_process = 3
	var/delta_y = target.y - moving.y
	var/delta_x = target.x - moving.x

	/datum/lecture/hearthcore/cataphract/dummy/perform(mob/living/carbon/human/lecturer, obj/item/implant/core_implant/C)
	*/