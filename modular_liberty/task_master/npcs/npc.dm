/obj/structure/npc
	name = "John Doe"
	desc = "It looks like a brain dead SSD plushie"
	icon = 'icons/obj/toy.dmi'
	icon_state = "slaggy"
	density = TRUE
	anchored = TRUE
	var/give_comp
	var/list/players

/obj/structure/npc/New()
	..()
	add_hearing()

/obj/structure/npc/Destroy()
	remove_hearing()
	. = ..()

/obj/structure/npc/hear_talk(mob/M, msg, verb, datum/language/speaking, speech_volume)
//	log_and_message_admins("NPC heard and pass start.")
	var/aready_given = FALSE
	if(ishuman(M) && give_comp)
		var/mob/living/carbon/human/H = M

		if(!players)
//			log_and_message_admins("No lens Found.")
			var/datum/npc_quest/new_quest = new give_comp(H, src)
			LAZYADD(players, new_quest)

		for(var/datum/npc_quest/checkme in players)
//			log_and_message_admins("NPC Looping.[checkme.knight_in_shining_armour.real_name] vs [H.real_name]")
			if(checkme.knight_in_shining_armour.real_name == H.real_name)
				aready_given = TRUE
//				log_and_message_admins("Talk heard, with [H.name] saying [msg].")
				checkme.hear_me(H, msg)

		if(!aready_given)
//			log_and_message_admins("Not Found.")
			var/datum/npc_quest/new_quest = new give_comp(H, src)
			LAZYADD(players, new_quest)

//			log_and_message_admins("NPC heard and were giving the compnent.")

//		log_and_message_admins("NPC heard and passed through.")

	..()

/obj/structure/npc/examine(mob/user)
	..()
//	log_and_message_admins("NPC Seen 1.")
	var/aready_given = FALSE
	if(ishuman(user) && give_comp)
		var/mob/living/carbon/human/H = user

		if(!players)
//			log_and_message_admins("No lens Found.")
			var/datum/npc_quest/new_quest = new give_comp(H, src)
			LAZYADD(players, new_quest)

		for(var/datum/npc_quest/checkme in players)
//			log_and_message_admins("NPC Looping.[checkme.knight_in_shining_armour.real_name] vs [H.real_name]")
			if(checkme.knight_in_shining_armour.real_name == H.real_name)
				aready_given = TRUE
				checkme.on_examine(H)
//				log_and_message_admins("Found.")

		if(!aready_given)
//			log_and_message_admins("Not Found.")
			var/datum/npc_quest/new_quest = new give_comp(H, src)
			LAZYADD(players, new_quest)

/obj/structure/npc/attackby(obj/item/I, mob/user)
	if(ishuman(user) && give_comp)
		var/mob/living/carbon/human/H = user
		for(var/datum/npc_quest/checkme in players)
			if(checkme.knight_in_shining_armour.real_name == H.real_name)
				checkme.attempt_give(I, user)

/obj/structure/npc/wax_wanter
	name = "Violet Rosefield"
	desc = "The big bee looking for wax."
	icon_state = "plushie_bee"
	give_comp = /datum/npc_quest/wax_wanter

