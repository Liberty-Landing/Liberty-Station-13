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
	icon_state = "alcohol" // https://game-icons.net/1x1/delapouite/beer-bottle.html
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
	icon_state = "alcohol_rage" // https://game-icons.net/1x1/lorc/muscle-fat.html
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
	icon_state = "junkie" // https://game-icons.net/1x1/skoll/knockout.html

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
	icon_state = "klutz" // https://game-icons.net/1x1/sbed/falling.html

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
	icon_state = "veteran"	// https://game-icons.net/1x1/skoll/rank-3.html

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
	icon_state = "survivor" // https://game-icons.net/1x1/lorc/one-eyed.html

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
	icon_state = "stupid" // https://game-icons.net/1x1/delapouite/shrug.html

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
	icon_state = "idealist" // https://game-icons.net/1x1/delapouite/caesar.html
	desc = "A day may come when the courage of men fails, when we forsake our friends and break all bonds of fellowship. \
			But it is not this day. This day you fight! \
			Your Insight gain is faster when you are around sane people and they will recover sanity when around you. \
			When you are around people that are low on health or sanity, you will take sanity damage."

/datum/perk/background/noble
	name = "Noble"
	icon_state = "noble" // https://game-icons.net/1x1/delapouite/throne-king.html
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
	icon_state = "reason" // https://game-icons.net/1x1/lorc/brainstorm.html

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
	desc = "Quick and agile as a rodent, you can avoid most traps and move as silently as a mouse. \
			However, this extends to your frail and scaredy mentality as well, and you might freak out more easily than others\
			when you witness anything sanity-altering like corpses and bloodstains."
	icon_state = "paranoia" // https://game-icons.net/1x1/lorc/paranoia.html

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

// FBP PERKS

/datum/perk/unfeeling
	name = "Unfeeling"
	desc = "Be it emotional supressors; a lack of programming, or simply not caring for organic damage - your mechanical nature has made you immune to the trials and tribulations of what the organics call 'the mind and soul'."
	icon_state = "android" // https://game-icons.net/1x1/lorc/android-mask.html

/datum/perk/unfeeling/assign(mob/living/carbon/human/H)
	if(..())
		holder.sanity.view_damage_threshold += 40 //Synth trait.
		holder.sanity.sanity_invulnerability += 1 //yep.
		holder.sanity.insight_gain_multiplier *= 0.25 //yeowch

/datum/perk/unfeeling/remove()
	if(holder)
		holder.sanity.view_damage_threshold -= 40 //Synth trait.
		holder.sanity.sanity_invulnerability -= 1 //yep.
		holder.sanity.insight_gain_multiplier *= 4 //Return us compltely, as removing this perk has a uniquic interation
		holder.stats.addPerk(PERK_LESS_FEELING)
	..()

/datum/perk/less_feeling
	name = "Less feeling"
	desc = "Be it emotional supressors; a lackings of programming, or simply not caring less organic damage, your mind does not seem to full graps the soul or other emotion carings as easy."
	icon_state = "cyborg" // https://game-icons.net/1x1/delapouite/cyborg-face.html

/datum/perk/less_feeling/assign(mob/living/carbon/human/H)
	if(..())
		holder.sanity.view_damage_threshold += 10
		holder.sanity.insight_gain_multiplier *= 0.5 //You gain insainly less sanity making you want to value stats
		holder.sanity.positive_prob -= 10

/datum/perk/less_feeling/remove()
	if(holder)
		holder.sanity.view_damage_threshold -= 10
		holder.sanity.insight_gain_multiplier *= 2 //Return us completely
		holder.sanity.positive_prob += 10
	..()

// END OF FBP PERKS
/datum/perk/fate/paper_worm
	name = "Paper Worm"
	desc = "You were a clerk and bureaucrat for all your life. Cramped offices with angry people is where your personality was forged. \
			You have lower stats all around, but have a higher chance to have positive mental breakdowns."
	icon_state = "bookworm" // https://game-icons.net/1x1/lorc/bookmarklet.html

/datum/perk/fate/paper_worm/assign(mob/living/carbon/human/H)
	if(..())
		holder.sanity.positive_prob += 20

/datum/perk/fate/paper_worm/remove()
	if(holder)
		holder.sanity.positive_prob -= 20
	..()


/////////////////
/* Misc Perks */
/////////////////

/datum/perk/no_obfuscation
	name = "Exact Values"
	desc = "Unlike most people you can fully visualize your states, giving your self understanding a more thorough grasp. \
	This is with addition to knowing how likely you are to fail after failing some tasks. \
	This does not give you detailed view of wounds or other medical issues."
	icon_state = "skills" // https://game-icons.net/1x1/delapouite/skills.html


/////////////////
/* Money Perks */
/////////////////

/datum/perk/background/extra_pay
	name = "Valued Employee"
	desc = "Due to one reason or another, like hard work, negotiations, or nepotism, you earn about 30% more income than your fellow peers."
	gain_text = "You feel comforted, knowing the amount of money coming your way."
	icon_state = "nepotism" // https://game-icons.net/1x1/delapouite/shaking-hands.html

/datum/perk/background/debtor
	name = "Debtor"
	desc = "You owe money to someone or something. Unfortunately, your wages have been garnished to make up the difference."
	gain_text = "You feel annoyed, thinking about how much of your wage is going into paying off your debt."
	icon_state = "debtor" // https://game-icons.net/1x1/delapouite/receive-money.html

////////////////
/* Gene Perks */
////////////////

/datum/perk/background/splicer
	name = "Splicer"
	desc = "Your genes are heavily modified already, your base genetic instability is 20%, even if you don't have any mutations."
	gain_text = "Your body is modified enough already; pushing it further might be bad."
	icon_state = "splicer" // https://game-icons.net/1x1/lorc/dna1.html

//Genetics is made reliably enough that simply increasing total instability, a dynamically changing value, will be permanent until removed.
/datum/perk/background/splicer/assign(mob/living/carbon/human/H)
	..()
	holder.unnatural_mutations.total_instability += 20

/datum/perk/background/splicer/remove()
	holder.unnatural_mutations.total_instability -= 20
	..()
