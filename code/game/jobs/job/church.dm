/datum/job/oathpledge
	title = "Oathpledge"
	flag = OATHPLEDGE
	department = DEPARTMENT_CHURCH
	department_flag = CHURCH | COMMAND
	faction = MAP_FACTION
	head_position = 1
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Liberty Council"
	difficulty = "Medium."
	selection_color = "#caaa42"
	ideal_character_age = 40
	minimum_character_age = 25
	playtimerequired = 1200
	security_clearance = CLEARANCE_CLERGY
	health_modifier = 10
	access = list(access_nt_preacher, access_nt_disciple, access_morgue, access_chapel_office, access_crematorium, access_maint_tunnels, access_RC_announce, access_keycard_auth, access_heads, access_sec_doors)
	disallow_species = list(FORM_FBP, FORM_UNBRANDED, FORM_PIRSYNTH, FORM_TERRAYNTH, FORM_LIBYNTH, FORM_NASHEF)

	wage = WAGE_COMMAND //The church has deep pockets
	department_account_access = TRUE
	outfit_type = /decl/hierarchy/outfit/job/church/oathpledge

	stat_modifiers = list(
		STAT_MEC = 30,
		STAT_BIO = 15,
		STAT_COG = 10,
		STAT_VIG = 15,
		STAT_TGH = 10,
	)

	perks = list(PERK_CHANNELING)

	software_on_spawn = list(/datum/computer_file/program/records,
							 /datum/computer_file/program/reports)

	core_upgrades = list(
		CRUCIFORM_PRIEST,
		CRUCIFORM_REDLIGHT
	)

	description = "The Oathpledge serves as the head of the local branch of the Church of the Bonfire. <br>\
	You represent the interest of the church and its disciples within the colony - identified by the cruciform implant upon their breast.<br>\
	Your most pressing duty is as a spiritual leader. Preach to the flock, inspire faith and strength, and convert those seeking salvation.<br>\
	While you are no trained psychologist, you can provide support and guidance to all - in both bright and dark times.<br>\
	Additional duty may require holding funerals for the truly lost, or host parties and group praying.<br>\
	The Crusader protocol may also be enacted under your command when facing a Hivemind threat. Use this boost, and your ritual book, to defeat evil."

	duties = "Represent the interests of church disciples on the colony. Protect them from persecution and speak for them.<br>\
		Hold mass, give sermons, preach to the faithful, and lead group ritual sessions.<br>\
		Hold funerals for those who cannot be saved."

	setup_restricted = TRUE

/obj/landmark/join/start/oathpledge
	name = "Oathpledge"
	icon_state = "player-black"
	join_tag = /datum/job/oathpledge

/datum/job/forgemaster
	title = "Forgemaster"
	flag = FORGEMASTER
	department = DEPARTMENT_CHURCH
	department_flag = CHURCH
	faction = MAP_FACTION
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Oathpledge"
	difficulty = "Easy."
	security_clearance = CLEARANCE_COMMON
	selection_color = "#ecd37d"
	access = list(access_nt_disciple, access_morgue, access_chapel_office, access_crematorium, access_maint_tunnels)
	outfit_type = /decl/hierarchy/outfit/job/church/forgemaster
	wage = WAGE_PROFESSIONAL //Specialist
	stat_modifiers = list(
		STAT_TGH = 20, //basically a punching bag, he can't robust anyone or shoot guns anyway
		STAT_MEC = 10  //They often deal with tool mods guns and other things that need these
	)

	//You need insperation to do your job.
	disallow_species = list(FORM_FBP, FORM_UNBRANDED, FORM_PIRSYNTH, FORM_TERRAYNTH, FORM_LIBYNTH, FORM_CHURCHSYNTH, FORM_NASHEF)


	perks = list(PERK_MARKET_PROF, PERK_ARTIST, PERK_STALKER)
	software_on_spawn = list(
							 /datum/computer_file/program/scanner,
							 /datum/computer_file/program/wordprocessor,
							 /datum/computer_file/program/reports)

	description = "The Artist serves as a versatile performance artist here to entertain the colony.<br>\
	You may find your colleagues distracted by boring duties or senseless bickering, so work hard to bring them some real culture.<br>\
	The CEO pays you a terrible retaining fee, so use your wits to sustain yourself - perhaps ask your audience for donations.<br>\
	In addition you do not gain desires like other members of the colony, instead you spend your insight at your workbench to create expensive works of art worth selling."

	duties = "Provide (family-friendly) entertainment to the crew with your varied talents.<br>\
		Create and sell valuable works of art in your artist bench.<br>\
		Try to be a successful rather than starving artist. The costume vendor and equipment in your cramped studio may prove useful."
	setup_restricted = TRUE

/obj/landmark/join/start/forgemaster
	name = "Forgemaster"
	icon_state = "player-grey"
	join_tag = /datum/job/forgemaster

/datum/job/enkindled
	title = "Enkindled"
	flag = ENKINDLED
	department = DEPARTMENT_CHURCH
	department_flag = CHURCH
	faction = MAP_FACTION
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Oathpledge"
	difficulty = "Easy to Medium."
	selection_color = "#ecd37d"
	access = list(access_morgue, access_crematorium, access_maint_tunnels, access_nt_disciple)
	wage = WAGE_LABOUR
	outfit_type = /decl/hierarchy/outfit/job/church/enkindled
	security_clearance = CLEARANCE_COMMON
	health_modifier = 5
	stat_modifiers = list(
	STAT_MEC = 25,
	STAT_BIO = 10,
	STAT_VIG = 10,
	STAT_TGH = 5,
	)
	disallow_species = list(FORM_FBP, FORM_UNBRANDED, FORM_PIRSYNTH, FORM_TERRAYNTH, FORM_LIBYNTH, FORM_NASHEF)

	core_upgrades = list(
		CRUCIFORM_PRIEST
	)

	perks = list(PERK_CHANNELING)

	description = "The Vector serves the Oathpledge, and more generally the church, as a disciple of the Faith.<br>\
	The sacred duties of operating the bioreactor and managing biomass for the church machines are your main priority.<br>\
	You should also work to present the Faith in a positive light to all colonists. The Vector may issue you with further duties."

	duties = "Operate the bioreactor and manage biomass for the church machines.<br>\
		Maintain areas owned by the church, keeping the facilities functional and in good order.<br>\
		Offer assistance to the faithful and non-faithful alike."

	setup_restricted = TRUE

/obj/landmark/join/start/enkindled
	name = "Enkindled"
	icon_state = "player-black"
	join_tag = /datum/job/enkindled

/datum/job/oathbound
	title = "Oathbound"
	flag = OATHBOUND
	department = DEPARTMENT_CHURCH
	department_flag = CHURCH
	faction = MAP_FACTION
	total_positions = 3
	spawn_positions = 3
	supervisors = "the Oathpledge"
	difficulty = "Easy to Medium."
	selection_color = "#ecd37d"
	access = list(access_morgue, access_crematorium, access_maint_tunnels, access_nt_disciple)
	wage = WAGE_LABOUR_DUMB
	outfit_type = /decl/hierarchy/outfit/job/church/oathbound
	security_clearance = CLEARANCE_COMMON
	health_modifier = 5
	stat_modifiers = list(
	STAT_MEC = 25,
	STAT_BIO = 10,
	STAT_VIG = 10,
	STAT_TGH = 5,
	)
	disallow_species = list(FORM_FBP, FORM_UNBRANDED, FORM_PIRSYNTH, FORM_TERRAYNTH, FORM_LIBYNTH, FORM_NASHEF)

	core_upgrades = list(
		CRUCIFORM_PRIEST
	)

	perks = list(PERK_CHANNELING)

	description = "The Vector serves the Oathpledge, and more generally the church, as a disciple of the Faith.<br>\
	The sacred duties of operating the bioreactor and managing biomass for the church machines are your main priority.<br>\
	You should also work to present the Faith in a positive light to all colonists. The Vector may issue you with further duties."

	duties = "Operate the bioreactor and manage biomass for the church machines.<br>\
		Maintain areas owned by the church, keeping the facilities functional and in good order.<br>\
		Offer assistance to the faithful and non-faithful alike."

	setup_restricted = TRUE

/obj/landmark/join/start/oathbound
	name = "Oathbound"
	icon_state = "player-black"
	join_tag = /datum/job/oathbound
