/datum/ritual/cruciform/base
	name = "cruciform"
	phrase = null
	implant_type = /obj/item/implant/core_implant/cruciform
	fail_message = "The Hearthcore feels cold against your chest."
	category = "Common"
	ignore_stuttering = TRUE //required for ignoring things like : and other symbols in phrases

/datum/ritual/targeted/cruciform/base
	name = "cruciform targeted"
	phrase = null
	implant_type = /obj/item/implant/core_implant/cruciform
	category = "Common"
	ignore_stuttering = TRUE

datum/ritual/cruciform/base/thumbspire
	name = "Thumbspire"
	phrase = "Oxidate Lecture: Thumbspire"
	desc = "Create a small spark on your thumb that can be used to ignite things."
	power = 2

/datum/ritual/cruciform/base/thumbspire/perform(mob/living/carbon/human/lecturer, obj/item/implant/core_implant/C)
	var/obj/item/flame/custodian_spark/flame = new /obj/item/flame/custodian_spark(src, lecturer)
	lecturer.visible_message(
		"As [lecturer] speaks, their thumb is covered by a small, intense spark.",
		"A small spark and flame quickly covers one of your thumbs."
		)
	playsound(usr.loc, pick('sound/effects/sparks1.ogg','sound/effects/sparks2.ogg','sound/effects/sparks3.ogg'), 50, 1, -3)
	usr.put_in_hands(flame)
	return TRUE

/obj/item/flame/custodian_spark //The pseudo-item used for the thumbspire, uses pyrokinetic spark code
	name = "custodian thumbspark"
	desc = "A spark and flame surrounding your thumb."
	icon = 'icons/obj/nt_melee.dmi'
	icon_state = "thumbspire"
	var/burntime = 120
	w_class = ITEM_SIZE_HUGE
	force = 1
	damtype = BURN
	slot_flags = null
	attack_verb = list("burnt", "singed")
	lit = 1
	var/mob/living/carbon/holder

/obj/item/flame/custodian_spark/New(var/loc, var/mob/living/carbon/lecturer)
	..()
	holder = lecturer //set the holder verb for Process()
	set_light(3) //the spark glows
	START_PROCESSING(SSobj, src) //start Process()ing

/obj/item/flame/custodian_spark/Process()
	if(isliving(loc))
		var/mob/living/M = loc //standard lighter Process() for now
		M.IgniteMob()
	var/turf/location = get_turf(src)
	burntime--
	if(burntime < 1)
		burn_out()
		return
	if(loc != holder) // We're no longer in the lecturer's hand, delete self
		visible_message("[src.name] flickers away as the fire fades into nothingness")
		STOP_PROCESSING(SSobj, src)
		qdel(src)
		return
	if(location)
		location.hotspot_expose(700, 5)
		return

/obj/item/flame/custodian_spark/proc/burn_out()
		visible_message("The [src.name] burns out and dissapears.")
		STOP_PROCESSING(SSobj, src)
		qdel(src)
		return

/datum/ritual/cruciform/base/entreaty
	name = "Entreaty"
	phrase = "Oxidate Lecture: Entreaty"
	desc = "Call for help, allowing other Hearthcore users to hear your cries."
	power = 10

/datum/ritual/cruciform/base/entreaty/perform(mob/living/carbon/human/H, obj/item/implant/core_implant/C)
	for(var/mob/living/carbon/human/target in disciples) //calls all hearthcore users
		if(target == H)
			continue

		var/obj/item/implant/core_implant/cruciform/CI = target.get_core_implant()
		var/area/t = get_area(H) //get the area name

		if((istype(CI) && CI.get_module(CRUCIFORM_COMMON)) || prob(50)) //if we found someone, 50/50 chance we print out a help message
			to_chat(target, SPAN_DANGER("[H], faithful cruciform follower, cries for help at [t.name]!"))
	return TRUE

/datum/ritual/cruciform/base/pyrelight
	name = "Pyrelight"
	phrase = "Oxidate Lecture: Pyrelight"
	desc = "Lecture of wandering Custodians that creates a small immobile light for twenty minutes."
	power = 20

/datum/ritual/cruciform/base/pyrelight/perform(mob/living/carbon/human/H, obj/item/implant/core_implant/C)
	playsound(H.loc, 'sound/effects/snap.ogg', 50, 1)
	new /obj/effect/sparks(H.loc)
	new /obj/effect/effect/smoke/illumination(H.loc, brightness=max(7), lifetime=12000) //Very bright light.
	return TRUE

/datum/ritual/cruciform/base/message
	name = "Carrier Pigeon"
	phrase = "Oxidate Lecture: Carrier Pigeon"
	desc = "Create a pigeon of light to send a message to a person of your choice."
	power = 10

/datum/ritual/cruciform/base/message/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C,list/targets)
	var/list/creatures = list()
	for(var/mob/living/carbon/human/h in world)
		if(!h.is_mannequin) // Can't talk mannequins
			creatures += h // Add the player to the list we can talk to
	var/mob/target = input("Who do you want to send a message to?") as null|anything in creatures

	if (!target)
		return FALSE

	if(user == target)
		fail("You feel stupid.",user,C,targets) //dont message yourself
		return FALSE

	var/text = input(user, "What message will you send to the target? Only they will be able to hear it.", "Sending a message") as text|null
	if (!text)
		return FALSE
	to_chat(target, "<span class='notice'><b><font color='#ffaa00'>A nearly imperceptible pigeon of light hovers near your ears and resonates with [user.real_name]'s voice: \"[text]\"</font><b></span>")
	log_and_message_admins("[user.real_name] sent a message to [target] with text \"[text]\"")
	playsound(user.loc, 'sound/machines/signal.ogg', 50, 1)
	playsound(target, 'sound/machines/signal.ogg', 50, 1)
	for(var/mob/observer/ghost/G in world)
		G.show_message("<i>Message from <b>[src]</b> to <b>[target]</b>: [text]</i>")
	return TRUE

/datum/ritual/cruciform/base/revelation
	name = "Revelation"
	phrase = "Oxidate Lecture: Revelation"
	desc = "A person close to you will recieve a fortifying effect to their psyche, letting them face greater horrors for thirty minutes. Has a five minute cooldown."
	power = 50
	cooldown_category = "revelation"
	cooldown = TRUE
	cooldown_time = 5 MINUTES
	effect_time = 30 MINUTES

/datum/ritual/cruciform/base/revelation/perform(mob/living/carbon/human/H, obj/item/implant/core_implant/C)
	var/mob/living/carbon/human/lectured = get_front_human_in_range(H, 4)
	if(!lectured)
		fail("No target.", H, C)
		return FALSE
	give_sanity_boost(lectured) //trigger boosting proc
	LEGACY_SEND_SIGNAL(H, COMSIG_RITUAL, src, lectured) //not relevant to the lecture itself, just used for a personal objective if it exists
	return TRUE

/datum/ritual/cruciform/base/revelation/proc/give_sanity_boost(mob/living/carbon/human/lectured)
	lectured.sanity.max_level += 20 //increase max sanity level
	addtimer(CALLBACK(src, .proc/take_sanity_boost, lectured), effect_time) //add timer for the removal proc
	to_chat(lectured, SPAN_NOTICE("Your mind feels fortified."))

/datum/ritual/cruciform/base/revelation/proc/take_sanity_boost(mob/living/carbon/human/lectured)
	if(!lectured)
		return
	lectured.sanity.max_level -= 20 //remove the boost
	to_chat(lectured, SPAN_NOTICE("You feel your mental fortification crumbling.")) //always notify when buffs activate and de-activate

/datum/ritual/cruciform/base/empower
	name = "Empower"
	phrase = "Oxidate Lecture: Empower"
	desc = "This lecture transfers Radiance from your own Hearthcore to another Hearthcore user, draining 15 Radiance to grant 10."
	power = 15

/datum/ritual/cruciform/base/empower/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C,list/targets)
	var/obj/item/implant/core_implant/cruciform/CI = get_implant_from_victim(user, /obj/item/implant/core_implant/cruciform)

	if(!CI || !CI.active || !CI.wearer)
		fail("Hearthcore not found.", user, C) //Hearthcore check
		return FALSE

	var/mob/living/carbon/human/H = CI.wearer

	user.visible_message("[user] places their hands upon [H]", "You lay your hands upon [H]")
	if (do_after(user, 40, H, TRUE))
		var/turf/T = get_turf(user)
		if (!(T.Adjacent(get_turf(H))))
			to_chat(user, SPAN_DANGER("[H] is beyond your reach.."))
			return FALSE
		to_chat(H, "<span class='info'>Your Hearthcore sings a small tune as it gets charged.</span>")

		CI.restore_power(10)

		return TRUE

/datum/ritual/cruciform/base/accelerated_growth
	name = "Accelerated Growth"
	phrase = "Oxidate Lecture: Accelerated Growth"
	desc = "This lecture boosts the growth of all plants in sight for about 5 minutes. Has a five minute cooldown."
	cooldown = TRUE
	cooldown_time = 5 MINUTES
	effect_time = 5 MINUTES
	cooldown_category = "accelerated_growth"
	power = 30

	var/boost_value = 1.5  // How much the aging process of the plant is sped up

/datum/ritual/cruciform/base/accelerated_growth/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)

	var/list/plants_around = list()
	for(var/obj/machinery/portable_atmospherics/hydroponics/H in view(user))
		if(H.seed)  // if there is a plant in the hydroponics tray
			plants_around.Add(H.seed)

	if(plants_around.len > 0) //if a plant was added to our list give boosts
		to_chat(user, SPAN_NOTICE("You feel the air thrum with an inaudible vibration."))
		playsound(user.loc, 'sound/machines/signal.ogg', 50, 1)
		for(var/datum/seed/S in plants_around)
			give_boost(S)
		set_personal_cooldown(user)
		return TRUE
	else
		fail("There is no plant around to hear your song.", user, C)
		return FALSE

/datum/ritual/cruciform/base/accelerated_growth/proc/give_boost(datum/seed/S)
	S.set_trait(TRAIT_BOOSTED_GROWTH, boost_value) //set the boost
	addtimer(CALLBACK(src, .proc/take_boost, S), effect_time) //add the timer to take away the boost

/datum/ritual/cruciform/base/accelerated_growth/proc/take_boost(datum/seed/S)
	// take_boost is automatically triggered by a callback function when the boost ends but the seed
	// may have been deleted during the duration of the boost
	if(S) // check if seed still exist otherwise we cannot read null.stats
		S.set_trait(TRAIT_BOOSTED_GROWTH, 1)

/datum/ritual/cruciform/base/mercy
	name = "Hand of Mercy"
	phrase = "Oxidate Lecture: Hand of Mercy"
	desc = "Relieves the pain of a person in front of you. Has a three minute cooldown."
	cooldown = TRUE
	cooldown_time = 3 MINUTES
	cooldown_category = "hand_of_mercy"
	power = 25

/datum/ritual/cruciform/base/mercy/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	var/mob/living/carbon/human/T = get_front_human_in_range(user, 1)
	if(!T) //anyone there?
		fail("No target in front of you.", user, C)
		return FALSE

	to_chat(T, SPAN_NOTICE("You feel slightly better as your pain eases."))
	to_chat(user, SPAN_NOTICE("You ease the pain of [T.name]."))

	T.reagents.add_reagent("anodyne", 10)
	set_personal_cooldown(user)

	return TRUE

/datum/ritual/cruciform/base/absolution
	name = "Flames of Stability"
	phrase = "Oxidate Lecture: Flames of Stability"
	desc = "Stabilizes the health of a person in front of you. Has a three minute cooldown."
	cooldown = TRUE
	cooldown_time = 3 MINUTES
	cooldown_category = "flames_of_stability"
	power = 25

/datum/ritual/cruciform/base/absolution/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C,list/targets)
	var/mob/living/carbon/human/T = get_front_human_in_range(user, 1)
	if(!T) //anyone there?
		fail("No target in front of you.", user, C)
		return FALSE

	to_chat(T, SPAN_NOTICE("You feel a soothing sensation in your veins."))
	to_chat(user, SPAN_NOTICE("You stabilize [T.name]'s health."))

	var/datum/reagents/R = new /datum/reagents(20, null)
	R.add_reagent("holyinaprovaline", 10)
	R.add_reagent("holydexalinp", 10)
	R.trans_to_mob(T, 20, CHEM_BLOOD)
	set_personal_cooldown(user)

	return TRUE

/datum/ritual/cruciform/base/purging
	name = "Word of Purification"
	phrase = "Oxidate Lecture: Word of Purification"
	desc = "Addictions are common afflictions among colony denizens. This lecture helps those people by easing or removing their addictions."
	power = 30

/datum/ritual/cruciform/base/purging/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	var/mob/living/carbon/human/T = get_front_human_in_range(user, 1)
	if(!T)
		fail("No target in front of you.", user, C)
		return FALSE

	if(T.metabolism_effects.addiction_list.len) //does addictions_list have anything in it?
		for(var/addiction in T.metabolism_effects.addiction_list)
			var/datum/reagent/R = addiction
			if(!R)
				T.metabolism_effects.addiction_list.Remove(R)
				continue

			T.metabolism_effects.addiction_list[R] += 15  // increase addiction level by 15
			// target will go through the addiction stages and finally be free from the addiction once it reaches level 40
			// it's a bad moment to go through but after 2 or 3 littany the addiction will be gone
			// psychiatrist RP opportunity -> think about the sins that led you to this addiction

		to_chat(T, SPAN_NOTICE("You feel weird as you progress through your addictions."))
		to_chat(user, SPAN_NOTICE("You help [T.name] get rid of their addictions."))

		T.reagents.add_reagent("laudanum", 10)

		return TRUE

	fail("No addictions found.", user, C)
	return FALSE

/datum/ritual/cruciform/base/records
	name = "Philosophical Record"
	phrase = "Oxidate Lecture: Philosophical Record"
	desc = "Gathers a copy of the Custodians' local records from a Board of Opposites."
	success_message = "On the verge of audibility you hear pleasant music, a piece of paper slides out from a slit in the board."

/datum/ritual/cruciform/base/records/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	var/list/OBJS = get_front(user)

	var/obj/machinery/optable/altar = locate(/obj/machinery/optable/altar) in OBJS

	if(!altar)
		fail("This is not a board, the lecture is useless.", user, C)
		return FALSE

	if(altar)
		new /obj/item/paper(altar.loc, disciples.Join("\n"), "Custodian Record")
	return TRUE


/datum/ritual/cruciform/base/anti_scrying
	name = "Anti-Scrying"
	phrase = "Oxidate Lecture: Anti-Scrying"
	desc = "Toggle the Radiance behind your eyes to permit or deny Scrying attempts."

// the ANTI_SCRYING module is checked in the Scrying lecture to let attempts go through or not, it functions much like a flag in that sense, this just toggles that module
/datum/ritual/cruciform/base/anti_scrying/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	if(C.get_module(CRUCIFORM_ANTI_SCRYING)) //if you already have the ANTI_SCRYING module, remove it
		C.remove_modules(CRUCIFORM_ANTI_SCRYING)
		to_chat(user, SPAN_NOTICE("You restore the Radiance behind your eyes, allowing Scrying attempts."))
		return TRUE
	else
		C.add_module(new CRUCIFORM_ANTI_SCRYING) //if there's no ANTI_SCRYING module, add it
		to_chat(user, SPAN_NOTICE("You remove the Radiance behind your eyes, denying Scrying attempts."))
		return TRUE


//datum/ritual/cruciform/base/wardenpyre LATER

//datum/ritual/cruciform/base/cauterization MAYBE LATER
