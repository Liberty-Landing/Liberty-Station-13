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

/datum/perk/job/artificer
	name = "Artificer"
	desc = "The fiery might grants boundless ingenuity - awe inspiring craftsmanship where every spark carries the promises of untamed power. \
			You gain more insight from all sources but can only increase your stats by crafting on an artisan's table."
	icon_state = "blacksmith" // https://game-icons.net/1x1/delapouite/blacksmith.html
	var/old_max_insight = INFINITY
	var/old_max_resting = INFINITY
	var/old_insight_rest_gain_multiplier = 1

/datum/perk/job/artificer/assign(mob/living/carbon/human/H)
	..()
	old_max_insight = holder.sanity.max_insight
	old_max_resting = holder.sanity.max_resting
	old_insight_rest_gain_multiplier = holder.sanity.insight_rest_gain_multiplier
	holder.sanity.max_insight = 100
	holder.sanity.insight_gain_multiplier *= 1.5
	holder.sanity.max_resting = 1
	holder.sanity.insight_rest_gain_multiplier = 0

/datum/perk/job/artificer/remove()
	holder.sanity.max_insight += old_max_insight - 100
	holder.sanity.insight_gain_multiplier /= 1.5
	holder.sanity.max_resting += old_max_resting - 1
	holder.sanity.insight_rest_gain_multiplier += old_insight_rest_gain_multiplier
	..()

/datum/perk/job/timeismoney // TODO! A perk that doesn't involve a free Chronos injection, specially for the Skylight CEO equivalent.
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
	name = "Inspiring Flame"
	desc = "When near a Torchbearer, you feel your mind at ease. You inner flame is strengthened by its presence, for within their fiery embrace lies not just warmth, but a solace that soothes the mind."
	gain_text = "You feel the warmth of a nearby torchbearer."
	lose_text = "The warmth from the torchbearer fades away."
	icon_state = "torchbearer" // https://game-icons.net/1x1/lorc/fire-silhouette.html

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

/datum/perk/job/phoenix_rekindlement
	name = "Phoenix Rekindlement"
	desc = "Your Hearthcore is more than just an emblem of knighthood. \
			Should you ever perish, it will attempt an emergency revival that may restore your body after a short time, in which you'll be unconscious."
	icon_state = "phoenix" // https://game-icons.net/1x1/lorc/condor-emblem.html

/datum/perk/job/chemist
	name = "Periodic Table"
	desc = "You know what the atoms around you react to and in what way they do. You are used to making organic substitutes and using them. \
			You get quarter more NSA than a normal person. You can also see all reagents in beakers."
	perk_shared_ability = PERK_SHARED_SEE_REAGENTS
	icon_state = "chemistry" // https://game-icons.net/1x1/skoll/atom.html

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
	icon_state = "selfmedicated"

/datum/perk/job/common_sense
	name = "Common Sense"
	desc = "You know what basic chemicals look like, from cleaning to cooking as well as the basics common chemicals."
	perk_shared_ability = PERK_SHARED_SEE_COMMON_REAGENTS
	icon_state = "knowledge"

/datum/perk/job/junkborn
	name = "Expert Scavenger"
	desc = "One man's trash is another man's salary. Removing a trash pile has a chance of revealing a valuable item nobody else would find."
	icon_state = "treasure" // https://game-icons.net

/datum/perk/job/sommelier
	name = "Sommelier"
	desc = "You know how to handle even the strongest alcohol in the universe and doing so improves your toughness."
	icon_state = "sommelier" // https://game-icons.net/1x1/lorc/martini.html

/datum/perk/job/handyman
	name = "Handyman"
	desc = "Training by the Terra-Therma Union has granted you the knowledge of how to take apart machines in the most efficient way possible, finding materials and supplies most people would miss. This training is taken further the more mechanically skilled or cognitively capable you are."
	icon_state = "engie" // https://game-icons.net/1x1/lorc/tinker.html

/datum/perk/job/handyman/assign(mob/living/carbon/human/H)
	..()


/datum/perk/job/handyman/remove()
	..()

/datum/perk/job/stalker
	name = "Anomaly Hunter"
	desc = "Special training from senior Shipbreakers and your own experience has allowed you to instinctively know the effects of greater oddities. By examining an oddity that has become an anomaly, you can tell what its greater boon or curse may be."
	icon_state = "inspect" // https://game-icons.net/1x1/lorc/lightning-tear.html

/datum/perk/job/market_prof
	name = "Market Professional"
	desc = "You've become an excellent appraiser of goods over the years. Just by looking at the item, you can know how much it would sell for in today's market rates."
	icon_state = "market_prof"

//Medical perks - relates to surgery and all.
/datum/perk/job/medicalexpertise
	name = "Medical Expertise"
	desc = "Your medical training and experience in the area of patient triage is unparalleled. 'Waste not, want not' is your motto, and you apply bandages and salves with utmost efficiency, sometimes using just the right amount of them."
	icon_state = "capsa" // https://game-icons.net/1x1/delapouite/rod-of-asclepius.html

/datum/perk/job/surgical_master
	name = "Surgery Training"
	desc = "While you may not know the more advanced medical procedures, your mandatory training on surgery for implantation purposes allows you to perform basic surgical procedures with ease."
	icon_state = "anatomy" // https://game-icons.net/1x1/lorc/anatomy.html

/datum/perk/job/advanced_medical
	name = "Advanced Surgical Techniques"
	desc = "Your surgical training and experience have tempered your special techniques for treating patients, \
			enabling you to make more effective and efficient use of your resources when reconstituting their bodies."
	icon_state = "scalpel" // https://game-icons.net/1x1/lorc/scalpel.html

/datum/perk/job/robotics_expert
	name = "Techno Tinkerer"
	desc = "Your formal training and experience in advanced mech construction and complex devices has made you more adept at working with them."
	icon_state = "tinker"  // https://game-icons.net/1x1/lorc/auto-repair.html

/datum/perk/job/robotics_expert/assign(mob/living/carbon/human/H)
	..()

/datum/perk/job/robotics_expert/remove()
	..()


/datum/perk/job/jingle_jangle
	name = "Key Smith"
	desc = "You have been granted a multitude of specially crafted electronic 'keys' \
			for opening most airlocks around the colony, and the knowledge \
			on how to use them has been solely been passed on to you. \
			Don't get discouraged, you will eventually find the right one..."
	icon_state = "keysmith"

/datum/perk/job/butcher
	name = "Master Butcher"
	desc = "Your skill as a butcher is unmatched, be it through your training or accumulated field experience. \
			You can harvest additional valuable parts from animals you cut up, nothing shall be wasted."
	icon_state = "butcher" // https://game-icons.net/1x1/lorc/meat-cleaver.html


/datum/perk/job/butcher/assign(mob/living/carbon/human/H)
	..()

/datum/perk/job/butcher/remove()
	..()

/datum/perk/job/master_herbalist
	name = "Naturalist"
	desc = "Experience in the field as a gatherer of food and resources in inclement weather has made you proficient \
			in harvesting strange plants that others would normally discard as useless. \
			You are also quite adept at making and efficiently using poultices and natural remedies, \
			and can recognise all reagents on a container while also having a natural talent for harvesting more produce out of plants."
	perk_shared_ability = PERK_SHARED_SEE_REAGENTS
	icon_state = "nature" // https://game-icons.net/1x1/lorc/daisy.html

/datum/perk/job/science
	name = "Science Training"
	desc = "You know how to use RnD core consoles and Exosuit Fabs."
	icon_state = "circuitry" // https://game-icons.net/1x1/lorc/circuitry.html

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

/datum/perk/job/foodappraise
	name = "Spice up Food"
	desc = "Your own special, secret touch in seasoning has anomalous properties that can enhance most food products."
	icon_state = "spice"
	active = FALSE
	passivePerk = FALSE

/datum/perk/job/foodappraise/activate()
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
	icon_state = "sanity_aura" // https://game-icons.net/1x1/lorc/beams-aura.html

/datum/perk/job/club/assign(mob/living/carbon/human/H)
	if(..())
		holder.sanity_damage -= 3

/datum/perk/job/club/remove()
	if(holder)
		holder.sanity_damage += 3
	..()


/datum/perk/job/radiance
	name = "Radiance Gentry"
	desc = "The Hearthcore is the heraldic of your knighthood ceremony, emblazed upon your back, igniting righteous fervor. \
			You are among the silver-bloodied, and the Radiance serves and sacrifices itself for you. You have an increased regeneration of Radiance."
	icon_state = "energy" // https://game-icons.net/1x1/lorc/fire-silhouette.html

// TODO: Custodian "alchemy" perk. WIP for now!
/datum/perk/job/apothecary
	name = "Apothecary"
	desc = "The aromantic symphony unfolds, tendrils of steam from concoctions whose essence \
			ignites a sensory dance on once dormant powers, trascending the ordinary - \
			all within a single vial."
	icon_state = "alchemy"

/datum/perk/job/influx //Perhaps we can nerf this making it related to how much radiance you have later down the line. Something you activate until the radiance reaches 0, no less.
	name = "Healing Influx"
	desc = "Deep within your bloodstream, radiant nanobots diligently mend and heal both yours and hearthcore bearers's wounds. \
	It relies on the hearthcore for transportation using Li-Fi systems, and does not seem to work with non-knight personnel."
	icon_state = "healinginflux" // https://game-icons.net/1x1/lorc/kindle.html
	var/healing_power = 0.1
	var/cooldown = 1 SECONDS // Just to make sure that perk don't go berserk.
	var/initial_time

/datum/perk/job/influx/assign(mob/living/carbon/human/H)
	..()
	initial_time = world.time

/datum/perk/job/influx/on_process()
	if(!..())
		return
	if(!holder.get_core_implant(/obj/item/implant/core_implant/hearthcore))
		return
	if(world.time < initial_time + cooldown)
		return
	initial_time = world.time
	for(var/mob/living/L in viewers(holder, 7))
		if(ishuman(L))
			var/mob/living/carbon/human/H = L
			if(H.stat == DEAD || !(H.get_core_implant(/obj/item/implant/core_implant/hearthcore)))
				continue
			H.adjustBruteLoss(-healing_power)
			H.adjustFireLoss(-healing_power)

/datum/perk/job/codespeak
	name = "Codespeak"
	desc = "You know Watchman codes."
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
	icon_state = "guns" // https://game-icons.net/1x1/delapouite/shotgun-rounds.html


// Outsider Perks

/datum/perk/job/tribal
	name = "Tribal Erudition"
	desc = "The Abyssal Mother Eris granted your people with knowledge. You saw the ones before you create wonders with the most basic of equipments. \
			From weapons, clothes, armor, equipments, guns and even a source of power. You have the knowledge to bring down the long darkness."
	icon_state = "tribal" // https://game-icons.net/1x1/delapouite/hut.html

/datum/perk/job/cultist
	name = "Precursor Heritage"
	desc = "Your faith comes with many blessings, and your inner psionic rays are by no means different. You've been granted the all-knowing eye. \
			You can manipulate what remains from the precursors as you see fit - the blood is by all means a delight to be controlled by the fingertips. \
			All you need to do is remain steadfast on your faith, and prove to the enlightened the alien races deserves to stay within the embrace of predestination."
	icon_state = "cult" // https://game-icons.net/1x1/lorc/holy-symbol.html
