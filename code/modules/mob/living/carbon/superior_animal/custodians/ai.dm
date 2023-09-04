// AI handling for Lord Foog's obey check. Oathpledge
/mob/living/carbon/superior_animal/lord_foog/hear_say(var/message, var/verb = "says", var/datum/language/language = null, var/alt_name = "", var/italics = 0, var/mob/speaker = null, var/sound/speech_sound, var/sound_vol, speech_volume)
	..()

	if(speaker in true_boss) // Only Oathpledge can give orders to the doggo to start taking orders from others or ignore them.

		// Add people as friends
		if(findtext(message, "Obey") && findtext(message, "[src.name]"))
			for(var/mob/target in orange(viewRange, src))
				if(target != src)
					if(findtext(message, target.name))
						if(friends.Find(target))
							visible_emote("tilts his head sideways, confused. He appears to recognise [target.name] as a leader already.")
						else
							visible_emote("barks, nodding once as he acknowledges [target.name]'s orders now.")
							playsound(loc, 'sound/voice/bark2.ogg', 50, 1)
							friends += target // We now take orders from them

		// Remove people as friends
		if(findtext(message, "Ignore") && findtext(message, "[src.name]"))
			for(var/mob/target in orange(viewRange, src))
				if(target != src || target != true_boss) // Do not revoke our own privileges!
					if(findtext(message, target.name))
						if(friends.Find(target))
							visible_emote("reluctantly nods, commencing to ignore [target.name]'s orders.")
							friends -= target
						else
							visible_emote("tilts his head, confused. It seems he never obeyed [target.name] to begin with.")

// Scoop up that dog
/mob/living/carbon/superior_animal/lord_foog/MouseDrop(atom/over_object)
	if(holder_type && !anchored)
		var/mob/living/carbon/H = over_object
		if(!istype(H) || !Adjacent(H))
			return ..()
		get_scooped(H, usr)
		return
	return ..()

