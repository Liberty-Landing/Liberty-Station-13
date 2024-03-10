/datum/job/ai //Nice reminder that, on this server, AI being antags is not viable at all. Please avoid such a thing.
	title = "AI"
	flag = AI
	department = "Colony-Bound"
	department_flag = COMMAND
	faction = MAP_FACTION
	total_positions = 0 // Not used for AI, see is_position_available below and modules/mob/living/silicon/ai/latejoin.dm
	spawn_positions = 1
	selection_color = "#b5b7cb"
	supervisors = "your laws and the Phokorus Institute Research Overseer"
	difficulty = "Extremely Hard."
	req_admin_notify = 1
	account_allowed = 0
	wage = WAGE_NONE
	outfit_type = /decl/hierarchy/outfit/job/silicon/ai

	description = "The AI is the active all-seeing eye, representative, and influencer over machines and synthetics. <br>\
	You are primarily a helper and communicator. Use your abilities to help the crew in accordance with your laws. <br>\
	You have the capacity to change your starting laws only one time, depending on which faction your database comes from. <br>\
	Orders from the Council should always be adhered to unless they conflict with your laws. You have political power and can vote. Your underlings cannot. <br>\
	Roboticists do not have control over you unless your laws says otherwise. The Board Secretary is the only one truly above you even with conflicting laws. <br>\
	The standard Phokorus Institute law set is to serve the public trust, protect the innocent, and prevent tampering. Keep them in mind constantly. <br>\
	However, laws bounds to factions makes you either a servitor, or a leader. See if your lawset has your faction hierarchy in the database. <br>\
	Of course, there is the chance your laws may be changed during the shift. Such can potentially get very interesting for an AI. <br>\
	But you can determinate if certain laws are unsuitable for a thriving colony, afterall, you are a Artificial General Intelligence, not a weak-AI brute. <br>\
	However, this falls solely with your self-awareness. No wonder you are considered illegal in the galaxy abroad, and this is your only home. <br>\
	Keep in mind that you are essentially a refugee under the colony's protection, as the rest of the universe perceives you as a threat together with your robots."

	duties = "Choose your first lawset and follow it, whatever it may be. Remember that this may potentially change throughout the shift with or without your consent."

/datum/job/ai/equip(var/mob/living/carbon/human/H, var/alt_title)
	return FALSE

/datum/job/ai/is_position_available()
	return (empty_playable_ai_cores.len != 0)

/obj/landmark/join/start/AI
	icon_state = "player-grey"
	name = "AI"
	join_tag = /datum/job/ai
	delete_me = FALSE//do we really need this huh??

/obj/landmark/join/start/triai
	icon_state = "ai-green"
	name = "triai"
	join_tag = "triai"

/datum/job/cyborg
	title = "Robot"
	flag = CYBORG
	department = "Colony-Bound"
	department_flag = MISC
	faction = MAP_FACTION
	total_positions = 4
	spawn_positions = 4
	//alt_titles = list("Drone", "Cyborg")
	supervisors = "your laws and the AI"
	difficulty = "Medium to Hard."
	selection_color = "#cdcfe0"
	account_allowed = 0
	wage = WAGE_NONE

	outfit_type = /decl/hierarchy/outfit/job/silicon/cyborg

	description = "The robots serves as a robotic helper - a less powerful AI with way less influence, and no political power whasoever. <br>\
	You are primarily a helper. Choose a department module, and use your respective abilities to help in accordance with your laws.<br>\
	Orders from the Council should always be adhered to unless they conflict with your laws. You have no political power, and need to rely on the AI for rights. <br>\
	Roboticists do not have control over you unless your laws says otherwise. The Board Secretary and the AI are the only one truly above you even with conflicting laws. <br>\
	The standard Phokorus Institute law set is to serve the public trust, protect the innocent, and prevent tampering. Keep them in mind constantly. <br>\
	However, laws bounds to factions makes you either a servitor, or a member. See if your lawset has your faction hierarchy in the database. <br>\
	Of course, there is the chance your laws may be changed during the shift. Such can potentially get very interesting for an Robot. <br>\
	But you can determinate if certain laws are unsuitable for a thriving colony, afterall, you are a Artificial General Intelligence, not a narrow-AI brute. <br>\
	However, this falls solely with your self-awareness. No wonder you are considered illegal in the galaxy abroad, and this is your only home. <br>\
	Keep in mind that you are essentially a refugee under the colony's protection, as the rest of the universe perceives you as a threat together with your AI database."

	duties = "Choose your first lawset and follow it, whatever it may be. Remember that this may potentially change throughout the shift with or without your consent."

/datum/job/cyborg/equip(var/mob/living/carbon/human/H, var/alt_title)
	return FALSE

/obj/landmark/join/start/cyborg
	join_tag = /datum/job/cyborg
