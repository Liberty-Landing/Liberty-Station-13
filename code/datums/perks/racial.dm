//Perks for racial options, make sure to keep this organized.
//Perks can be both active and passive.

/////////////////
/* Human Perks */
/////////////////

/datum/perk/racial/human_will
	name = "Will to Survive"
	desc = "Your determination to survive and push on takes precedent before your other instincs making you ignore some of your pain and letting your body recover faster."
	active = FALSE
	passivePerk = FALSE

/datum/perk/racial/human_will/activate()
	var/mob/living/carbon/human/user = usr
	if(!istype(user))
		return ..()
	if(world.time < cooldown_time)
		to_chat(usr, SPAN_NOTICE("The human body can only take so much, you'll need more time before you've recovered enough to use this again."))
		return FALSE
	cooldown_time = world.time + 15 MINUTES
	user.visible_message("[user] grits their teeth and begins breathing slowly.", "You grit your teeth and remind yourself you ain't got time to bleed!")
	log_and_message_admins("used their [src] perk.")
	user.reagents.add_reagent("adrenol", 5)
	return ..()

/datum/perk/racial/human_battlecry
	name = "Inspiring Battlecry"
	desc = "Life has taught you that beyond sheer force of will, what made your kind conquer the stars was also a sense of camaraderie and cooperation among your battle brothers and sisters. Your heroic warcry can inspire yourself and others to better performance in combat."
	active = FALSE
	passivePerk = FALSE

/datum/perk/racial/human_battlecry/activate()
	var/mob/living/carbon/human/user = usr
	var/list/people_around = list()
	if(!istype(user))
		return ..()
	if(world.time < cooldown_time)
		to_chat(usr, SPAN_NOTICE("You cannot muster the willpower to have a heroic moment just yet."))
		return FALSE
	cooldown_time = world.time + 30 MINUTES
	log_and_message_admins("used their [src] perk.")
	for(var/mob/living/carbon/human/H in view(user))
		if(H != user && !isdeaf(H))
			people_around.Add(H)
	if(people_around.len > 0)
		for(var/mob/living/carbon/human/participant in people_around)
			to_chat(participant, SPAN_NOTICE("You feel inspired by a heroic shout!"))
			give_boost(participant)
	give_boost(usr)
	usr.emote("urah")
	return ..()

/datum/perk/racial/human_battlecry/proc/give_boost(mob/living/carbon/human/participant)
	var/effect_time = 2 MINUTES
	var/amount = 10
	var/list/stats_to_boost = list(STAT_ROB = 10, STAT_TGH = 10, STAT_VIG = 10)
	for(var/stat in stats_to_boost)
		participant.stats.changeStat(stat, amount)
		addtimer(CALLBACK(src, .proc/take_boost, participant, stat, amount), effect_time)

/datum/perk/racial/human_battlecry/proc/take_boost(mob/living/carbon/human/participant, stat, amount)
	participant.stats.changeStat(stat, -amount)

/datum/perk/racial/human_tenacity
	name = "Tenacity"
	desc = "Humans were always resilient, not letting anything or anyone to get in way of their goals. Due to this your body is way more adapted to anything thrown it's way letting you push onward for just a little bit longer than others."

/////////////////////
/* Sablekyne Perks */
/////////////////////

/datum/perk/racial/sable_laststand
	name = "Last Stand"
	desc = "As a sablekyne your body is a tank, through will and biology you can ignore pain entirely for a short amount of time."
	active = FALSE
	passivePerk = FALSE

/datum/perk/racial/sable_laststand/activate()
	var/mob/living/carbon/human/user = usr
	if(!istype(user))
		return ..()
	if(world.time < cooldown_time)
		to_chat(usr, SPAN_NOTICE("Your nerves are shot, you'll need to recover before you can withstand greater pain again."))
		return FALSE
	cooldown_time = world.time + 15 MINUTES
	user.visible_message("<b><font color='red'>[user] begins growling as their muscles tighten!</font><b>", "<b><font color='red'>You feel a comfortable warmth as your body steels itself against all pain.</font><b>", "<b><font color='red'>You hear something growling!</font><b>")
	log_and_message_admins("used their [src] perk.")
	user.reagents.add_reagent("sabledone", 10)
	return ..()

/datum/perk/racial/sable_bone
	name = "Bone Plated"
	desc = "All sablekyne are covered in bone-like plating across various parts of the body, this layer of natural armor along the shins, thighs, fore-arms, and shoulders allow you to absorb impacts better than anyone, adding a further tolerance to pain."
	//icon_state = "" // - No icon, suggestion - Riot Shield?

/datum/perk/racial/sable_brawn
	name = "Brawny Build"
	desc = "All sablekyne are stocky and built wide, your brawny build and low center of gravity gives you exceptional balance. Few beasts can knock you down and not even the strongest men can push you over."
	//icon_state = "muscular" // https://game-icons.net

/datum/perk/racial/sable_brawn/assign(mob/living/carbon/human/H)
	..()
	holder.mob_bump_flag = HEAVY

/datum/perk/racial/sable_brawn/remove()
	holder.mob_bump_flag = ~HEAVY
	..()

////////////////////
/* Mar'qua  Perks */
////////////////////

/datum/perk/racial/squid_brilliance
	name = "Sudden Brilliance"
	desc = "Your intelligence is above the 'lesser races' and even the humblest of Mar'qua can prove it easily in moments of focus. Use this to center your thoughts and increase all your mental abilities."
	active = FALSE
	passivePerk = FALSE

/datum/perk/racial/squid_suddenbrilliance/activate()
	var/mob/living/carbon/human/user = usr
	if(!istype(user))
		return ..()
	if(world.time < cooldown_time)
		to_chat(usr, SPAN_NOTICE("You are mentally exhausted, you'll need more rest before you can attempt greater thought."))
		return FALSE
	cooldown_time = world.time + 25 MINUTES
	user.visible_message("[user] suddenly looks lost in thought, their focus elsewhere for a moment.", "You clear your mind and feel your thoughts focusing into a single stream of brilliance.", "You hear the calming silence, as if someone nearby is thinking deeply.")
	log_and_message_admins("used their [src] perk.")
	user.reagents.add_reagent("marquatol", 10)
	return ..()

/datum/perk/racial/squid_inspired
	name = "Inspired Intellect"
	desc = "Even the most humble Mar'qua is capable of study and extrapolation, your natural intellect allows you to become gain inspiration more easily."

/datum/perk/racial/squid_inspired/assign(mob/living/carbon/human/H)
	if(..())
		holder.sanity.insight_passive_gain_multiplier *= 1.5

/datum/perk/racial/squid_inspired/remove()
	if(holder)
		holder.sanity.insight_passive_gain_multiplier /= 1.5
	..()

/datum/perk/racial/squid_alien_nerves
	name = "Adapted Nervous System"
	desc = "A mar'qua's nervous system has long since adapted to the use of stimulants, chemicals, and different toxins. Unlike lesser races, you can handle a wide variety of chemicals before showing any side effects and you'll never become addicted."

/datum/perk/racial/squid_alien_nerves/assign(mob/living/carbon/human/H)
	..()
	holder.metabolism_effects.addiction_chance_multiplier = -1
	holder.metabolism_effects.nsa_bonus += 300
	holder.metabolism_effects.calculate_nsa()

/datum/perk/racial/squid_alien_nerves/remove()
	holder.metabolism_effects.addiction_chance_multiplier = 1
	holder.metabolism_effects.nsa_bonus -= 300
	holder.metabolism_effects.calculate_nsa()
	..()

////////////////////
/* Kriosan  Perks */
////////////////////

/datum/perk/racial/kriosan_senses
	name = "Enhance Senses"
	desc = "You're a predator at heart and have the senses to match, for a short time your body toughens and your aim improves drastically as your senses enhance."
	active = FALSE
	passivePerk = FALSE

/datum/perk/racial/kriosan_senses/activate()
	var/mob/living/carbon/human/user = usr
	if(!istype(user))
		return ..()
	if(world.time < cooldown_time)
		to_chat(usr, SPAN_NOTICE("You haven't quite recovered yet, your senses need more time before you may use this again."))
		return FALSE
	cooldown_time = world.time + 15 MINUTES
	user.visible_message("<b><font color='red'>[user] sneers lightly as their pupils dilate and tension builds in their body!</font><b>", "<b><font color='red'>You feel your senses focusing, sound becomes crystal clear and your reflexes as fluid as water.</font><b>")
	log_and_message_admins("used their [src] perk.")
	user.reagents.add_reagent("kriotol", 5)
	return ..()

/datum/perk/racial/kriosan_instincs
	name = "Instinctual Skill"
	desc = "All kriosans understand the dynamics of shooting, to such a degree that guns are more extensions to one's hand than weapon. You take no penalty when firing any range weapon one handed."

/datum/perk/racial/kriosan_bolt_reflect
	name = "Bolt Action Rifle Training"
	desc = "Through intense and repetitive training with bolt-action and lever-action rifles, you will always chamber a new round instantly after firing."
	icon_state = "skills"

/datum/perk/racial/kriosan_command
	name = "Commanding Presence"
	desc = "You know just what to say to people and are able to inspire the best - or even worst - in others. \
			People around you regain their sanity quicker."
	icon_state = "inspiration"

/datum/perk/racial/kriosan_command/assign(mob/living/carbon/human/H)
	if(..())
		holder.sanity_damage -= 2

/datum/perk/racial/kriosan_command/remove()
	if(holder)
		holder.sanity_damage += 2
	..()

//////////////////
/* Akula  Perks */
//////////////////

/datum/perk/racial/akula_frenzy
	name = "Reckless Frenzy"
	desc = "Your body is powerful and strong when you succumb to instinct, but doing so leaves you without much higher reasoning for a short time. The rush of chemicals is also highly addictive \
	and often times will leave your body weaker for a short time."
	active = FALSE
	passivePerk = FALSE

/datum/perk/racial/akula_frenzy/activate()
	var/mob/living/carbon/human/user = usr
	if(!istype(user))
		return ..()
	if(world.time < cooldown_time)
		to_chat(usr, SPAN_NOTICE("Your body has been taxed to its limits, you need more time to recover before using this ability again."))
		return FALSE
	cooldown_time = world.time + 15 MINUTES
	user.visible_message("<b><font color='red'>[user] lets out deep guttural growl as their eyes glaze over!</font><b>", "<b><font size='3px'><font color='red'>You abandon all reason as your sink into a blood thirsty frenzy!</font><b>", "<b><font color='red'>You hear a terrifying roar!</font><b>")
	playsound(usr.loc, 'sound/voice/akularoar.ogg', 50, 1)
	log_and_message_admins("used their [src] perk.")
	user.reagents.add_reagent("robustitol", 5)
	return ..()

/datum/perk/racial/akula_iron_flesh
	name = "Iron Flesh"
	desc = "Akula scales are not only tough and resistant to damage but exceptionally skilled at naturally forcing out embedded objects that somehow punch through. You'll never get a bullet nor object stuck inside when hit."


////////////////////
/* Naramad  Perks */
////////////////////

/datum/perk/racial/naramad_adrenaline
	name = "Adrenaline Burst"
	desc = "Naramads are built for extreme speed, be it for charging forward and retreating back."
	active = FALSE
	passivePerk = FALSE

/datum/perk/racial/naramad_adrenaline/activate()
	var/mob/living/carbon/human/user = usr
	if(!istype(user))
		return ..()
	if(world.time < cooldown_time)
		to_chat(usr, SPAN_NOTICE("Your legs ache, you'll need more time to recover before using this again."))
		return FALSE
	cooldown_time = world.time + 15 MINUTES
	user.visible_message("[user] begins breathing much quicker as they let out a merp!", "You feel your heart rate increasing rapidly as everything seems to speed up and you let out an excited merp!", "You hear a loud merp...")
	playsound(usr.loc, 'sound/voice/merp.ogg', 50, 1)
	log_and_message_admins("used their [src] perk.")
	user.reagents.add_reagent("naratonin", 5)
	return ..()

/datum/perk/racial/naramad_hydration
	name = "Hydration Reliance"
	desc = "Naramad have adapted biology heavily reliant on the intake of fluids, in particular clean clear water. Drinking purified water, even tap water, heals your body slowly, as if you drank tricordizine!"

/datum/perk/racial/naramad_warrior
	name = "Born Warrior"
	desc = "No matter their background all naramadi are capable bringing any object to bear as a weapon, be it bladed or blunt. Unlike other races your grip is iron and you'll never lose your weapon through embedding it in an enemy."

//////////////////////
/* Cindarite  Perks */
//////////////////////

/datum/perk/racial/cindarite_purge_toxin
	name = "Purge Toxins"
	desc = "You force your body to begin the process of removing toxins from your blood. All toxins, addictions, and stimulants are slowly purged while any toxin damage to your liver or body is healed but the effect leaves you exhausted."
	active = FALSE
	passivePerk = FALSE

/datum/perk/racial/cindarite_purge_toxin/activate()
	var/mob/living/carbon/human/user = usr
	if(!istype(user))
		return ..()
	if(world.time < cooldown_time)
		to_chat(usr, SPAN_NOTICE("Your body aches with the pain of its recent purge, you'll need more rest before using this effect again."))
		return FALSE
	cooldown_time = world.time + 15 MINUTES
	user.visible_message("[user] shivers slightly as they begin to slow down.", "You start to feel quite chilly and tired as your body begins purging toxins within your blood.")
	log_and_message_admins("used their [src] perk.")
	user.reagents.add_reagent("cindpetamol", 5)
	return ..()

/datum/perk/racial/cindarite_purge_infection
	name = "Uncanny Resiliance"
	desc = "Your body is adept not only at curing toxins and regulating its blood flow but also fighting off infections and disease in any form. All infections within you are slowly cured and diseases progression slowed if not outright cured, similar to as if you were injected with spaceacillin. Severe infections or late stage diseases may still need additional medical aid and this cannot restore necrotic tissue."
	active = FALSE
	passivePerk = FALSE

/datum/perk/racial/cindarite_purge_infection/activate()
	var/mob/living/carbon/human/user = usr
	if(!istype(user))
		return ..()
	if(world.time < cooldown_time)
		to_chat(usr, SPAN_NOTICE("Your chemical sacks have not refilled yet, you'll need more rest before using this effect again."))
		return FALSE
	cooldown_time = world.time + 30 MINUTES
	user.visible_message("[user] shivers slightly before taking a deep breath.", "You shiver slightly and take a deep breath before willing your bodies chemical sacks to open and begin purging infections.")
	log_and_message_admins("used their [src] perk.")
	user.reagents.add_reagent("cindicillin", 5)
	return ..()

/datum/perk/racial/cindarite_second_skin
	name = "Second Skin"
	desc = "Cindarites, be they bunker born or spacers, are used to wearing bulky enviromental suits. This life time of being acclimated to heavy clothing has become a second skin for many, allowing you to remove clothing instantly and only suffer half the slowdown from heavy armor."

/////////////////////
/* Cht'mant  Perks */
/////////////////////

/datum/perk/racial/chmant_spiderfriend
	name = "Kin to the Spiders"
	desc = "Through a combination of pheromones, appearance, and an innate understanding of spider behavior all spiders are friendly to you, they won't attack you even if you attack them. This change \
	in your biology and pheromones however make you an enemy to roaches. As a side effect of dealing with spiders so often, you can't be slowed or stuck by webbing."
	//icon_state = "muscular" // https://game-icons.net

/datum/perk/racial/chmant_spiderfriend/assign(mob/living/carbon/human/H)
	..()
	holder.faction = "spiders"

/datum/perk/racial/chmant_spiderfriend/remove()
	holder.faction = "neutral"
	..()

/datum/perk/racial/chmant_webmaker
	name = "Spin Webs"
	desc = "You can spin webs, spreading them around a location as a form of snaring barricade."
	active = FALSE
	passivePerk = FALSE

/datum/perk/racial/chmant_webmaker/activate()
	var/mob/living/carbon/human/user = usr
	if(!istype(user))
		return ..()
	if(world.time < cooldown_time)
		to_chat(usr, SPAN_NOTICE("You need a bit more time to build up your web reserves!"))
		return FALSE
	cooldown_time = world.time + 5 SECONDS
	user.visible_message("[user] begins secreting and spreading web material around them.", "You begin secreting and spreading your webbing around.", "You hear an uncomfortable chittering noise.")
	//log_and_message_admins("used their [src] perk.") //commented out due to spam in the logs.
	new /obj/effect/spider/stickyweb/chtmant(usr.loc)
	return ..()

/datum/perk/racial/chmant_ichor
	name = "Produce Ichor"
	desc = "As a member of the Ru caste your ability to produce chemicals is well known, though it takes an hour to recover and much of your nutritional in-take you can produce clumped ichors that function as medical kits."
	active = FALSE
	passivePerk = FALSE

/datum/perk/racial/chmant_ichor/activate()
	var/mob/living/carbon/human/user = usr
	if(!istype(user))
		return ..()
	if(world.time < cooldown_time)
		to_chat(usr, SPAN_NOTICE("Your body hasn't finished recovering, you will need to wait a bit longer."))
		return FALSE
	if(usr.nutrition <= 350)
		to_chat(usr, SPAN_NOTICE("You do not have enough nutrition to produce more ichor, find things to eat!"))
		return FALSE
	cooldown_time = world.time + 1 HOURS
	usr.nutrition -= 350
	user.visible_message("<b><font color='red'>[user] vomits different colored slime onto the floor!</font><b>", "<b><font color='red'>You vomit out your healing ichors onto the floor!</font><b>", "<b><font color='red'>You hear a retching noise!</font><b>")
	log_and_message_admins("used their [src] perk.")
	playsound(usr.loc, 'sound/effects/blobattack.ogg', 50, 1)
	new /obj/item/stack/medical/bruise_pack/advanced/mending_ichor(usr.loc)
	new /obj/item/stack/medical/ointment/advanced/regenerative_ichor(usr.loc)
	new /obj/item/stack/ichor/purging_ichor(usr.loc)
	return ..()

/datum/perk/racial/chmant_chitinarmor
	name = "Chitin Armor"
	desc = "Unlike other caste in the cht'mant hive you are built for combat, while not as naturally tough as other species you can tank a few more blows than your softer insectile brethren."
	//icon_state = "" // - No icon, suggestion - Riot Shield?

/datum/perk/racial/chmant_chitinarmor/assign(mob/living/carbon/human/H)
	..()
	holder.brute_mod_perk -= 0.15 // Reduces total brute damage to +10% **taken** instead of +25%
	holder.mob_bomb_defense += 5
	holder.falls_mod -= 0.2

/datum/perk/racial/chmant_chitinarmor/remove()
	holder.brute_mod_perk += 0.15
	holder.mob_bomb_defense -= 5
	holder.falls_mod += 0.2
	..()

/datum/perk/racial/chmant_scuttlebug
	name = "Scuttlebug"
	desc = "While your definitive purpose is not as clearly defined as other castes within the cht'mant hive your constant movement and labors have made you quite used to the hustle and bustle, letting you run faster than most races."
	//icon_state = "fast" // https://game-icons.net/1x1/delapouite/fast-forward-button.html

/datum/perk/racial/chmant_repair_goo
	name = "Produce Repair Goo"
	desc = "Fixing things is apart of your caste as it is scuttling around keeping yourself busy. As such you can vomit out glue-like goo that functions exceptionally well for tool and general repairs."
	active = FALSE
	passivePerk = FALSE

/datum/perk/racial/chmant_repair_goo/activate()
	var/mob/living/carbon/human/user = usr
	if(!istype(user))
		return ..()
	if(world.time < cooldown_time)
		to_chat(usr, SPAN_NOTICE("Your body hasn't finished recovering, you will need to wait a bit longer."))
		return FALSE
	if(usr.nutrition <= 350)
		to_chat(usr, SPAN_NOTICE("You do not have enough nutrition to produce more goo, find things to eat!"))
		return FALSE
	cooldown_time = world.time + 1 HOURS
	usr.nutrition -= 350
	user.visible_message("<b><font color='red'>[user] vomits a sticky gray tar onto the floor!</font><b>", "<b><font color='red'>You vomit out your repair goo onto the floor!</font><b>", "<b><font color='red'>You hear a retching noise!</font><b>")
	log_and_message_admins("used their [src] perk.")
	playsound(usr.loc, 'sound/effects/blobattack.ogg', 50, 1)
	new /obj/item/tool/tape_roll/repair_goo(usr.loc)
	return ..()

///////////////////
/* Opifex  Perks */
///////////////////

/datum/perk/racial/opifex_raven
	name = "Ravenous Instincts"
	desc = "Even throught the endless trials and experiments at the end of it you are still an animal. While your brain is still underdeveloped compared to a humanoid your animal instincts make up for this. \
	You gain insight into things slower but movement over rough surfaces and especially falling from high places is second nature to you."

/datum/perk/racial/opifex_raven/assign(mob/living/carbon/human/H)
	if(..())
		holder.sanity.insight_passive_gain_multiplier *= 0.8
		holder.falls_mod -= 0.9

/datum/perk/racial/opifex_raven/remove()
	if(holder)
		holder.sanity.insight_passive_gain_multiplier /= 1
		holder.falls_mod += 0.9
	..()

//////////////////
/* Slime  Perks */
//////////////////

/datum/perk/racial/limb_regen
	name = "Gelatinous Regeneration"
	desc = "Spend nutrition to regenerate lost limbs, albeit without fully fixing your injuries."
	var/cooldown = 30 MINUTES
	passivePerk = FALSE
	var/nutrition_cost = 300

/datum/perk/racial/limb_regen/activate()
	if(world.time < cooldown_time)
		to_chat(usr, SPAN_NOTICE("You can't regenerate again so soon!"))
		return FALSE
	cooldown_time = world.time + cooldown
	holder.nutrition -= nutrition_cost
	for(var/obj/item/organ/external/current_organ in holder.organs) //grab the current brute/burn of the limb, then re-apply half of it after rejuvenating OR subtract ten, whichever is lower
		var/old_brute = current_organ.brute_dam
		var/old_burn = current_organ.burn_dam
		if(!(current_organ == BP_HEAD))
			current_organ.replaced()
		current_organ.rejuvenate()
		current_organ.brute_dam = max(0, min((old_brute / 2), (old_brute - 10)))
		current_organ.burn_dam = max(0, min((old_burn / 2), (old_burn - 10)))

/datum/perk/racial/slime_metabolism
	name = "Gelatinous Biology"
	desc = "Your abnormal biology allows you to benefit from most toxins - however, many antitoxins are outright harmful to you." //This perk doesn't actually cause the slime-specific chem metabolism effects
	passivePerk = TRUE

/datum/perk/racial/slime_metabolism/assign(mob/living/carbon/human/H)
	..()
	holder.toxin_mod_perk -= 0.5

/datum/perk/racial/slime_metabolism/better_toxins/remove()
	holder.toxin_mod_perk += 0.5
	..()
