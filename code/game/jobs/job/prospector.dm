/datum/job/shepherd
	title = "Expeditionary leader"
	flag = SHEPHERD
	head_position = 1
	department = DEPARTMENT_PROSPECTOR
	department_flag = PROSPECTORS | COMMAND
	faction = MAP_FACTION
	total_positions = 1
	spawn_positions = 1
	supervisors = "The Liberty Council"
	difficulty = "Hard."
	selection_color = "#97b0be"
	req_admin_notify = 1
	initial_balance = INIT_BALANCE_COMMAND
	wage = WAGE_COMMAND
	department_account_access = TRUE
	health_modifier = 15

	outfit_type = /decl/hierarchy/outfit/job/shepherd
	playtimerequired = 1200
	access = list(
		access_fontaine, access_field_shepherd, access_external_airlocks, access_eva, access_heads, access_sec_doors,
		access_RC_announce, access_keycard_auth, access_maint_tunnels, access_medical_suits //for locating scav team dead bodies
	)

	stat_modifiers = list(
		STAT_ROB = 30,
		STAT_TGH = 30,
		STAT_VIG = 30,
		STAT_MEC = 10,
		STAT_BIO = 10
	)

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/digitalwarrant,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/reports)

	perks = list(PERK_STALKER, PERK_JUNKBORN, PERK_BUTCHER)

	description = "The Expeditionary Leader manages a Black Bolt Logistics team on the surface, they must both delegate tasks to their team and make sure to maintain a constant flow of supplies for the different factions.<br>\
    Your goal is to lead your team into Profitable locations and take anything valuable that isn't totally destroyed, being crashed spaceships, ruins, raided outposts or villages, be prepared to answer distress signals from the planet or even the space.<br>\
    As the leader of a Black Bolt team you are expected to keep cooperative and fair dealings with the other factions with whom you constantly have to deal and assist.<br>\
	Your job is perhaps the most dangerous in the entire colony, so good combat and survival skills are essential, good social skills are mandatory."

	duties = "Gather your team of Stalkers and Scrappers by equipping them with anything you can find in your staging area and elsewhere.<br>\
	Lead your team through dangerous areas and make sure they recover something of value.<br>\
	Keep everyone alive and make sure no one is left behind.<br>\
	Fill in the missing roles on your team, whether as a Cargo Mule, Medic, Fighter, or your speciality, Be Responsable with your workers."

/obj/landmark/join/start/shepherd
	name = "Expeditionary Leader"
	icon_state = "player-blue-officer"
	join_tag = /datum/job/shepherd

/datum/job/trapper
	title = "Stalker"
	flag = TRAPPER
	department = DEPARTMENT_PROSPECTOR
	department_flag = PROSPECTORS
	faction = MAP_FACTION
	total_positions = 3
	spawn_positions = 3
	supervisors = "The Expeditionary Leader"
	difficulty = "Medium."
/*	noob_name = "Novice Stalker" */
	alt_titles = list("Novice Stalker")
	selection_color = "#a7bbc6"

	initial_balance = INIT_BALANCE_HAZARD
	wage = WAGE_NONE

	outfit_type = /decl/hierarchy/outfit/job/trapper

	health_modifier = 5

	access = list(
		access_fontaine, access_external_airlocks, access_eva, access_maint_tunnels
	)

	stat_modifiers = list(
		STAT_MEC = 20,
		STAT_BIO = 10, // Needed for butchering a bit faster
		STAT_TGH = 10,
		STAT_VIG = 10,
		STAT_ROB = 10
	)
	perks = list(PERK_BUTCHER, PERK_MASTER_HERBALIST)

	description = "The Stalker is a employee of Black Bolt Logistics dedicated to trapping and hunting wildlife as well as acting as a scout for the Scrapper Guards.<br>\
	Your primary role is that of a game hunter. Hunt and butcher wildlife for sale, distribution, or crafting.<br>\
	Your secondary task is providing scouting and forging for your fellow co-workers; such as that of the Scrappers.<br>\
	Remember that you are here to gain riches from the abandoned wilds. Don't waste time and resources mindlessly hunting creatures that don't provide profit unless aiding companions."

	duties = "Extract natural resources for your employer. Use equipment to access new areas and gain a foothold in the wilderness.<br>\
	Aid your colleagues through scouting and applying field-dressing or forging useful materials from the wilds.<br>\
	Leave security duties to the scrappers unless faced with no other option."

/obj/landmark/join/start/trapper
	name = "Stalker"
	icon_state = "player-blue"
	join_tag = /datum/job/trapper

/datum/job/shipbreaker
	title = "Scrapper Guardsman"
	flag = SHIPBREAKER
	department = DEPARTMENT_PROSPECTOR
	department_flag = PROSPECTORS
	faction = MAP_FACTION
	total_positions = 3
	spawn_positions = 3
	supervisors = "The Expeditionary Leader"
	difficulty = "Medium."
/*	noob_name = "Rookie Scrapper" */
	alt_titles = list("Rookie Scrapper")
	selection_color = "#a7bbc6"
	initial_balance = INIT_BALANCE_HAZARD
	wage = WAGE_NONE

	outfit_type = /decl/hierarchy/outfit/job/shipbreaker
	health_modifier = 10

	access = list(
		access_fontaine, access_external_airlocks, access_eva, access_maint_tunnels
	)

	stat_modifiers = list(
		STAT_TGH = 20,
		STAT_VIG = 20,
		STAT_ROB = 20,
		STAT_MEC = 10//to use tools decently, they are breachers now
	)

	perks = list(PERK_STALKER, PERK_JUNKBORN)

	description = "The Scrapper Guardsmen is a loyal member of Black Bolt Logistics, hired and trained to be the strong armored guard of the team<br>\
	Your job is to keep your companions safe if a threat appears during the job, mainly you do the fighting and scrapping using your tools and preferred guns<br>\
	Your primary goal is to provide protection for companions while in the wilds and gather all the loot possible from outside the colony, or search in non-owned areas for loot."

	duties = "Guard your peers from hostile creatures and other dangers that cross your path, report any unknown threat to the colony.<br>\
	Use whatever measures necessary to ensure survival, but try not to soil the standing of your team, don't shoot fuel roaches or take away your gas mask.<br>\
	Help with the more general salvaging and heavy lifting, be there if the colony needs defenders, don't use your knowledge in breachs to steal From the Colony."

/obj/landmark/join/start/shipbreaker
	name = "Scrapper Guardsmen"
	icon_state = "player-blue"
	join_tag = /datum/job/shipbreaker
