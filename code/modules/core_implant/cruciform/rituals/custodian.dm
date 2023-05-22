/datum/ritual/cruciform/custodian //these are only available to the module CRUCIFORM_CUSTODIAN so all Custodian jobs have them
	name = "cruciform"
	phrase = null
	implant_type = /obj/item/implant/core_implant/cruciform
	fail_message = "The Hearthcore feels cold against your chest."
	category = "Custodian"
	ignore_stuttering = TRUE //required for ignoring things like : and other symbols in phrases

/datum/ritual/cruciform/custodian/offering
	name = "Offerings"
	power = 25
	var/list/req_offerings = list()
	var/list/miracles = list(ALERT, INSPIRATION, STAT_BUFF, ENERGY_REWARD)

/datum/ritual/cruciform/custodian/offering/perform(mob/living/carbon/human/H, obj/item/implant/core_implant/C, targets)
	var/list/OBJS = get_front(H)

	var/obj/machinery/power/eotp/EOTP = locate(/obj/machinery/power/eotp) in OBJS
	if(!EOTP)
		fail("You must be in front of the Embers of Theoretical Philosophy.", H, C)
		return FALSE

	var/list/obj/item/item_targets = list()
	var/turf/source_t = get_turf(EOTP)
	for(var/turf/T in RANGE_TURFS(7, source_t))
		for(var/obj/item/A in T)
			item_targets.Add(A)

	if(!make_offerings(item_targets))
		fail("Your offerings are not enough.", H, C)
		return FALSE

	EOTP.current_rewards = miracles
	EOTP.armaments_points = min(EOTP.armaments_points + 5, EOTP.max_armaments_points)
	EOTP.visible_message("\icon[EOTP] <span class = 'notice'>The Embers resonate slightly as the offering is consumed.</span>")
	return TRUE

/datum/ritual/cruciform/custodian/offering/proc/make_offerings(list/offerings)
	var/num_check = 0
	var/list/true_offerings = list()
	for(var/path in req_offerings)
		var/req_num = req_offerings[path]
		var/num_item = 0
		for(var/obj/item/I in offerings)
			if(istype(I, path))
				if(num_item >= req_num)
					break
				if(istype(I, /obj/item/stack))
					var/obj/item/stack/S = I
					num_item += S.amount
				else
					num_item++
				true_offerings.Add(I)

		if(num_item < req_num)
			break
		else
			num_check++

	if(num_check >= req_offerings.len)
		for(var/path in req_offerings)
			var/req_num = req_offerings[path]
			for(var/obj/item/I in true_offerings)
				if(req_num <= 0)
					break
				if(istype(I, path))
					if(istype(I, /obj/item/stack))
						var/obj/item/stack/S = I
						if(S.amount <= req_num)
							var/num = S.amount
							S.use(num)
							req_num -= num
						else
							S.use(req_num)
							req_num = 0
					else
						qdel(I)
						req_num--
		return TRUE

	return FALSE

/datum/ritual/cruciform/custodian/offering/buy_item
	name = "Order Armaments"
	phrase = "Oxidate Lecture: Order Armaments"
	desc = "Allows you to spend favor to unlock disks from the lower stronghold."

/datum/ritual/cruciform/custodian/offering/buy_item/perform(mob/living/carbon/human/H, obj/item/implant/core_implant/C, targets)
	var/list/OBJS = get_front(H)

	var/obj/machinery/power/eotp/EOTP = locate(/obj/machinery/power/eotp) in OBJS
	if(!EOTP)
		fail("You must be in front of the Embers of Theoretical Philosophy.", H, C)
		return FALSE

	eotp.nano_ui_interact(H)
	return TRUE

/datum/ritual/cruciform/custodian/offering/call_for_arms
	name = "Call for Arms"
	phrase = "Oxidate Lecture: Call for Arms"
	desc = "Make an appeal to the Embers of Theoretical Philosophy by offering ten carbon fiber, twenty steel, and sixty bio-silk to guide its power towards inspiring Hearthcore users. \
	Your offering also increases the EOTP's armanents reserves."
	req_offerings = list(/obj/item/stack/material/carbon_fiber = 10, /obj/item/stack/material/steel = 20, /obj/item/stack/material/biopolymer_silk = 60)
	miracles = list(INSPIRATION)

/datum/ritual/cruciform/custodian/offering/divine_intervention
	name = "Righteous Intervention"
	phrase = "Oxidate Lecture: Righteous Intervention"
	desc = "Make an appeal to the Embers of Theoretical Philosophy by offering two hundred and forty bio-silk to guide its power towards enhancing the abilities of Hearthcore users. \
	Your offering also increases the EOTP's armanents reserves."
	req_offerings = list(/obj/item/stack/material/biopolymer_silk = 240)
	miracles = list(STAT_BUFF)

/datum/ritual/cruciform/custodian/offering/holy_guidance
	name = "Sparking Guidance"
	phrase = "Oxidate Lecture: Sparking Guidance"
	desc = "Make an appeal to the Embers of Theoretical Philosophy by offering an oddity and forty bio-silk to guide its power towards enhancing Hearthcore Radiance regeneration among users. \
	Your offering also increases the EOTP's armanents reserves."
	req_offerings = list(/obj/item/oddity = 1, /obj/item/stack/material/biopolymer_silk = 40)
	miracles = list(ENERGY_REWARD)

/datum/ritual/cruciform/custodian/offering/alert
	name = "Discern Malcontents"
	phrase = "Oxidate Lecture: Discern Malcontents"
	desc = "Make an appeal to the Embers of Theoretical Philosophy by offering one hundred and twenty bio-silk and five carbon fiber to guide its power towards potentially discovering evil creatures. \
	Your offering also increases the EOTP's armanents reserves."
	req_offerings = list(/obj/item/stack/material/biopolymer_silk = 120, /obj/item/stack/material/carbon_fiber = 20)
	miracles = list(ALERT)
