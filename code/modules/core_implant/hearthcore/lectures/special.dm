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
	var/anti_cheata = FALSE
	if(C.get_module(HEARTHCORE_SPECIAL)) //You trained your synthetic neurons. They are not hungry for knowledgde anymore!
		to_chat(user, SPAN_NOTICE("Your brain and muscular memory feeds your silvery neurons with precious knowledge. You must choose which knowledge you've received in your trainings as a knight."))
		var/list/Listed_Options = list("Druzhina", "Cataphract", "Hussar", "Grenadier")
		var/whatever_var = input("Neural Specialization.", "Whisper the training secrets.", null, null) as null|anything in Listed_Options
		if(anti_cheata)
			to_chat(user, SPAN_NOTICE("The hearthcore refuses your echo."))
			return FALSE
		anti_cheata = TRUE
		switch(whatever_var)
			if("Druzhina")
				C.add_module(new HEARTHCORE_DRUZHINA)
				to_chat(user, SPAN_NOTICE("The radiance weaves into the fabric of your strategic acumen, bolstering collective protection, while fortifying your cognitive framework. As a Druzhina Knight, you stand with allies, a beacon of power that punishes enemies without burning allies with your fiery wrath."))
				C.remove_module(HEARTHCORE_SPECIAL)
			if("Cataphract")
				C.add_module(new HEARTHCORE_CATAPHRACT)
				to_chat(user, SPAN_NOTICE("The Radiance weaves into your physical form and mind, effortlessly shielding against the roaming plague. As a Cataphract, you embody eternal resilience, recalling ancient tactics. Safeguarding your comrades allows their survival under any condition."))
				C.remove_module(HEARTHCORE_SPECIAL)
			if("Hussar")
				C.add_module(new HEARTHCORE_HUSSAR)
				to_chat(user, SPAN_NOTICE("The Radiance intertwines with your muscles, infusing your legs with oxygenated vitality that propels you beyond limits. As a Hussar, you embody swiftness and sophistication, executing dazzling feats to open holes in enemy defenses and seize the advantage."))
				C.remove_module(HEARTHCORE_SPECIAL)
			if("Grenadier")
				C.add_module(new HEARTHCORE_GRENADIER)
				to_chat(user, SPAN_NOTICE("The Radiance weaves through your organs, refining your lungs to breath and fuel the fire within. As a Grenadier, you become a crucible of undying warrior spirit, embodying unparalleled versatility and risk. The pure, untamed fire becomes a force equally perilous to you, your allies and enemies alike."))
				C.remove_module(HEARTHCORE_SPECIAL)

	anti_cheata = FALSE
	return TRUE