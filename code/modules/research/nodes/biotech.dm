/datum/technology/basic_biotech
	name = "Basic Biotech"
	desc = "Basic biotech micro manipulations and scanning method."
	tech_type = RESEARCH_BIOTECH

	x = 0.2
	y = 0.5
	icon = "healthanalyzer"

	required_technologies = list()
	required_tech_levels = list()
	cost = 0

	unlocks_designs = list(	/datum/design/research/item/part/micro_mani,
							/datum/design/research/item/part/basic_sensor,
							/datum/design/research/item/medical/autopsy_scanner,
							/datum/design/research/item/beaker/smoll,
							/datum/design/research/item/beaker/big
						)

/datum/technology/medical_cooling
	name = "Medical Cooling"
	desc = "Using cryo based tech in more equipment based gear."
	tech_type = RESEARCH_BIOTECH

	x = 0.2
	y = 0.7
	icon = "cryobag"

	required_technologies = list(/datum/technology/ice_and_fire, /datum/technology/basic_biotech)
	required_tech_levels = list()
	cost = 375

	unlocks_designs = list(	/datum/design/research/item/medical/cryobag,
							/datum/design/research/item/medical/red,
							/datum/design/research/item/medical/blue
						)

/datum/technology/basic_med_machines
	name = "Basic Medical Machines"
	desc = "Basic medical databases and surgical monitoring."
	tech_type = RESEARCH_BIOTECH

	x = 0.35
	y = 0.5
	icon = "operationcomputer"

	required_technologies = list(/datum/technology/basic_biotech)
	required_tech_levels = list()
	cost = 150

	unlocks_designs = list(	/datum/design/research/circuit/med_data,
							/datum/design/research/circuit/operating,
							/datum/design/research/item/medical/roller_bed
						)

/datum/technology/adv_med_machines
	name = "Advanced Medical Machines"
	desc = "Advanced Medical manipulations and fast scan and injection system."
	tech_type = RESEARCH_BIOTECH

	x = 0.45
	y = 0.5
	icon = "sleeper"

	required_technologies = list(/datum/technology/basic_med_machines)
	required_tech_levels = list()
	cost = 375

	unlocks_designs = list(/datum/design/research/circuit/sleeper,
							/datum/design/research/circuit/med_fab,
							/datum/design/research/circuit/slime_compresser,
							/datum/design/research/item/medical/compact_roller_bed)

/datum/technology/hydroponics
	name = "Hydroponics"
	desc = "The method of reassembling biomaterials. The flora genetic modifying method."
	tech_type = RESEARCH_BIOTECH

	x = 0.45
	y = 0.7
	icon = "hydroponics"

	required_technologies = list(/datum/technology/basic_biotech)
	required_tech_levels = list()
	cost = 300

	unlocks_designs = list(	/datum/design/research/circuit/biogenerator,
							/datum/design/research/circuit/extractor,
							/datum/design/research/circuit/seed_extractor,
							/datum/design/research/circuit/editor,
							/datum/design/research/item/weapon/flora_gun
							)

/datum/technology/portable_chemistry
	name = "Portable Chemistry"
	desc = "Portable bottle generating and reagent separation. Portable heating system, space for system required: 30 cubic millimeters."
	tech_type = RESEARCH_BIOTECH

	x = 0.55
	y = 0.7
	icon = "chemdisp"

	required_technologies = list(	/datum/technology/basic_biotech,
									/datum/technology/hydroponics
								)
	required_tech_levels = list()
	cost = 525

	unlocks_designs = list(	/datum/design/research/circuit/chemmaster,
							/datum/design/research/circuit/chemical_dispenser,
							/datum/design/research/circuit/chem_heater,
							/datum/design/research/item/makeshift_centrifuge,
							/datum/design/research/structure/bidon,
							/datum/design/research/item/computer_part/medical,
							/datum/design/research/item/computer_part/reagent,
							/datum/design/research/item/robot_upgrade/medical_hypo_upgrade
							//datum/design/research/item/robot_upgrade/rescue_hypo_upgrade
							)

/datum/technology/basic_medical_tools
	name = "Basic Medical Tools"
	desc = "Mass Spectrometry method. Experimental surgical laser tools. Medical sensors intergrated HUD in hud-glass and large revival electrical shocks. Artificial quick dry bone gel composite."
	tech_type = RESEARCH_BIOTECH

	x = 0.55
	y = 0.5
	icon = "medhud"

	required_technologies = list(/datum/technology/adv_med_machines)
	required_tech_levels = list()
	cost = 375

	unlocks_designs = list(	/datum/design/research/item/medical/mass_spectrometer,
							/datum/design/research/item/medical/reagent_scanner,
							/datum/design/research/item/medical/defibs,
							/datum/design/research/item/scalpel_laser,
							/datum/design/research/item/clothing/health,
							)

/datum/technology/improved_biotech
	name = "Improved Biotech"
	desc = "Improved micro manipulations, advanced scanning methods. Chemical implants and better surgical tools, be careful."
	tech_type = RESEARCH_BIOTECH

	x = 0.65
	y = 0.5
	icon = "handheldmonitor"

	required_technologies = list(/datum/technology/basic_medical_tools)
	required_tech_levels = list()
	cost = 750

	unlocks_designs = list(	/datum/design/research/item/implant/chemical,
							/datum/design/research/item/part/adv_sensor,
							/datum/design/research/item/part/nano_mani,
							/datum/design/research/item/fire_kit,
							/datum/design/research/item/regular_kit,
							/datum/design/research/item/toxin_kit,
							/datum/design/research/item/o2_kit,
							/datum/design/research/item/adv_kit,
							/datum/design/research/item/surgery_kit,
							/datum/design/research/item/drill_s_adv,
							/datum/design/research/item/scalpel_adv,
							/datum/design/research/item/bonesetter_adv,
							/datum/design/research/item/cautery_adv,
							/datum/design/research/item/hemostat_adv,
							/datum/design/research/item/retractor_adv,
							/datum/design/research/item/medsaw_circular,
							)

/datum/technology/portable_biotech
	name = "Advanced and Portable Chemistry Biotech"
	desc = "Portable injection and scan method, capitalists' and not capitalists portable sleeper. Integrated medical sensors hud with hardsuits' systems."
	tech_type = RESEARCH_BIOTECH

	x = 0.65
	y = 0.7
	icon = "rignuclearreactor"

	required_technologies = list(/datum/technology/improved_biotech,
								/datum/technology/portable_chemistry
								)
	required_tech_levels = list()
	cost = 750

	unlocks_designs = list(
						/datum/design/research/item/chem_dispenser,
						/datum/design/research/item/medhud,
						/datum/design/research/structure/bidonadv,
						/datum/design/research/structure/bidontrigger,
						/datum/design/research/item/medical/compact_defibs,
						/datum/design/research/item/implant/alarm,
						/datum/design/research/item/petite_scanner
						)

/datum/technology/tracker_tablet
	name = "Tracker tablet"
	desc = "Modified tablet frame with extra screens for use with sensor monitoring software."
	tech_type = RESEARCH_BIOTECH

	x = 0.65
	y = 0.9
	icon = "moetablet"

	required_technologies = list(/datum/technology/portable_biotech)
	required_tech_levels = list()
	cost = 1000

	unlocks_designs = list(/datum/design/research/item/tracker_tablet)

/datum/technology/advanced_biotech
	name = "Advanced Biotech"
	desc = "Top-tier micro manipulations systems. Top-tier scan method. Upgraded mass spectrometry. Advanced sprayer. Machinegun-like syringe-gun."
	tech_type = RESEARCH_BIOTECH

	x = 0.75
	y = 0.5
	icon = "rapidsyringegun"

	required_technologies = list(/datum/technology/improved_biotech)
	required_tech_levels = list()
	cost = 750

	unlocks_designs = list(	/datum/design/research/item/part/phasic_sensor,
							/datum/design/research/item/part/pico_mani,
							/datum/design/research/item/medical/adv_mass_spectrometer,
							/datum/design/research/item/medical/adv_reagent_scanner,
							/datum/design/research/item/weapon/chemsprayer,
							/datum/design/research/item/weapon/rapidsyringe,
							/datum/design/research/item/ammo/rapidsyringe)
/*
/datum/technology/virology
	name = "Virology"
	desc = "Virology"
	tech_type = RESEARCH_BIOTECH

	x = 0.4
	y = 0.8
	icon = "vialbox"

	required_technologies = list(/datum/technology/basic_med_machines)
	required_tech_levels = list()
	cost = 500

	unlocks_designs = list()
*/
