/* This is a master file for all perks / traits that are given via background selection.area

This includes perks from:
- Career background selection
- Early-life background selection
- And other selections.

This is NOT for racial-specific perks, but rather specifically for general background perks for organizations sake.*/

////////////////////
/* Baseline Perks */
////////////////////

/datum/perk/background/alcoholic
	name = "Alcoholic"
	icon_state = "electrochemistry" // Disco Elysium Skills - Simplified	Artist: Glassesblu - Down and Greyscaled by Lamasmaster - Don't own the art just think it's real neat so putting credits behind every one of these so it's clear.
	desc = "You imagined the egress from all your trouble and pain at the bottom of the bottle, but the way only led to a labyrinth. \
			You never stopped from coming back to it, trying again and again, poisoning your mind until you lost control. Now your face bears witness to your self-destruction. \
			There is only one key to survival, and it is the liquid that has shown you the way down. \
			You have a permanent alcohol addiction, which gives you a boost to combat stats while under the influence and lowers your cognition permanently."

/datum/perk/background/alcoholic/assign(mob/living/carbon/human/H)
	if(..() && !(/datum/reagent/ethanol in holder.metabolism_effects.addiction_list))
		var/datum/reagent/R = new /datum/reagent/ethanol
		holder.metabolism_effects.addiction_list.Add(R)

/datum/perk/background/alcoholic_active
	name = "Alcoholic - active"
	icon_state = "electrochemistry" // Disco Elysium Skills - Simplified	Artist: Glassesblu - Down and Greyscaled by Lamasmaster - Don't own the art just think it's real neat so putting credits behind every one of these so it's clear.
	desc = "Combat stats increased."

/datum/perk/background/alcoholic_active/assign(mob/living/carbon/human/H)
	if(..())
		holder.stats.addTempStat(STAT_ROB, 15, INFINITY, "Background Alcoholic")
		holder.stats.addTempStat(STAT_TGH, 15, INFINITY, "Background Alcoholic")
		holder.stats.addTempStat(STAT_VIG, 15, INFINITY, "Background Alcoholic")

/datum/perk/background/alcoholic_active/remove()
	if(holder)
		holder.stats.removeTempStat(STAT_ROB, "Background Alcoholic")
		holder.stats.removeTempStat(STAT_TGH, "Background Alcoholic")
		holder.stats.removeTempStat(STAT_VIG, "Background Alcoholic")
	..()

/datum/perk/background/addict
	name = "Drug Addict"
	desc = "You've been an addict all your life, for whatever piss poor reason you've told yourself. Your body is able to handle a variety of drugs, more than the average person, but you get \
	easily addicted to all of them."
	icon_state = "selfmedicated" // https://game-icons.net/1x1/lorc/overdose.html

/datum/perk/background/addict/assign(mob/living/carbon/human/H)
	..()
	holder.metabolism_effects.addiction_chance_multiplier = 2
	holder.metabolism_effects.nsa_bonus += 20
	holder.metabolism_effects.calculate_nsa()

/datum/perk/background/addict/remove()
	holder.metabolism_effects.addiction_chance_multiplier = 1
	holder.metabolism_effects.nsa_bonus -= 20
	holder.metabolism_effects.calculate_nsa()
	..()

/datum/perk/background/mercenary_grit
	name = "Mercenary Grit"
	desc = "Your past life has been one of turmoil and extremes and as a result has toughened you up severely. Environmental damage from falling or explosives have less of an effect on your toughened body."
	icon_state = "bomb" // https://game-icons.net

/datum/perk/background/mercenary_grit/assign(mob/living/carbon/human/H)
	..()
	holder.mob_bomb_defense += 25
	holder.falls_mod -= 0.4
	holder.sanity.view_damage_threshold += 10

/datum/perk/background/mercenary_grit/remove()
	holder.mob_bomb_defense -= 25
	holder.falls_mod += 0.4
	holder.sanity.view_damage_threshold -= 10
	..()

/datum/perk/background/linguist
	name = "Linguist"
	desc = "Having dedicated time to learn foreign tongues, you find yourself knowing an extra language. Be it from your upbringing or schooling, you're fluent in one more language than the average person!"
	icon_state = "knowledge"
	active = FALSE
	passivePerk = FALSE
	var/anti_cheat = FALSE

/datum/perk/background/linguist/activate()
	..()
	if(anti_cheat)
		to_chat(holder, "Recalling more languages is not as easy for someone unskilled as you.")
		return FALSE
	anti_cheat = TRUE
	var/mob/M = usr
	var/list/options = list()
	options["Euronord"] = LANGUAGE_EURO
	options["Galactic Sign Language"] = LANGUAGE_SIGN
	options["Jana"] = LANGUAGE_JANA
	options["Interslavic"] = LANGUAGE_CYRILLIC
	options["Interromanico"] = LANGUAGE_ROMANA
	options["Yassari"] = LANGUAGE_YASSARI
	options["Rolion Standard"] = LANGUAGE_COALITION
	var/choice = input(M,"Which language do you know?","Linguist Choice") as null|anything in options
	if(src && choice)
		M.add_language(choice)
		M.stats.removePerk(PERK_LINGUIST)
	anti_cheat = FALSE
	return TRUE

/datum/perk/background/linguist/remove()
	..()

/datum/perk/background/athlete
	name = "Athleticism"
	desc = "You dedicated your life to being a professional athlete in your younger years, that didn't exactly pan for out for you but you can still move way faster across obstacles than a normal person and land on your feet from high altitude just fine."
	icon_state = "parkour" //https://game-icons.net/1x1/delapouite/jump-across.html

/datum/perk/background/athlete/assign(mob/living/carbon/human/H)
	..()
	holder.mod_climb_delay -= 0.95
	holder.falls_mod -= 0.8

/datum/perk/background/athlete/remove()
	holder.mod_climb_delay += 0.95
	holder.falls_mod += 0.8
	..()

/datum/perk/background/cuban_delight
	name = "Cuban Delight"
	desc = "Due to extensive smoker history in your family line or gene-therapy you are now afflicted with a sequence known as 'Cuban Delight' meaning you can slowly recover from effects of venom as long as nicotine is flowing through you."
	icon_state = "cigarette" // https://game-icons.net

/datum/perk/background/klutz
	name = "Klutz"
	desc = "You find a lot of tasks a little beyond your ability to perform such is using any type of weaponry, but being accident prone has at least made you used to getting hurt."
	icon_state = "hand_eye" // Disco Elysium Skills - Simplified	Artist: Glassesblu - Down and Greyscaled by Lamasmaster - Don't own the art just think it's real neat so putting credits behind every one of these so it's clear.

/datum/perk/background/klutz/assign(mob/living/carbon/human/H)
	..()
	holder.mutations.Add(CLUMSY)
	holder.maxHealth += 10
	holder.health += 10

/datum/perk/background/klutz/remove()
	holder.mutations.Remove(CLUMSY)
	holder.maxHealth -= 10
	holder.health -= 10
	..()

////////////////////////
/* Sanity-Based Perks */
////////////////////////

/datum/perk/background/veteran
	name = "Veteran"
	desc = "You've been trained how to handle tense situations. Shootings, injuries, blood, and death. Preperation to these issues is key. \
			Your sanity cap is greater by about 1/4th its normal capacity."
	icon_state = "riotshield"	//https://game-icons.net/1x1/lorc/riot-shield.html

/datum/perk/background/veteran/assign(mob/living/carbon/human/H)
	..()
	holder.sanity.view_damage_threshold += 25

/datum/perk/background/veteran/remove()
	holder.sanity.view_damage_threshold -= 25
	..()

/datum/perk/background/survivor
	name = "Survivor"
	desc = "After seeing the death of many acquaintances and friends, witnessing death doesn't shock you as much as before. \
			Halves sanity loss from seeing people die but you cannot recover sanity from talking with people."
	icon_state = "composure" // Disco Elysium Skills - Simplified	Artist: Glassesblu - Down and Greyscaled by Lamasmaster - Don't own the art just think it's real neat so putting credits behind every one of these so it's clear.

/datum/perk/background/survivor/assign(mob/living/carbon/human/H)
	if(..())
		holder.sanity.death_view_multiplier *= 0.5

/datum/perk/background/survivor/remove()
	if(holder)
		holder.sanity.death_view_multiplier *= 2
	..()

/datum/perk/background/nihilist
	name = "Nihilist"
	desc = 	"You simply ran out of fucks to give at some point in your life. \
			This increases chance of positive breakdowns by 10% and negative breakdowns by 20%. Seeing someone die has a random effect on you: \
			sometimes you won’t take any sanity loss and you can even gain back sanity, or get a boost to your cognition."
	icon_state = "volition" // Disco Elysium Skills - Simplified	Artist: Glassesblu - Down and Greyscaled by Lamasmaster - Don't own the art just think it's real neat so putting credits behind every one of these so it's clear.

/datum/perk/background/nihilist/assign(mob/living/carbon/human/H)
	if(..())
		holder.sanity.positive_prob += 10
		holder.sanity.negative_prob += 20

/datum/perk/background/nihilist/remove()
	if(holder)
		holder.sanity.positive_prob -= 10
		holder.sanity.negative_prob -= 20
		holder.stats.removeTempStat(STAT_COG, "Background Nihilist")
	..()

/datum/perk/background/idealist
	name = "Idealist"
	icon_state = "authority" // Disco Elysium Skills - Simplified	Artist: Glassesblu - Down and Greyscaled by Lamasmaster - Don't own the art just think it's real neat so putting credits behind every one of these so it's clear.
	desc = "A day may come when the courage of men fails, when we forsake our friends and break all bonds of fellowship. \
			But it is not this day. This day you fight! \
			Your Insight gain is faster when you are around sane people and they will recover sanity when around you. \
			When you are around people that are low on health or sanity, you will take sanity damage."

/datum/perk/background/noble
	name = "Noble"
	icon_state = "family" //https://game-icons.net
	desc = "You came from a wealthy family of high stature, able to achieve a high education and spent most of your life capable of relaxing. \
			Start with an heirloom, higher chance to be on contractor contracts and removed sanity cap. Stay clear of filth and danger."

/datum/perk/background/noble/assign(mob/living/carbon/human/H)
	if(!..())
		return
	holder.sanity.environment_cap_coeff -= 1
	if(!holder.name)
		holder.stats.removePerk(src.type)
		return
	var/turf/T = get_turf(holder)
	var/obj/item/W
	W = /obj/item/gunbox/heirloom
	W = new W(T)
	spawn(1)
		holder.equip_to_storage_or_drop(W)

/datum/perk/background/noble/remove()
	if(holder)
		holder.sanity.environment_cap_coeff += 1
	..()

/datum/perk/background/rejected_genius
	name = "Rejected Genius"
	desc = "You see the world in different shapes and colors. \
			Your sanity loss cap is removed, so stay clear of corpses or filth. You have less maximum sanity and no chance to have positive breakdowns. \
			As tradeoff, you have 50% faster insight gain."
	icon_state = "encyclopedia" // Disco Elysium Skills - Simplified	Artist: Glassesblu - Down and Greyscaled by Lamasmaster - Don't own the art just think it's real neat so putting credits behind every one of these so it's clear.

/datum/perk/background/rejected_genius/assign(mob/living/carbon/human/H)
	if(..())
		holder.sanity.environment_cap_coeff -= 1
		holder.sanity.positive_prob_multiplier -= 1
		holder.sanity.insight_passive_gain_multiplier *= 1.5
		holder.sanity.max_level -= 20

/datum/perk/background/rejected_genius/remove()
	if(holder)
		holder.sanity.environment_cap_coeff += 1
		holder.sanity.positive_prob_multiplier += 1
		holder.sanity.insight_passive_gain_multiplier /= 1.5
		holder.sanity.max_level += 20
	..()

/datum/perk/background/rat
	name = "Rat"
	desc = "You are an agile being of small stature, you can easily avoid traps and punches thrown at you while moving quiet as an actual mouse, however anything bad you see might just make you have a bad time."
	icon_state = "interfacing" // Disco Elysium Skills - Simplified	Artist: Glassesblu - Down and Greyscaled by Lamasmaster - Don't own the art just think it's real neat so putting credits behind every one of these so it's clear.

/datum/perk/background/rat/assign(mob/living/carbon/human/H)
	if(..())
		holder.sanity.max_level -= 10
		holder.noise_coeff -= 0.75

/datum/perk/background/rat/remove()
	if(holder)
		holder.sanity.max_level += 10
		holder.noise_coeff += 0.75
	..()

/datum/perk/background/solborn
	name = "Sol Born"
	desc = "You are from the cradle of humanity, pampered and caressed you don't know much about struggles of life and as such you have hard time dealing with horrors of the frontier space."
	icon_state = "sol"

/datum/perk/solborn/assign(mob/living/carbon/human/H)//You aren't built for these steets cuh
	if(..())
		holder.sanity.death_view_multiplier *= 1.2
		holder.sanity.negative_prob += 10
		holder.metabolism_effects.nsa_bonus -= 10
		holder.metabolism_effects.calculate_nsa()

/datum/perk/solborn/remove()
	if(holder)
		holder.sanity.death_view_multiplier = 1
		holder.sanity.negative_prob -= 10
		holder.metabolism_effects.nsa_bonus += 10
		holder.metabolism_effects.calculate_nsa()
	..()

/datum/perk/unfeeling
	name = "Unfeeling"
	desc = "Be it emotional supressors; a lack of programming, or simply not caring for organic damage - your mechanical nature has made you immune to the trials and tribulations of what the organics call 'the mind and soul'."
	icon_state = "interfacing" // Disco Elysium Skills - Simplified	Art.

/datum/perk/unfeeling/assign(mob/living/carbon/human/H)
	if(..())
		holder.sanity.view_damage_threshold += 600 //Synth trait.
		holder.sanity.sanity_invulnerability += 1 //yep.
		holder.sanity.insight_gain_multiplier *= 0.25 //yeowch

/datum/perk/unfeeling/remove()
	if(holder)
		holder.sanity.view_damage_threshold -= 600 //Synth trait.
		holder.sanity.sanity_invulnerability -= 1 //yep.
		holder.sanity.insight_gain_multiplier *= 2 //so you arent softlocked
	..()

/datum/perk/fate/paper_worm
	name = "Paper Worm"
	desc = "You were a clerk and bureaucrat for all your life. Cramped offices with angry people is where your personality was forged. \
			You have lower stats all around, but have a higher chance to have increased stat growth on level up."
	icon_state = "paper"

/datum/perk/fate/paper_worm/assign(mob/living/carbon/human/H)
	if(..())
		holder.sanity.positive_prob += 20

/datum/perk/fate/paper_worm/remove()
	if(holder)
		holder.sanity.positive_prob -= 20
	..()

/////////////////
/* Money Perks */
/////////////////

/datum/perk/background/nepotism
	name = "Nepotism"
	desc = "You earn about 30% higher pay than your fellow peers- The spirit of capitalism smiles upon you."
	gain_text = "You feel comforted, knowing the amount of money coming your way."
	icon_state = "nepotism"

/datum/perk/background/debtor
	name = "Debtor"
	desc = "You owe money to someone or something. Unfortunately, your wages have been garnished to make up the difference."
	gain_text = "You feel annoyed, thinking about how much of your wage is going into paying off your debt."
	icon_state = "robber_hand"

////////////////
/* Gene Perks */
////////////////

/datum/perk/background/splicer
	name = "Splicer"
	desc = "Your genes are heavily modified already, your base genetic instability is 20%, even if you don't have any mutations."
	gain_text = "Your body is modified enough already; pushing it further might be bad."
	icon_state = "splicer"

//Genetics is made reliably enough that simply increasing total instability, a dynamically changing value, will be permanent until removed.
/datum/perk/background/splicer/assign(mob/living/carbon/human/H)
	..()
	holder.unnatural_mutations.total_instability += 20

/datum/perk/background/splicer/remove()
	holder.unnatural_mutations.total_instability -= 20
	..()
