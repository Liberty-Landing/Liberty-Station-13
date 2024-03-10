/datum/job/clubmanager
	title = "Club Manager"
	flag = CLUBMANAGER
	head_position = 1
	department = DEPARTMENT_SERVICE
	department_flag = SERVICE | COMMAND
	faction = MAP_FACTION
	total_positions = 1
	spawn_positions = 1
	supervisors = "Money."
	difficulty = "Medium."
	alt_titles = list("Chief Sales Officer", "Pusher", "Sales Manager")
	selection_color = "#dddddd"
	access = list(access_merchant, access_janitor, access_hydroponics, access_bar, access_kitchen, access_heads, access_cargo, access_RC_announce, access_keycard_auth, access_tcomsat, access_ai_upload)

	initial_balance = INIT_BALANCE_COMMAND
	wage = WAGE_COMMAND

	department_account_access = TRUE
	playtimerequired = 1200
	stat_modifiers = list(
		STAT_ROB = 15,
		STAT_TGH = 15,
		STAT_VIG = 15,
	)

	perks = list(PERK_MARKET_PROF, PERK_CLUB, PERK_COMMON_SENSE)

	outfit_type = /decl/hierarchy/outfit/job/service/clubmanager //Re-using this.
	description = "The Bartender runs the colony bar, providing colonists with drinks and entertainment.<br>\
	Working with the Chef and Gardener, you make the big decisions. Run your business well - perhaps seek to maximise profits.<br>\
	Although tips are a good source of income, your wider business acumen will truly decide your prosperity here."

	duties = "Run the bar - provide a safe haven for food, drinks, and entertainment.<br>\
		Seek extra sources of income from the venue - perhaps run deals or trade secrets.<br>\
		Potentially take over cooking duties if a Chef is not present."

/obj/landmark/join/start/clubmanager
	name = "Club Manager"
	icon_state = "player-grey"
	join_tag = /datum/job/clubmanager

/datum/job/fixer
	title = "Fixer"
	flag = FIXER
	department = DEPARTMENT_SERVICE
	department_flag = SERVICE
	faction = MAP_FACTION
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Club Manager"
	difficulty = "Easy."
	alt_titles = list("Sales Technician", "Trade Router")
	selection_color = "#dddddd"
	access = list(access_cargo, access_janitor)

	initial_balance = INIT_BALANCE_MENIAL //Got department account access now
	wage = WAGE_LABOUR_DUMB //They should get paid by making food.

	department_account_access = TRUE
	stat_modifiers = list(
		STAT_ROB = 10,
		STAT_TGH = 10,
	)

	perks = list(PERK_MARKET_PROF, PERK_COMMON_SENSE)

	outfit_type = /decl/hierarchy/outfit/job/service/fixer
	description = "The Fixer oversees sales within the cargo-wing of Skylight and aids the service side in daily operations as requested.<br>\
	You will typically work closely with the Club Workers, keeping order, cleaning, and perhaps entertaining.<br>\
	You are paid mainly through handling sales, providing aid to Club workers as requested, and other means deemed acceptable by the Club manager."

	duties = "Handle trades, requests, and sales within Cargo.<br>\
		Help club staff in keeping customers entertained and catered to.<br>\
		Take on odd jobs and pull connections to get people what they need securely."

/obj/landmark/join/start/fixer
	name = "Fixer"
	icon_state = "player-grey"
	join_tag = /datum/job/fixer

/datum/job/clubworker
	title = "Club Worker"
	flag = CLUBWORKER
	department = DEPARTMENT_SERVICE
	department_flag = SERVICE
	faction = MAP_FACTION
	total_positions = 4
	spawn_positions = 4
	supervisors = "the Club Manager"
	difficulty = "Easy."
	alt_titles = list("Bartender", "Chef", "Gardener")
	selection_color = "#dddddd"
	access = list(access_janitor, access_hydroponics, access_bar, access_kitchen)

	initial_balance = INIT_BALANCE_MENIAL
	wage = WAGE_LABOUR_DUMB //They should get paid by making food.

	perks = list(PERK_CLUB, PERK_CHEF, PERK_COMMON_SENSE)

	stat_modifiers = list(
		STAT_ROB = 10,
		STAT_BIO = 10, // They need it to butcher animals without hurting themselves.
	)

	outfit_type = /decl/hierarchy/outfit/job/service/waiter
	description = "The Club Worker over looks the kitchen, garden, and bar ensuring that the colony remains well-fed and energetic.<br>\
	You will typically work closely with a Bartender, Gardener, and Chef serving, and perhaps entertaining.<br>\
	You are paid mainly through fulfilling requests for food and drinks. The successful Club Worker takes initiative by asking for customer orders."

	duties = "Provide enough meals to feed the colony. Aim for a variety of interesting and tasty dishes.<br>\
		Ensure your customers are well-fed and looked after.<br>\
		Take over bartending, cooking, garden duties if specialists are not present."


/obj/landmark/join/start/clubworker
	name = "Club Worker"
	icon_state = "player-grey"
	join_tag = /datum/job/clubworker

/datum/job/janitor
	title = "Janitor"
	flag = JANITOR
	department = DEPARTMENT_SERVICE
	department_flag = SERVICE
	faction = MAP_FACTION
	total_positions = 2
	spawn_positions = 2
	supervisors = "Club Manager"
	difficulty = "Easy."
	selection_color = "#dddddd"
	alt_titles = list ("Sanitation Worker")
	access = list(access_janitor, access_maint_tunnels, access_morgue, access_hydroponics, access_bar, access_kitchen)

	initial_balance = INIT_BALANCE_HAZARD
	wage = WAGE_LABOUR_HAZARD //No longer part of church you don't need this boy

	health_modifier = 5
	outfit_type = /decl/hierarchy/outfit/job/service/janitor

	perks = list(PERK_JINGLE_JANGLE, PERK_NEAT, PERK_COMMON_SENSE)

	stat_modifiers = list(
		STAT_ROB = 15,
		STAT_TGH = 10,
		STAT_VIG = 15,
		STAT_COG = 10,
	)


	software_on_spawn = list(/datum/computer_file/program/camera_monitor)
	description = "The lowly, reliable, always needed Janitor, well paid but rarely respected, nevertheless provides a valuable service.<br>\
	You will trundle around the colony, armed with your trusty janicart full of cleaning supplies, disposing of trash and pests.<br>\
	Some minor maintenance also falls within your duties. Fix lights, correct broken vendors, replace floor tiles - ease the guild burden.<br>\
	Although your status is miserable, your knowledge of maintenance may lead you to some valuable salvage for some extra cash."

	duties = "Clean blood, dirt, rubble and messes. Don't clean up crime scenes!<br>\
		Conduct minor repairs and maintenance when Union techs aren't available.<br>\
		Restock Newscasters to at lest 15 prints.<br>\
		Deploy traps on burrows and do your best to handle the ongoing pest problem."

/obj/landmark/join/start/janitor
	name = "Janitor"
	icon_state = "player-black"
	join_tag = /datum/job/janitor
