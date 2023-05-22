#define CRUCIFORM_TYPE obj/item/implant/core_implant/cruciform

//Creates a global list for searching requirements, and three separate lists for the weak/medium/strong manifestation lectures, more relevant with the custodian tier upgrades later
//Probably sloppy? I don't know a better way

GLOBAL_LIST_INIT(custodian_blueprints, init_custodian_blueprints())
GLOBAL_LIST_INIT(weak_blueprints, init_weak_blueprints())
GLOBAL_LIST_INIT(medium_blueprints, init_medium_blueprints())
GLOBAL_LIST_INIT(strong_blueprints, init_strong_blueprints())

/proc/init_custodian_blueprints()
	var/list/list = list()
	for(var/blueprint_type in typesof(/datum/custodian_blueprint))
		if(blueprint_type == /datum/custodian_blueprint)
			continue
		if(blueprint_type == /datum/custodian_blueprint/weak)
			continue
		if(blueprint_type == /datum/custodian_blueprint/medium)
			continue
		if(blueprint_type == /datum/custodian_blueprint/strong)
			continue
		var/datum/custodian_blueprint/pb = new blueprint_type()
		list[pb.name] = pb
	. = list

/proc/init_weak_blueprints()
	var/list/list = list()
	for(var/blueprint_type in typesof(/datum/custodian_blueprint/weak))
		if(blueprint_type == /datum/custodian_blueprint/weak)
			continue
		var/datum/custodian_blueprint/pb = new blueprint_type()
		list[pb.name] = pb
	. = list

/proc/init_medium_blueprints()
	var/list/list = list()
	for(var/blueprint_type in typesof(/datum/custodian_blueprint/medium))
		if(blueprint_type == /datum/custodian_blueprint/medium)
			continue
		var/datum/custodian_blueprint/pb = new blueprint_type()
		list[pb.name] = pb
	. = list

/proc/init_strong_blueprints()
	var/list/list = list()
	for(var/blueprint_type in typesof(/datum/custodian_blueprint/strong))
		if(blueprint_type == /datum/custodian_blueprint/strong)
			continue
		var/datum/custodian_blueprint/pb = new blueprint_type()
		list[pb.name] = pb
	. = list

//Create a list of what the blueprints actually make, and the materials required to make them. Blueprints list generation turns them into text format, not datums.
GLOBAL_LIST_INIT(nt_constructs, init_nt_constructs())

/proc/init_nt_constructs()
	var/list/nt_constructs = list()
	for(var/name in GLOB.custodian_blueprints)
		var/datum/custodian_blueprint/accessed = GLOB.custodian_blueprints[name]
		nt_constructs[accessed.build_path] = accessed.materials
	. = nt_constructs

/datum/ritual/cruciform/forgemaster/flame_guidance
	name = "Flame Guidance"
	phrase = "Oxidate Lecture: Flame Guidance"
	desc = "Learn the requirements for constructing a specific Custodian blueprint."
	category = "Construction"

/datum/ritual/cruciform/forgemaster/flame_guidance/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C, list/targets)
	var/construction_key = input("Select construction", "") as null|anything in GLOB.custodian_blueprints
	if (!construction_key)
		return FALSE
	var/datum/custodian_blueprint/blueprint = GLOB.custodian_blueprints[construction_key]
	var/list/listed_components = list()
	for(var/requirement in blueprint.materials)
		var/atom/placeholder = requirement
		if(!ispath(placeholder))
			continue
		listed_components += list("[blueprint.materials[placeholder]] [initial(placeholder.name)]")
	to_chat(user, SPAN_NOTICE("[blueprint.name] requires: [english_list(listed_components)]."))
	return TRUE

/datum/ritual/cruciform/forgemaster/deconstruction
	name = "Uproot"
	phrase = "Oxidate Lecture: Uproot"
	desc = "Deconstruct a Custodian machine infront of you."
	power = 25

/datum/ritual/cruciform/forgemaster/deconstruction/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C, list/targets)
	if(!GLOB.nt_constructs) //Makes sure the list we curated earlier actually exists
		fail("You have no idea what constitutes a church construct.",user,C,targets)
		return

	var/obj/reclaimed //Variable to be defined later as the removed construct
	var/loot //Variable to be defined later as materials resulting from deconstruction
	var/turf/target_turf = get_step(user,user.dir) //Gets the turf in front of the user

	//Find the NT Structure in front of the player
	for(reclaimed in target_turf)
		if(reclaimed.type in GLOB.nt_constructs)
			loot = GLOB.nt_constructs[reclaimed.type]
			break

	if(isnull(loot))
		fail("There is nothing to remove here.",user,C,targets)
		return

	user.visible_message(SPAN_NOTICE("[user] stretches a hand forward."),SPAN_NOTICE("You start reclaiming."))

	var/obj/effect/overlay/nt_construction/effect = new(target_turf, 5 SECONDS)

	if(!do_after(user, 5 SECONDS, target_turf)) //"Sit still" timer
		fail("You feel something is judging you upon your impatience",user,C,targets)
		effect.failure()
		return FALSE

	if(QDELETED(reclaimed) || reclaimed.loc != target_turf)
		fail("It's no longer there.", user, C, targets)
		effect.failure()
		return FALSE

	//Lets spawn and drop the materials resulting from deconstruction
	for(var/obj/scrap as anything in loot)
		if(ispath(scrap, /obj/item/stack))
			var/obj/item/stack/mat = new scrap(target_turf)
			mat.amount = loot[scrap]
		else
			scrap = new scrap(target_turf)

	effect.success()
	user.visible_message(SPAN_NOTICE("Clanking of parts hit the floor as [user] finishes the machine falls apart."),SPAN_NOTICE("The machine falls apart into it's components."))

	qdel(reclaimed)
	return TRUE

/datum/ritual/cruciform/forgemaster/construction
	name = "Weak Manifestation"
	phrase = "Oxidate Lecture: Weak Manifestation"
	desc = "Shape materials and components in front of you into a Custodian design."
	power = 25
	category = "Construction"

/datum/ritual/cruciform/forgemaster/construction/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C, list/targets)
	var/construction_key = input("Select construction", "") as null|anything in GLOB.weak_blueprints
	var/datum/custodian_blueprint/blueprint = GLOB.weak_blueprints[construction_key]
	var/turf/target_turf = get_step(user,user.dir)
	if(!blueprint)
		fail("You decided not to construct anything.",user,C,targets)
		return
	if(!items_check(user, target_turf, blueprint))
		fail("Something is missing.",user,C,targets)
		return

	user.visible_message(SPAN_NOTICE("You see as [user] passes his hands over something."),SPAN_NOTICE("You concentrate on the [blueprint.name]'s image."))

	var/obj/effect/overlay/nt_construction/effect = new(target_turf, blueprint.build_time)

	if(!do_after(user, blueprint.build_time, target_turf))
		fail("You feel something is judging you upon your impatience",user,C,targets)
		effect.failure()
		return
	if(!items_check(user, target_turf, blueprint))
		fail("Something got moved!",user,C,targets)
		effect.failure()
		return
	//magic has to be a bit innacurate

	for(var/item_type in blueprint.materials)
		var/t = locate(item_type) in target_turf.contents
		if(istype(t, /obj/item/stack))
			var/obj/item/stack/S = t
			S.use(blueprint.materials[item_type])
		else
			qdel(t)

	effect.success()
	user.visible_message(SPAN_NOTICE("You hear a soft humming sound as [user] finishes."),SPAN_NOTICE("You take a deep breath as your efforts conclude."))
	var/build_path = blueprint.build_path
	new build_path(target_turf)

/datum/ritual/cruciform/forgemaster/construction/proc/items_check(mob/user,turf/target, datum/custodian_blueprint/blueprint)
	var/list/turf_contents = target.contents

	for(var/item_type in blueprint.materials)
		var/located_raw = locate(item_type) in turf_contents
		//single item check is handled there, rest of func is for stacked items or items with containers
		if(!located_raw)
			return FALSE

		var/required_amount = blueprint.materials[item_type]
        // I hope it is fast enough
        // could have initialized it in glob
		if(item_type in typesof(/obj/item/stack/))
			var/obj/item/stack/stacked = located_raw
			if(stacked.amount < required_amount)
				return FALSE
	return TRUE

/datum/ritual/cruciform/forgemaster/construction/medium
	name = "Medium Manifestation"
	phrase = "Oxidate Lecture: Medium Manifestation"
	desc = "Shape materials and components in front of you into a Custodian design."
	power = 30
	category = "Construction"

/datum/ritual/cruciform/forgemaster/construction/medium/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C, list/targets)
	var/construction_key = input("Select construction", "") as null|anything in GLOB.medium_blueprints
	var/datum/custodian_blueprint/blueprint = GLOB.medium_blueprints[construction_key]
	var/turf/target_turf = get_step(user,user.dir)
	if(!blueprint)
		fail("You decided not to construct anything.",user,C,targets)
		return
	if(!items_check(user, target_turf, blueprint))
		fail("Something is missing.",user,C,targets)
		return

	user.visible_message(SPAN_NOTICE("You see as [user] passes his hands over something."),SPAN_NOTICE("You concentrate on the [blueprint.name]'s image."))

	var/obj/effect/overlay/nt_construction/effect = new(target_turf, blueprint.build_time)

	if(!do_after(user, blueprint.build_time, target_turf))
		fail("You feel something is judging you upon your impatience",user,C,targets)
		effect.failure()
		return
	if(!items_check(user, target_turf, blueprint))
		fail("Something got moved!",user,C,targets)
		effect.failure()
		return
	//magic has to be a bit innacurate

	for(var/item_type in blueprint.materials)
		var/t = locate(item_type) in target_turf.contents
		if(istype(t, /obj/item/stack))
			var/obj/item/stack/S = t
			S.use(blueprint.materials[item_type])
		else
			qdel(t)

	effect.success()
	user.visible_message(SPAN_NOTICE("You hear a soft humming sound as [user] finishes."),SPAN_NOTICE("You take a deep breath as your efforts conclude."))
	var/build_path = blueprint.build_path
	new build_path(target_turf)

/datum/ritual/cruciform/forgemaster/construction/strong
	name = "Strong Manifestation"
	phrase = "Oxidate Lecture: Strong Manifestation"
	desc = "Shape materials and components in front of you into a Custodian design."
	power = 35
	category = "Construction"

/datum/ritual/cruciform/forgemaster/construction/strong/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C, list/targets)
	var/construction_key = input("Select construction", "") as null|anything in GLOB.strong_blueprints
	var/datum/custodian_blueprint/blueprint = GLOB.strong_blueprints[construction_key]
	var/turf/target_turf = get_step(user,user.dir)
	if(!blueprint)
		fail("You decided not to construct anything.",user,C,targets)
		return
	if(!items_check(user, target_turf, blueprint))
		fail("Something is missing.",user,C,targets)
		return

	user.visible_message(SPAN_NOTICE("You see as [user] passes his hands over something."),SPAN_NOTICE("You concentrate on the [blueprint.name]'s image."))

	var/obj/effect/overlay/nt_construction/effect = new(target_turf, blueprint.build_time)

	if(!do_after(user, blueprint.build_time, target_turf))
		fail("You feel something is judging you upon your impatience",user,C,targets)
		effect.failure()
		return
	if(!items_check(user, target_turf, blueprint))
		fail("Something got moved!",user,C,targets)
		effect.failure()
		return
	//magic has to be a bit innacurate

	for(var/item_type in blueprint.materials)
		var/t = locate(item_type) in target_turf.contents
		if(istype(t, /obj/item/stack))
			var/obj/item/stack/S = t
			S.use(blueprint.materials[item_type])
		else
			qdel(t)

	effect.success()
	user.visible_message(SPAN_NOTICE("You hear a soft humming sound as [user] finishes."),SPAN_NOTICE("You take a deep breath as your efforts conclude."))
	var/build_path = blueprint.build_path
	new build_path(target_turf)

/datum/custodian_blueprint/
	var/name = "Report me"
	var/build_path
	var/list/materials
	var/build_time = 3 SECONDS

/datum/custodian_blueprint/weak

/datum/custodian_blueprint/weak/canister
	name = "Scorch Canister"
	build_path = /obj/structure/reagent_dispensers/scorch
	materials = list(
		/obj/item/stack/material/steel = 4,
		/obj/item/stack/material/plastic = 2,
		/obj/item/stack/mold_kit/masonry = 1,
	)
/datum/custodian_blueprint/weak/canister/large
	name = "Large Scorch Canister"
	build_path = /obj/structure/reagent_dispensers/scorch/large
	materials = list(
		/obj/item/stack/material/steel = 16,
		/obj/item/stack/material/plastic = 4,
		/obj/item/stack/mold_kit/masonry = 1,
	)
	build_time = 5 SECONDS

/datum/custodian_blueprint/weak/obelisk
	name = "Torchbearer"
	build_path = /obj/machinery/power/nt_obelisk
	materials = list(
		/obj/item/stack/material/biopolymer_silk = 10,
		/obj/item/stack/mold_kit/radiance_sigil = 1,
		/obj/item/book/ritual/cruciform = 1,
		/obj/item/stack/mold_kit/masonry = 2,
		/obj/item/stack/mold_kit/tailoring = 3,
	)
	build_time = 8 SECONDS

/datum/custodian_blueprint/weak/flarelathe
	name = "Flarelathe"
	build_path = /obj/machinery/autolathe/flarelathe
	materials = list(
		/obj/item/stack/material/steel = 10,
		/obj/item/stack/material/glass = 2,
		/obj/item/stack/material/silver = 6,
		/obj/item/storage/toolbox = 1
	)
	build_time = 5 SECONDS

/datum/custodian_blueprint/weak/sewing_artificer
	name = "Sewing Artificer"
	build_path = /obj/machinery/sewing_artificer
	materials = list(
		/obj/item/stack/material/steel = 20,
		/obj/item/stack/material/silver = 5,
		/obj/structure/reagent_dispensers/scorch = 1
	)
	build_time = 9 SECONDS

/datum/custodian_blueprint/weak/composite_artificer
	name = "Composite Artificer"
	build_path = /obj/machinery/sewing_artificer/composite_artificer
	materials = list(
		/obj/item/stack/material/steel = 12,
		/obj/item/stack/material/glass = 2,
		/obj/item/tool/saw = 1
	)
	build_time = 5 SECONDS

/datum/custodian_blueprint/medium

/datum/custodian_blueprint/medium/door_common
	name = "Common Hatchway"
	build_path = /obj/machinery/door/holy
	materials = list(
		/obj/item/stack/material/steel = 5,
		/obj/item/stack/material/biopolymer_silk = 20,
		/obj/item/stack/material/silver = 2,
		/obj/item/stack/mold_kit/masonry = 1,
	)
	build_time = 8 SECONDS

/datum/custodian_blueprint/medium/door_secure
	name = "Secure Gate"
	build_path = /obj/machinery/door/holy/preacher
	materials = list(
		/obj/item/stack/material/biopolymer_silk = 20,
		/obj/item/stack/material/silver = 3,
		/obj/item/stack/mold_kit/blacksmithing = 1,
		/obj/item/stack/mold_kit/masonry = 1,
	)
	build_time = 8 SECONDS

//Requires a lot but heals bluespace, for free, like really good
/datum/custodian_blueprint/medium/entropy_repairer
	name = "Bonfire Nullifer"
	build_path = /obj/machinery/telesci_inhibitor/nt_bluespace_seer
	materials = list(
		/obj/item/stack/material/plasteel = 6,
		/obj/structure/reagent_dispensers/scorch = 1,
		/obj/item/stack/mold_kit/blacksmithing = 2,
		/obj/item/stack/mold_kit/tailoring = 3,
		/obj/item/stack/mold_kit/radiance_sigil = 1,
		/obj/item/stack/mold_kit/masonry = 4,
	)
	build_time = 8 SECONDS

/datum/custodian_blueprint/medium/sentinel
	name = "Sentinel"
	build_path = /obj/machinery/power/sentinel
	materials = list(
		/obj/item/stack/material/carbon_fiber = 10,
		/obj/item/stack/material/biopolymer_silk = 30,
		/obj/item/stack/material/silver = 10,
		/obj/item/stack/mold_kit/masonry = 2,
		/obj/item/stack/mold_kit/blacksmithing = 2,
		/obj/item/book/ritual/cruciform = 1,
		/obj/item/stack/mold_kit/tailoring = 3,
	)
	build_time = 8 SECONDS

/datum/custodian_blueprint/medium/bioreactor_loader
	name = "Bonfire: Loader"
	build_path = /obj/machinery/multistructure/bioreactor_part/loader
	materials = list(
		/obj/item/stack/material/steel = 10,
		/obj/item/stack/material/silver = 3,
		/obj/item/stack/material/glass = 2,
		/obj/structure/reagent_dispensers/scorch = 1
	)
	build_time = 8 SECONDS

/datum/custodian_blueprint/medium/bioreactor_unloader
	name = "Bonfire: Unloader" //Basically a hopper
	build_path = /obj/machinery/multistructure/bioreactor_part/platform
	materials = list(
		/obj/item/stack/material/steel = 10
	)
	build_time = 2 SECONDS

/datum/custodian_blueprint/medium/bioreactor_metrics
	name = "Bonfire: Metrics"
	build_path = /obj/machinery/multistructure/bioreactor_part/console
	materials = list(
		/obj/item/stack/material/steel = 2,
		/obj/item/stack/material/silver = 5,
		/obj/item/stack/material/glass = 4,
		/obj/item/stack/cable_coil = 30 //! TODO: proper recipe
	)
	build_time = 7 SECONDS

/datum/custodian_blueprint/medium/bioreactor_port
	name = "Bonfire: Port"
	build_path = /obj/machinery/multistructure/bioreactor_part/bioport
	materials = list(
		/obj/item/stack/material/silver = 5,
		/obj/item/reagent_containers/glass/bucket = 1
	)
	build_time = 6 SECONDS

/datum/custodian_blueprint/medium/bioreactor_biotank
	name = "Bonfire: Tank"
	build_path = /obj/machinery/multistructure/bioreactor_part/biotank_platform
	materials = list(
		/obj/item/stack/material/plastic = 10,
		/obj/item/stack/material/steel = 20,
		/obj/structure/reagent_dispensers/scorch/large = 1
	)
	build_time = 6 SECONDS

/datum/custodian_blueprint/medium/bioreactor_unloader
	name = "Bonfire: Unloader"
	build_path = /obj/machinery/multistructure/bioreactor_part/unloader
	materials = list(
		/obj/item/stack/material/plastic = 10,
		/obj/item/stack/rods = 5,
		/obj/structure/reagent_dispensers/scorch = 1
	)
	build_time = 8 SECONDS

/datum/custodian_blueprint/medium/bioreactor_platform
	name = "Bonfire: Platform"
	build_path = /obj/machinery/multistructure/bioreactor_part/platform
	materials = list(
		/obj/item/stack/material/steel = 10,
		/obj/item/stack/rods = 2
	)
	build_time = 8 SECONDS

/datum/custodian_blueprint/medium/scorchtank_platform
	name = "Bonfire: Scorch Canister Platform"
	build_path = /obj/machinery/multistructure/bioreactor_part/biotank_platform
	materials = list(
		/obj/item/stack/material/steel = 10,
		/obj/item/stack/material/plastic = 4,
		/obj/item/stack/tile/floor = 1
	)
	build_time = 8 SECONDS

/datum/custodian_blueprint/medium/artisan_table
	name = "Artisan Table"
	build_path = /obj/machinery/autolathe/artist_bench
	materials = list(
		/obj/item/stack/material/glass = 10,
		/obj/item/stack/mold_kit/masonry = 1,
		/obj/item/stack/mold_kit/tailoring = 1,
		/obj/item/stack/mold_kit/blacksmithing = 1,
	)
	build_time = 5 SECONDS

/datum/custodian_blueprint/medium/knight
	name = "Vassal Automaton"
	build_path = /mob/living/carbon/superior_animal/robot/church/knight
	materials = list(
		/obj/item/tool/sword/custodian/shortsword = 1,
		/obj/item/stack/cable_coil = 20,
		/obj/item/book/ritual/cruciform = 1,
		/obj/item/stack/mold_kit/tailoring = 2,
		/obj/item/stack/mold_kit/masonry = 1,
		/obj/item/stack/mold_kit/blacksmithing = 1,
	)
	build_time = 20 SECONDS //We dont want to make these in combat

/datum/custodian_blueprint/medium/natures_blessing
	name = "Hearthcore: Nature's Blessing Upgrade"
	build_path = /obj/item/cruciform_upgrade/natures_blessing
	materials = list(
		/obj/item/stack/material/plasteel = 5,
		/obj/item/stack/material/biopolymer_silk = 120,
		/obj/item/stack/material/gold = 5
	)
	build_time = 8 SECONDS

/datum/custodian_blueprint/medium/cleansing_presence
	name = "Hearthcore: Cleansing Presence Upgrade"
	build_path = /obj/item/cruciform_upgrade/cleansing_presence
	materials = list(
		/obj/item/stack/material/plasteel = 10,
		/obj/item/stack/material/biopolymer_silk = 70,
		/obj/item/stack/material/silver = 5
	)
	build_time = 8 SECONDS

/datum/custodian_blueprint/strong

/datum/custodian_blueprint/strong/flarelathe_upgrade
	name = "Enhanced Flarelathe"
	build_path = /obj/machinery/autolathe/flarelathe/upgraded
	materials = list(
		/obj/machinery/autolathe/flarelathe = 1,
		/obj/item/stack/material/biopolymer_silk = 30,
		/obj/item/stack/material/carbon_fiber = 5,
		/obj/item/stack/material/silver = 10,
	)
	build_time = 5 SECONDS

/datum/custodian_blueprint/strong/eotp
	name = "Embers of Theoretical Philosophy"
	build_path = /obj/machinery/power/eotp
	materials = list(
		/obj/item/stack/material/plasteel = 15,
		/obj/item/stack/material/biopolymer_silk = 10,
		/obj/item/stack/material/gold = 5,
		/obj/item/stack/material/diamond = 3,
		/CRUCIFORM_TYPE = 1
	)
	build_time = 15 SECONDS

/datum/custodian_blueprint/strong/rook
	name = "Suzerain Automaton"
	build_path = /mob/living/carbon/superior_animal/robot/church/rook
	materials = list(
		/obj/item/stack/material/diamond = 1,
		/obj/item/book/ritual/cruciform = 1,
		/obj/item/stack/cable_coil = 30,
		/obj/item/stack/material/gold = 6,
		/obj/item/stack/mold_kit/radiance_sigil = 1,
		/obj/item/stack/mold_kit/blacksmithing = 5,
		/obj/item/stack/mold_kit/masonry = 3,
		/obj/item/stack/mold_kit/tailoring = 2,
	)
	build_time = 20 SECONDS //We dont want to make these in combat

/datum/custodian_blueprint/strong/faiths_shield
	name = "Hearthcore Faiths shield Upgrade"
	build_path = /obj/item/cruciform_upgrade/faiths_shield
	materials = list(
		/obj/item/stack/material/plasteel = 15,
		/obj/item/stack/material/biopolymer_silk = 120,
		/obj/item/stack/material/gold = 5
	)
	build_time = 8 SECONDS

/datum/custodian_blueprint/strong/martyr_gift
	name = "Hearthcore Martyr Gift Upgrade"
	build_path = /obj/item/cruciform_upgrade/martyr_gift
	materials = list(
		/obj/item/stack/material/plasteel = 15,
		/obj/item/stack/material/biopolymer_silk = 120,
		/obj/item/stack/material/gold = 5,
		/obj/item/stack/material/plasma = 10
	)
	build_time = 8 SECONDS

/datum/custodian_blueprint/strong/wrath_of_god
	name = "Hearthcore Wrath of god Upgrade"
	build_path = /obj/item/cruciform_upgrade/wrath_of_god
	materials = list(
		/obj/item/stack/material/plasteel = 10,
		/obj/item/stack/material/biopolymer_silk = 70,
		/obj/item/stack/material/silver = 5
	)
	build_time = 8 SECONDS

/datum/custodian_blueprint/strong/speed_of_the_chosen
	name = "Hearthcore Speed of the chosen Upgrade"
	build_path = /obj/item/cruciform_upgrade/speed_of_the_chosen
	//Speed is king, so we requires a kings randsom to make!
	materials = list(
		/obj/item/stack/material/plasteel = 10,
		/obj/item/stack/material/biopolymer_silk = 70,
		/obj/item/stack/material/silver = 10,
		/obj/item/stack/material/gold = 3,
		/obj/item/stack/material/plasma = 1
	)
	build_time = 8 SECONDS

/*
//For making mobs
/datum/custodian_blueprint/mob

/datum/custodian_blueprint/mob/pawn
	name = "Pawn Golem"
	build_path = /mob/living/carbon/superior_animal/robot/church/pawm
	materials = list(
		/obj/item/stack/material/steel = 10,
		/obj/item/stack/material/plastic = 5,
		/obj/item/stack/material/silver = 8,
		/obj/item/stack/cable_coil = 15,
		/obj/item/stack/material/plasteel = 3,
		/obj/item/stack/material/biopolymer_silk = 15,
		/obj/item/tool/sword/custodian/horseaxe = 1,
		/obj/item/tool/sword/custodian/shortsword = 1,
		/obj/item/paper = 1 //Limiting factor
	)
	build_time = 1 SECONDS //We do want to mid-comat summan these

/datum/custodian_blueprint/mob/bishop
	name = "Bishop Golem"
	build_path = /mob/living/carbon/superior_animal/robot/church/bishop
	materials = list(
		/obj/item/stack/material/steel = 15,
		/obj/item/stack/material/plastic = 15,
		/obj/item/stack/material/gold = 8,
		/obj/item/stack/cable_coil = 15,
		/obj/item/stack/material/plasteel = 10,
		/obj/item/stack/material/biopolymer_silk = 60,
		/obj/item/book/ritual/cruciform/priest = 1 //Limiting factor
	)
	build_time = 60 SECONDS //These need a lot of prep

//Notice: We don't use them on Soj but its kept here for posterity. -Kaz
//cloner

/datum/custodian_blueprint/machinery/cloner
	name = "Cloner Pod"
	build_path = /obj/machinery/neotheology/cloner
	materials = list(
		/obj/item/stack/material/glass = 15,
		/obj/item/stack/material/plasteel = 10,
		/obj/item/stack/material/gold = 5,
		/obj/item/stack/material/glass/reinforced = 10,
	)
	build_time = 10 SECONDS

/datum/custodian_blueprint/machinery/reader
	name = "Cruciform Reader"
	build_path = /obj/machinery/neotheology/reader
	materials = list(
		/obj/item/stack/material/steel = 10,
		/obj/item/stack/material/plasteel = 5,
		/obj/item/stack/material/silver = 10,
		/CRUCIFORM_TYPE = 1
	)
	build_time = 10 SECONDS

/datum/custodian_blueprint/machinery/biocan
	name = "Biomass tank"
	build_path = /obj/machinery/neotheology/biomass_container
	materials = list(
		/obj/item/stack/material/gold = 5,
		/obj/item/stack/material/plasteel = 5,
		/obj/structure/reagent_dispensers/scorch/large = 1
	)
	build_time = 8 SECONDS
*/

#undef CRUCIFORM_TYPE
