//Todo: make this thing work under new shield system
/obj/machinery/shieldwallgen/excelsior
	name = "soviet shield generator"
	desc = "A shield generator."
	icon = 'icons/obj/machines/excelsior/field.dmi'
	stun_chance = 3
	shield_type = /obj/machinery/shieldwall
	circuit = /obj/item/circuitboard/excelsiorshieldwallgen
	req_access = list()

/obj/machinery/shieldwallgen/excelsior/attack_hand(mob/user as mob)
	..()

/obj/machinery/shieldwallgen/excelsior/emag_act()
	return

/obj/machinery/shieldwallgen/excelsior/verb/toggle_stun()
	set category = "Object"
	set name = "Toggle stun mode"
	set src in view(1)

	if(usr.incapacitated())
		return

	stunmode = !stunmode

	if(stunmode)
		to_chat(usr, SPAN_NOTICE("You toggle on [src]'s stun mode."))
	else
		to_chat(usr, SPAN_NOTICE("You toggle off [src]'s stun mode."))
