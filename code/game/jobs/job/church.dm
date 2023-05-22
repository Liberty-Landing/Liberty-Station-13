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
	health_modifier = 20
	access = list(access_nt_preacher, access_nt_disciple, access_morgue, access_chapel_office, access_crematorium, access_maint_tunnels, access_RC_announce, access_keycard_auth, access_heads, access_sec_doors)

	initial_balance = INIT_BALANCE_COMMAND
	wage = WAGE_COMMAND
	department_account_access = TRUE
	outfit_type = /decl/hierarchy/outfit/job/church/oathpledge

	stat_modifiers = list(
		STAT_COG = 15,
		STAT_TGH = 45,
		STAT_ROB = 45,
	)

	perks = list(PERK_CHANNELING)

	software_on_spawn = list(/datum/computer_file/program/records,
							 /datum/computer_file/program/reports)

	core_upgrades = list(
		CRUCIFORM_OATHBOUND,
		CRUCIFORM_OATHPLEDGE,
		CRUCIFORM_CUSTODIAN,
	)

	description = "The Oathpledge is the leader and beacon of guidance of the main surface stronghold. One of many in both cases.<br>\
	You represent the interests of the Custodians, their knights and their philosophical views - working together with purifying intentions against the many plagues that curse the colony.<br>\
	Your major duty is to ensure that the Oaths are respected and followed by all Hearthcore users. You are the symbol of discipline being superior to mindwashing - different from your enemies - and are obligated to act as such.<br>\
	You are capable of altering the neural data of Hearthcores and provide support to your knights in battle, allowing their mental boundaries to vanish and bring their purifying force into light, making demigods out of trained warriors. You have ways to know where an enemy is hiding.<br>\
	Your role does not mean you are the highest in rank or the oldest member, but rather that you specialize in leadership, social capability, and financial spending."

	duties = "Provide guidance and discipline to Oathbounds and To-be Oathbounds.<br>\
	Hold philosophical discussions and plan cleansing efforts against plague-infested places, the mutants, the brainwashers and the slavers.<br>\
	Provide combative support to other Oathbounds and stay in watch against whatever may hurt the precious dogmas of the Custodians."

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
	health_modifier = 20
	access = list(access_nt_disciple, access_morgue, access_chapel_office, access_crematorium, access_maint_tunnels)
	outfit_type = /decl/hierarchy/outfit/job/church/forgemaster

	initial_balance = INIT_BALANCE_MENIAL
	wage = WAGE_LABOUR
	stat_modifiers = list(
		STAT_MEC = 30,
		STAT_TGH = 20,
		STAT_ROB = 20,
	)

	core_upgrades = list(
		CRUCIFORM_FORGEMASTER,
		CRUCIFORM_CUSTODIAN,
	)

	perks = list(PERK_STALKER, PERK_ARTIST, PERK_CHANNELING)
	software_on_spawn = list(
							 /datum/computer_file/program/scanner,
							 /datum/computer_file/program/wordprocessor,
							 /datum/computer_file/program/reports)

	description = "Where the Oathpledge discipline the Oathbounds, the Forgemaster discipline the fire - specialized in engineering and tinkering, the Forgemasters are the backbone of the Custodian’s supportive operations.<br>\
    Artisans of marvels beyond normal comprehension, one uses the fist as a hammer and fire as fuel to discipline red hot steel into shape, creating statues, walls, machines, Hearthcore upgrades, artistic oddities and weapon mods.<br>\
    Forgemasters may not have the fighting capability of the unspecialized Oathbounds, yet their creative mind provides financial support, combat prowess, equipment and upgrades to the Custodians.<br>\
    In addition, you do not gain desires like other members of the colony, you spend your insight at your workbench to create expensive works of art fit to trade or to be used to recover the insight of the common people."

	duties = "Create, use and sell valuable arts of your own making.<br>\
	Ensure that the Stronghold is well protected against the insectoid plague, the mutants and mindcontrolled fiends."

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

	initial_balance = INIT_BALANCE_MENIAL
	wage = WAGE_LABOUR
	outfit_type = /decl/hierarchy/outfit/job/church/enkindled
	security_clearance = CLEARANCE_COMMON
	health_modifier = 10
	stat_modifiers = list(
		STAT_BIO = 30,
		STAT_TGH = 20,
		STAT_ROB = 20,
	)

	core_upgrades = list(
		CRUCIFORM_ENKINDLED,
		CRUCIFORM_CUSTODIAN,
	)

	perks = list(PERK_CHANNELING)

	description = "The Enkindled are the blood transmuters specialized in the proto-science of traditions of biology - with the revolutionary custodian spin.<br>\
    The Enkindled are not proficient in surgery and lack the tools for it, but they are able to produce many different elixirs from the corpses of fallen creatures with varying effects - from healing tinctures, throwable flasks, poison needles, combat enhancers and status potions.<br>\
    Be aware, potions can be too strong to Oathbounds about to head into battle, in fact, many potions also possess negative qualities that the Oathbounds must be aware of before combat.<br>\
	Hearthcore users cannot be cloned, so it falls to the Enkindled to bring them back to life with their Hearthcore, reborn with the neural nature of the radiance, bringing their brain back to life and allowing further organ revival to take place.<br>\
    Enkindled are known for being somewhat mentally derailed  - in a good and bad way. They are more than capable of recovering the sanity of others as much as they heal, with the last possibly causing sanity damage."

	duties = "Provide medical support to other Oathbounds in battle and in rest - but do not get in the way of CAPSA. <br>\
	Provide sanity recovery and enhancing services to those you deem fit.<br>\
	Produce strong potions and don't sell it to ingenuous Oathbounds, throw a flask at a roach and watch it become an acidic glop for fun"

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
	total_positions = 4
	spawn_positions = 4
	supervisors = "the Oathpledge"
	difficulty = "Easy to Medium."
	selection_color = "#ecd37d"
	access = list(access_morgue, access_crematorium, access_maint_tunnels, access_nt_disciple)

	initial_balance = INIT_BALANCE_MENIAL
	wage = WAGE_LABOUR
	outfit_type = /decl/hierarchy/outfit/job/church/oathbound
	security_clearance = CLEARANCE_COMMON
	health_modifier = 10
	stat_modifiers = list(
		STAT_COG = 10,
		STAT_TGH = 30,
		STAT_ROB = 30,
	)

	core_upgrades = list(
		CRUCIFORM_OATHBOUND,
		CRUCIFORM_CUSTODIAN,
	)

	perks = list(PERK_CHANNELING)

	description = "The Oathbounds are the combat units, footsoldiers of purity that burn down the plague inside and outside the colony, along with mutants and antagonistic entities that defy their dogmas.<br>\
    Oathbounds can supply their forces in expeditions and help change the tide of battle with their high defensive capabilities and overall toughness in the frontlines, keeping the flimsy gun-users behind and protected, or ignite them on accident - to the disdain of their Oathpledge.<br>\
    Oathbounds are meant to be well trained and reflect the strength of people in the times of old, when society did not weaken it's people, so one must act like such (See: Oaths and Custodian culture). They are not allowed to use firearms like all other custodians, but their blades, staves and throwing weapons of enhanced rudimentary technology proves highly competitive against the most common technology.<br>\
    Oathbounds should work the machinery and provide the colony with Custodian products of textile and protective nature, but only non-igniting weapons can be sold."

	duties = "Cleanse the insectoid plague from the halls and maintenance tunnels, but take care not to harm the Cht'mant next door.<br>\
	Ensure that there's no religious entity putting Oathbounds's free will at risk, spread philosophical ideas around the colony.<br>\
	Help other custodian roles to the best of your abilities as much as they help you, ask the Enkindled for their strongest potions, work the Bonfire and produce many textile and armor products to help the economy."

	setup_restricted = TRUE

/obj/landmark/join/start/oathbound
	name = "Oathbound"
	icon_state = "player-black"
	join_tag = /datum/job/oathbound
