/datum/job/chief_engineer
	title = "Union Chief"
	flag = UNIONCHIEF
	head_position = 1
	department = DEPARTMENT_ENGINEERING
	department_flag = ENGINEERING | COMMAND
	faction = MAP_FACTION
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Liberty Council"
	difficulty = "Medium."
	selection_color = "#c7b97b"
	req_admin_notify = 1
	playtimerequired = 1200
	wage = WAGE_COMMAND
	ideal_character_age = 50
	minimum_character_age = 25
	health_modifier = 5

	disallow_species = list(FORM_UNBRANDED, FORM_PIRSYNTH, FORM_LIBYNTH, FORM_CHURCHSYNTH, FORM_NASHEF)
	outfit_type = /decl/hierarchy/outfit/job/engineering/chief

	access = list(
		access_engine, access_engine_equip, access_tech_storage, access_maint_tunnels,
		access_teleporter, access_external_airlocks, access_atmospherics, access_emergency_storage, access_eva,
		access_heads, access_construction, access_sec_doors, access_network,
		access_ce, access_RC_announce, access_keycard_auth, access_tcomsat, access_ai_upload,
		access_mining, access_mining_office, access_mining_station
	)

	stat_modifiers = list(
		STAT_MEC = 40,
		STAT_COG = 20,
		STAT_TGH = 15,
		STAT_VIG = 15,
	)

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/ntnetmonitor,
							 /datum/computer_file/program/power_monitor,
							 /datum/computer_file/program/supermatter_monitor,
							 /datum/computer_file/program/alarm_monitor,
							 /datum/computer_file/program/atmos_control,
							 /datum/computer_file/program/rcon_console,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/shield_control,
							 /datum/computer_file/program/reports)

	description = "The Union Chief is the head of the local Terra-Therma Worker's Union Chapterhouse, and is responsible for the operation and oversight of all engineering and mining projects on the colony. They direct the Technicians, organising projects and work orders for the workers. It is your job to keep the colony running efficiently. You are the sole authority on Engineering matters, and thus are expected to competently handle repairs and power production across the colony as needed. You also command the Mining Technicians; make sure they are working well and are bringing back materials for the Union. As a leader, it is far more efficient for you to delegate work than attempting to solve everything yourself - spread the labour. Machinery across the colony is your Union's responsibility. Let no outsiders interfere or intrude upon your domain - even Command staff are no exception. Treat every Union member like your family. Keep them paid, fed and safe. The Workers' Union looks after its members, and you are all a fraternity. Your own comes first."

	duties = "Manage the Technicians, be they Mining Technicians or Mechanical Technicians.<br>\
	Set tasks and areas of focus.<br>\
	Strive to protect the rights of your Technicians, as well as their safety and health.<br>\
	Conduct your own repairs and projects as required, especially when low staffed."

	perks = list(PERK_INSPIRATION, PERK_HANDYMAN)

/obj/landmark/join/start/chief_engineer
	name = "Union Chief"
	icon_state = "player-orange-officer"
	join_tag = /datum/job/chief_engineer


/datum/job/engineer
	title = "Mechanical Technician"
	flag = TECHNICIAN
	department = DEPARTMENT_ENGINEERING
	department_flag = ENGINEERING
	faction = MAP_FACTION
	total_positions = 4
	spawn_positions = 4
	supervisors = "the Union Chief"
	difficulty = "Medium."
	selection_color = "#d5c88f"
	wage = WAGE_PROFESSIONAL
	outfit_type = /decl/hierarchy/outfit/job/engineering/engineer
	alt_titles = list("Electrical Technician", "Atmospheric Technician", "Technical Apprentice")
	noob_name = "Technical Apprentice"
	access = list(
		access_eva, access_engine, access_engine_equip, access_tech_storage, access_maint_tunnels,
		access_external_airlocks, access_construction, access_atmospherics
	)

	disallow_species = list(FORM_PIRSYNTH, FORM_LIBYNTH, FORM_NASHEF)


	stat_modifiers = list(
		STAT_MEC = 30,
		STAT_COG = 15,
		STAT_TGH = 10,
		STAT_VIG = 10,
	)

	software_on_spawn = list(/datum/computer_file/program/power_monitor,
							 /datum/computer_file/program/supermatter_monitor,
							 /datum/computer_file/program/alarm_monitor,
							 /datum/computer_file/program/atmos_control,
							 /datum/computer_file/program/rcon_console,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/shield_control)

	description = "The Mechanical Technician is a member of the Terra-Therma Workers' Union, contracted to maintain, repair and power the colony. Your main priority is ensuring the setup and maintenance of the colony's power grid. Seek guidance on this complex task if untrained. You are also expected to ensure that the colony is structurally sound and safe, as well as making sure that it is heated. It's cold outside; make sure the cold doesn't creep in. Outside of this, you should devote time into learning and configuring various systems. Everything can be improved, and new constructs can be made. In your downtime, your arsenal can be improved with mods and different tools, either hand-crafted or made through the Matter NanoForge. Your NanoForge is the pride and joy of the Union; the objects created from it can be used to supplement your equipment or sold for profit. Do not let outsiders, even Command Staff, interfere with the duties of the Union. Be ready to respond to emergency calls at all time. You are the first, and maybe last, line of defense against structural damage."

	duties = "Start up the engines of the colony. Upgrade them when time permits.<br>\
	Repair anything (and anyone who asks) that needs maintenance.<br>\
	Respond to distress calls and patch breaches in the walls.<br>\
	Keep every part of the colony powered, oxygenated, warm and ready to use.<br>\
	Assist the Union whenever needed. The Miners often have use for your crafts, and you depend on them for materials."

	perks = list(PERK_INSPIRATION, PERK_HANDYMAN)

/obj/landmark/join/start/engineer
	name = "Mechanical Technician"
	icon_state = "player-orange"
	join_tag = /datum/job/engineer

/datum/job/mining
	title = "Mining Technician"
	flag = MINER
	department = DEPARTMENT_ENGINEERING
	department_flag = ENGINEERING
	faction = MAP_FACTION
	total_positions = 4
	spawn_positions = 4
	supervisors = "the Union Chief"
	difficulty = "Easy."
	alt_titles = list("Drill Technician", "Mining Apprentice")
	selection_color = "#d5c88f"
	wage = WAGE_LABOUR_HAZARD
	health_modifier = 5

	disallow_species = list(FORM_LIBYNTH, FORM_CHURCHSYNTH)
	outfit_type = /decl/hierarchy/outfit/job/engineering/mining

	description = "The Mining Technician is a professional resource procurer, acquiring valuable minerals and materials for the Terra-Therma Workers' Union. Your primary responsibility is to descend into the deep tunnels and dig up as much ore as you can. Accessed by elevator, the area contains an outpost with all the facilities to process said ore and deliver refined materials ready for use. Whatever you dig up will go to the Union, and from then on it is the responsibility of others within the Union to use or sell as needed. The deep tunnels are far less dangerous than the blisteringly cold wilderness, but pack well - disappearances are not unheard of."

	duties = "Dig up ores and minerals to be processed into usable material.<br>\
	Locate other valuables within the tunnels that may be sold off for profit.<br>\
	Assist the Union whenever needed. The Maintenance Technicians require what you dig up for crafting and repairing the colony, and what they can produce will be invaluable for your work."

	access = list(
		access_eva, access_maint_tunnels, access_external_airlocks, access_mining, access_mining_office, access_mining_station
	)

	perks = list(PERK_INSPIRATION, PERK_HANDYMAN)

	stat_modifiers = list(
		STAT_ROB = 15,
		STAT_TGH = 15,
		STAT_VIG = 15,
		STAT_MEC = 15
	)

	software_on_spawn = list(
							 /datum/computer_file/program/wordprocessor,
							 /datum/computer_file/program/reports
							 )

/obj/landmark/join/start/mining
	name = "Mining Technician"
	icon_state = "player-beige"
	join_tag = /datum/job/mining

//No we won't
