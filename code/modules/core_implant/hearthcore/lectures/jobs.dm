#define REPAIR_COST 25

//////////////////////////////////////////////////
/////////         OATHBOUND             /////////
//////////////////////////////////////////////////

/datum/lecture/hearthcore/oathbound
	name = "Hearthcore"
	phrase = null
	implant_type = /obj/item/implant/core_implant/hearthcore
	category = "Oathbound"
	ignore_stuttering = TRUE

/datum/lecture/targeted/hearthcore/oathbound
	name = "Hearthcore targeted"
	phrase = null
	implant_type = /obj/item/implant/core_implant/hearthcore
	category = "Oathbound"
	ignore_stuttering = TRUE

datum/lecture/hearthcore/oathbound/fireball
	name = "Manifestation of Flames"
	phrase = "Oxidate Lecture: Manifestation of Flames."
	desc = "Allows your radiance to spread to the surface of your skin, creating a protective layer before releasing concentrated, launchable plasma."
	power = 35

/datum/lecture/hearthcore/oathbound/fireball/perform(mob/living/carbon/human/lecturer, obj/item/implant/core_implant/C)
	var/obj/item/gun/custodian_fireball/flame = new /obj/item/gun/custodian_fireball(src, lecturer)
	lecturer.visible_message(
		"As [lecturer] speaks, their hand is covered in a fierce blue fireball.",
		"A blue fireball completely covers one of your hands."
		)
	playsound(usr.loc, pick('sound/effects/sparks1.ogg','sound/effects/sparks2.ogg','sound/effects/sparks3.ogg'), 50, 1, -3)
	usr.put_in_hands(flame)
	return TRUE

/obj/item/gun/custodian_fireball //the fireball item created by Manifestation of Flames
	name = "radiant fireball"
	desc = "A summoned, throwable fireball that disappears if dropped, or by closing your hand."
	icon = 'icons/obj/guns/projectile/fireball.dmi'
	icon_state = "fireball_lecture"
	item_state = "fireball_lecture"
	origin_tech = list()
	fire_sound = 'sound/effects/magic/fireball.ogg' // Proper fireball firing sound courtesy of tg
	fire_sound_text = "fireball"
	max_upgrades = 0
	slot_flags = null
	w_class = ITEM_SIZE_HUGE
	damtype = BURN
	var/projectile_type = /obj/item/projectile/custodian_fireball // What does it shoot
	var/use_amount = 1 // How many times can it be used
	var/mob/living/carbon/holder // Used to delete when dropped
	serial_shown = FALSE
	safety = FALSE

/obj/item/gun/custodian_fireball/New(var/loc, var/mob/living/carbon/lecturer)
	..()
	holder = lecturer
	START_PROCESSING(SSobj, src)

/obj/item/gun/custodian_fireball/consume_next_projectile()
	if(!ispath(projectile_type)) // Do we actually shoot something?
		return null
	if(use_amount <= 0) //Are we out of charges?
		return null
	use_amount -= 1
	return new projectile_type(src)

/obj/item/gun/custodian_fireball/Process()
	if(loc != holder || (use_amount <= 0)) // We're no longer in the lecturer's hand or we're out of charges.
		visible_message("[src] fades into nothingness.")
		STOP_PROCESSING(SSobj, src)
		qdel(src)
		return

// Alternative to drop it: Use in hand to extinguish
/obj/item/gun/custodian_fireball/attack_self(mob/user)
	user.visible_message(SPAN_NOTICE("[user] closes their palm, extinguishing the fireball."), SPAN_NOTICE("You close your hand and decide to extinguish \the [src]."), "You hear sizzling stop.")
	STOP_PROCESSING(SSobj, src)
	qdel(src)
	return

/obj/item/projectile/custodian_fireball //the fireball projectile used
	name = "fireball"
	icon_state = "fireball_lecture"
	damage_types = list(BURN = WEAPON_FORCE_NORMAL) //deal 10 burn

/obj/item/projectile/custodian_fireball/on_impact(atom/target)
	scorch_attack(target) //now that you've hit something, trigger a scorch attack of 20 damage
	return TRUE

/obj/item/projectile/blazelance //the nobility projectile used
	name = "blazelance"
	icon_state = "firelance_discharger"
	damage_types = list(BURN = WEAPON_FORCE_NORMAL) //deal 10 burn

/* might exist eventually, might not

/obj/item/gun/custodian_fireball/explosion
	projectile_type = /obj/item/projectile/custodian_bigfireball

/obj/item/projectile/custodian_bigfireball
	name = "fireball"
	icon_state = "fireball_lecture"
	var/list/explosion_values = list(0, 1, 2, 4) // Explosions strengths, same value as a regular missile.

/obj/item/projectile/custodian_bigfireball/on_impact(atom/target)
	explosion(loc, explosion_values[1], explosion_values[2], explosion_values[3], explosion_values[4])
	return TRUE

datum/lecture/hearthcore/oathbound/fireball_big
	name = "Manifestation of Inferno"
	phrase = "Oxidate Lecture: Manifestation of Inferno."
	desc = "Create a launchable exploding fireball on a free hand."
	power = 25

/datum/lecture/hearthcore/oathbound/fireball_big/perform(mob/living/carbon/human/lecturer, obj/item/implant/core_implant/C)
	var/obj/item/gun/custodian_fireball/explosion/flame = new /obj/item/gun/custodian_fireball/explosion(src, lecturer)
	lecturer.visible_message(
		"As [lecturer] speaks, their hand is covered in a fierce blue fireball.",
		"A blue fireball completely covers one of your hands."
		)
	playsound(usr.loc, pick('sound/effects/sparks1.ogg','sound/effects/sparks2.ogg','sound/effects/sparks3.ogg'), 50, 1, -3)
	usr.put_in_hands(flame)
	return TRUE
*/

/datum/lecture/hearthcore/oathbound/eyeflare
	name = "Eyeflare"
	phrase = "Oxidate Lecture: Eyeflare."
	desc = "This lecture causes a bright flash in a short radius around the user. Has a cooldown of three minutes."
	power = 30
	cooldown = TRUE
	cooldown_time = 3 MINUTES
	cooldown_category = "eyeflare"

/datum/lecture/hearthcore/oathbound/eyeflare/perform(mob/living/carbon/human/H, obj/item/implant/core_implant/C)
	for(var/mob/living/carbon/M in view(2, H)) //get everything in a 2 tile radius, including the user
		if(issuperioranimal(M)) //is it a superior_animal?
			var/mob/living/carbon/superior_animal/G = M //get a new temporary var pathed to superior animals, since flash_resistances do not exist on living/carbon, set it to the already gathered and checked M
			G.Weaken((10 - G.flash_resistances)) //trigger a regular flash effect on superior animals, 10 minus their resistance
		var/safety = M.eyecheck()
		if(safety < FLASH_PROTECTION_MINOR) //any amount of flash protection nullifies this
			M.flash(3, FALSE, FALSE, TRUE)
	H.visible_message("A flash of light flares out of [H]!")
	set_personal_cooldown(H)
	return TRUE

/datum/lecture/hearthcore/oathbound/radiance_neural
	name = "Radiance Neural Expression"
	phrase = "Oxidate Lecture: Radiance Neural Expression."
	desc = "You impart a portion of your cognizance on another, gifting them with Insight from your own experiences. In doing so, you sacrifice some of your own. Requires thirty minutes between uses."
	cooldown = TRUE
	cooldown_time = 30 MINUTES
	cooldown_category = "radiance_neural"
	power = 65

/datum/lecture/hearthcore/oathbound/radiance_neural/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	var/mob/living/carbon/human/T = get_front_human_in_range(user, 1)
	if(!T)
		fail("No target in front of you.", user, C)
		return FALSE

	if(user.sanity.insight >= 25 && user.species?.reagent_tag != IS_SYNTHETIC && T.species?.reagent_tag != IS_SYNTHETIC)
		user.sanity.insight -= 25
		T.sanity.insight += 50
		to_chat(user, "<span class='info'>You offer your insight to [T.name], your meditation boosting another, allowing them a glimpse at your perceptions.</span>")
		to_chat(T, "<span class='info'>You feel inspired, a new perspective offered by another, showing you the same picture from a different angle.</span>")
		set_personal_cooldown(user)
	else
		to_chat(user, SPAN_WARNING("You lack the personal insight to impart more to another, time and meditation will allow you to try again."))
		return FALSE

	return FALSE


/datum/lecture/hearthcore/oathbound/searing_of_torment
	name = "Searing of Torment"
	phrase = "Oxidate Lecture: Searing of Torment."
	desc = "A short lecture that removes all pain and heals some damage, requires fifteen minutes between uses."
	power = 50
	cooldown = TRUE
	cooldown_time = 15 MINUTES
	cooldown_category = "searing"

/datum/lecture/hearthcore/oathbound/searing_of_torment/perform(mob/living/carbon/human/H, obj/item/implant/core_implant/C)
	H.reagents.add_reagent("nepenthe", 10)
	H.adjustBruteLoss(-10)
	H.adjustFireLoss(-10)
	H.adjustOxyLoss(-20)
	H.adjustBrainLoss(-5)
	H.updatehealth()
	set_personal_cooldown(H)
	return TRUE

/datum/lecture/hearthcore/oathbound/scorching_shell
	name = "Scorching Shell"
	phrase = "Oxidate Lecture: Scorching Shell."
	desc = "A lecture that channels radiance by the bloodstream, enveloping the skin in a silvery layer. The speaker bear the substantial burden of radiance covering their skin, yet the protection diminishes all harm inflicted upon them. This lecture has a cooldown of fifteen minutes, so the radiance can replenish."
	cooldown = TRUE
	cooldown_time = 15 MINUTES
	cooldown_category = "scorching_shell"
	effect_time = 1 MINUTES
	power = 90

/datum/lecture/hearthcore/oathbound/scorching_shell/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	user.stats.addPerk(PERK_SCORCHING_SHELL) //Adding a temporary perk due to the slowdown, simply adding slowdown via += will see it reset in seconds
	set_personal_cooldown(user)
	addtimer(CALLBACK(src, .proc/discard_effect, user), src.effect_time)
	return TRUE

/datum/lecture/hearthcore/oathbound/scorching_shell/proc/discard_effect(mob/living/carbon/human/user)
	if(!user)
		return
	user.stats.removePerk(PERK_SCORCHING_SHELL)

/datum/lecture/hearthcore/oathbound/scorching_smite
	name = "Scorching Smite"
	phrase = "Oxidate Lecture: Scorching Smite."
	desc = "A short lecture activated in the middle of battle, it empowers the user's muscular fast-twitch fibers and oxigenation, allowing far stronger strikes for thirty seconds. Takes five minutes to recharge - to avoid harming the user from overuse."
	cooldown = TRUE
	cooldown_time = 5 MINUTES
	cooldown_category = "scorching_smite"
	effect_time = 30 SECONDS
	power = 25
	var/wrath_damage = 0.2

/datum/lecture/hearthcore/oathbound/scorching_smite/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	user.damage_multiplier += wrath_damage //increase the user's damage multiplier
	to_chat(user, SPAN_NOTICE("You feel righteous wrath empowering you with immense but fleeting strength!"))
	set_personal_cooldown(user)
	addtimer(CALLBACK(src, .proc/discard_effect, user), src.effect_time) //set a timer to remove the buff
	return TRUE

/datum/lecture/hearthcore/oathbound/scorching_smite/proc/discard_effect(mob/living/carbon/human/user)
	if(!user)
		return
	user.damage_multiplier -= wrath_damage //remove the buff
	to_chat(user, SPAN_NOTICE("Your wrath subsides"))

/datum/lecture/hearthcore/oathbound/restraint_conflagration
	name = "Restraint Conflagration"
	phrase = "Oxidate Lecture: Restraint Conflagration."
	desc = "A lecture that emboldens the body and muscles for five minutes, making you tougher and more robust. Requires thirty minutes between uses."
	cooldown = TRUE
	cooldown_time = 30 MINUTES
	cooldown_category = "restraint_conflagration"
	effect_time = 5 MINUTES
	power = 90

/datum/lecture/hearthcore/oathbound/restraint_conflagration/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	user.stats.changeStat(STAT_TGH, 10) //make alterations
	user.stats.changeStat(STAT_ROB, 10)
	to_chat(user, SPAN_NOTICE("You feel emboldened, your body growing in strength and fortitude."))
	set_personal_cooldown(user)
	addtimer(CALLBACK(src, .proc/discard_effect, user), src.effect_time) //set a timer
	return TRUE

/datum/lecture/hearthcore/oathbound/restraint_conflagration/proc/discard_effect(mob/living/carbon/human/user)
	if(!user)
		return
	user.stats.changeStat(STAT_TGH, -10)
	user.stats.changeStat(STAT_ROB, -10) //remove alterations
	to_chat(user, SPAN_NOTICE("You no longer feel emboldened."))

/datum/lecture/hearthcore/oathbound/ignite_flesh
	name = "Ignite Flesh"
	phrase = "Oxidate Lecture: Ignite Flesh."
	desc = "Recite the lecture to ignite the surrounding bodies of those without a Hearthcore."
	power = 60

/datum/lecture/hearthcore/oathbound/ignite_flesh/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	for(var/mob/living/M in view(2, user)) //get everything alive
		if(!M.get_core_implant(/obj/item/implant/core_implant/hearthcore)) //no hearthcore users
			scorch_attack(M) //trigger scorch attack
	user.visible_message(SPAN_DANGER("A wave of flame radiates out from [user]!"))
	return TRUE

//////////////////////////////////////////////////
/////////         ENKINDLED             /////////
//////////////////////////////////////////////////

/datum/lecture/hearthcore/enkindled
	name = "Hearthcore"
	phrase = null
	implant_type = /obj/item/implant/core_implant/hearthcore
	category = "Enkindled"
	ignore_stuttering = TRUE

/datum/lecture/targeted/hearthcore/enkindled
	name = "Hearthcore targeted"
	phrase = null
	implant_type = /obj/item/implant/core_implant/hearthcore
	category = "Enkindled"
	ignore_stuttering = TRUE

/datum/lecture/hearthcore/enkindled/succour
	name = "Succour"
	phrase = "Oxidate Lecture: Succour."
	desc = "Heal a nearby Hearthcore user. Has a five minute cooldown"
	cooldown = TRUE
	cooldown_time = 5 MINUTES
	cooldown_category = "succour"
	power = 35

/datum/lecture/hearthcore/enkindled/succour/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C,list/targets)
	var/obj/item/implant/core_implant/hearthcore/CI = get_implant_from_victim(user, /obj/item/implant/core_implant/hearthcore)

	if(!CI || !CI.active || !CI.wearer)
		fail("Hearthcore not found.", user, C)
		return FALSE

	var/mob/living/carbon/human/H = CI.wearer

	user.visible_message("[user] places their hands upon [H]", "You lay your hands upon [H]")
	if (do_after(user, 40, H, TRUE))
		var/turf/T = get_turf(user)
		if (!(T.Adjacent(get_turf(H)))) //are we next to the target after the do_after?
			to_chat(user, SPAN_DANGER("[H] is beyond your reach..")) //no? fail
			return FALSE
		log_and_message_admins(" healed [CI.wearer] with the Succour lecture")
		to_chat(H, "<span class='info'>A sensation of relief bathes you, washing away your pain</span>")
		H.add_chemical_effect(CE_PAINKILLER, 20)
		H.adjustBruteLoss(-30)
		H.adjustFireLoss(-30)
		H.updatehealth()
		set_personal_cooldown(user)
		return TRUE

/datum/lecture/hearthcore/enkindled/convalescence
	name = "Convalescence"
	phrase = "Oxidate Lecture: Convalescence."
	desc = "Recover from the ravages of wounds and pain, has a five minute cooldown."
	cooldown = TRUE
	cooldown_time = 5 MINUTES
	cooldown_category = "convalescence"
	power = 25 //Healing yourself is slightly easier than healing someone else

/datum/lecture/hearthcore/enkindled/convalescence/perform(mob/living/carbon/human/H, obj/item/implant/core_implant/C,list/targets)
	if(H.species?.reagent_tag == IS_SYNTHETIC)
		to_chat(H, SPAN_WARNING("You fail to cast the litany due to your non-organic body..."))
		return FALSE
	to_chat(H, "<span class='info'>A sensation of relief bathes you, washing away your pain.</span>")
	H.reagents.add_reagent("laudanum", 5)
	H.adjustBruteLoss(-15)
	H.adjustFireLoss(-15)
	H.adjustOxyLoss(-20)
	H.sanity.changeLevel(10)
	H.updatehealth()
	set_personal_cooldown(H)
	return TRUE

/datum/lecture/hearthcore/enkindled/graceful_repose
	name = "Graceful Repose"
	phrase = "Oxidate Lecture: Graceful Repose."
	desc = "A tricky litany that heals the mind and body of those around you from esoteric maladies such as genetic malignance or brain damage. Has a fifteen minute cooldown."
	cooldown = TRUE
	cooldown_time = 15 MINUTES
	cooldown_category = "grepose"
	power = 50

/datum/lecture/hearthcore/enkindled/graceful_repose/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	var/list/people_around = list()
	for(var/mob/living/carbon/human/H in view(user)) //get people around
		people_around.Add(H) //add them to a list

	if(people_around.len > 0) //anyone there? if so, run the effect
		to_chat(user, SPAN_NOTICE("Your feel the air thrum with an inaudible vibration."))
		playsound(user.loc, 'sound/machines/signal.ogg', 50, 1)
		for(var/mob/living/carbon/human/participant in people_around)
			to_chat(participant, SPAN_NOTICE("You hear a silent signal..."))
			heal_other(participant)
			add_effect(participant, FILTER_HOLY_GLOW, 25)
		set_personal_cooldown(user)
		return TRUE
	else //you are alone
		fail("No one's around to help. Your hearthcore sings alone in this god-forsaken world.", user, C)
		return FALSE

/datum/lecture/hearthcore/enkindled/graceful_repose/proc/heal_other(mob/living/carbon/human/participant)
		to_chat(participant, "<span class='info'>A sensation of relief bathes you, washing away most of your pain in body and mind</span>")
		participant.reagents.add_reagent("anodyne", 10)
		participant.adjustCloneLoss(-20)
		participant.adjustBrainLoss(-20)
		participant.updatehealth()

/datum/lecture/hearthcore/enkindled/healing_word
	name = "Healing Word"
	phrase = "Oxidate Lecture: Healing Word."
	desc = "Heal every person you can see for a fair amount. This lecture has a cooldown of 15 minutes."
	cooldown = TRUE
	power = 50
	cooldown_time = 15 MINUTES
	cooldown_category = "healingword"

/datum/lecture/hearthcore/enkindled/healing_word/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	var/list/people_around = list()
	for(var/mob/living/carbon/human/H in view(user))
		people_around.Add(H)

	if(people_around.len > 0)
		to_chat(user, SPAN_NOTICE("Your feel the air thrum with an inaudible vibration."))
		playsound(user.loc, 'sound/machines/signal.ogg', 50, 1)
		for(var/mob/living/carbon/human/participant in people_around)
			to_chat(participant, SPAN_NOTICE("You hear a silent signal..."))
			heal_other(participant)
			add_effect(participant, FILTER_HOLY_GLOW, 25)
		set_personal_cooldown(user)
		return TRUE
	else
		fail("No one's around to help. Your hearthcore sings alone in this god-forsaken world.", user, C)
		return FALSE

/datum/lecture/hearthcore/enkindled/healing_word/proc/heal_other(mob/living/carbon/human/participant)
		to_chat(participant, "<span class='info'>A sensation of relief bathes you, washing away your some of your pain</span>")
		participant.reagents.add_reagent("laudanum", 10)
		participant.adjustBruteLoss(-20)
		participant.adjustFireLoss(-20)
		participant.adjustOxyLoss(-40)
		participant.adjustBrainLoss(-5)
		participant.updatehealth()

/datum/lecture/hearthcore/enkindled/realignment
	name = "Realignment"
	phrase = "Oxidate Lecture: Realignment."
	desc = "Recovers all damage from toxin exposure, purges all chemical and stimulants reagents with toxic effects in the bloodstream, while curing addictions and healing damaged liver tissues. The radiance needs to recover itself for five minutes after oxidated"
	power = 50
	cooldown = TRUE
	cooldown_time = 15 MINUTES
	cooldown_category = "realignment"

/datum/lecture/hearthcore/enkindled/realignment/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	var/mob/living/carbon/human/T = get_front_human_in_range(user, 1)
	if(!T)
		fail("No target in front of you.", user, C)
		return FALSE
	to_chat(T, SPAN_NOTICE("You feel yourself growing more focused with each passing second."))
	to_chat(user, SPAN_NOTICE("You grant [T.name] cleansing."))

	T.reagents.add_reagent("alignitol", 10)
	set_personal_cooldown(user)

	return TRUE

//datum/lecture/hearthcore/enkindled/blood_transmuting NOT FOR NOW

/datum/lecture/hearthcore/enkindled/revival_lecture
	name = "Revival"
	phrase = "Oxidate Lecture: Revival."
	desc = "Consume parts of a Hearthcore to jumpstart a deceased user's life functions, mending any present neural degeneration in the process. Has a thirty minute cooldown."
	power = 100
	cooldown = TRUE
	cooldown_time = 30 MINUTES
	cooldown_category = "revival"

/datum/lecture/hearthcore/enkindled/revival_lecture/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	var/mob/living/carbon/human/M = get_victim(user)
	var/obj/item/implant/core_implant/hearthcore/CI = M.get_core_implant(/obj/item/implant/core_implant/hearthcore, FALSE)

	if(!M.client && !M.teleop) //ghost, get in the body
		for(var/mob/observer/ghost/ghost in GLOB.player_list)
			if(ghost.mind == M.mind)
				sound_to(ghost, 'sound/machines/defib_SafetyOn.ogg')
				to_chat(ghost, "<b><font color = #330033><font size = 3>Someone is attempting to resuscitate you. Re-enter your body if you want to be revived!</b> (Verbs -> Ghost -> Re-enter corpse)</font></font>")

	if(!do_after(user, 60, M, 0)) //start a lengthy do_after
		return FALSE

	if (!CI)
		fail("[M] doesn't have a Hearthcore installed.", user, C)
		return FALSE

	if (CI.get_module(HEARTHCORE_DAMAGED)) //if they have the HEARTHCORE_DAMAGED module they've been Revival'd without repairing, cancel
		fail("[M]'s Hearthcore is damaged from a previous Revival lecture.", user, C)
		return FALSE

	if(!M.client && !M.teleop) //ghost didn't return in time? cancel
		fail("[M]'s mind does not respond, continued attempts may bear fruit.", user, C)
		return FALSE

	GLOB.dead_mob_list.Remove(M)
	GLOB.living_mob_list += M

	M.adjustOxyLoss(-10) //Same as a regular defib
	M.timeofdeath = 0
	M.stat = UNCONSCIOUS //Life() can bring them back to consciousness if it needs to.
	M.failed_last_breath = 0 //So mobs that died of oxyloss don't revive and have perpetual out of breath.

	M.emote("gasp")
	M.Weaken(rand(10,25))
	M.updatehealth()

	var/rngStatRemoved
	switch(M.stats.getStat(STAT_MEC))
		if(0 to 40)
			rngStatRemoved = pick(1,2,3,4,5,6,7,8)
			M.stats.changeStat(STAT_MEC, -rngStatRemoved)
		if(40 to 60)
			rngStatRemoved = pick(8,9,10,11,12)
			M.stats.changeStat(STAT_MEC, -rngStatRemoved)
		if(60 to INFINITY)
			rngStatRemoved = pick(12,13,14,15,16,17,18,19,20)
			M.stats.changeStat(STAT_MEC, -rngStatRemoved)
	log_and_message_admins("Removed [-rngStatRemoved] to the MEC stat of [M]")
	switch(M.stats.getStat(STAT_BIO))
		if(0 to 40)
			rngStatRemoved = pick(1,2,3,4,5,6,7,8)
			M.stats.changeStat(STAT_BIO, -rngStatRemoved)
		if(40 to 60)
			rngStatRemoved = pick(8,9,10,11,12)
			M.stats.changeStat(STAT_BIO, -rngStatRemoved)
		if(60 to INFINITY)
			rngStatRemoved = pick(12,13,14,15,16,17,18,19,20)
			M.stats.changeStat(STAT_BIO, -rngStatRemoved)
	log_and_message_admins("Removed [-rngStatRemoved] to the BIO stat of [M]")
	switch(M.stats.getStat(STAT_COG))
		if(0 to 40)
			rngStatRemoved = pick(1,2,3,4,5,6,7,8)
			M.stats.changeStat(STAT_COG, -rngStatRemoved)
		if(40 to 60)
			rngStatRemoved = pick(8,9,10,11,12)
			M.stats.changeStat(STAT_COG, -rngStatRemoved)
		if(60 to INFINITY)
			rngStatRemoved = pick(12,13,14,15,16,17,18,19,20)
			M.stats.changeStat(STAT_COG, -rngStatRemoved)
	log_and_message_admins("Removed [-rngStatRemoved] to the COG stat of [M]")
	switch(M.stats.getStat(STAT_ROB))
		if(0 to 40)
			rngStatRemoved = pick(1,2,3,4,5,6,7,8)
			M.stats.changeStat(STAT_ROB, -rngStatRemoved)
		if(40 to 60)
			rngStatRemoved = pick(8,9,10,11,12)
			M.stats.changeStat(STAT_ROB, -rngStatRemoved)
		if(60 to INFINITY)
			rngStatRemoved = pick(12,13,14,15,16,17,18,19,20)
			M.stats.changeStat(STAT_ROB, -rngStatRemoved)
	log_and_message_admins("Removed [-rngStatRemoved] to the ROB stat of [M]")
	switch(M.stats.getStat(STAT_TGH))
		if(0 to 40)
			rngStatRemoved = pick(1,2,3,4,5,6,7,8)
			M.stats.changeStat(STAT_TGH, -rngStatRemoved)
		if(40 to 60)
			rngStatRemoved = pick(8,9,10,11,12)
			M.stats.changeStat(STAT_TGH, -rngStatRemoved)
		if(60 to INFINITY)
			rngStatRemoved = pick(12,13,14,15,16,17,18,19,20)
			M.stats.changeStat(STAT_TGH, -rngStatRemoved)
	log_and_message_admins("Removed [-rngStatRemoved] to the TGH stat of [M]")
	switch(M.stats.getStat(STAT_VIG))
		if(0 to 40)
			rngStatRemoved = pick(1,2,3,4,5,6,7,8)
			M.stats.changeStat(STAT_VIG, -rngStatRemoved)
		if(40 to 60)
			rngStatRemoved = pick(8,9,10,11,12)
			M.stats.changeStat(STAT_VIG, -rngStatRemoved)
		if(60 to INFINITY)
			rngStatRemoved = pick(12,13,14,15,16,17,18,19,20)
			M.stats.changeStat(STAT_VIG, -rngStatRemoved)
	log_and_message_admins("Removed [-rngStatRemoved] to the VIG stat of [M]")

	switch(M.stats.getStat(STAT_TGH)) //no advanced pads here, hit them with the harsh code
		if(-200 to 40)
			M.stats.addPerk(PERK_REZ_SICKNESS_FATAL)
			log_and_message_admins("Added fatal rez sickness to [M].")
		if(40 to 60)
			M.stats.addPerk(PERK_REZ_SICKNESS_SEVERE)
			log_and_message_admins("Added severe rez sickness to [M].")
		if(60 to INFINITY)
			M.stats.addPerk(PERK_REZ_SICKNESS)
			log_and_message_admins("Added mild rez sickness to [M].")

	CI.add_module(new HEARTHCORE_DAMAGED) //HEARTHCORE_DAMAGED is a module used to prevent using Revival on a person more than once without repairing the Hearthcore

	return TRUE

//////////////////////////////////////////////////
/////////         FORGEMASTER             /////////
//////////////////////////////////////////////////

/datum/lecture/hearthcore/forgemaster
	name = "Hearthcore"
	phrase = null
	implant_type = /obj/item/implant/core_implant/hearthcore
	category = "Forgemaster"
	ignore_stuttering = TRUE

/datum/lecture/targeted/hearthcore/forgemaster
	name = "targeted hearthcore lecture"
	phrase = null
	implant_type = /obj/item/implant/core_implant/hearthcore
	category = "Forgemaster"
	ignore_stuttering = TRUE

/datum/lecture/hearthcore/forgemaster/empowering_flames
	name = "Empowering Flames"
	desc = "Consume some Radiance to charge a power cell you are holding."
	phrase = "Oxidate Lecture: Empowering Flames."
	cooldown = TRUE
	cooldown_time = 0 MINUTES
	cooldown_category = "charging"
	power = 0 // Do not use the power in one shot
	var/charge_used = 10 // Amount of hearthcore radiance used.
	var/charge_rate = 20 // The delay between each charge? The number is in deciseconds, so 30 is equal to 3 seconds

/datum/lecture/hearthcore/forgemaster/empowering_flames/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	set_personal_cooldown(user)
	var/inhand = user.get_active_hand()
	if(istype(inhand, /obj/item/cell))
		var/obj/item/cell/P = inhand
		if(P.max_chargerate == 0) // Can we even charge the damn thing.
			fail("This type of cell cannot be charged.", user, C)
			return
		to_chat(user, "You start charging the [P.name].")
		while(C.power >= charge_used) // Keep going until we run out of power
			if(!istype(user.get_active_hand(), /obj/item/cell)) // Check if we're still holding a cell. Because rigged cell explode when charging.
				break
			if(P.fully_charged()) // Leave the loop if the cell is charged.
				break
			if(do_after(user, charge_rate)) // Small delay where the user must stand still
				C.power -= charge_used // We use some radiance
				P.give(charge_used * 10) // Charge the power cell
			else
				break // Leave the loop if we interrupt.
		to_chat(user, "You finish charging the [P.name]. It is now [P.percent()]% charged.")
	else
		fail("You need a power cell in your active hand to charge it.", user, C)

/datum/lecture/hearthcore/forgemaster/tools_of_bonfire
	name = "Tools of Bonfire"
	phrase = "Oxidate Lecture: Tools of Bonfire."
	desc = "Channels the power of your Hearthcore into an incorporeal omnitool."
	power = 40
	success_message = "Your hand glows with radiant light, and you feel more in tune with the machinery around you."

/datum/lecture/hearthcore/forgemaster/tools_of_bonfire/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	var/obj/item/tool/factorial_omni/tool = new /obj/item/tool/factorial_omni(src, user) //create the omni-tool
	usr.put_in_hands(tool) //put it in the active hand
	return TRUE //refer to code\game\objects\items\weapons\tools\misc.dm for factorial_omni

//datum/lecture/hearthcore/forgemaster/flame_guidance - Refer to code\modules\core_implant\hearthcore\lectures\construction.dm

//datum/lecture/hearthcore/forgemaster/weak_manifestation - Refer to code\modules\core_implant\hearthcore\lectures\construction.dm

/datum/lecture/hearthcore/forgemaster/nerve_learning
	name = "Nerve Learning"
	phrase = "Oxidate Lecture: Nerve Learning."
	desc = "This lecture will command a Hearthcore upgrade to attach to a person's Hearthcore. They must lie on a Board of Opposites with the upgrade near them."
	power = 20

/datum/lecture/hearthcore/forgemaster/nerve_learning/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	var/mob/living/carbon/human/H = get_victim(user)
	var/obj/item/implant/core_implant/hearthcore/CI = get_implant_from_victim(user, /obj/item/implant/core_implant/hearthcore)
	if(!H)
		fail("No target.", user, C)
		return FALSE

	if(!CI)
		fail("[H] doesn't have a Hearthcore installed.", user, C)
		return FALSE
	if(CI.upgrade)
		fail("Hearthcore already has an upgrade installed.", user, C)
		return FALSE

	var/list/L = get_front(user)

	var/obj/item/hearthcore_upgrade/CU = locate(/obj/item/hearthcore_upgrade) in L

	if(!CU)
		fail("There is no Hearthcore upgrade nearby.", user, C)
		return FALSE

	if(!(H in L))
		fail("Hearthcore upgrade is too far from [H].", user, C)
		return FALSE

	if(CU.active)
		fail("Hearthcore upgrade is already active.", user, C)
		return FALSE

	if(!H.lying || !locate(/obj/machinery/optable/altar) in L)
		fail("[H] must lie on the Board.", user, C)
		return FALSE

	if(!CU.install(H, CI) || CU.wearer != H)
		fail("Upgrade failed.", user, C)
		return FALSE

	return TRUE

/* hash out specific details on how upgrading works  and who does it later
/datum/lecture/hearthcore/forgemaster/unupgrade
	name = "Nerve Purging"
	phrase = "Oxidate Lecture: Nerve Purging."
	desc = "This lecture will remove any upgrade from the target's Hearthcore implant. The upgrade is lost and cannot be recovered."
	power = 80

/datum/lecture/hearthcore/forgemaster/unupgrade/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	var/obj/item/implant/core_implant/hearthcore/CI = get_implant_from_victim(user, /obj/item/implant/core_implant/hearthcore)

	if(!CI)
		fail("There is no hearthcore on this one.", user, C)
		return FALSE

	if(!CI.wearer)
		fail("Hearthcore is not installed.", user, C)
		return FALSE

	if(!istype(CI.upgrades) || length(CI.upgrades) <= 0)
		fail("There is no upgrade on this one.", user, C)
		return FALSE

	for(var/obj/item/coreimplant_upgrade/CU in CI.upgrades)
		CU.remove()
		log_and_message_admins("removed upgrade from [C] hearthcore with nerve purging lecture")

	return TRUE
*/

/datum/lecture/hearthcore/forgemaster/greater_empower
	name = "Greater Empower"
	phrase = "Oxidate Lecture: Greater Empower."
	desc = "This lecture uses Radiance from your own Hearthcore to another Hearthcore user by feeding their own silvery compounds, draining 20 Radiance to grant the same amount."
	power = 20

/datum/lecture/hearthcore/forgemaster/greater_empower/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C,list/targets)
	var/obj/item/implant/core_implant/hearthcore/CI = get_implant_from_victim(user, /obj/item/implant/core_implant/hearthcore)
	var/mob/living/carbon/human/H = get_victim(user)

	if(!H)
		fail("Target not found.",user,C,targets)
		return FALSE

	if(!CI || !CI.active || !CI.wearer)
		fail("Hearthcore not found.", user, C)
		return FALSE

	user.visible_message("[user] places their hands upon [H]", "You lay your hands upon [H]")
	if (do_after(user, 30, H, TRUE))
		var/turf/T = get_turf(user)
		if (!(T.Adjacent(get_turf(H))))
			to_chat(user, SPAN_DANGER("[H] is beyond your reach.."))
			return FALSE
		to_chat(H, "<span class='info'>Your Hearthcore billows as your radiance practices mitosis with the newfound silvery nutrition.</span>")

		CI.restore_power(20)

		return TRUE

/datum/lecture/hearthcore/forgemaster/iron_will
	name = "Lecture of Iron Will"
	phrase = "Oxidate Lecture: Lecture of Iron Will."
	desc = "Enforces the repairship of a person's mechanical organs and limbs or a mechanical creature in front of you by using radiance. The Radiance will use itself as a modular silvery tape, but will need five minutes of mitosis."
	cooldown = TRUE
	cooldown_time = 5 MINUTES
	cooldown_category = "iron_will"
	power = 60

/datum/lecture/hearthcore/forgemaster/iron_will/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	var/mob/living/target = get_victim(user)
	var/synth = FALSE

	if(!target)
		fail("There's nothing there.",user,C)
		return FALSE

	if(issilicon(target))
		target.adjustBruteLoss(-30)
		add_effect(target, FILTER_HOLY_GLOW, 25) // Make them glow.
		return TRUE

	for(var/obj/item/organ/augmentic in target) // Run this loop for every organ the person has
		if(augmentic.nature == MODIFICATION_SILICON) // Is the organ made of metal?
			synth = TRUE
			augmentic.heal_damage(5)
			to_chat(target, "Your [augmentic.name] repairs itself!")

	if(!synth)
		fail("You watch as the radiance struggles to find mechanical bits on the organic mesh. Now your patient is glowing in thin flex tape.",user,C)
		return FALSE

	add_effect(target, FILTER_HOLY_GLOW, 25)
	return TRUE

//datum/lecture/hearthcore/forgemaster/medium_manifestation - Refer to code\modules\core_implant\hearthcore\lectures\construction.dm

//datum/lecture/hearthcore/forgemaster/strong_manifestation - Refer to code\modules\core_implant\hearthcore\lectures\construction.dm

//////////////////////////////////////////////////
/////////         OATHPLEDGE             /////////
//////////////////////////////////////////////////

/datum/lecture/hearthcore/oathpledge
	name = "Hearthcore"
	phrase = null
	implant_type = /obj/item/implant/core_implant/hearthcore
	category = "Oathpledge"
	ignore_stuttering = TRUE

/datum/lecture/targeted/hearthcore/oathpledge
	name = "Hearthcore targeted"
	phrase = null
	implant_type = /obj/item/implant/core_implant/hearthcore
	category = "Oathpledge"
	ignore_stuttering = TRUE

/datum/lecture/hearthcore/oathpledge/scrying
	name = "Scrying"
	phrase = "Oxidate Lecture: Scrying."
	desc = "Look into the world from the eyes of another Hearthcore user. Can only be maintained for half a minute and the target will sense they are being watched, but not by whom."
	power = 100

/datum/lecture/hearthcore/oathpledge/scrying/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C,list/targets)
	if(!user.client) //user dc'd somehow in the process? cancel
		return FALSE

	var/mob/living/M = pick_disciple_global(user, TRUE) //pick a hearthcore user
	if (!M)
		return FALSE //no target? cancel

	if(user == M)
		fail("You feel your own radiance overcoming one of your eyes as you hear the sounds of machinery zooming like a camera. Honestly, it changes absolutely nothing beyond allowing you to see with two eyes, in case you lacked just one.",user,C,targets) //yourself? cancel
		return FALSE

	var/obj/item/implant/core_implant/hearthcore/target = M.get_core_implant(/obj/item/implant/core_implant/hearthcore)
	if (target.get_module(HEARTHCORE_ANTI_SCRYING)) //did they activate Anti-Scrying? cancel
		to_chat(user, SPAN_NOTICE("That Hearthcore user has blocked Scrying attempts."))
		return FALSE

	to_chat(user, SPAN_NOTICE("Your vision shifts.")) //all checks are good, proceed
	to_chat(M, SPAN_NOTICE("You feel your own radiance overcoming one of your eyes as you hear the sounds of machinery zooming like a camera. Whatever you may be looking at - there is someone else doing the same..."))

	var/mob/observer/eye/god/eye = new/mob/observer/eye/god(M)
	eye.target = M
	eye.owner_mob = user
	eye.owner_loc = user.loc
	eye.owner = eye
	user.reset_view(eye)

	//After 30 seconds, your view is forced back to yourself
	addtimer(CALLBACK(user, .mob/proc/reset_view, user), 300)

	return TRUE

/datum/lecture/hearthcore/oathpledge/reimagining //re-named convalescence to give it to Enkindled and Oathpledge but not give the entire category
	name = "Reimagining"
	phrase = "Oxidate Lecture: Reimagining."
	desc = "Guides the radiance to knit and weave wounds, while soothing the nerves. The oxidization needs five minutes of recovery before having to be used again."
	cooldown = TRUE
	cooldown_time = 5 MINUTES
	cooldown_category = "reimagining"
	power = 25 //Healing yourself is slightly easier than healing someone else

/datum/lecture/hearthcore/oathpledge/reimagining/perform(mob/living/carbon/human/H, obj/item/implant/core_implant/C,list/targets)
	if(H.species?.reagent_tag == IS_SYNTHETIC)
		to_chat(H, SPAN_WARNING("Amusing. You witnessed the radiance falter, attempting to ment your injuries. The freshly formed monocryl slides off your mechanical bits."))
		return FALSE
	to_chat(H, "<span class='info'>A sharp pain which soon subsides, followed by your wounds now knitted by the hard working radiance with a absorbable material.</span>")
	H.reagents.add_reagent("laudanum", 5)
	H.adjustBruteLoss(-15)
	H.adjustFireLoss(-15)
	H.adjustOxyLoss(-20)
	H.sanity.changeLevel(10)
	H.updatehealth()
	set_personal_cooldown(H)
	return TRUE

/datum/lecture/hearthcore/oathpledge/commitment
	name = "Accolade"
	phrase = "Oxidate Lecture: Accolade"
	desc = "the central act in the rite of knighthood - which should come together with a ceremony - that will command a Hearthcore to attach to a person lying on a Board of Opposites. The Hearthcore must lay near them, and will require the Epiphany lecture to fully activate."

/datum/lecture/hearthcore/oathpledge/commitment/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	var/mob/living/carbon/human/H = get_victim(user)
	var/obj/item/implant/core_implant/hearthcore/CI = get_implant_from_victim(user, /obj/item/implant/core_implant/hearthcore, FALSE)
	if(CI)
		fail("[H] is already a knight with a Hearthcore installed.", user, C)
		return FALSE

	var/list/L = get_front(user)

	CI = locate(/obj/item/implant/core_implant/hearthcore) in L

	if(!CI)
		fail("This one lacks a hearthcore - or lacks a spine for it to attach, on both senses of the word.)", user, C)
		return FALSE

	if (H.stat == DEAD)
		fail("Your radiance, the neural cells of your second brain, informs you that you've either mistakenly tried to transform a corpse into a knight for an inexplicable reason, or you've forgotten that the ceremonial sword is intended for tapping on the shoulders, not for decapitation. The fact you understood it from chemical reactions is no short of surprising - but at this point you are more likely just as dumb.", user, C)
		return FALSE

	if(!(H in L))
		fail("Hearthcore can't reach [H], it is too far away.", user, C)
		return FALSE

	if(CI.active)
		fail("This person is already knighted, together with a active hearthcore.", user, C)
		return FALSE

	if(!H.lying || !locate(/obj/machinery/optable/altar) in L)
		fail("[H] must lie on the board of opposites.", user, C)
		return FALSE

	if(!CI.install(H, BP_CHEST, user) || CI.wearer != H)
		fail("Accolade failed.", user, C)
		return FALSE

	if(ishuman(H))
		var/mob/living/carbon/human/M = H
		var/obj/item/organ/external/E = M.organs_by_name[BP_CHEST]
		for (var/i = 0; i < 5;i++)
			E.take_damage(5, sharp = FALSE)
			//Deal 25 damage in five hits. Using multiple small hits mostly prevents internal damage

		M.custom_pain("You feel the wings of the Hearthcore driving deep into your back, wrapping warm metal around all the extension of the spine! Why you suddently created sensitivity in places you never felt before?!",1)
		M.update_implants()
		M.updatehealth()

	return TRUE

/datum/lecture/hearthcore/oathpledge/epiphany
	name = "Epiphany"
	phrase = "Oxidate Lecture: Epiphany."
	desc = "This lecture will command an Hearthcore with sleeping radiance to awake. The subject must lay on a Board of Opposites."

/datum/lecture/hearthcore/oathpledge/epiphany/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	var/obj/item/implant/core_implant/hearthcore/CI = get_implant_from_victim(user, /obj/item/implant/core_implant/hearthcore, FALSE)

	if(!CI)
		fail("This one is no knight, but a yeoman or squire.", user, C)
		return FALSE

	if(!CI.wearer)
		fail("Hearthcore is not installed.", user, C)
		return FALSE

	if(CI.activated || CI.active)
		fail("This Hearthcore has been used before.", user, C)
		return FALSE

	if (CI.wearer.stat == DEAD)
		fail("This person is dead. You should, perhaps, bring them to CAPSA instead? Corpses makes no knights, nor the radiance will be compatible with the dead.", user, C)
		return FALSE

	log_and_message_admins("successfully knighted [CI.wearer]")
	to_chat(CI.wearer, "<span class='info'>The warm flow of silvery radiance spreads wide on your bloodstream. Your servants craves for oxidation.</span>")

	CI.activate()

	return TRUE

/datum/lecture/hearthcore/oathpledge/deprivation
	name = "Deprivation"
	phrase = "Oxidate Lecture: Deprivation."
	desc = "This litany will command a Hearthcore to detach from its bearer, if the one bearing it is dead."

/datum/lecture/hearthcore/oathpledge/deprivation/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	var/obj/item/implant/core_implant/hearthcore/CI = get_implant_from_victim(user, /obj/item/implant/core_implant/hearthcore, FALSE)

	if(!CI)
		fail("There is no Hearthcore on this one", user, C)
		return FALSE

	if(!CI.wearer)
		fail("Hearthcore is not installed.", user, C)
		return FALSE

	var/mob/M = CI.wearer

	if(ishuman(M) && is_dead(M))
		var/mob/living/carbon/human/H = M
		var/obj/item/organ/external/E = H.organs_by_name[BP_CHEST]
		E.take_damage(15)
		H.custom_pain("You feel the Hearthcore being ripped out of your spine as you feel a portion of you dying instantly!",1)
		CI.name = "[M]'s Hearthcore"
		CI.uninstall()
		return TRUE

	else if(ismob(M) && is_dead(M)) //Hearthcores can't normally be placed on non-humans, but this is still here for sanity purposes.
		CI.name = "[M]'s Hearthcore"
		CI.uninstall()
		return TRUE

	else
		fail("Deprivation does not work upon the living.", user, C)
		return FALSE


/datum/lecture/hearthcore/oathpledge/reconsecration
	name = "Reconsecration"
	phrase = "Oxidate Lecture: Reconsecration."
	desc = "The ritual needed for the reactivation and repair of a Hearthcore that has been unwillingly separated from the body or damaged by the bearer's death. The process requires a Board of Opposites and the Hearthcore in question to be attached. \
	If the Hearthcore has been damaged by the Revival lecture, 25 silver must be laid on the Board aswell, as raw material to reconstitute the Hearthcore."
	power = 50

/datum/lecture/hearthcore/oathpledge/reconsecration/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	var/obj/item/implant/core_implant/hearthcore/CI = get_implant_from_victim(user, /obj/item/implant/core_implant/hearthcore, FALSE)
	var/mob/living/carbon/human/H = get_victim(user)
	var/list/front_contents = get_front(user)

	if(!H.lying || !locate(/obj/machinery/optable/altar) in front_contents)
		fail("[H] must lie on the Board.", user, C)
		return FALSE

	if(!CI)
		fail("There is no Hearthcore on this one.", user, C)
		return FALSE

	if(!CI.wearer)
		fail("Hearthcore is not installed.", user, C)
		return FALSE

	if(CI.active)
		fail("This Hearthcore is already active.", user, C)
		return FALSE

	if (CI.wearer.stat == DEAD)
		fail("The Hearthcore cannot be bound to a corpse.", user, C)
		return FALSE

	if (CI.get_module(HEARTHCORE_DAMAGED)) //did someone use Revival on this person?
		var/obj/item/stack/located = locate(/obj/item/stack/material/silver) in front_contents //find silver in their turf
		if (!located)
			fail("There is no silver present to repair such severe damage.", user, C) //no silver
			return FALSE
		if (!(located.can_use(REPAIR_COST)))
			fail("There is not enough silver present to repair such severe damage.", user, C) //not enough silver
			return FALSE
		located.use(REPAIR_COST)

	log_and_message_admins("successfully reconsecrated [CI.wearer]")
	to_chat(CI.wearer, "<span class='info'>Your Hearthcore vibrates as your radiance comes back to life. You feel whole once again.</span>")

	CI.activate()
	CI.remove_modules(HEARTHCORE_DAMAGED) //repair process removes the DAMAGED module

	return TRUE

/datum/lecture/hearthcore/oathpledge/adoption
	name = "Adoption"
	phrase = "Oxidate Lecture: Adoption."
	desc = "Grants a Hearthcore user in front of you access to Custodian Hatchways."
	power = 15

/datum/lecture/hearthcore/oathpledge/adoption/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C,list/targets)
	var/obj/item/implant/core_implant/hearthcore/CI = get_implant_from_victim(user, /obj/item/implant/core_implant/hearthcore)

	if(!CI || !CI.wearer || !ishuman(CI.wearer) || !CI.active)
		fail("Hearthcore not found", user, C)
		return FALSE

	CI.security_clearance = CLEARANCE_COMMON
	return TRUE

/datum/lecture/hearthcore/oathpledge/ordination
	name = "Ordination"
	phrase = "Oxidate Lecture: Ordination."
	desc = "Grants a Hearthcore user in front of you access to Secure Custodian Hatchways."
	power = 15

/datum/lecture/hearthcore/oathpledge/ordination/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C,list/targets)
	var/obj/item/implant/core_implant/hearthcore/CI = get_implant_from_victim(user, /obj/item/implant/core_implant/hearthcore)

	if(!CI || !CI.wearer || !ishuman(CI.wearer) || !CI.active)
		fail("Hearthcore not found", user, C)
		return FALSE

	CI.security_clearance = CLEARANCE_ORDER
	return TRUE

/datum/lecture/hearthcore/oathpledge/omission
	name = "Omission"
	phrase = "Oxidate Lecture: Omission."
	desc = "Removes all access from target's Hearthcore."
	power = 30

/datum/lecture/hearthcore/oathpledge/omission/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C,list/targets)
	var/obj/item/implant/core_implant/hearthcore/CI = get_implant_from_victim(user, /obj/item/implant/core_implant/hearthcore)

	if(!CI || !CI.wearer || !ishuman(CI.wearer) || !CI.active)
		fail("Hearthcore not found", user, C)
		return FALSE

	CI.security_clearance = CLEARANCE_NONE
	return TRUE

/datum/lecture/hearthcore/oathpledge/pilgrim_path
	name = "Pilgrim's Path"
	phrase = "Oxidate Lecture: Pilgrim's Path."
	desc = "A lecture that enhances the physical attributes of everyone around you for ten minutes. Has a thirty minute cooldown."
	cooldown = TRUE
	cooldown_time = 30 MINUTES
	cooldown_category = "pilgrim_path"
	effect_time = 10 MINUTES
	power = 75

/datum/lecture/hearthcore/oathbound/pilgrim_path/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	for(var/mob/living/carbon/human/H in view()) //get everyone in view
		if(!(H == user)) //don't buff yourself, only apply buffs to others
			H.stats.changeStat(STAT_TGH, 15)
			H.stats.changeStat(STAT_ROB, 15)
			H.stats.changeStat(STAT_VIG, 15)
			to_chat(H, SPAN_NOTICE("You feel your muscles contract, oxygenated from a unknown source. now fearless, strong and agile."))
			add_effect(H, FILTER_HOLY_GLOW, 25)
			addtimer(CALLBACK(src, .proc/discard_effect, user), src.effect_time) //start removal timer
	set_personal_cooldown(user)
	return TRUE

/datum/lecture/hearthcore/oathbound/pilgrim_path/proc/discard_effect(mob/living/carbon/human/user)
	if(!user)
		return
	user.stats.changeStat(STAT_TGH, -15)
	user.stats.changeStat(STAT_ROB, -15)
	user.stats.changeStat(STAT_VIG, -15)
	to_chat(user, SPAN_NOTICE("Your muscles relax, deprived of oxygen. The imagined battle music in your mind has fallen silent, leaving you demoralized."))

/datum/lecture/hearthcore/oathpledge/sanctorium_of_life
	name = "Sanctorium of Life"
	phrase = "Oxidate Lecture: Sanctorium of Life."
	desc = "A lecture that enhances the mental attributes of everyone around you for ten minutes. Has a thirty minute cooldown."
	cooldown = TRUE
	cooldown_time = 30 MINUTES
	cooldown_category = "sanctorium"
	effect_time = 10 MINUTES
	power = 75

/datum/lecture/hearthcore/oathbound/sanctorium_of_life/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	for(var/mob/living/carbon/human/H in view()) //get everyone around
		if(!(H == user)) //not the user, only buff others
			H.stats.changeStat(STAT_MEC, 15)
			H.stats.changeStat(STAT_COG, 15)
			H.stats.changeStat(STAT_BIO, 15)
			to_chat(H, SPAN_NOTICE("Your mind turns inwards - everything becomes clear. You feel smarter, mentally capable."))
			add_effect(H, FILTER_HOLY_GLOW, 25)
			addtimer(CALLBACK(src, .proc/discard_effect, user), src.effect_time)
	set_personal_cooldown(user)
	return TRUE

/datum/lecture/hearthcore/oathbound/sanctorium_of_life/proc/discard_effect(mob/living/carbon/human/user)
	if(!user)
		return
	user.stats.changeStat(STAT_MEC, -15)
	user.stats.changeStat(STAT_COG, -15)
	user.stats.changeStat(STAT_BIO, -15)
	to_chat(user, SPAN_NOTICE("Your mind has become less responsive, as if something has slipped from your memory."))


/datum/lecture/hearthcore/oathpledge/torch_of_guidance
	name = "Torch of Guidance"
	phrase = "Oxidate Lecture: Torch of Guidance."
	desc = "A lecture intricately aligned with the neural links to forewarn the user of perfil. The radiance will inspect and unveil the presence of plague, hostile fauna, monstrous entity hiding as people and traps."
	power = 50

/datum/lecture/hearthcore/oathpledge/torch_of_guidance/perform(mob/living/carbon/human/H, obj/item/implant/core_implant/C)
	var/was_triggired = FALSE
	log_and_message_admins("performed empowered reveal lecture")
	for(var/mob/living/carbon/superior_animal/S in range(14, H))
		if (S.stat != DEAD)
			to_chat(H, SPAN_WARNING("The radiance quivers in antecipation. Foes draw near. You sense a palpable, malevolent presence - a worthy adversary.")) //prints this for every superior_animal found in 14 tiles
			was_triggired = TRUE

	if(!was_triggired)
		for (var/mob/living/simple_animal/hostile/S in range(14, H)) //prints this for every hostile simple_animal found in 14 tiles
			if (S.stat != DEAD)
				to_chat(H, SPAN_WARNING("The radiance breaths in disappointment. A simple hostile brute is nearby, stupid and most likely unworthy of a fight."))
				was_triggired = TRUE

	if(locate(/obj/structure/wire_splicing || /obj/item/mine || /obj/item/mine_old || /obj/item/spider_shadow_trap || /obj/item/beartrap || /obj/item/emp_mine) in view(7, H)) //prints this only once if a trap was found in the user's view
		to_chat(H, SPAN_WARNING("The radiance triggers you a chemical warning. You must tread carefully, someone has laid curses and traps nearby."))
		was_triggired = TRUE

	for(var/mob/living/carbon/human/target in range(14, H)) //prints this for every implanted carrion organ found in 14 tiles
		for(var/organ in target.organs)
			if (organ in subtypesof(/obj/item/organ/internal/carrion))
				to_chat(H, SPAN_DANGER("The radiance shivers in disgust, now running boiling hot on your bloodstream to prepare you for what is to come. You feel danger, yet never afraid. The presence of a terrible plague is nearby."))
				was_triggired = TRUE

	if(!was_triggired) //nothing was triggered? print this
		to_chat(H, SPAN_NOTICE("There is nothing here. You feel safe."))

	return TRUE

/datum/lecture/hearthcore/oathpledge/undying_phrases
	name = "Undying Phrases"
	phrase = "Oxidate Lecture: Undying Phrases."
	desc = "Transmit a message to all Hearthcore users."
	power = 25

/datum/lecture/hearthcore/oathpledge/undying_phrases/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C,list/targets)
	var/text = input(user, "What message will you send? Only Hearthcore users will be able to hear it.", "Sending a message") as text|null

	if (!text)
		return FALSE //no text in the message? cancel

	for (var/mob/living/L in disciples) //get all hearthcore users
		if(!(L == user)) //not yourself
			to_chat(L, "<span class='notice'><b><font size='2px'><font color='#ffaa00'> [user.real_name]'s voice resonates from your Hearthcore: \"[text]\"</font><b></span>")
	log_and_message_admins("[user.real_name] sent a message to all Hearthcore users with text \"[text]\"")
	playsound(user.loc, 'sound/machines/signal.ogg', 50, 1)
	for(var/mob/observer/ghost/G in world)
		G.show_message("<i>Message from <b>[src]</b> to all Hearthcore users: [text]</i>")
	return TRUE

/datum/lecture/hearthcore/oathpledge/inspiration
	name = "Inspiration"
	phrase = "Oxidate Lecture: Inspiration."
	desc = "Increases the Sanity recovery rate of the person in front of you for fifteen minutes."
	effect_time = 15 MINUTES
	power = 65

/datum/lecture/hearthcore/oathpledge/inspiration/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	var/mob/living/carbon/human/target = get_victim(user)
	if(!target)
		fail("No target.", user, C)
		return FALSE
	give_sanity_recovery(target) //get target using get_victim(), if there is a target, apply buff, otherwise? cancel
	return TRUE

/datum/lecture/hearthcore/oathpledge/inspiration/proc/give_sanity_recovery(mob/living/carbon/human/target)
	target.sanity.sanity_passive_gain_multiplier += 0.2
	addtimer(CALLBACK(src, .proc/take_sanity_recovery, target), effect_time)//start the timer to remove the buff
	spawn(30)
		to_chat(target, SPAN_NOTICE("Gentle whispers, their meanings convoluted, evokes a profound sense of nostalgia that washes over you, no longer ensared by the clutches of a restless mind - only solace."))

/datum/lecture/hearthcore/oathpledge/inspiration/proc/take_sanity_recovery(mob/living/carbon/human/target)
	if(!target)
		return
	target.sanity.sanity_passive_gain_multiplier -= 0.2
	to_chat(target, SPAN_NOTICE("The gentle whispers subsized - your mind exposed to the old, intrusive thoughts. Yearning for that nostalgic peace, you crave its return..."))

/datum/lecture/hearthcore/oathpledge/order_of_misery
	name = "Order of Misery"
	phrase = "Oxidate Lecture: Order of Misery."
	desc = "Decreases the Sanity recovery rate of the person in front of you for fifteen minutes."
	effect_time = 15 MINUTES
	power = 65

/datum/lecture/hearthcore/oathpledge/order_of_misery/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	var/mob/living/carbon/human/target = get_victim(user)
	if(!target)
		fail("No target.", user, C)
		return FALSE
	give_sanity_malus(target)//get target using get_victim(), if there is a target, apply debuff, otherwise? cancel
	return TRUE

/datum/lecture/hearthcore/oathpledge/order_of_misery/proc/give_sanity_malus(mob/living/carbon/human/target)
	target.sanity.sanity_passive_gain_multiplier -= 0.2
	addtimer(CALLBACK(src, .proc/take_sanity_malus, target), effect_time)//start the timer to remove the debuff
	spawn(30)
		to_chat(target, SPAN_NOTICE("Something enter your mind, intrusive thoughts that was beyond your previous imagination. Anywhere you look - everything seems to be briefly melting."))

/datum/lecture/hearthcore/oathpledge/order_of_misery/proc/take_sanity_malus(mob/living/carbon/human/target)
	if(!target)
		return
	target.sanity.sanity_passive_gain_multiplier += 0.2
	to_chat(target, SPAN_NOTICE("You no longer feel the world melting as the intrusive thoughts weakens, yet it has long damaged your mind."))

/datum/lecture/hearthcore/oathpledge/disgrace
	name = "Disgrace"
	phrase = "Oxidate Lecture: Disgrace."
	desc = "Inflict a harmful psychological effect on the person in front of you."
	power = 35

/datum/lecture/hearthcore/oathpledge/disgrace/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	var/mob/living/carbon/human/target = get_victim(user)

	if(!target)
		fail("No target to curse, at least not as easily.", user, C)
		return FALSE

	target.sanity.changeLevel(-20)//get target using get_victim(), if there is a target, lower sanity, otherwise? cancel
	return TRUE

/datum/lecture/hearthcore/oathpledge/sight_of_bonfire
	name = "Knight Sight"
	phrase = "Oxidate Lecture: Knight Sight."
	desc = "Toggles revealing other Hearthcore users."

/datum/lecture/hearthcore/oathpledge/sight_of_bonfire/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	var/datum/core_module/hearthcore/neotheologyhud/hud_module = C.get_module(/datum/core_module/hearthcore/neotheologyhud)
	if(hud_module) //toggles an already existing church HUD module that shows a little icon on Hearthcore users
		success_message = "Turning off Sight of Knights."
		C.remove_module(hud_module)
	else
		success_message = "Turning on Sight of Knights."
		C.add_module(new /datum/core_module/hearthcore/neotheologyhud)
	return TRUE

#undef REPAIR_COST
