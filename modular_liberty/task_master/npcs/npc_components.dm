/datum/npc_quest
	var/quest_stared = FALSE

	var/mob/living/carbon/human/knight_in_shining_armour
	var/obj/snow_white

	var/npc_name = "John Doe"
	var/list/card_name = list("Jane Doe")
	var/quest_item = /obj/item/reagent_containers/food/snacks/cookie

	var/item_quest = FALSE
	var/swap_reward = FALSE
	var/steps = 1

	var/step_annoucer = FALSE

	var/talk_ver = "says"

	var/ask_question = "do you require anything?"
	var/ask_question_answer = "..."

	var/reward_question = "What will you give in return?"
	var/reward_question_answer = "..."
	var/reward_question_answer_swapped = "..."
	var/reward_question_answer_swapped_back = "?!?"

	var/quest_question = "?"
	var/quest_question_answer = "..."

	var/change_question = "I don't like your current reward."
	var/change_question_answer = "..."
	var/change_question_answer_two = "..."

	var/complete_words = "Quest Completed"

/datum/npc_quest/New(knight_name, sleepy_apple)
	if(knight_name)
		knight_in_shining_armour = knight_name
	if(sleepy_apple)
		snow_white = sleepy_apple

/datum/npc_quest/proc/check_knightnquest(mob/living/user)
	if(knight_in_shining_armour.real_name != user.name)
		return FALSE

	if(!quest_stared)
		return FALSE

	return TRUE

/datum/npc_quest/proc/attempt_give(obj/item/A, mob/living/user)
	if(!check_knightnquest(user))
		return

	if(item_quest)
		if(istype(A, quest_item))
			qdel(A)
			next_quest_step(user)
			return TRUE

	return FALSE

/datum/npc_quest/proc/complete_quest(mob/living/user)
	if(!check_knightnquest(user))
		return

/datum/npc_quest/proc/next_quest_step_annoucement(mob/living/user)
	if(!check_knightnquest(user))
		return

/datum/npc_quest/proc/next_quest_step(mob/living/user)
	if(!check_knightnquest(user))
		return

	steps -= 1

	if(step_annoucer)
		next_quest_step_annoucement(user)

	if(steps < 1)
		complete_quest(user)


/datum/npc_quest/proc/on_examine(mob/living/user)
	if(user.real_name != knight_in_shining_armour.real_name)
		return

	if(quest_stared)
		if(ask_question)
			snow_white.visible_message("To ask a reminder of the task: [npc_name], [ask_question]")
		if(reward_question)
			snow_white.visible_message("To ask about a reward: [npc_name] [reward_question]")
		if(quest_question)
			snow_white.visible_message("To ask how to do the task: [npc_name] [quest_question]")
		if(change_question)
			snow_white.visible_message("To ask for a chance at an alternative reward: [npc_name] [change_question]")
		return

	snow_white.visible_message("To start the task: [npc_name], [ask_question]")

	return

/datum/npc_quest/proc/hear_me(mob/living/user, message)
	if(!check_knightnquest(user))
		return

	if(message == "[npc_name], [ask_question]")
		quest_stared = TRUE
		snow_white.visible_message("[npc_name] [talk_ver] \"[ask_question_answer]\"")

	if(message == "[npc_name] [reward_question]" && quest_stared)
		if(swap_reward)
			snow_white.visible_message("[npc_name] [talk_ver] \"[reward_question_answer]\"")
		else
			snow_white.visible_message("[npc_name] [talk_ver] \"[reward_question_answer_swapped]\"")

	if(message == "[npc_name] [quest_question]" && quest_stared)
		snow_white.visible_message("[npc_name] [talk_ver], \"[quest_question_answer]\"")

	if(message == "[npc_name] [change_question]" && quest_stared)
		if(swap_reward)
			snow_white.visible_message("[npc_name] [talk_ver], \"<span class='warning'>[change_question_answer]</span>\"")
			swap_reward = FALSE
		else
			snow_white.visible_message("[npc_name] [talk_ver], \"[reward_question_answer_swapped_back]\"")
			swap_reward = TRUE

	return

//Types

/datum/npc_quest/wax_wanter
	npc_name = "Violet Rosefield"
	card_name = list("Wax Hive", "Beekeeper", "Buzzy Bee")

	quest_item  = /obj/item/tool_upgrade/productivity/waxcoat
	talk_ver = "buzzes"
	quest_question = "How do I get a wax coating?"
	ask_question_answer = "Yes I do, I need an endless - er I mean one, wax coating. For now at least..."


	reward_question_answer = "I can give you a random harcase, that may have some items inside."
	reward_question_answer_swapped = "Im giving you a card currently!"
	reward_question_answer_swapped_back = "Well, alright. I have some spare medical items I can give you instead of the card..."


	quest_question_answer = "Well, you can make it by hand or like find it somewere. If I knew for sure I'd not ask you for it..."
	change_question_answer = "Hmp! I'm changing the reward to just card, then!"

	complete_words = "Thank you for the wax! Here are some items as a reward. Could you bring me more?"

/datum/npc_quest/wax_wanter/complete_quest(mob/living/user)
	..()

	snow_white.visible_message("[npc_name] [talk_ver] \"[complete_words]\"")
	new /obj/random/pouch/hardcase(user.loc)
	if(swap_reward)
		new /obj/random/medical_lowcost/always_spawn(user.loc)
		new /obj/random/medical_lowcost_handmade/always_spawn(user.loc)
	else
		new /obj/item/card_carp/index/adved(user.loc)
		var/obj/item/card_carp/death_card/death_card = new /obj/item/card_carp/death_card(user.loc)
		death_card.generate(1, pick(card_name))
	user.mind.individual_objectives_completed++
	steps = initial(steps)

	return

