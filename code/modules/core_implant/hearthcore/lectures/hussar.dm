//Holds all the proj, guns and spells for the Hussars. The Cataphract focuses on movement, rapid attacks and dealing pain. In overall, they are the specializations that focus on muscular improvement and spearheading any battle formation to quickly attack an enemy, and then fall back. They can deal pain and toxin damage (at the same time) to weaken enemies before clashing against them.

/datum/lecture/hearthcore/hussar/skirmish
	name = "Skirmishing"
	phrase = "Oxidate Lecture: Skirmishing."
	desc = "Temporarily enable radiance to create internal alveoli, gathering oxygen from the surface of the skin and deliver it directly to the muscles. Simultaneously, the radiance filter out lactic acid, enhancing muscle function for increased speed and stamina."
	cooldown = TRUE
	cooldown_time = 30 MINUTES
	power = 35

datum/lecture/hearthcore/hussar/skirmish/perform(mob/living/carbon/human/lecturer, obj/item/implant/core_implant/C,list/targets)
	var/rob = holder.stats.getStat(STAT_ROB)
		if(ROB > 24)
			to_chat(C, "<span class='info'>The feeling of rejuvenation washes over you. You feel comfortable warmth on your muscles.</span>")
			C.add_chemical_effect(CE_SPEEDBOOST, 0.3, 5, "skirmish")
			C.add_chemical_effect(CE_OXYGENATED, 5)
			updatehealth()
	return TRUE
		to_chat(C, "<span class='info'>It feels the same as adding a new color to the light spectrum. Your body does not have the robustness to train your silvery neurons.</span>")
		return //You need 25 robustness at minimum to use this lecture

//lecture that deals pain damage
//a lecture that spawns a silver bow that uses radiance to shoot
//(talk with Trilby to see what suits more. Making the Hussar invisible by human standards like the cloaker spiders, or have something that allows them to put a "teleporter" in a place(only one) which they can teleport into after a delay.

/*
			var/rob = holder.stats.getStat(STAT_ROB)
		if(rob > 30)

			return
		to_chat(C, "<span class='info'>It feels the same as adding a new color to the light spectrum. Your body does not have the robustness to train your silvery neurons.</span>")
		return //Not enough robustness to use this lecture.