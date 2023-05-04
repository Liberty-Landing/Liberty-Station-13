var/datum/announcement/minor/captain_announcement = new(do_newscast = 1)

/datum/job/secretary
	title = "Board Secretary"
	flag = SECRETARY
	department = DEPARTMENT_COMMAND
	head_position = TRUE
	aster_guild_member = TRUE
	department_flag = COMMAND
	faction = MAP_FACTION
	total_positions = 1
	spawn_positions = 1
	supervisors = "your heart and wisdom"
	difficulty = "Very Hard."
	selection_color = "#ccccff"
	req_admin_notify = 1
	playtimerequired = 2500
	wage = WAGE_COMMAND

	ideal_character_age = 50 // Old geezer captains ftw
	minimum_character_age = 30
	outfit_type = /decl/hierarchy/outfit/job/captain

	perks = list(PERK_SOMELLIER)

	description = "The Board Secretary is man of many talents and responsibilities as such should only be played by experienced players.<br>\
The first thing that should be noted you aren't a captain, just because you have fancy revolver, all access and ability to control accounts of departments doesn't mean you should play as one.<br>\
Your primary objective is to oversee council decisions, change access levels, and act as both lawyer and consultant in various decisions and when it comes to it be a diplomat.<br>\
The heads of staff have final say on matters of their respective departments, unless they are overstepping boundaries or the law leave them to their own devices.<br>\
As a Board Secretary you should have supreme knowledge of both Standard Operating Procedures and Laws as well as paperwork formatting, laziness is no excuse.<br>\
Fax is your best friend, use it, but only when you are sure it won't backfire against you and remember that abusing your gear and access is one way ticket to getting fired."

	duties = "Guide council when required and oversee everything is done by the book.<br>\
	Offer advice and counsel when approached, particularly during important decisions.<br>\
	Manage the colony primary accounts and access levels accordingly.<br>\
	Don't die.<br>"

	stat_modifiers = list(
		STAT_ROB = 15,
		STAT_TGH = 15,
		STAT_BIO = 15,
		STAT_MEC = 15,
		STAT_VIG = 25,
		STAT_COG = 15,
	)

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/card_mod,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/reports)


	get_access()
		return get_all_station_access()

/obj/landmark/join/start/secretary
	name = "Board Secretary"
	icon_state = "player-gold-officer"
	join_tag = /datum/job/secretary
