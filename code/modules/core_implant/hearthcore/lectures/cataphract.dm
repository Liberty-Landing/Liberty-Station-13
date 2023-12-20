//Holds all the proj, guns and spells for the Cataphract. The Cataphract focus on defense and defending others, while making use of radiance to manifest ways to counter enemy's move in the battlefield.

/obj/item/shield_projector/rectangle/cataphract_personal
	name = "Cataphract personal shield"
	description_info = "A fast deploying, personal energy shield. Powered by the Hearthcore internal plasma and delivered and manifested by radiance, it ensures the protection of the user when attacked by surprise. Not the best option, but what you can have any time. \
	this allows projectiles to leave from inside but blocks projectiles from outside. Everything else can pass through the shield freely, including other people and thrown objects. \
	The shield also cannot block certain effects which \
	take place over an area, such as flashbangs or explosions."
	icon_state = "last_shelter"
	high_color = "#FFFFFF"
	shield_health = 2
	max_shield_health = 2
	size_x = 1
	size_y = 1
	var/obj/item/implant/core_implant/hearthcore/linked_hearthcore

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
	desc = "By allowing the radiance to spread towards the surface of the hand and sacrifice itself as it ignites, it allows the Knight to use the leftover radiance like oil and spread it in the battlefield in a flamethrower.."
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

/obj/item/gun/purification
	name = "Genuine Purification"
	desc = "The beloved, benevolent purification of the body, to allow these maintenance pests and mutants to finally rest in piece."
	icon = 'icons/obj/guns/launcher/backburner.dmi'
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
	var/projectile_type = /obj/item/projectile/flamer_lob/flamethrower // What does it shoot
	var/use_amount = 1 // How many times can it be used
	var/mob/living/carbon/holder  // Used to delete when dropped
	var/changes_projectile = TRUE // Used to delete when dropped
	serial_shown = FALSE
	safety = FALSE
