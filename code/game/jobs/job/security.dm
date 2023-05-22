/datum/job/dc
	title = "Deputy Chief"
	flag = DC
	head_position = 1
	department = DEPARTMENT_SECURITY
	department_flag = SECURITY | COMMAND
	faction = MAP_FACTION
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Council"
	difficulty = "Very Hard."
	selection_color = "#97b0be"
	req_admin_notify = 1

	initial_balance = INIT_BALANCE_COMMAND
	wage = WAGE_COMMAND

	ideal_character_age = 40
	minimum_character_age = 30
	department_account_access = TRUE
	playtimerequired = 2500
	health_modifier = 25

	outfit_type = /decl/hierarchy/outfit/job/security/dc

	access = list(
		access_security, access_eva, access_sec_doors, access_brig, access_armory, access_medspec, access_hos, access_tcomsat,
		access_forensics_lockers, access_morgue, access_maint_tunnels, access_all_personal_lockers,
		access_moebius, access_engine, access_mining, access_construction, access_mailsorting,
		access_heads, access_hos, access_RC_announce, access_keycard_auth, access_gateway,
		access_external_airlocks, access_research_equipment, access_prospector, access_medical, access_kitchen, access_medical_suits
	)

	stat_modifiers = list(
		STAT_ROB = 30,
		STAT_TGH = 40,
		STAT_VIG = 40,
	)

	perks = list(PERK_ASS_OF_CONCRETE,
				 PERK_CODESPEAK,
				 PERK_GUNSMITH,
				 PERK_CHEM_CONTRABAND)

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/digitalwarrant,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/reports)

	description = "The Deputy Chief serves as the operations commander of the local group of Liberty Watch.<br>\
	Contracted to protect and serve the colony, your group of Watchmen serve as the colony's internal and external security experts.<br>\
	Your goal is to keep everyone living on the colony as safe as possible and to eliminate any threats to safety.<br>\
	Deligate tasks to your team of Watchmen under you and stay atop of operations. Advise your employees and aid them in their duties."

	duties = "Coordinate with the Watchmen in the field, assigning them to threats and distress calls as needed.<br>\
		Work with the Board of Directors to handle inter-departmental affairs from a legal standpoint.<br>\
		Organize and prepare the colony's security forces for any threats; internal or external.<br>\
		Oversee performance of the Watchmen under your command and handle any that are incompitant or otherwise insubordinate.<br>\
		Advise the Board of Directors on threats to colony security and advise them towards choices that will minimise exposure to threats."

/obj/landmark/join/start/dc
	name = "Deputy Chief"
	icon_state = "player-blue-officer"
	join_tag = /datum/job/dc

/datum/job/armorer
	title = "Armorer"
	flag = ARMORER
	department = DEPARTMENT_SECURITY
	department_flag = SECURITY
	faction = MAP_FACTION
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Deputy Chief"
	difficulty = "Hard."
	alt_titles = list("Supply Specialist", "Quartermaster", "Warden")
	selection_color = "#a7bbc6"
	department_account_access = TRUE

	initial_balance = INIT_BALANCE_HAZARD
	wage = WAGE_LABOUR_HAZARD

	minimum_character_age = 25
	playtimerequired = 1200
	health_modifier = 20

	outfit_type = /decl/hierarchy/outfit/job/security/armorer

	access = list(
		access_security, access_moebius, access_medspec, access_engine, access_mailsorting,
		access_eva, access_sec_doors, access_brig, access_armory, access_maint_tunnels, access_morgue,
		access_external_airlocks, access_research_equipment, access_prospector,
		access_hydroponics, access_bar, access_kitchen, access_medical_suits, access_sec_shop, access_forensics_lockers
	)

	stat_modifiers = list(
		STAT_ROB = 25,
		STAT_TGH = 25,
		STAT_VIG = 25,
	)

	software_on_spawn = list(/datum/computer_file/program/digitalwarrant,
							 /datum/computer_file/program/camera_monitor)

	perks = list(PERK_MARKET_PROF,
				 PERK_CODESPEAK,
				 PERK_CHEM_CONTRABAND,
				 PERK_GUNSMITH)

	description = "The Armorer is the right hand of the Deputy Chief and the defacto controller of the armory and armory shop. <br>\
	Your role is mainly a desk job - with duties rarely taking you outside of the colony or even the armory.<br>\
	You will often be called to sell weaponry and armory to colonists, maintaining the stock of the equipment and tracking who has what.<br>\
	You will also be often asked to watch or process prisoners. Perform regular checkups on anyone locked in the brig - breakouts are intolerable.<br>\
	In quieter times, you serve as the on-site weapons instructor. Take the initiative to offer a variety of training drills, especially to junior operatives.<br>\
	Remember that any Deputy Chief duties may be delegated to you if they wish and internal tasks will fall to you at times."

	duties = "Manage a good balance of armory stock, and dispense responsibly with a paper trail and fair price.<br>\
	Monitor prisoners in the brig to ensure their health and safety.<br>\
	Perform training drills and other exercises to bring the Watchman up to standard."

/obj/landmark/join/start/armorer
	name = "Armorer"
	icon_state = "player-blue"
	join_tag = /datum/job/armorer

/datum/job/investigator
	title = "Criminal Investigator"
	flag = INVESTIGATOR
	department = DEPARTMENT_SECURITY
	department_flag = SECURITY
	faction = MAP_FACTION
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Deputy Chief"
	difficulty = "Hard."
	/*noob_name = "Criminal Profiler"*/
	alt_titles = list("Criminal Profiler","Forensics Specialist", "Crimescene Investigator", "Detective")
	selection_color = "#a7bbc6"

	initial_balance = INIT_BALANCE_PROF
	wage = WAGE_PROFESSIONAL

	playtimerequired = 1200
	health_modifier = 5

	outfit_type = /decl/hierarchy/outfit/job/security/investigator

	access = list(
		access_security, access_moebius, access_medspec, access_engine, access_mailsorting,
		access_sec_doors, access_forensics_lockers, access_morgue, access_maint_tunnels,
		access_external_airlocks, access_prospector, access_brig, access_hydroponics, access_bar, access_kitchen,
		access_medical_suits
	)

	perks = list(PERK_EAR_OF_QUICKSILVER,
				 PERK_CODESPEAK,
				 PERK_CHEM_CONTRABAND)

	stat_modifiers = list(
		STAT_BIO = 15,
		STAT_ROB = 15,
		STAT_TGH = 15,
		STAT_VIG = 25,
	)

	software_on_spawn = list(/datum/computer_file/program/digitalwarrant,
							 /datum/computer_file/program/audio,
							 /datum/computer_file/program/camera_monitor)

	description = "The Criminal Investigator is the colony detective and field agent, taking on cases and suspects that aren't always what they seem.<br>\
	Your job is to interrogate suspects, gather witness statements,  harvest evidence and reach a conclusion about the nature and culprit of a crime.<br>\
	You are a higher ranking position than officers and operatives and can determine if charges are valid and may release individuals for lack of evidence. <br>\
	However, you cannot give orders outside those pertaining to charges and arrests. The Deputy Chief still outranks you - bring all conflicts to them.<br>\
	When there are no outstanding cases, look for them. Mingle with civilians, interact and converse, sniff out leads about potential criminal activity."

	duties = "Interview suspects and witnesses after a crime. Record important details of their statements, and look for inconsistencies.<br>\
		Gather evidence and bring it back for processing.<br>\
		Send out officers to bring suspects in for questioning.<br>\
		Interact with civilians and be on the lookout for criminal activity."

/obj/landmark/join/start/investigator
	name = "Criminal Investigator"
	icon_state = "player-blue"
	join_tag = /datum/job/investigator

/datum/job/watchmen
	title = "Watchmen"
	flag = WATCHMEN
	department = DEPARTMENT_SECURITY
	department_flag = SECURITY
	faction = MAP_FACTION
	total_positions = 6
	spawn_positions = 6
	supervisors = "the Deputy Chief"
	difficulty = "Hard."
	/*noob_name = "Watchmen Greenhorn"*/
	alt_titles = list("Watchmen Greenhorn", "Sentry", "Patrolman")
	selection_color = "#a7bbc6"

	initial_balance = INIT_BALANCE_HAZARD
	wage = WAGE_LABOUR_HAZARD

	health_modifier = 10

	outfit_type = /decl/hierarchy/outfit/job/security/watchmen

	access = list(
		access_security, access_moebius, access_engine, access_mailsorting, access_eva, access_forensics_lockers, access_medspec,
		access_sec_doors, access_brig, access_maint_tunnels, access_morgue, access_external_airlocks, access_prospector, access_kitchen, access_medical_suits
	)

	stat_modifiers = list(
		STAT_ROB = 25,
		STAT_TGH = 25,
		STAT_VIG = 20,
	)

	perks = list(PERK_CHEM_CONTRABAND, PERK_CODESPEAK)

	software_on_spawn = list(/datum/computer_file/program/digitalwarrant,
							 /datum/computer_file/program/camera_monitor)

	description = "The Watchmen forms the brunt of the Watchmen, internally enforcing law and keeping the peace.<br>\
	You are expected to be a problem solver who can descalate situations, reach peaceful agreements, and maintain public trust.<br>\
	Keep your weapons holstered unless the situation demands otherwise - exercise good judgment and follow Blackshield orders.<br>\
	When there are no standing orders, your ongoing task is to patrol the colony and be on the lookout for threats or problems. <br>\
	Check in at departments and watch the main gate. You have access to most places to help with your duties  - do not abuse this."

	duties = "Patrol the colony, provide a security presence, and look for trouble.<br>\
		Deal with internal threats to the colony such as criminals, saboteurs, and anything that endangers colonists.<br>\
		Ensure that people follow the law and SoP to maintain order.<br>\
		Follow orders from the chain of command.<br>\
		Obey the law. You are not above it."

/obj/landmark/join/start/watchmen
	name = "Watchmen"
	icon_state = "player-blue"
	join_tag = /datum/job/watchmen
