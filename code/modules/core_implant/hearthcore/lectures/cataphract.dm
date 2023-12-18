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