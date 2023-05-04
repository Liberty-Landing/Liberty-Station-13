/// Basically a marker perk. If the user has this perk, another will be given in certain conditions.
/datum/perk/job/inspiration
	name = "Exotic Inspiration"
	desc = "The best ideas come from a mind not entirely sober, any alcohol will give you that much needed boost... somehow."
	icon_state = "inspiration" // https://game-icons.net/1x1/delapouite/booze.html

/datum/perk/job/active_inspiration
	name = "Exotic Inspiration (Active)"
	desc = "The alcohol you imbibed is granting you that much needed boost in inspiration for your next project...somehow."
	gain_text = "You feel a sudden rush of alcohol-induced inspiration..."
	lose_text = "Your sudden flash of brilliance fades away..."
	icon_state = "inspiration_active" // https://game-icons.net/1x1/lorc/enlightenment.html

/datum/perk/job/active_inspiration/assign(mob/living/carbon/human/H)
	..()
	holder.stats.addTempStat(STAT_COG, 5, INFINITY, "Exotic Inspiration")
	holder.stats.addTempStat(STAT_MEC, 10, INFINITY, "Exotic Inspiration")

/datum/perk/job/active_inspiration/remove()
	holder.stats.removeTempStat(STAT_COG, "Exotic Inspiration")
	holder.stats.removeTempStat(STAT_MEC, "Exotic Inspiration")
	..()

/datum/perk/job/artist
	name = "Artist"
	desc = "You have a lot of expertise in making works of art. You gain more insight from all sources but can only increase \
			your stats by creating works of art."
	icon_state = "paintbrush"
	var/old_max_insight = INFINITY
	var/old_max_resting = INFINITY
	var/old_insight_rest_gain_multiplier = 1

/datum/perk/job/artist/assign(mob/living/carbon/human/H)
	..()
	old_max_insight = holder.sanity.max_insight
	old_max_resting = holder.sanity.max_resting
	old_insight_rest_gain_multiplier = holder.sanity.insight_rest_gain_multiplier
	holder.sanity.max_insight = 100
	holder.sanity.insight_gain_multiplier *= 1.5
	holder.sanity.max_resting = 1
	holder.sanity.insight_rest_gain_multiplier = 0

/datum/perk/job/artist/remove()
	holder.sanity.max_insight += old_max_insight - 100
	holder.sanity.insight_gain_multiplier /= 1.5
	holder.sanity.max_resting += old_max_resting - 1
	holder.sanity.insight_rest_gain_multiplier += old_insight_rest_gain_multiplier
	..()

/datum/perk/job/timeismoney // TODO: A perk that doesn't involve a free Chronos injection, specially for the Skylight CEO equivalent.
	name = "Chronos Injection"
	desc = "A standard issue injector hidden away that is designed for Chief Executive Officers that contains a small on-demand injection of Chronos. The injector itself is unable to be seen by prying scanners and comes in both \
	metal and organic material designs to aid in remaining hidden. While useful, the chemical storage takes time to recharge after use."
	active = FALSE
	passivePerk = FALSE

/datum/perk/job/timeismoney/activate()
	var/mob/living/carbon/human/user = usr
	if(!istype(user))
		return ..()
	if(world.time < cooldown_time)
		to_chat(usr, SPAN_NOTICE("Your chemical injector is still refilling, you'll need to wait longer."))
		return FALSE
	cooldown_time = world.time + 15 MINUTES
	user.visible_message("[user] begins twitching and breathing much quicker!", "You feel your heart rate increasing rapidly as everything seems to speed up!", "You hear someone breathing rapidly...")
	log_and_message_admins("used their [src] perk.")
	user.reagents.add_reagent("chronos", 5)
	return ..()

/datum/perk/job/sanityboost
	name = "True Faith"
	desc = "When near an obelisk, you feel your mind at ease. Your body is strengthened by its presence, resisting all forms of damage."
	gain_text = "You feel the protection of the nearby obelisk."
	lose_text = "You no longer feel the protection of an obelisk."
	icon_state = "sanityboost" // https://game-icons.net/1x1/lorc/templar-eye.html

/datum/perk/active_sanityboost/assign(mob/living/carbon/human/H)
	if(..())
		holder.sanity.sanity_passive_gain_multiplier *= 1.5

/datum/perk/active_sanityboost/remove()
	if(holder)
		holder.sanity.sanity_passive_gain_multiplier /= 1.5
	..()

/datum/perk/job/ear_of_quicksilver
	name = "Ear of Quicksilver"
	desc = "Training (and an ear implant) given to you as a Ranger makes it hard for secrets to escape your ears. Beware, loud noises are especially dangerous to you as a side effect."
	icon_state = "ear" // https://game-icons.net

/datum/perk/job/lazarus_protocol
	name = "Lazarus Protocol"
	desc = "Your cruciform is more than just a symbol of faith. Should you ever perish, it will attempt an emergency revival that may restore your body after a short time, in which you'll be unconscious."
	icon_state = "regrowth" // https://game-icons.net/1x1/delapouite/stump-regrowth.html

/datum/perk/job/chemist
	name = "Periodic Table"
	desc = "You know what the atoms around you react to and in what way they do. You are used to making organic substitutes and using them. \
			You get quarter more NSA than a normal person. You can also see all reagents in beakers."
	perk_shared_ability = PERK_SHARED_SEE_REAGENTS
	icon_state = "selfmedicated"

/datum/perk/job/chemist/assign(mob/living/carbon/human/H)
	..()
	if(holder)
		holder.metabolism_effects.nsa_mult += 0.25
		holder.metabolism_effects.calculate_nsa()

/datum/perk/job/chemist/remove()
	if(holder)
		holder.metabolism_effects.nsa_mult -= 0.25
		holder.metabolism_effects.calculate_nsa()
	..()

/datum/perk/job/chem_contraband
	name = "Illegal Substance Training"
	desc = "For reasons either fair or foul, you know how to easily identify certain kinds of illegal chemical contraband."
	perk_shared_ability = PERK_SHARED_SEE_ILLEGAL_REAGENTS
	icon_state = "paper"

/datum/perk/job/junkborn
	name = "Expert Scavenger"
	desc = "One man's trash is another man's salary. Removing a trash pile has a chance of revealing a valuable item nobody else would find."
	icon_state = "treasure" // https://game-icons.net

/datum/perk/job/sommelier
	name = "Sommelier"
	desc = "You know how to handle even the strongest alcohol in the universe and doing so improves your toughness."
	icon_state = "drinking"

/datum/perk/job/handyman
	name = "Handyman"
	desc = "Training by the Terra-Therma Union has granted you the knowledge of how to take apart machines in the most efficient way possible, finding materials and supplies most people would miss. This training is taken further the more mechanically skilled or cognitively capable you are."
	icon_state = "guild"

/datum/perk/job/handyman/assign(mob/living/carbon/human/H)
	..()


/datum/perk/job/handyman/remove()
	..()

/datum/perk/job/stalker
	name = "Anomaly Hunter"
	desc = "Special training from senior Shipbreakers and your own experience has allowed you to instinctively know the effects of greater oddities. By examining an oddity that has become an anomaly, you can tell what its greater boon or curse may be."
	icon_state = "treasure"

//Medical perks - relates to surgery and all.

/datum/perk/job/surgical_master
	name = "Surgery Training"
	desc = "While you may not know the more advanced medical procedures, your mandatory training on surgery for implantation purposes allows you to perform basic surgical procedures with ease."
	icon_state = "surgery"

/datum/perk/job/advanced_medical
	name = "Advanced Surgical Techniques"
	desc = "Your surgical training and experience have tempered your special techniques for treating patients, enabling you to make more effective and efficient use of your resources when reconstituting their bodies."
	icon_state = "surgery"

/datum/perk/job/robotics_expert
	name = "Robotics Expert"
	desc = "Your formal training and experience in advanced mech construction and complex devices has made you more adept at working with them."
	icon_state = "robotics"

/datum/perk/job/robotics_expert/assign(mob/living/carbon/human/H)
	..()

/datum/perk/job/robotics_expert/remove()
	..()


/datum/perk/job/jingle_jangle
	name = "Key Smith"
	desc = "You have been granted a multitude of specially crafted electronic 'keys' for opening most airlocks around the colony, and the knowledge on how to use them has been solely been passed on to you. Don't get discouraged, you will eventually find the right one..."
	icon_state = "keysmith"

/datum/perk/job/butcher
	name = "Master Butcher"
	desc = "Your skill as a butcher is unmatched, be it through your training or accumulated field experience. You can harvest additional valuable parts from animals you cut up, nothing shall be wasted."
	icon_state = "knowledge"


/datum/perk/job/butcher/assign(mob/living/carbon/human/H)
	..()

/datum/perk/job/butcher/remove()
	..()

/datum/perk/job/master_herbalist
	name = "Naturalist"
	desc = "The secrets of natural remedies have been unlocked by the lodge after special training from folken tribes, given their alliance. This has granted you the ability to make better \
	use of grown plants to harvest more fruit and more properly manage the use of medical supplies like blood tongues or powder pouches. As an added bonus, when harvesting soil \
	or plant trays you always harvest an additional bonus! You are also a capable surgeon, able to perform surgical steps a lot more easily, to the point of rivaling real surgeons."
	perk_shared_ability = PERK_SHARED_SEE_REAGENTS
	icon_state = "regrowth"

/datum/perk/job/science
	name = "Science Training"
	desc = "You know how to use RnD core consoles and Exosuit Fabs."
	icon_state = "knowledge"

/datum/perk/job/neat
	name = "Humble Cleanser"
	desc = "You're used to see blood and filth in all its forms. Your motto: a clean colony is a happy colony. \
			This perk reduces the total sanity damage you can take from what is happening around you. \
			You can regain sanity by cleaning."
	icon_state = "neat" // https://game-icons.net/1x1/delapouite/broom.html

/datum/perk/neat/assign(mob/living/carbon/human/H)
	if(..())
		holder.sanity.view_damage_threshold += 20

/datum/perk/neat/remove()
	if(holder)
		holder.sanity.view_damage_threshold -= 20
	..()

/datum/perk/foodappraise
	name = "Spice up Food"
	desc = "Your own special, secret touch in seasoning has anomalous properties that can enhance most food products."
	icon_state = "spice"
	active = FALSE
	passivePerk = FALSE

/datum/perk/foodappraise/activate()
	var/mob/living/carbon/human/user = usr
	var/obj/item/reagent_containers/food/snacks/F = user.get_active_hand()
	if(!istype(user))
		return ..()
	if(!istype(F, /obj/item/reagent_containers/food/snacks))
		to_chat(usr, SPAN_NOTICE("You can only season food items!"))
		return FALSE
	if(F.appraised == 1)
		to_chat(usr, SPAN_NOTICE("This food item has already been seasoned!"))
		return FALSE
	to_chat(usr, SPAN_NOTICE("You quickly sprinkle some of your anomalous seasoning onto the food item, revealing its hidden properties."))
	//log_and_message_admins("used their [src] perk.")
	F.chef_buff_type = rand(1,9) // We assign a random bufferino.
	F.appraised = 1
	switch(F.chef_buff_type)
		if(1)
			F.name = "mentally engaging [F.name]"
		if(2)
			F.name = "mechanic's [F.name]"
		if(3)
			F.name = "caretaker's [F.name]"
		if(4)
			F.name = "vigorous [F.name]"
		if(5)
			F.name = "hardy [F.name]"
		if(6)
			F.name = "focusing [F.name]"
		if(7)
			var/newprice = rand(100,500)
			F.name = "exquisite [F.name]"
			if(F.price_tag < newprice)
				F.price_tag = newprice
		if(8)
			F.name = "nourishing [F.name]"
			F.reagents.add_reagent("nutriment", 15)
		if(9)
			F.name = "hearty [F.name]"

/datum/perk/job/club
	name = "Raising the bar"
	desc = "You know how to mix drinks and change lives. People near you recover sanity."
	icon_state = "inspiration"

/datum/perk/job/club/assign(mob/living/carbon/human/H)
	if(..())
		holder.sanity_damage -= 2

/datum/perk/job/club/remove()
	if(holder)
		holder.sanity_damage += 2
	..()


/datum/perk/job/channeling
	name = "Channeling"
	desc = "You know how to channel spiritual energy during rituals. You gain additional skill points \
			during group rituals, and have an increased regeneration of cruciform energy."
	icon_state = "channeling"


/datum/perk/job/codespeak
	name = "Codespeak"
	desc = "You know Marshal codes."
	icon_state = "codespeak" // https://game-icons.net/1x1/delapouite/police-officer-head.html
	var/list/codespeak_procs = list(
		/mob/living/carbon/human/proc/codespeak_help,
		/mob/living/carbon/human/proc/codespeak_clear,
		/mob/living/carbon/human/proc/codespeak_regroup,
		/mob/living/carbon/human/proc/codespeak_moving,
		/mob/living/carbon/human/proc/codespeak_moving_away,
		/mob/living/carbon/human/proc/codespeak_spooders,
		/mob/living/carbon/human/proc/codespeak_romch,
		/mob/living/carbon/human/proc/codespeak_bigspooders,
		/mob/living/carbon/human/proc/codespeak_bigromch,
		/mob/living/carbon/human/proc/codespeak_serb,
		/mob/living/carbon/human/proc/codespeak_commie,
		/mob/living/carbon/human/proc/codespeak_carrion,
		/mob/living/carbon/human/proc/codespeak_mutant,
		/mob/living/carbon/human/proc/codespeak_dead,
		/mob/living/carbon/human/proc/codespeak_corpse,
		/mob/living/carbon/human/proc/codespeak_criminal,
		/mob/living/carbon/human/proc/codespeak_unknown,
		/mob/living/carbon/human/proc/codespeak_status,
		/mob/living/carbon/human/proc/codespeak_detaining,
		/mob/living/carbon/human/proc/codespeak_shutup,
		/mob/living/carbon/human/proc/codespeak_understood,
		/mob/living/carbon/human/proc/codespeak_yes,
		/mob/living/carbon/human/proc/codespeak_no,
		/mob/living/carbon/human/proc/codespeak_detain_local,
		/mob/living/carbon/human/proc/codespeak_understood_local,
		/mob/living/carbon/human/proc/codespeak_yes_local,
		/mob/living/carbon/human/proc/codespeak_no_local,
		/mob/living/carbon/human/proc/codespeak_warcrime_local,
		/mob/living/carbon/human/proc/codespeak_rules_of_engagmentn_local,
		/mob/living/carbon/human/proc/codespeak_run_local
		)

/datum/perk/job/codespeak/assign(mob/living/carbon/human/H)
	..()
	if(holder)
		holder.verbs += codespeak_procs


/datum/perk/job/codespeak/remove()
	if(holder)
		holder.verbs -= codespeak_procs
	..()

/datum/perk/job/gunsmith
	name = "Gunsmith Master"
	desc = "You are a professional gunsmith, your knowledge allows to not only repair firearms but expertly craft them. \
			This includes the machines required to do so, including the bullet fabricator."
	icon_state = "knowledge"
