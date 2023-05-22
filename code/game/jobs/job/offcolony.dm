/datum/job/outsider
	title = "Outsider"
	total_positions = 10
	spawn_positions = 10
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
	difficulty = "Impossible!"
	has_id = FALSE
	//playtimerequired = 1200000	- Not needed now.

	stat_modifiers = list(
		STAT_BIO = 5,
		STAT_TGH = 6,
		STAT_ROB = 6,
		STAT_VIG = 4,
		STAT_MEC = 8,
		STAT_COG = 2
	)

	description = "You're an outsider, disconnected from the lodge and the colony as a whole. Whether you're an exile, stranded pirate, hermit, or just the right man in the wrong place you're \
	entirely alone out here. What friends you can make and rely on should be cherished, for there are other looters and outsiders there who might be less than friendly short of giving out lead \
	and ionized laser shots. You better stake your claim, fortify a safe spot, then venture out for supplies and whatever loot you can use, sell, or stockpile. Remember, you are not protected by \
	colony law, few people with care or even raise an eyebrow if you're shot to death for whatever you're carrying."

	duties = "Choose between building a home or becoming nomadic.<br>\
		Make friends and avoid making enemies, as you're not protected like a colonist or hunter.<br>\
		Avoid dying in the dangerous wilderness alone."

/obj/landmark/join/start/outsider
	name = "Outsider"
	icon_state = "player-black"
	join_tag = /datum/job/outsider
