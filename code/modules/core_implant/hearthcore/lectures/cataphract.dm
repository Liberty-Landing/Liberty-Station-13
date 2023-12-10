//Holds all the proj, guns and spells for the Cataphract. The Cataphract focus on defense and defending others, while making use of radiance to manifest ways to counter enemy's move in the battlefield.

	//Lecture: Summon a Stand that attacks anything around the user
	//Summon a thing that just stays there, calling attention of mobs. (done)
	//make the Cataphract summon a shield
	//Talk with trilby if we can port the Eris's lecture that allows NeoTheology guys to remove their shrapnels, or something that can help Cataphracts to "hold the line" even after being VERY punished not with damage, but with surgery-related problems


/datum/lecture/hearthcore/hussar/dummy
	name = "Assemble: Taunting Dummy"
	phrase = "Radiance, hear me. Assemble the Tauting Dummy." 
	desc = "Assemble with your own radiance a thin, taunting dummy. It looks like a moving body to animalistic enemies, may not work for people. Can still be used as a living shield."
	cooldown = TRUE
	cooldown_time = 15 MINUTES
	power = 35

/datum/lecture/hearthcore/druzhina/perform(mob/living/carbon/human/lecturer, obj/item/implant/core_implant/C)
	var/rob = holder.stats.getStat(STAT_ROB)
		if(rob > 30)
			to_chat(C, "<span class='info'>You quickly deploy an radiance dummy from your bloodstream. What a sight!.</span>")
			new /mob/living/carbon/superior_animal/robot/custodians/faux_dummy
			return
		to_chat(C, "<span class='info'>It feels the same as adding a new color to the light spectrum. Your body does not have the robustness to train your silvery neurons.</span>")
		return //Not enough robustness to use this lecture.