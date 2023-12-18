//Holds all the proj, guns and spells for the Hussars. The Cataphract focuses on movement, rapid attacks and dealing pain. In overall, they are the specializations that focus on muscular improvement and spearheading any battle formation to quickly attack an enemy, and then fall back. They can deal pain and toxin damage (at the same time) to weaken enemies before clashing against them.

/datum/lecture/hearthcore/hussar
	name = "Hussar"
	category = "Hussar"
	phrase = null
	implant_type = /obj/item/implant/core_implant/hearthcore


	//Lecture: Summon a Stand that attacks anything around the user
	//Summon a thing that just stays there, calling attention of mobs. (done)
	//make the Cataphract summon a shield
	//Talk with trilby if we can port the Eris's lecture that allows NeoTheology guys to remove their shrapnels, or something that can help Cataphracts to "hold the line" even after being VERY punished not with damage, but with surgery-related problems

/datum/lecture/hearthcore/hussar/dummy
	name = "Assemble: Taunting Dummy"
	phrase = "Radiance, hear me. Assemble the Taunting Dummy."
	desc = "Assemble with your own radiance a thin, taunting dummy. It looks like a moving body to animalistic enemies, may not work for people. Can still be used as a living shield."
	cooldown = TRUE
	cooldown_time = 15 MINUTES
	power = 35

/datum/lecture/hearthcore/hussar/dummy/perform(mob/living/carbon/human/lecturer, obj/item/implant/core_implant/C)
	var/rob = lecturer.stats.getStat(STAT_ROB)
	if(rob > 30)
		to_chat(lecturer, "<span class='info'>You quickly deploy an radiance dummy from your bloodstream. What a sight!.</span>")
		new /mob/living/carbon/superior_animal/robot/custodians/faux_dummy(lecturer.loc)
		return TRUE
	to_chat(lecturer, "<span class='info'>It feels the same as adding a new color to the light spectrum. Your body does not have the robustness to train your silvery neurons.</span>")
	return FALSE//Not enough robustness to use this lecture.


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
//lecture that deals pain damage
//a lecture that spawns a silver bow that uses radiance to shoot
//(talk with Trilby to see what suits more. Making the Hussar invisible by human standards like the cloaker spiders, or have something that allows them to put a "teleporter" in a place(only one) which they can teleport into after a delay.

/*
			var/rob = holder.stats.getStat(STAT_ROB)
		if(rob >= 30)

			return
		to_chat(lecturer, "<span class='info'>It feels the same as adding a new color to the light spectrum. Your body does not have the robustness to train your silvery neurons.</span>")
		return //Not enough robustness to use this lecture.
*/