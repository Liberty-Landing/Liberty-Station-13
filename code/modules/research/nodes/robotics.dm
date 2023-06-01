/datum/technology/basic_robotics
	name = "Basic Robotics"
	desc = "Basic Robotics"
	tech_type = RESEARCH_ROBOTICS

	x = 0.1
	y = 0.5
	icon = "cyborganalyzer"

	required_technologies = list()
	required_tech_levels = list()
	cost = 0

	unlocks_designs = list(
							/datum/design/research/circuit/recharge_station,
							/datum/design/research/item/medical/robot_scanner,
							/datum/design/research/item/mmi
							)

//Cyborgs

/datum/technology/cyborg_robo
	name = "Advanced Robotics"
	desc = "Positron links. Man-Machine Interface. Cyborg control systems. Artificial Intelegence mobile storages."
	tech_type = RESEARCH_ROBOTICS

	x = 0.3
	y = 0.7
	icon = "posbrain"

	required_technologies = list(/datum/technology/basic_robotics)
	required_tech_levels = list()
	cost = 375

	unlocks_designs = list(
							/datum/design/research/item/posibrain,
							/datum/design/research/item/mmi_radio,
							/datum/design/research/item/intellicard,
							/datum/design/research/item/paicard,
							/datum/design/research/circuit/robocontrol
							)

/datum/technology/robot_modules
	name = "Advanced Cyborg Components"
	desc = "Advanced Cyborg Components"
	tech_type = RESEARCH_ROBOTICS

	x = 0.5
	y = 0.7
	icon = "borgmodule"

	required_technologies = list(/datum/technology/cyborg_robo)
	required_tech_levels = list()
	cost = 1500

	unlocks_designs = list(
						/datum/design/research/item/mechfab/robot/component/jetpack,
						/datum/design/research/item/robot_upgrade/vtec,
						/datum/design/research/item/robot_upgrade/tasercooler,
						/datum/design/research/item/robot_upgrade/rcd,
						/datum/design/research/item/robot_upgrade/arc_welder,
						/datum/design/research/item/mechfab/robot/component/armour,
						/datum/design/research/circuit/repair_station
						)

//AI BRANCH

/datum/technology/artificial_intelligence
	name = "Artificial intelligence"
	desc = "Construction and programming of artificial intelligence."
	tech_type = RESEARCH_ROBOTICS

	x = 0.5
	y = 0.9
	icon = "aicard"

	required_technologies = list(/datum/technology/cyborg_robo)
	required_tech_levels = list()
	cost = 1500

	unlocks_designs = list(
							/datum/design/research/circuit/aicore,
//							/datum/design/research/circuit/aiupload
							)

/datum/technology/artificial_intelligence_laws
	name = "Artificial intelligence: Maintenance"
	desc = "Artificial intelligence Maintenance."
	tech_type = RESEARCH_ROBOTICS

	x = 0.7
	y = 0.9
	icon = "module"

	required_technologies = list(/datum/technology/artificial_intelligence)
	required_tech_levels = list()
	cost = 1500

	unlocks_designs = list(
							/datum/design/research/circuit/aifixer,
//							/datum/design/research/aimodule/safeguard,
//							/datum/design/research/aimodule/onehuman,
//							/datum/design/research/aimodule/protectstation,
//							/datum/design/research/aimodule/notele,
//							/datum/design/research/aimodule/quarantine,
//							/datum/design/research/aimodule/oxygen,
//							/datum/design/research/aimodule/freeform,
//							/datum/design/research/aimodule/reset,
//							/datum/design/research/aimodule/purge,
//							/datum/design/research/aimodule/core/freeformcore,
//							/datum/design/research/aimodule/core/asimov,
//							/datum/design/research/aimodule/core/paladin,
							/datum/design/research/circuit/aicore,
//							/datum/design/research/circuit/aiupload,
//							/datum/design/research/circuit/borgupload
							)

//FBPS
/datum/technology/prosthetic_limbs
	name = "Prosthetic Augmentations"
	desc = "Body augmentations in the way of CAPSA-brand prosthesis."
	tech_type = RESEARCH_ROBOTICS

	x = 0.3
	y = 0.3
	icon = "scalpelmanager"

	required_technologies = list(
								/datum/technology/advanced_biotech,
								/datum/technology/portable_biotech,
								/datum/technology/basic_robotics
								)
	required_tech_levels = list()
	cost = 1500

	unlocks_designs = list(
							/datum/design/research/item/mechfab/prosthesis_moebius/r_arm,
							/datum/design/research/item/mechfab/prosthesis_moebius/l_arm,
							/datum/design/research/item/mechfab/prosthesis_moebius/r_leg,
							/datum/design/research/item/mechfab/prosthesis_moebius/l_leg,
							/datum/design/research/item/mechfab/prosthesis_moebius/groin,
							/datum/design/research/item/mechfab/prosthesis_moebius/head,
							/datum/design/research/item/mechfab/prosthesis_moebius/chest
							)

/datum/technology/prosthetic_organs
	name = "Prosthetic Organs"
	desc = "Organ augmentations in the way of CAPSA-brand prosthesis."
	tech_type = RESEARCH_ROBOTICS

	x = 0.5
	y = 0.3
	icon = "cryobag"

	required_technologies = list(/datum/technology/prosthetic_limbs)
	required_tech_levels = list()
	cost = 1500

	unlocks_designs = list(
							/datum/design/research/item/mechfab/robotic_internals/heart,
							/datum/design/research/item/mechfab/robotic_internals/lung,
							/datum/design/research/item/mechfab/robotic_internals/kidney,
							/datum/design/research/item/mechfab/robotic_internals/eyes,
							/datum/design/research/item/mechfab/robotic_internals/liver,
							/datum/design/research/item/mechfab/robotic_internals/stomach,
							/datum/design/research/item/mechfab/robotic_internals/blood,
							/datum/design/research/item/mechfab/robotic_internals/muscle,
							/datum/design/research/item/mechfab/robotic_internals/nerves,
							/datum/design/research/item/mechfab/robotic_internals/cell
							)

/datum/technology/augmentations
	name = "Advanced Augmentations Biotech"
	desc = "Refined and end of the line advancements that both body and mind can handle."
	tech_type = RESEARCH_ROBOTICS

	x = 0.5
	y = 0.1
	icon = "medhud"

	required_technologies = list(/datum/technology/prosthetic_limbs)
	required_tech_levels = list()
	cost = 1500

	unlocks_designs = list(	/datum/design/research/item/mechfab/modules/armor,
							/datum/design/research/item/mechfab/modules/armblade,
							/datum/design/research/item/mechfab/modules/wolverine,
							/datum/design/research/item/mechfab/modules/energy_blade,
							/datum/design/research/item/mechfab/modules/taser,
							/datum/design/research/item/mechfab/modules/armsmg,
							/datum/design/research/item/mechfab/modules/armshield,
							/datum/design/research/item/mechfab/modules/runner,
							/datum/design/research/item/mechfab/modules/hud/med,
							/datum/design/research/item/mechfab/modules/hud/sec,
							/datum/design/research/item/mechfab/modules/hud/welder
							)

/datum/technology/omnitools
	name = "Omnitool Augments Tool"
	desc = "An all in one tool for surgery based on those that are found in legendary Similacrum Robotics models."
	tech_type = RESEARCH_ROBOTICS

	x = 0.7
	y = 0.1
	icon = "omnisurgery"

	required_technologies = list(/datum/technology/augmentations)
	required_tech_levels = list(RESEARCH_BIOTECH = 9, RESEARCH_ENGINEERING = 18)
	cost = 225

	unlocks_designs = list(
						/datum/design/research/item/medical/medimplant_sci,
						/datum/design/research/item/mechfab/modules/multitool/surgical,
						/datum/design/research/item/mechfab/modules/multitool/engineer,
						/datum/design/research/item/mechfab/modules/multitool/miner,
						/datum/design/research/item/mechfab/modules/multitool/farmer
						)
