#define HEARTHCORE_TYPE obj/item/implant/core_implant/hearthcore

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

/datum/lecture/hearthcore/forgemaster/flame_guidance
	name = "Flame Guidance"
	phrase = "Oxidate Lecture: Flame Guidance."
	desc = "Learn the requirements for constructing a specific Custodian blueprint."
	category = "Construction"

/datum/lecture/hearthcore/forgemaster/flame_guidance/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C, list/targets)
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
	to_chat(user, SPAN_NOTICE("It is constructed through a [blueprint.manifestation_tier] Manifestation lecture."))
	return TRUE

/datum/lecture/hearthcore/forgemaster/deconstruction
	name = "Uproot"
	phrase = "Oxidate Lecture: Uproot."
	desc = "Deconstruct a Custodian machine in front of you."
	power = 25

/datum/lecture/hearthcore/forgemaster/deconstruction/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C, list/targets)
	if(!GLOB.nt_constructs) //Makes sure the list we curated earlier actually exists
		fail("You have no idea what constitutes a Custodian construct.",user,C,targets)
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
		fail("There is no Custodian machinery to remove here.",user,C,targets)
		return

	user.visible_message(SPAN_NOTICE("[user] stretches a hand forward."),SPAN_NOTICE("You start reclaiming."))

	var/obj/effect/overlay/knight_construction/effect = new(target_turf, 5 SECONDS)

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
	user.visible_message(SPAN_NOTICE("Clanking of parts hit the floor as [user] finishes, the machine falling apart at their touch."),SPAN_NOTICE("The machine falls apart into its components."))

	qdel(reclaimed)
	return TRUE

/datum/lecture/hearthcore/forgemaster/construction
	name = "Weak Manifestation"
	phrase = "Oxidate Lecture: Weak Manifestation."
	desc = "Shape materials and components in front of you into a Custodian design."
	power = 25
	category = "Construction"

/datum/lecture/hearthcore/forgemaster/construction/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C, list/targets)
	var/construction_key = input("Select construction", "") as null|anything in GLOB.weak_blueprints
	var/datum/custodian_blueprint/blueprint = GLOB.weak_blueprints[construction_key]
	var/turf/target_turf = get_step(user,user.dir)
	if(!blueprint)
		fail("You decided not to construct anything.",user,C,targets)
		return
	if(!items_check(user, target_turf, blueprint))
		fail("Not enough materials for this manifestation.",user,C,targets)
		return

	user.visible_message(SPAN_NOTICE("You see as [user] passes [user.identifying_gender == "male" ? "his" : user.identifying_gender == "female" ? "her" : "their"] hands over something."),SPAN_NOTICE("You concentrate on the [blueprint.name]'s image."))

	var/obj/effect/overlay/knight_construction/effect = new(target_turf, blueprint.build_time)

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

/datum/lecture/hearthcore/forgemaster/construction/proc/items_check(mob/user,turf/target, datum/custodian_blueprint/blueprint)
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

/datum/lecture/hearthcore/forgemaster/construction/medium
	name = "Medium Manifestation"
	phrase = "Oxidate Lecture: Medium Manifestation."
	desc = "Shape materials and components in front of you into a Custodian design."
	power = 30
	category = "Construction"

/datum/lecture/hearthcore/forgemaster/construction/medium/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C, list/targets)
	var/construction_key = input("Select construction", "") as null|anything in GLOB.medium_blueprints
	var/datum/custodian_blueprint/blueprint = GLOB.medium_blueprints[construction_key]
	var/turf/target_turf = get_step(user,user.dir)
	if(!blueprint)
		fail("You decided not to construct anything.",user,C,targets)
		return
	if(!items_check(user, target_turf, blueprint))
		fail("Not enough materials for this manifestation.",user,C,targets)
		return

	user.visible_message(SPAN_NOTICE("You see as [user] passes [user.identifying_gender == "male" ? "his" : user.identifying_gender == "female" ? "her" : "their"] hands over something."),SPAN_NOTICE("You concentrate on the [blueprint.name]'s image."))

	var/obj/effect/overlay/knight_construction/effect = new(target_turf, blueprint.build_time)

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

/datum/lecture/hearthcore/forgemaster/construction/strong
	name = "Strong Manifestation"
	phrase = "Oxidate Lecture: Strong Manifestation."
	desc = "Shape materials and components in front of you into a Custodian design."
	power = 35
	category = "Construction"

/datum/lecture/hearthcore/forgemaster/construction/strong/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C, list/targets)
	var/construction_key = input("Select construction", "") as null|anything in GLOB.strong_blueprints
	var/datum/custodian_blueprint/blueprint = GLOB.strong_blueprints[construction_key]
	var/turf/target_turf = get_step(user,user.dir)
	if(!blueprint)
		fail("You decided not to construct anything.",user,C,targets)
		return
	if(!items_check(user, target_turf, blueprint))
		fail("Not enough materials for this manifestation.",user,C,targets)
		return

	user.visible_message(SPAN_NOTICE("You see as [user] passes [user.identifying_gender == "male" ? "his" : user.identifying_gender == "female" ? "her" : "their"] hands over something."),SPAN_NOTICE("You concentrate on the [blueprint.name]'s image."))

	var/obj/effect/overlay/knight_construction/effect = new(target_turf, blueprint.build_time)

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
	var/manifestation_tier = "Weak" // What tier of manifest lecture are we?

/datum/custodian_blueprint/weak

/datum/custodian_blueprint/weak/canister
	name = "Scorch Canister"
	build_path = /obj/structure/reagent_dispensers/scorch
	materials = list(
		/obj/item/stack/material/aluminium = 4,
		/obj/item/stack/material/plastic = 2,
		/obj/item/stack/mold_kit/masonry = 1,
	)
/datum/custodian_blueprint/weak/canister/large
	name = "Large Scorch Canister"
	build_path = /obj/structure/reagent_dispensers/scorch/large
	materials = list(
		/obj/item/stack/material/aluminium = 16,
		/obj/item/stack/material/plastic = 4,
		/obj/item/stack/mold_kit/masonry = 1,
	)
	build_time = 5 SECONDS

/datum/custodian_blueprint/weak/obelisk
	name = "Torchbearer"
	build_path = /obj/machinery/power/torchbearer
	materials = list(
		/obj/item/stack/material/biopolymer_silk = 10,
		/obj/item/stack/mold_kit/radiance_sigil = 1,
		/obj/item/book/lectures/hearthlantern = 1,
		/obj/item/stack/mold_kit/masonry = 2,
		/obj/item/stack/mold_kit/tailoring = 3,
	)
	build_time = 8 SECONDS

/datum/custodian_blueprint/weak/flarelathe
	name = "Flarelathe"
	build_path = /obj/machinery/autolathe/flarelathe
	materials = list(
		/obj/item/stack/material/aluminium = 10,
		/obj/item/stack/material/glass = 2,
		/obj/item/stack/material/silver = 6,
		/obj/item/storage/toolbox = 1
	)
	build_time = 5 SECONDS

/datum/custodian_blueprint/weak/sewing_artificer
	name = "Sewing Artificer"
	build_path = /obj/machinery/sewing_artificer
	materials = list(
		/obj/item/stack/material/aluminium = 20,
		/obj/item/stack/material/silver = 5,
		/obj/structure/reagent_dispensers/scorch = 1
	)
	build_time = 9 SECONDS

/datum/custodian_blueprint/weak/composite_artificer
	name = "Composite Artificer"
	build_path = /obj/machinery/sewing_artificer/composite_artificer
	materials = list(
		/obj/item/stack/material/aluminium = 12,
		/obj/item/stack/material/glass = 2,
		/obj/item/tool/saw = 1
	)
	build_time = 5 SECONDS

/datum/custodian_blueprint/medium/emberblaze
	name = "Emberblaze Limbs"
	build_path = /obj/item/storage/box/emberblaze_set //test the materials to see how much!
	materials = list(
		/obj/item/stack/material/carbon_fiber = 60
	)
	build_time = 20 SECONDS

/datum/custodian_blueprint/weak/bricktiles
	name = "Pristine brick stack"
	build_path = /obj/item/stack/tile/greybricks_pristine/full
	materials = list(
		/obj/item/stack/ore = 10
	)
	build_time = 5 SECONDS

/datum/custodian_blueprint/weak/training_dummy
	name = "Wooden Training Dummy"
	build_path = /obj/item/training_dummy
	materials = list(
		/obj/item/stack/material/wood = 20
	)
	build_time = 8 SECONDS

/datum/custodian_blueprint/weak/wing_chun_dummy
	name = "Unarmed Training Dummy"
	build_path = /obj/item/training_dummy/wingchun
	materials = list(
		/obj/item/stack/material/wood = 20
	)
	build_time = 8 SECONDS

/datum/custodian_blueprint/weak/cult_training_dummy
	name = "Training Dummy (cultist)"
	build_path = /obj/item/training_dummy/cultist
	materials = list(
		/obj/item/stack/material/wood = 20,
		/obj/item/stack/material/aluminium = 10
	)
	build_time = 8 SECONDS

/datum/custodian_blueprint/weak/merc_training_dummy
	name = "Training Dummy (mercenary)"
	build_path = /obj/item/training_dummy/merc
	materials = list(
		/obj/item/stack/material/wood = 20,
		/obj/item/stack/material/aluminium = 10
	)
	build_time = 8 SECONDS

/datum/custodian_blueprint/medium
	manifestation_tier = "Medium"
/*
/datum/custodian_blueprint/medium/melee_armor
	name = "Carbon Fiber Melee Plating"
	build_path = /obj/item/tool_upgrade/custodian/armor/melee
	materials = list(
		/obj/item/stack/material/carbon_fiber = 60
	)
	build_time = 20 SECONDS

/datum/custodian_blueprint/medium/ballistic_armor
	name = "Silk Polymer Bullet Plating"
	build_path = /obj/item/tool_upgrade/custodian/armor/bullet
	materials = list(
		/obj/item/stack/material/biopolymer_silk = 40,
		/obj/item/stack/material/indsteel = 10,
		/obj/item/stack/material/plastic = 10
	)
	build_time = 20 SECONDS

/datum/custodian_blueprint/medium/energy_armor
	name = "Dark Silver Energy Plating"
	build_path = /obj/item/tool_upgrade/custodian/armor/energy
	materials = list(
		/obj/item/stack/material/carbon_fiber = 30,
		/obj/item/stack/material/biopolymer_silk = 15,
		/obj/item/stack/material/plastic = 15
	)
	build_time = 20 SECONDS

/datum/custodian_blueprint/medium/fireproof_armor
	name = "Fire and Pressure Proof Plating"
	build_path = /obj/item/tool_upgrade/custodian/armor/fireproofing
	materials = list(
		/obj/item/stack/material/biopolymer_silk = 30,
		/obj/item/stack/material/biomatter = 30
	)
	build_time = 20 SECONDS

The Custodians of Bonfire must protect the Bonfire, not replace them! Besides, lorewise the Bonfire is connected to the underground by a literal star core.
So you can't just make it because yeah why not

/datum/custodian_blueprint/medium/bioreactor_loader
	name = "Bonfire: Loader"
	build_path = /obj/machinery/multistructure/bonfire_part/loader
	materials = list(
		/obj/item/stack/material/aluminium = 10,
		/obj/item/stack/material/silver = 3,
		/obj/item/stack/material/glass = 2,
		/obj/structure/reagent_dispensers/scorch = 1
	)
	build_time = 8 SECONDS

/datum/custodian_blueprint/medium/bioreactor_unloader
	name = "Bonfire: Unloader" //Basically a hopper
	build_path = /obj/machinery/multistructure/bonfire_part/platform
	materials = list(
		/obj/item/stack/material/aluminium = 10
	)
	build_time = 2 SECONDS

/datum/custodian_blueprint/medium/bioreactor_metrics
	name = "Bonfire: Metrics"
	build_path = /obj/machinery/multistructure/bonfire_part/console
	materials = list(
		/obj/item/stack/material/aluminium = 2,
		/obj/item/stack/material/silver = 5,
		/obj/item/stack/material/glass = 4,
		/obj/item/stack/cable_coil = 30
	)
	build_time = 7 SECONDS

/datum/custodian_blueprint/medium/bioreactor_port
	name = "Bonfire: Port"
	build_path = /obj/machinery/multistructure/bonfire_part/port
	materials = list(
		/obj/item/stack/material/silver = 5,
		/obj/item/reagent_containers/glass/bucket = 1
	)
	build_time = 6 SECONDS

/datum/custodian_blueprint/medium/bioreactor_biotank
	name = "Bonfire: Tank"
	build_path = /obj/machinery/multistructure/bonfire_part/scorchtank_platform
	materials = list(
		/obj/item/stack/material/plastic = 10,
		/obj/item/stack/material/aluminium = 20,
		/obj/structure/reagent_dispensers/scorch/large = 1
	)
	build_time = 6 SECONDS

/datum/custodian_blueprint/medium/bioreactor_unloader
	name = "Bonfire: Unloader"
	build_path = /obj/machinery/multistructure/bonfire_part/unloader
	materials = list(
		/obj/item/stack/material/plastic = 10,
		/obj/item/stack/rods = 5,
		/obj/structure/reagent_dispensers/scorch = 1
	)
	build_time = 8 SECONDS

/datum/custodian_blueprint/medium/bioreactor_platform
	name = "Bonfire: Platform"
	build_path = /obj/machinery/multistructure/bonfire_part/platform
	materials = list(
		/obj/item/stack/material/aluminium = 10,
		/obj/item/stack/rods = 2
	)
	build_time = 8 SECONDS

/datum/custodian_blueprint/medium/scorchtank_platform
	name = "Bonfire: Scorch Canister Platform"
	build_path = /obj/machinery/multistructure/bonfire_part/scorchtank_platform
	materials = list(
		/obj/item/stack/material/aluminium = 10,
		/obj/item/stack/material/plastic = 4,
		/obj/item/stack/tile/floor = 1
	)
	build_time = 8 SECONDS
*/

/datum/custodian_blueprint/medium/door_common
	name = "Common Hatchway"
	build_path = /obj/machinery/door/bonfire
	materials = list(
		/obj/item/stack/material/aluminium = 5,
		/obj/item/stack/material/biopolymer_silk = 20,
		/obj/item/stack/material/silver = 2,
		/obj/item/stack/mold_kit/masonry = 1,
	)
	build_time = 8 SECONDS

/datum/custodian_blueprint/medium/door_secure
	name = "Secure Gate"
	build_path = /obj/machinery/door/bonfire/secure
	materials = list(
		/obj/item/stack/material/biopolymer_silk = 20,
		/obj/item/stack/material/silver = 3,
		/obj/item/stack/mold_kit/blacksmithing = 1,
		/obj/item/stack/mold_kit/masonry = 1,
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
		/obj/item/book/lectures/hearthlantern = 1,
		/obj/item/stack/mold_kit/tailoring = 3,
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

/datum/custodian_blueprint/medium/natures_blessing
	name = "Hearthcore Upgrade - \"Nature's Blessing\""
	build_path = /obj/item/hearthcore_upgrade/natures_blessing
	materials = list(
		/obj/item/stack/material/biomatter = 100,
		/obj/item/stack/material/indsteel = 5,
		/obj/item/stack/material/gold = 5
	)
	build_time = 8 SECONDS

/datum/custodian_blueprint/medium/cleansing_flames
	name = "Hearthcore Upgrade - \"Cleansing Flames\""
	build_path = /obj/item/hearthcore_upgrade/cleansing_flames
	materials = list(
		/obj/item/stack/material/biopolymer_silk = 50,
		/obj/item/stack/material/indsteel = 5,
		/obj/item/stack/material/silver = 5
	)
	build_time = 8 SECONDS

/datum/custodian_blueprint/strong
	manifestation_tier = "strong"

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
		/obj/item/stack/material/indsteel = 15,
		/obj/item/stack/material/biopolymer_silk = 10,
		/obj/item/stack/material/gold = 5,
		/obj/item/stack/material/diamond = 3,
		/HEARTHCORE_TYPE = 1
	)
	build_time = 15 SECONDS

// Automatons

/datum/custodian_blueprint/strong/vassal
	name = "Vassal Automaton"
	build_path = /mob/living/carbon/superior_animal/robot/custodians/vassal
	materials = list(
		/obj/item/tool/sword/custodian/shortsword = 1,
		/obj/item/stack/cable_coil = 20,
		/obj/item/book/lectures/hearthlantern = 1,
		/obj/item/stack/mold_kit/tailoring = 2,
		/obj/item/stack/mold_kit/masonry = 1,
		/obj/item/stack/mold_kit/blacksmithing = 1,
	)
	build_time = 20 SECONDS // Not meant to be spam created during combat

/datum/custodian_blueprint/strong/suzerain
	name = "Suzerain Automaton"
	build_path = /mob/living/carbon/superior_animal/robot/custodians/suzerain
	materials = list(
		/obj/item/stack/material/diamond = 1,
		/obj/item/book/lectures/hearthlantern = 1,
		/obj/item/stack/cable_coil = 30,
		/obj/item/stack/material/gold = 6,
		/obj/item/stack/mold_kit/radiance_sigil = 1,
		/obj/item/stack/mold_kit/blacksmithing = 5,
		/obj/item/stack/mold_kit/masonry = 3,
		/obj/item/stack/mold_kit/tailoring = 2,
	)
	build_time = 20 SECONDS // Not meant to be spam created during combat

// Hearthcore upgrades
/datum/custodian_blueprint/strong/blazing_aegis
	name = "Hearthcore Upgrade - \"Blazing Aegis\""
	build_path = /obj/item/hearthcore_upgrade/blazing_aegis
	materials = list(
		/obj/item/stack/material/indsteel = 10,
		/obj/item/stack/material/carbon_fiber = 100,
		/obj/item/stack/material/gold = 5
	)
	build_time = 8 SECONDS

/datum/custodian_blueprint/strong/martyr_gift
	name = "Hearthcore Upgrade - \"Martyr's Gift\""
	build_path = /obj/item/hearthcore_upgrade/martyr_gift
	materials = list(
		/obj/item/stack/material/indsteel = 5,
		/obj/item/stack/material/biomatter = 100, // Heals, thus, biomatter.
		/obj/item/stack/material/gold = 5,
		/obj/item/stack/material/hydrogenc = 5
	)
	build_time = 8 SECONDS

/datum/custodian_blueprint/strong/wrath_of_god
	name = "Hearthcore Upgrade - \"Burning Fury\""
	build_path = /obj/item/hearthcore_upgrade/burning_fury
	materials = list(
		/obj/item/stack/material/indsteel = 10,
		/obj/item/stack/material/biopolymer_silk = 50,
		/obj/item/stack/material/carbon_fiber = 50,
		/obj/item/stack/material/silver = 5
	)
	build_time = 8 SECONDS

/datum/custodian_blueprint/strong/embers_of_swiftness
	name = "Hearthcore Upgrade - \"Embers of Swiftness\""
	build_path = /obj/item/hearthcore_upgrade/embers_of_swiftness
	//Speed is king, so we requires a kings randsom to make!
	materials = list(
		/obj/item/stack/material/indsteel = 10,
		/obj/item/stack/material/biopolymer_silk = 70,
		/obj/item/stack/material/silver = 10,
		/obj/item/stack/material/gold = 3,
		/obj/item/stack/material/hydrogenc = 1
	)
	build_time = 8 SECONDS

/datum/custodian_blueprint/strong/phoenix_edict
	name = "Hearthcore Upgrade - \"Phoenix Edict\""
	build_path = /obj/item/hearthcore_upgrade/phoenix_edict
	materials = list(
		/obj/item/stack/material/biomatter = 100,
		/obj/item/stack/material/biopolymer_silk = 50,
		/obj/item/stack/material/carbon_fiber = 50,
		/obj/item/stack/material/titanium = 10
	)
	build_time = 8 SECONDS

#undef HEARTHCORE_TYPE
