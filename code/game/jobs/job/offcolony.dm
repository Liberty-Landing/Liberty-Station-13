/datum/job/outsider
	title = "Outsider"
	total_positions = 4
	spawn_positions = 4
	flag = OUTSIDER
	faction = MAP_FACTION
	department = DEPARTMENT_INDEPENDENT
	department_flag = INDEPENDENT
	supervisors = "nobody! You're an outsider"
	selection_color = "#191919"
	account_allowed = 0
	create_record = 0
	initial_balance = INIT_BALANCE_NONE
	wage = WAGE_NONE
	//minimal_access = list(access_maint_tunnels)	- No.
	outfit_type = /decl/hierarchy/outfit/job/outsider
	difficulty = "Survive!"
	has_id = FALSE
	//playtimerequired = 1200000	- Not needed now.

	stat_modifiers = list(
		STAT_BIO = 15,
		STAT_TGH = 22,
		STAT_ROB = 16,
		STAT_VIG = 16,
		STAT_MEC = 10,
		STAT_COG = 10
	)

	description = "You stand alone, an outsider detached from the colony.  Whether you're an exile, Whether an amnesiac, stranded spacefarer, pirate, mercenary, hermit, or simply \
	the right person in the wrong place, solitude is your constant companion. What friends you can make and rely on should be cherished, for there are other looters and outsiders there who might \
	be less than friendly short of giving out lead and ionized laser shots. You better stake your claim, fortify a safe spot, then venture out for supplies and whatever loot you can use, sell, or \
	stockpile. Remember, you are not protected by colony law, few people with care or even raise an eyebrow if you're shot to death for whatever you're carrying. \
	Albeit you may be lacking in equipments, you've survived long enough to become experienced. Differently of other outsider roles, you have all-round better stats."

	duties = "Choose between building a home or becoming completely nomadic.<br>\
		Make friends and avoid making enemies, as you're not protected like a colonist.<br>\
		Avoid dying in the dangerous wilderness alone."

/obj/landmark/join/start/outsider
	name = "Outsider"
	icon_state = "player-black"
	join_tag = /datum/job/outsider

/datum/job/tribal
	title = "Frostwalker Tribal"
	total_positions = 4
	spawn_positions = 4
	flag = OUTSIDER
	faction = MAP_FACTION
	department = DEPARTMENT_INDEPENDENT
	department_flag = INDEPENDENT
	supervisors = "The Sagamore, the most wise or old on your group."
	selection_color = "#191919"
	account_allowed = 0
	create_record = 0
	initial_balance = INIT_BALANCE_NONE
	wage = WAGE_NONE
	alt_titles = list("Sagamore", "Warrior", "Shaman", "Hunter")
	//minimal_access = list(access_maint_tunnels)	- No.
	outfit_type = /decl/hierarchy/outfit/job/tribal
	difficulty = "Survive!"
	has_id = TRUE //only a wooden dogtag showing name and your job, no access whasoever tho
	//playtimerequired = 1200000	- Not needed now.

	stat_modifiers = list(
		STAT_BIO = 10,
		STAT_TGH = 10,
		STAT_ROB = 10,
		STAT_COG = 5
	)

	description = "You are a Phokorus native from the Frostwalker Tribe. Your shamanistic religion declares that your forefathers has been kidnapped by the long darkness. \
	In reverence to the Abyssal Mother and her ethereal spirits, you embody some powers by bringing light to the long darkness - the Precursors and their filthy cultists. \
	You are peaceful, but compelled by current challenges, you are a now a reluctant warrior. Living in these cursed lands allowed you to use your unique tradition as a weapon. \
	The cannibal Mappukini Tribe harass your people, while newcomers punctures the earth and settle their greedy hands on what is holy, with little to no respect to where you thread. \
	Cultists of the Long Darkness came as they promised in the carved stones, salting the earth with its psionic presence. Now other outsiders steal and raid your settlements. \
	So, by the Abyssal mother, those made from the clay of this land must wield the war totems and smash the filth into mush, you may be peaceful, but never weak."

	duties = "Protect your settlement and ensure that it will not be raided. Reinforce the walls, forge duraluminium weapons and make traps, if needed. Diplomacy may suffice if not. <br>\
		Protect your fellow frostwalker natives, as these are the sons of Abyssal Mother. <br>\
		Collect and bring light to precursor technology to enhance said tools with Abyssal Mother's light. <br>\
		Antagonises cultists as those are followers of Long Darkness, who salts the earth. Spit on their comparation of Abyssal Mother and 'Dissident God'"

/obj/landmark/join/start/tribal
	name = "Frostwalker"
	icon_state = "player-black"
	join_tag = /datum/job/tribal
