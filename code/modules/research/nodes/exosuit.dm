//change stuff here
//GENERIC
/datum/technology/exosuit_robotics
	name = "Exosuit Construction"
	desc = "Exosuit production and control systems."
	tech_type = RESEARCH_EXOSUIT

	x = 0.1
	y = 0.5
	icon = "autolathe"

	required_technologies = list(/datum/technology/basic_robotics)
	required_tech_levels = list()
	cost = 375

	unlocks_designs = list(
		/datum/design/research/circuit/mechacontrol,
		/datum/design/research/circuit/mechfab,
		/datum/design/research/circuit/dronecontrol,
		/datum/design/research/circuit/mech_recharger,
		/datum/design/research/circuit/mecha/main,
		/datum/design/research/circuit/mecha/peripherals,
		/datum/design/research/circuit/mecha/targeting,
		/datum/design/research/item/clothing/rig_cheap
		)

//Hardsuits
/datum/technology/basic_hardsuit_modules
	name = "Basic Hardsuit Modules"
	desc = "Basic Hardsuit Modules"
	tech_type = RESEARCH_EXOSUIT

	x = 0.3
	y = 0.7
	icon = "rigscanner"

	required_technologies = list(/datum/technology/exosuit_robotics)
	required_tech_levels = list()
	cost = 500

	unlocks_designs = list(
							/datum/design/research/item/autodoc_commercial,
							/datum/design/research/item/chem_injector,
							/datum/design/research/item/healthscanner,
							/datum/design/research/item/rig_ore_scanner,
							/datum/design/research/item/rig_anomaly_scanner
							)

/datum/technology/hardsuit_nonlethal
	name = "Mounted Non-Lethal"
	desc = "Electrical-shock weapon for hardsuits."
	tech_type = RESEARCH_EXOSUIT

	x = 0.45
	y = 0.85
	icon = "rigtaser"

	required_technologies = list(/datum/technology/basic_hardsuit_modules)
	required_tech_levels = list()
	cost = 3375

	unlocks_designs = list(
						/datum/design/research/item/rig_grenade_launcher,
						/datum/design/research/item/rig_flash,
						/datum/design/research/item/tasermount
						)

/datum/technology/advanced_hardsuit_modules
	name = "Advanced Hardsuit Modules"
	desc = "Advanced Hardsuit Modules"
	tech_type = RESEARCH_EXOSUIT

	x = 0.6
	y = 0.7
	icon = "rigmining"

	required_technologies = list(/datum/technology/basic_hardsuit_modules)
	required_tech_levels = list(

		)
	cost = 2000

	unlocks_designs = list(
						/datum/design/research/item/autodoc,
						/datum/design/research/item/combat_injector,
						/datum/design/research/item/medhud,
						/datum/design/research/item/rig_drill,
						/datum/design/research/item/rig_nvgoggles
						)

/datum/technology/riglaser_weaponry
	name = "Hardsuit Laser Weaponry"
	desc = "Hardsuit Laser Weaponry"
	tech_type = RESEARCH_EXOSUIT

	x = 0.75
	y = 0.85
	icon = "riglethals"

	required_technologies = list(/datum/technology/laser_weaponry, /datum/technology/advanced_hardsuit_modules)
	required_tech_levels = list()
	cost = 5625

	unlocks_designs = list(/datum/design/research/item/lasercannon, /datum/design/research/item/lasermount)

/datum/technology/toptier_hardsuit_modules
	name = "Experimental Hardsuit Modules"
	desc = "Experimental Hardsuit Modules"
	tech_type = RESEARCH_EXOSUIT

	x = 0.9
	y = 0.6
	icon = "rigstorage"

	required_technologies = list(/datum/technology/advanced_hardsuit_modules)
	required_tech_levels = list()
	cost = 5000

	unlocks_designs = list(
		/datum/design/research/item/rig_thermalgoggles,
		/datum/design/research/item/rigjets,
		/datum/design/research/item/storage,
		/datum/design/research/item/ai_container,
		/datum/design/research/item/rigrcd
	)

//MECH BRANCH
/datum/technology/mech_ripley
	name = "Ripley"
	desc = "Exosuit production and control systems. Exosuit-miner basics."
	tech_type = RESEARCH_EXOSUIT

	x = 0.4
	y = 0.4
	icon = "ripley"

	required_technologies = list(/datum/technology/exosuit_robotics)
	required_tech_levels = list()
	cost = 375

	unlocks_designs = list(
		/datum/design/research/item/mechfab/ripley/chassis,
		/datum/design/research/item/mechfab/ripley/chassis/firefighter,
		/datum/design/research/item/mechfab/ripley/torso,
		/datum/design/research/item/mechfab/ripley/left_arm,
		/datum/design/research/item/mechfab/ripley/right_arm,
		/datum/design/research/item/mechfab/ripley/left_leg,
		/datum/design/research/item/mechfab/ripley/right_leg
		)

/datum/technology/mech_odysseus
	name = "Odysseus"
	desc = "Odysseus - the medical exosuit."
	tech_type = RESEARCH_EXOSUIT

	x = 0.5
	y = 0.4
	icon = "odyssey"

	required_technologies = list(/datum/technology/mech_ripley)
	required_tech_levels = list()
	cost = 375

	unlocks_designs = list(
		/datum/design/research/item/mechfab/odysseus/chassis,
		/datum/design/research/item/mechfab/odysseus/torso,
		/datum/design/research/item/mechfab/odysseus/head,
		/datum/design/research/item/mechfab/odysseus/left_arm,
		/datum/design/research/item/mechfab/odysseus/right_arm,
		/datum/design/research/item/mechfab/odysseus/left_leg,
		/datum/design/research/item/mechfab/odysseus/right_leg
		)


/datum/technology/mech_gygax
	name = "Gygax"
	desc = "Gygax - the killer exosuit."
	tech_type = RESEARCH_EXOSUIT

	x = 0.6
	y = 0.4
	icon = "gygax"

	required_technologies = list(/datum/technology/mech_odysseus)
	required_tech_levels = list()
	cost = 1500

	unlocks_designs = list(
		/datum/design/research/item/mechfab/gygax/chassis,
		/datum/design/research/item/mechfab/gygax/torso,
		/datum/design/research/item/mechfab/gygax/head,
		/datum/design/research/item/mechfab/gygax/left_arm,
		/datum/design/research/item/mechfab/gygax/right_arm,
		/datum/design/research/item/mechfab/gygax/left_leg,
		/datum/design/research/item/mechfab/gygax/right_leg,
		/datum/design/research/item/mechfab/gygax/armour
		)

/datum/technology/mech_durand
	name = "Durand"
	desc = "Durand - the knight exosuit."
	tech_type = RESEARCH_EXOSUIT

	x = 0.7
	y = 0.4
	icon = "durand"

	required_technologies = list(/datum/technology/mech_gygax)
	required_tech_levels = list()
	cost = 1500

	unlocks_designs = list(
		/datum/design/research/item/mechfab/durand/chassis,
		/datum/design/research/item/mechfab/durand/torso,
		/datum/design/research/item/mechfab/durand/head,
		/datum/design/research/item/mechfab/durand/left_arm,
		/datum/design/research/item/mechfab/durand/right_arm,
		/datum/design/research/item/mechfab/durand/left_leg,
		/datum/design/research/item/mechfab/durand/right_leg,
		/datum/design/research/item/mechfab/durand/armour
	)


/datum/technology/mech_phazon
	name = "Phazon"
	desc = "Phazon - the battle scout exosuit"
	tech_type = RESEARCH_EXOSUIT

	x = 0.9
	y = 0.4
	icon = "vindicator" // TODO change icon

	required_technologies = list(/datum/technology/mech_teleporter_modules)
	required_tech_levels = list() // Add some bluespace requirement?
	cost = 3000

	unlocks_designs = list(
		/datum/design/research/item/mechfab/phazon/chassis,
		/datum/design/research/item/mechfab/phazon/torso,
		/datum/design/research/item/mechfab/phazon/head,
		/datum/design/research/item/mechfab/phazon/left_arm,
		/datum/design/research/item/mechfab/phazon/right_arm,
		/datum/design/research/item/mechfab/phazon/left_leg,
		/datum/design/research/item/mechfab/phazon/right_leg,
		/datum/design/research/item/mechfab/phazon/armour
		)


//Mech Modules
/datum/technology/mech_modules_core
	name = "Exosuit Modules Technology"
	desc = "Roots of exosuits' modularity."
	tech_type = RESEARCH_EXOSUIT

	x = 0.3
	y = 0.3
	icon = "drill"

	required_technologies = list(/datum/technology/exosuit_robotics)
	required_tech_levels = list()
	cost = 375

	unlocks_designs = list(
		/datum/design/research/item/mecha/hydraulic_clamp,
		/datum/design/research/item/mecha/drill,
		/datum/design/research/item/mecha/extinguisher,
		/datum/design/research/item/mecha/cable_layer,
		/datum/design/research/item/mecha/flaregun,
		/datum/design/research/item/mecha/passenger
	)

/datum/technology/mech_utility_modules
	name = "Exosuit Utility Modules"
	desc = "Exosuit Utility Modules"
	tech_type = RESEARCH_EXOSUIT

	x = 0.4
	y = 0.2
	icon = "mechrcd"

	required_technologies = list(/datum/technology/mech_modules_core)
	required_tech_levels = list()
	cost = 750

	unlocks_designs = list(
							/datum/design/research/item/mecha/jetpack,
							/datum/design/research/item/mecha/ai_holder,
							/datum/design/research/item/mecha/wormhole_gen,
							/datum/design/research/item/mecha/rcd,
							/datum/design/research/item/mecha/gravcatapult,
							/datum/design/research/item/mecha/repair_droid,
							/datum/design/research/item/mecha/plasma_generator,
							/datum/design/research/item/mecha/energy_relay,
							/datum/design/research/item/mecha/sleeper,
							/datum/design/research/item/mecha/syringe_gun,
							/datum/design/research/item/mecha/diamond_drill,
							/datum/design/research/item/mecha/generator_nuclear
							)

/datum/technology/mech_armor_modules
	name = "Exosuit Armor Modules"
	desc = "Exosuit Armor Modules"
	tech_type = RESEARCH_EXOSUIT

	x = 0.4
	y = 0.1
	icon = "mecharmor"

	required_technologies = list(/datum/technology/mech_utility_modules)
	required_tech_levels = list()
	cost = 1500

	unlocks_designs = list(
		/datum/design/research/item/mecha/ccw_armor,
		/datum/design/research/item/mecha/proj_armor,
		/datum/design/research/item/mecha/shield_droid
		)

/datum/technology/mech_weaponry_modules
	name = "Exosuit Weaponry"
	desc = "Exosuit Weaponry"
	tech_type = RESEARCH_EXOSUIT

	x = 0.5
	y = 0.2
	icon = "mechgrenadelauncher"

	required_technologies = list(/datum/technology/mech_utility_modules)
	required_tech_levels = list()
	cost = 1500

	unlocks_designs = list(
							/datum/design/research/item/mecha/weapon/scattershot,
							/datum/design/research/item/mecha/weapon/laser,
							/datum/design/research/item/mecha/weapon/grenade_launcher
							)

/datum/technology/mech_heavy_weaponry_modules
	name = "Exosuit Heavy Weaponry"
	desc = "Integration of hand lethal weapon in exosuit system."
	tech_type = RESEARCH_EXOSUIT

	x = 0.6
	y = 0.2
	icon = "mechlaser"

	required_technologies = list(/datum/technology/mech_weaponry_modules)
	required_tech_levels = list()
	cost = 1500

	unlocks_designs = list(
							/datum/design/research/item/mecha/weapon/laser_heavy,
							/datum/design/research/item/mecha/weapon/ion,
							/datum/design/research/item/mecha/weapon/mecha_sword,
							/datum/design/research/item/mecha/weapon/mecha_cutlass
							)

/datum/technology/mech_teleporter_modules
	name = "Exosuit Teleporter Module"
	desc = "Exosuit Teleporter Module"
	tech_type = RESEARCH_EXOSUIT

	x = 0.8
	y = 0.4
	icon = "mechteleporter"

	required_technologies = list(/datum/technology/mech_durand)
	required_tech_levels = list()
	cost = 3750

	unlocks_designs = list(/datum/design/research/item/mecha/teleporter)
