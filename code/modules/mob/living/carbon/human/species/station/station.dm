/datum/species/human
	name = "Human"
	name_plural = "Humans"
	default_form = FORM_HUMAN
	obligate_name = FALSE
	unarmed_types = list(/datum/unarmed_attack/punch, /datum/unarmed_attack/stomp,  /datum/unarmed_attack/kick, /datum/unarmed_attack/bite)
	blurb = "Humanity originated in the Sol system, and over the last five centuries has spread \
	colonies across a wide swathe of space. They hold a wide range of forms and creeds.<br/><br/> \
	While the central Sol Federation maintains control of much of the known star space \
	interests, rampant cyber and bio-augmentation and secretive factions make life on most human \
	worlds tumultuous at best in the far flung galactic rim."
	num_alternate_languages = 2
	name_language = null // Use the first-name last-name generator rather than a language scrambler
	min_age = 18
	max_age = 110

	dark_color = "#ffffff"
	light_color = "#000000"

	stat_modifiers = list(
		STAT_BIO = 4,
		STAT_COG = 4,
		STAT_MEC = 4,
		STAT_ROB = 4,
		STAT_TGH = 4,
		STAT_VIG = 4
	)
	darksight = 2

	perks = list(PERK_IWILLSURVIVE, PERK_BATTLECRY, PERK_TENACITY)

	spawn_flags = CAN_JOIN

/datum/species/human/get_bodytype()
	return "Human"

/datum/species/sablekyne
	name = "Sablekyne"
	name_plural = "Sablekynes"
	default_form = FORM_SABLEKYNE
	obligate_form = TRUE
	unarmed_types = list(/datum/unarmed_attack/claws/strong, /datum/unarmed_attack/punch, /datum/unarmed_attack/stomp,  /datum/unarmed_attack/kick, /datum/unarmed_attack/bite/strong, /datum/unarmed_attack/horns)
	darksight = 8
	num_alternate_languages = 2
	name_language = null
	min_age = 18
	max_age = 110
	blurb = "The Sablekyne are a mammalian alien species vaguely resembling felines with horns, hailing from Onkarth in the Gamma Minoris system. \
	Sablekyne were originally uplifted by the aid of human colonization and human corporations, aiding them by \
	accelerating the fledgling culture into the interstellar age. Their history is full of war and highly fractious \
	ethnicities, something that permeates even to today's times. Northlander sablekyne perfer colder winter environments and speak with Gaelic influences while \
	southlanders prefer hot dry deserts and speak with Japanese influences. Both groups are stocky, strong, and thickly built and few have the lithe feline qualities \
	one would expect."
	taste_sensitivity = TASTE_SENSITIVE                 // How sensitive the species is to minute tastes.

	dark_color = "#00ff00"
	light_color = "#008000"

	cold_level_1 = 240 //Default 270
	cold_level_2 = 215 //Default 230
	cold_level_3 = 190  //Default 200

	heat_level_1 = 340 //Default 330
	heat_level_2 = 400 //Default 380
	heat_level_3 = 480 //Default 460

	heat_discomfort_level = 340
	heat_discomfort_strings = list(
		"Your fur prickles in the heat.",
		"You feel uncomfortably warm.",
		"Your overheated skin itches."
		)

	cold_discomfort_level = 240
	list/cold_discomfort_strings = list(
		"You feel chilly.",
		"You shiver suddenly.",
		"Your chilly flesh stands out in goosebumps."
		)
	spawn_flags = CAN_JOIN

	stat_modifiers = list(
		STAT_ROB = 5,
		STAT_TGH = 5
	)

	permitted_ears  = list("Sablekyne Large Horns",
		"Sablekyne Curled Horns",
		"Sablekyne Curled Horns (small)",
		"Sablekyne Small Horns 1",
		"Sablekyne Small Horns 2",
		"Sablekyne Small Horns 3",
		"Sablekyne Stabber Horns",
		"Sablekyne Dogma Horns",
		"Sablekyne Outstretched Horns",
		"Sablekyne Halo Horns",
		"Sablekyne Upward Horns",
		"Sablekyne Great Horns",
		"Sablekyne Bun Horns",
		"Sabelkyne Murauder Horns",
		"Sabelkyne Faceguard Horns",
		"Uni-Horn",
		"Ox Horns",
		"Stabber Horns (Colorable)"
		)
	permitted_tail  = list("Sablekyne Tail")
	permitted_wings = list()

	darksight = 3 //Cat eyes
	perks = list(PERK_LASTSTAND, PERK_BONE, PERK_BRAWN)

/datum/species/sablekyne/get_bodytype()
	return "Sablekyne"

/datum/species/marqua
	name = "Mar'Qua"
	name_plural = "Mar'quas"
	default_form = FORM_MARQUA
	obligate_form = TRUE
	reagent_tag = IS_MARQUA
	unarmed_types = list(/datum/unarmed_attack/punch, /datum/unarmed_attack/stomp,  /datum/unarmed_attack/kick)
	darksight = 4
	num_alternate_languages = 2
	name_language = null
	min_age = 18
	max_age = 160
	blurb = "no."
	hunger_factor = 0.5
	taste_sensitivity = TASTE_HYPERSENSITIVE

	dark_color = "#afeeee"
	light_color = "#20b2aa"

	cold_level_1 = 230 //Default 270
	cold_level_2 = 210 //Default 230
	cold_level_3 = 190  //Default 200

	cold_discomfort_level = 230
	list/cold_discomfort_strings = list(
		"You feel chilly.",
		"You shiver suddenly.",
		"Your chilly flesh stands out in goosebumps."
		)
	spawn_flags = CAN_JOIN

	stat_modifiers = list(
		STAT_BIO = 10,
		STAT_COG = 10,
		STAT_MEC = 10
	)

	has_process = list(    // which required-organ checks are conducted.
		OP_HEART        = /obj/item/organ/internal/heart,
		OP_LUNGS        = /obj/item/organ/internal/lungs,
		OP_STOMACH      = /obj/item/organ/internal/stomach,
		OP_LIVER        = /obj/item/organ/internal/liver,
		OP_KIDNEY_LEFT  = /obj/item/organ/internal/kidney,
		OP_KIDNEY_RIGHT = /obj/item/organ/internal/kidney,
		BP_BRAIN        = /obj/item/organ/internal/brain,
		OP_APPENDIX     = /obj/item/organ/internal/appendix,
		OP_EYES         = /obj/item/organ/internal/eyes/marqua
	)

	permitted_ears  = list()
	permitted_tail  = list()
	permitted_wings = list()

	perks = list(PERK_SUDDENBRILLIANCE, PERK_INSPIRED, PERK_ALIEN_NERVES)

/datum/species/marqua/get_bodytype()
	return "Mar'Qua"




/datum/species/kriosan
	name = "Kriosan"
	name_plural = "Kriosans"
	default_form = FORM_KRIOSAN
	obligate_form = TRUE
	reagent_tag = IS_KRIOSAN
	unarmed_types = list(/datum/unarmed_attack/needle, /datum/unarmed_attack/punch, /datum/unarmed_attack/stomp,  /datum/unarmed_attack/kick, /datum/unarmed_attack/bite)
	darksight = 4 //enhanced eyes dosnt mean perfected
	num_alternate_languages = 2
	name_language = null
	min_age = 18
	max_age = 110
	blurb = "no."
	taste_sensitivity = TASTE_HYPERSENSITIVE
	hunger_factor = 1.25
	radiation_mod = 0.5
	total_health = 130
	siemens_coefficient = 2

	dark_color = "#ff0000"
	light_color = "#990000"

	spawn_flags = CAN_JOIN

	stat_modifiers = list(
		STAT_TGH = 5,
		STAT_VIG = 5
	)

	permitted_ears  = list("Fennec Ears",
		"Fox Ears",
		"Hound Ears",
		"Jagged Ears",
		"Kitsune Ears",
		"Doberman Ears",
		"Sleek Ears",
		"Vulpkanin Ears",
		"Wolf Ears"
		)
	permitted_tail  = list("Cross Fox Tail",
		"Curly Tail",
		"Docked Tail",
		"Fennec Tail, Downwards",
		"Fennec Tail, Upwards",
		"Fennecsune Tails",
		"Fennix Tail",
		"Fox Tail, Downwards",
		"Fox Tail, Upwards",
		"Otie Tail",
		"Vulpkanin Tail",
		"Vulpkanin Tail 2",
		"Vulpkanin Tail 3",
		"Wolf Tail",
		"Jackal Tail"
		)
	permitted_wings = list()

	perks = list(PERK_ENHANCEDSENSES)

/datum/species/kriosan/get_bodytype()
	return "Kriosan"

/datum/species/akula
	name = "Akula"
	name_plural = "Akulas"
	default_form = FORM_AKULA
	obligate_form = TRUE
	reagent_tag = IS_AKULA
	unarmed_types = list(/datum/unarmed_attack/punch, /datum/unarmed_attack/stomp,  /datum/unarmed_attack/kick, /datum/unarmed_attack/tail, /datum/unarmed_attack/bite/strong)
	darksight = 3
	num_alternate_languages = 2
	name_language = null
	min_age = 18
	max_age = 130
	blurb = "no."
	taste_sensitivity = TASTE_DULL
	hunger_factor = 1.25
	total_health = 120

	cold_level_1 = 240 //Default 270
	cold_level_2 = 200 //Default 230
	cold_level_3 = 170  //Default 200

	cold_discomfort_level = 240
	list/cold_discomfort_strings = list(
		"You feel chilly.",
		"You shiver suddenly.",
		"Your chilly flesh stands out in goosebumps."
		)
	spawn_flags = CAN_JOIN

	dark_color = "#0000ff"
	light_color = "#0000ff"

	stat_modifiers = list(
		STAT_TGH = 10
	)

	permitted_ears  = list("Sleek Ears")
	permitted_tail  = list("Akula Tail")
	permitted_wings = list()

	perks = list(PERK_RECKLESSFRENZY, PERK_IRON_FLESH)

/datum/species/akula/get_bodytype()
	return "Akula"

/datum/species/naramad
	name = "Naramad"
	name_plural = "Naramadi"
	default_form = FORM_NARAMAD
	obligate_form = TRUE
	unarmed_types = list(/datum/unarmed_attack/claws/strong, /datum/unarmed_attack/punch, /datum/unarmed_attack/stomp,  /datum/unarmed_attack/kick, /datum/unarmed_attack/bite/strong, /datum/unarmed_attack/tail)
	num_alternate_languages = 0
	name_language = null
	min_age = 18
	max_age = 60
	slowdown = -0.4
	blurb = "no."
	darksight = 2

	spawn_flags = CAN_JOIN

	stat_modifiers = list(
		STAT_TGH = 10,
		STAT_ROB = 10,
		STAT_VIG = -10,
		STAT_COG = -10
	)

	dark_color = "#ffff00"
	light_color = "#ffff00"

	permitted_ears  = list("Naramad Ears", "Sleek Ears")
	permitted_tail  = list("Naramad Tail", "Naramad Tail 2")
	permitted_wings = list()

	perks = list(PERK_ADRENALINEBURST, PERK_BORN_WARRIOR, PERK_STAY_HYDRATED)

/datum/species/naramad/get_bodytype()
	return "Naramad"

/datum/species/vox
	name = "Opifex"
	name_plural = "Opifexi"
	default_form = FORM_OPIFEX
	obligate_form = TRUE
	reagent_tag = IS_OPIFEX
	unarmed_types = list(/datum/unarmed_attack/claws, /datum/unarmed_attack/punch, /datum/unarmed_attack/stomp,  /datum/unarmed_attack/kick, /datum/unarmed_attack/bite)
	num_alternate_languages = 2
	name_language = null
	min_age = 18
	max_age = 80
	blurb = "no."
	breath_type = "nitrogen"                        // Non-oxygen gas breathed, if any.
	poison_type = "oxygen"                        // Poisonous air.
	exhale_type = "carbon_dioxide"
	siemens_coefficient = 0.5
	spawn_flags = CAN_JOIN
	hunger_factor = 0.5

	stat_modifiers = list(
		STAT_MEC = 5,
		STAT_COG = 5
	)

	dark_color = "#dddddd"
	light_color = "#dddddd"
	darksight = 2

	permitted_ears  = list()
	permitted_tail  = list("Avian Wagtail", "Avian Fantail")
	permitted_wings = list("Harpy Wings",
		"Fantail Wings",
		"Feathered Wings, Small",
		"Feathered Wings, Medium",
		"Feathered Wings, Large"
		)

	perks = list(PERK_OPIFEX_TURRET, PERK_OPIFEX_PATCHKIT)

/datum/species/vox/get_bodytype()
	return "Opifex"

/datum/species/chtmant
	name = "Cht'mant"
	name_plural = "Cht'mants"
	default_form = FORM_CHTMANT
	obligate_form = TRUE
	reagent_tag = IS_CHTMANT
	unarmed_types = list(/datum/unarmed_attack/punch, /datum/unarmed_attack/stomp,  /datum/unarmed_attack/kick, /datum/unarmed_attack/bite)
	num_alternate_languages = 2
	name_language = null
	min_age = 18
	max_age = 120
	blurb = "no."
	flags = NO_PAIN
	spawn_flags = CAN_JOIN
	taste_sensitivity = TASTE_HYPERSENSITIVE
	darksight = 4

	brute_mod =     1.25                    // Physical damage multiplier.
	burn_mod =      0.85                    // Burn damage multiplier.
	flash_mod =     3

	stat_modifiers = list(
		STAT_BIO = 5,
		STAT_COG = 5
	)

	dark_color = "#5ac18e"
	light_color = "#5ac18e"

	permitted_ears  = list("Bee Antennae",
		"Citheronia Antennae",
		"Curly Antennae"
		)
	permitted_tail  = list("Bug Abdomen",
		"Bug Abdomen, Bee Top",
		"Bug Abdomen, Bee Full",
		"Bug Abdomen, Underside",
		"Bug Abdomen, Firefly",
		"Large Bug Abdomen",
		"Large Bug Abdomen, Bee Top",
		"Large Bug Abdomen, Bee Full",
		"Large Bug Abdomen, Underside",
		"Large Bug Abdomen, Firefly",
		"Alternate Bug Abdomen",
		"Alternate Bug Abdomen, Bee Top",
		"Alternate Bug Abdomen, Bee Full",
		"Alternate Bug Abdomen, Underside",
		"Alternate Bug Abdomen, Firefly",
		"Alternate Bug Abdomen 2",
		"Alternate Bug Abdomen 2, Bee Top",
		"Alternate Bug Abdomen 2, Bee Full",
		"Alternate Bug Abdomen 2, Underside",
		"Alternate Bug Abdomen 2, Firefly",
		"Alternate Large Bug Abdomen",
		"Alternate Large Bug Abdomen, Bee Top",
		"Alternate Large Bug Abdomen, Bee Full",
		"Alternate Large Bug Abdomen, Underside",
		"Alternate Large Bug Abdomen, Firefly",
		"Alternate Bug Abdomen 3",
		"Alternate Bug Abdomen 3, Bee Top",
		"Alternate Bug Abdomen 3, Bee Full",
		"Alternate Bug Abdomen 3, Underside",
		"Alternate Bug Abdomen 3, Firefly"
		)
	permitted_wings = list("Bee Wings",
		"Butterfly Wings",
		"Dragonfly Wings",
		"Moth Wings, Burned",
		"Moth Wings, Citheronia",
		"Moth Wings, Deathhead",
		"Moth Wings, Firewatch",
		"Moth Wings, Gothic",
		"Moth Wings, Lover",
		"Moth Wings, Monarch",
		"Moth Wings, Moonfly",
		"Moth Wings, Poison",
		"Moth Wings, Ragged",
		"Moth Wings, Red",
		"Moth Wings, Royal",
		"Moth Wings, Royal Unfluffed",
		"Moth Wings, Snowy",
		"Moth Wings, White",
		"Moth Wings, Worker",
		"Moth Wings, Plain",
		"Spider Legs"
		)

/datum/species/chtmant/get_bodytype()
	return "Cht'mant"

/datum/species/cindarite
	name = "Cindarite"
	name_plural = "Cindarites"
	default_form = FORM_CINDAR
	reagent_tag = IS_CINDERITE
	obligate_form = TRUE
	unarmed_types = list(/datum/unarmed_attack/punch, /datum/unarmed_attack/stomp,  /datum/unarmed_attack/kick, /datum/unarmed_attack/bite, /datum/unarmed_attack/tail)
	num_alternate_languages = 2
	blurb = "no"
	name_language = null
	min_age = 18
	max_age = 90
	spawn_flags = CAN_JOIN
	total_health = 110                   // Burn damage multiplier.
	radiation_mod = 0
	darksight = 3

	stat_modifiers = list(
		STAT_BIO = 2,
		STAT_COG = 2,
		STAT_MEC = 2,
		STAT_TGH = 2
	)

	cold_level_1 = 290 //Default 270
	cold_level_2 = 265 //Default 230
	cold_level_3 = 240  //Default 200

	heat_level_1 = 370 //Default 330
	heat_level_2 = 410 //Default 380
	heat_level_3 = 500 //Default 460

	heat_discomfort_level = 370
	heat_discomfort_strings = list(
		"Your scales prickles in the heat.",
		"You feel uncomfortably warm.",
		"Your overheated scales itch."
		)

	dark_color = "#660066"
	light_color = "#660066"

	cold_discomfort_level = 290
	list/cold_discomfort_strings = list(
		"You feel chilly.",
		"You shiver suddenly.",
		"Your chilly scales stands out in goosebumps."
		)

	has_process = list(    // which required-organ checks are conducted.
		OP_HEART =    /obj/item/organ/internal/heart,
		OP_LUNGS =    /obj/item/organ/internal/lungs,
		OP_STOMACH =  /obj/item/organ/internal/stomach,
		OP_LIVER =    /obj/item/organ/internal/liver,
		OP_KIDNEY_LEFT =  /obj/item/organ/internal/kidney/left/cindarite,
		OP_KIDNEY_RIGHT = /obj/item/organ/internal/kidney/right/cindarite,
		BP_BRAIN =    /obj/item/organ/internal/brain,
		OP_APPENDIX = /obj/item/organ/internal/appendix,
		OP_EYES =     /obj/item/organ/internal/eyes
		)

	permitted_ears  = list("Frills, Aquatic",
		"Frills, Drake",
		"Frills, Short",
		"Frills, Simple",
		"Frills, Big"
		)
	permitted_tail  = list("Render Tail",
		"Snake Tail",
		"Lizard Tail",
		"Lizard Tail, Short",
		"Lizard Tail, Dark Tiger"
		)
	permitted_wings = list("Spines, Aquatic",
		"Spines, Long",
		"Spines, Long Membrane",
		"Spines, Short",
		"Spines, Short Membrane",
		)

	perks = list(PERK_PURGEINFECTIONS, PERK_PURGETOXINS, PERK_SECOND_SKIN)

/datum/species/cindarite/get_bodytype()
	return "Cindarite"

/datum/species/full_body_prosthetic
	name = "Full Body Prosthetic"
	default_form = FORM_FBP
	obligate_form = TRUE
	obligate_name = FALSE
	name_plural = "FBPs"
	unarmed_types = list(/datum/unarmed_attack/punch, /datum/unarmed_attack/stomp,  /datum/unarmed_attack/kick, /datum/unarmed_attack/bite)
	blurb = "no."
	reagent_tag = IS_SYNTHETIC
	hunger_factor = 0
	flags = NO_BREATHE | NO_PAIN | NO_BLOOD | NO_SCAN | NO_POISON | NO_MINOR_CUT
	radiation_mod = 0
	total_health = 75
	virus_immune = TRUE
	breath_type = null
	poison_type = null
	darksight = 2

	has_limbs = list(
		BP_CHEST =  new /datum/organ_description/chest/full_body_prosthetic,
		BP_GROIN =  new /datum/organ_description/groin/full_body_prosthetic,
		BP_HEAD =   new /datum/organ_description/head/full_body_prosthetic,
		BP_L_ARM =  new /datum/organ_description/arm/left/full_body_prosthetic/full,
		BP_R_ARM =  new /datum/organ_description/arm/right/full_body_prosthetic/full,
		BP_L_LEG =  new /datum/organ_description/leg/left/full_body_prosthetic/full,
		BP_R_LEG =  new /datum/organ_description/leg/right/full_body_prosthetic/full
		)

	has_process = list(    // which required-process checks are conducted and default organs for them.
		OP_CELL = /obj/item/organ/internal/cell,
		BP_BRAIN = /obj/item/organ/internal/brain,
		OP_EYES = /obj/item/organ/internal/eyes/prosthetic/fbp
		)

	heat_discomfort_strings = list(
		"System analysis reports higher than normal heat levels.",
		"System analysis reports rising tempatures!",
		"System analysis reports dangerous levels of heat!."
		)
	cold_discomfort_strings = list(
		"System analysis reports lower than normal tempature.",
		"System analysis reports rapidly decreasing tempatures!",
		"System analysis reports dangerous levels of cold!."
		)

	spawn_flags = CAN_JOIN

/datum/species/full_body_prosthetic/get_bodytype()
	return "Full Body Prosthetic"

/datum/species/unbranded_synth
	name = "Unbranded Full Body Prosthetic"
	default_form = FORM_UNBRANDED
	obligate_form = TRUE
	obligate_name = FALSE
	name_plural = "FBPs"
	unarmed_types = list(/datum/unarmed_attack/punch, /datum/unarmed_attack/stomp,  /datum/unarmed_attack/kick, /datum/unarmed_attack/bite)
	blurb = "no"
	reagent_tag = IS_SYNTHETIC
	hunger_factor = 0
	flags = NO_BREATHE | NO_PAIN | NO_BLOOD | NO_SCAN | NO_POISON | NO_MINOR_CUT
	radiation_mod = 0
	total_health = 75
	virus_immune = TRUE
	breath_type = null
	poison_type = null
	darksight = 2

	has_limbs = list(
		BP_CHEST =  new /datum/organ_description/chest/unbranded,
		BP_GROIN =  new /datum/organ_description/groin/unbranded,
		BP_HEAD =   new /datum/organ_description/head/unbranded,
		BP_L_ARM =  new /datum/organ_description/arm/left/unbranded/full,
		BP_R_ARM =  new /datum/organ_description/arm/right/unbranded/full,
		BP_L_LEG =  new /datum/organ_description/leg/left/unbranded/full,
		BP_R_LEG =  new /datum/organ_description/leg/right/unbranded/full
		)

	has_process = list(    // which required-process checks are conducted and default organs for them.
		OP_CELL = /obj/item/organ/internal/cell,
		BP_BRAIN = /obj/item/organ/internal/brain,
		OP_EYES = /obj/item/organ/internal/eyes/prosthetic/fbp
		)

	heat_discomfort_strings = list(
		"System analysis reports higher than normal heat levels.",
		"System analysis reports rising tempatures!",
		"System analysis reports dangerous levels of heat!."
		)
	cold_discomfort_strings = list(
		"System analysis reports lower than normal tempature.",
		"System analysis reports rapidly decreasing tempatures!",
		"System analysis reports dangerous levels of cold!."
		)

	spawn_flags = CAN_JOIN

/datum/species/unbranded_synth/get_bodytype()
	return "Unbranded Full Body Prosthetic"

/datum/species/capsa_synthetic
	name = "CAPSA synth"
	name_plural = "synthetics"
	default_form = FORM_PIRSYNTH
	obligate_name = TRUE
	obligate_form = TRUE
	unarmed_types = list(/datum/unarmed_attack/punch, /datum/unarmed_attack/stomp,  /datum/unarmed_attack/kick, /datum/unarmed_attack/bite)
	blurb = "no."
	num_alternate_languages = 3
	name_language = null // Use the first-name last-name generator rather than a language scrambler
	min_age = 18
	max_age = 110
	siemens_coefficient = 2
	reagent_tag = IS_SYNTHETIC
	hunger_factor = 0
	flags = NO_BREATHE | NO_PAIN | NO_BLOOD | NO_SCAN | NO_POISON | NO_MINOR_CUT
	slowdown = 0.3
	radiation_mod = 0
	total_health = 75
	virus_immune = TRUE
	breath_type = null
	poison_type = null
	darksight = 2

	dark_color = "#ffffff"
	light_color = "#000000"

	has_limbs = list(
		BP_CHEST =  new /datum/organ_description/chest/capsa_synthetic,
		BP_GROIN =  new /datum/organ_description/groin/capsa_synthetic,
		BP_HEAD =   new /datum/organ_description/head/capsa_synthetic,
		BP_L_ARM =  new /datum/organ_description/arm/left/capsa_synthetic/full,
		BP_R_ARM =  new /datum/organ_description/arm/right/capsa_synthetic/full,
		BP_L_LEG =  new /datum/organ_description/leg/left/capsa_synthetic/full,
		BP_R_LEG =  new /datum/organ_description/leg/right/capsa_synthetic/full
		)

	has_process = list(    // which required-process checks are conducted and default organs for them.
		OP_CELL = /obj/item/organ/internal/cell,
		BP_BRAIN = /obj/item/organ/internal/brain/synthetic,
		OP_EYES = /obj/item/organ/internal/eyes/prosthetic/fbp
		)

	heat_discomfort_strings = list(
		"System analysis reports higher than normal heat levels.",
		"System analysis reports rising tempatures!",
		"System analysis reports dangerous levels of heat!."
		)
	cold_discomfort_strings = list(
		"System analysis reports lower than normal tempature.",
		"System analysis reports rapidly decreasing tempatures!",
		"System analysis reports dangerous levels of cold!."
		)

	stat_modifiers = list(
		STAT_COG = 5,
		STAT_MEC = 5
	)

	spawn_flags = CAN_JOIN

/datum/species/capsa_synthetic/get_bodytype()
	return "CAPSA Synthetic"

/datum/species/terra_therma_synthetic
	name = "Terra-Therma synth"
	name_plural = "synthetics"
	default_form = FORM_TERRAYNTH
	obligate_name = TRUE
	obligate_form = TRUE
	unarmed_types = list(/datum/unarmed_attack/punch, /datum/unarmed_attack/stomp,  /datum/unarmed_attack/kick, /datum/unarmed_attack/bite)
	blurb = "no."
	num_alternate_languages = 3
	name_language = null // Use the first-name last-name generator rather than a language scrambler
	min_age = 18
	max_age = 110
	siemens_coefficient = 0
	reagent_tag = IS_SYNTHETIC
	hunger_factor = 0
	flags = NO_BREATHE | NO_PAIN | NO_BLOOD | NO_SCAN | NO_POISON | NO_MINOR_CUT
	radiation_mod = 0
	virus_immune = TRUE
	breath_type = null
	poison_type = null
	total_health = 75
	darksight = 2

	dark_color = "#FA8128"
	light_color = "#FCAE1E"

	has_limbs = list(
		BP_CHEST =  new /datum/organ_description/chest/terra_therma_synthetic,
		BP_GROIN =  new /datum/organ_description/groin/terra_therma_synthetic,
		BP_HEAD =   new /datum/organ_description/head/terra_therma_synthetic,
		BP_L_ARM =  new /datum/organ_description/arm/left/terra_therma_synthetic/full,
		BP_R_ARM =  new /datum/organ_description/arm/right/terra_therma_synthetic/full,
		BP_L_LEG =  new /datum/organ_description/leg/left/terra_therma_synthetic/full,
		BP_R_LEG =  new /datum/organ_description/leg/right/terra_therma_synthetic/full
		)

	has_process = list(    // which required-process checks are conducted and defalut organs for them.
		OP_CELL = /obj/item/organ/internal/cell,
		BP_BRAIN = /obj/item/organ/internal/brain/synthetic,
		OP_EYES = /obj/item/organ/internal/eyes/prosthetic/fbp
		)

	heat_discomfort_strings = list(
		"System analysis reports higher than normal heat levels.",
		"System analysis reports rising tempatures!",
		"System analysis reports dangerous levels of heat!."
		)
	cold_discomfort_strings = list(
		"System analysis reports lower than normal tempature.",
		"System analysis reports rapidly decreasing tempatures!",
		"System analysis reports dangerous levels of cold!."
		)

	stat_modifiers = list(
		STAT_MEC = 10
	)

	spawn_flags = CAN_JOIN

/datum/species/terra_therma_synthetic/get_bodytype()
	return "Terra-Therma Synthetic"

/datum/species/liberty_synthetic
	name = "Liberty Synthetic"
	name_plural = "synthetics"
	default_form = FORM_LIBYNTH
	obligate_name = TRUE
	obligate_form = TRUE
	unarmed_types = list(/datum/unarmed_attack/punch, /datum/unarmed_attack/stomp,  /datum/unarmed_attack/kick, /datum/unarmed_attack/bite)
	blurb = "no."
	num_alternate_languages = 3
	name_language = null // Use the first-name last-name generator rather than a language scrambler
	min_age = 18
	max_age = 110
	reagent_tag = IS_SYNTHETIC
	hunger_factor = 0
	flags = NO_BREATHE | NO_PAIN | NO_BLOOD | NO_SCAN | NO_POISON | NO_MINOR_CUT
	radiation_mod = 0
	virus_immune = TRUE
	breath_type = null
	poison_type = null
	total_health = 75
	dark_color = "#FFFFFF"
	light_color = "#000000"
	darksight = 2

	has_limbs = list(
		BP_CHEST =  new /datum/organ_description/chest/liberty_synthetic,
		BP_GROIN =  new /datum/organ_description/groin/liberty_synthetic,
		BP_HEAD =   new /datum/organ_description/head/liberty_synthetic,
		BP_L_ARM =  new /datum/organ_description/arm/left/liberty_synthetic/full,
		BP_R_ARM =  new /datum/organ_description/arm/right/liberty_synthetic/full,
		BP_L_LEG =  new /datum/organ_description/leg/left/liberty_synthetic/full,
		BP_R_LEG =  new /datum/organ_description/leg/right/liberty_synthetic/full
		)

	has_process = list(    // which required-process checks are conducted and default organs for them.
		OP_CELL = /obj/item/organ/internal/cell,
		BP_BRAIN = /obj/item/organ/internal/brain/synthetic,
		OP_EYES = /obj/item/organ/internal/eyes/prosthetic/fbp
		)

	heat_discomfort_strings = list(
		"System analysis reports higher than normal heat levels.",
		"System analysis reports rising tempatures!",
		"System analysis reports dangerous levels of heat!."
		)
	cold_discomfort_strings = list(
		"System analysis reports lower than normal tempature.",
		"System analysis reports rapidly decreasing tempatures!",
		"System analysis reports dangerous levels of cold!."
		)

	stat_modifiers = list(
		STAT_TGH = 10
	)

	spawn_flags = CAN_JOIN

/datum/species/liberty_synthetic/get_bodytype()
	return "Liberty Synthetic"

/datum/species/church_synthetic
	name = "Knight Synth"
	name_plural = "synthetics"
	default_form = FORM_CHURCHSYNTH
	obligate_name = TRUE
	obligate_form = TRUE
	unarmed_types = list(/datum/unarmed_attack/punch, /datum/unarmed_attack/stomp,  /datum/unarmed_attack/kick, /datum/unarmed_attack/bite)
	blurb = "no."
	num_alternate_languages = 3
	name_language = null // Use the first-name last-name generator rather than a language scrambler
	min_age = 18
	max_age = 110
	reagent_tag = IS_SYNTHETIC
	hunger_factor = 0
	flags = NO_BREATHE | NO_PAIN | NO_BLOOD | NO_SCAN | NO_POISON | NO_MINOR_CUT
	radiation_mod = 0
	virus_immune = TRUE
	breath_type = null
	poison_type = null
	total_health = 75
	darksight = 2

	dark_color = "#FFFFFF"
	light_color = "#000000"

	has_limbs = list(
		BP_CHEST =  new /datum/organ_description/chest/church_synthetic,
		BP_GROIN =  new /datum/organ_description/groin/church_synthetic,
		BP_HEAD =   new /datum/organ_description/head/church_synthetic,
		BP_L_ARM =  new /datum/organ_description/arm/left/church_synthetic/full,
		BP_R_ARM =  new /datum/organ_description/arm/right/church_synthetic/full,
		BP_L_LEG =  new /datum/organ_description/leg/left/church_synthetic/full,
		BP_R_LEG =  new /datum/organ_description/leg/right/church_synthetic/full
		)

	has_process = list(    // which required-process checks are conducted and default organs for them.
		OP_CELL = /obj/item/organ/internal/cell,
		BP_BRAIN = /obj/item/organ/internal/brain/synthetic,
		OP_EYES = /obj/item/organ/internal/eyes/prosthetic/fbp
		)

	heat_discomfort_strings = list(
		"System analysis reports higher than normal heat levels.",
		"System analysis reports rising tempatures!",
		"System analysis reports dangerous levels of heat!."
		)
	cold_discomfort_strings = list(
		"System analysis reports lower than normal tempature.",
		"System analysis reports rapidly decreasing tempatures!",
		"System analysis reports dangerous levels of cold!."
		)

	stat_modifiers = list(
		STAT_BIO = 10
	)

	spawn_flags = CAN_JOIN

/datum/species/church_synthetic/get_bodytype()
	return "Knight Synthetic"

/datum/species/nashef_synthetic
	name = "Nashef-Agunabi"
	name_plural = "synthetics"
	default_form = FORM_NASHEF
	obligate_name = TRUE
	obligate_form = TRUE
	unarmed_types = list(/datum/unarmed_attack/punch, /datum/unarmed_attack/stomp,  /datum/unarmed_attack/kick, /datum/unarmed_attack/bite)
	blurb = "no."
	num_alternate_languages = 3
	name_language = null // Use the first-name last-name generator rather than a language scrambler
	min_age = 18
	max_age = 110
	reagent_tag = IS_SYNTHETIC
	hunger_factor = 0
	flags = NO_BREATHE | NO_PAIN | NO_BLOOD | NO_SCAN | NO_POISON | NO_MINOR_CUT
	radiation_mod = 0
	virus_immune = TRUE
	breath_type = null
	poison_type = null
	darksight = 3

	dark_color = "#FFFFFF"
	light_color = "#000000"

	has_limbs = list(
		BP_CHEST =  new /datum/organ_description/chest/nashef_synthetic,
		BP_GROIN =  new /datum/organ_description/groin/nashef_synthetic,
		BP_HEAD =   new /datum/organ_description/head/nashef_synthetic,
		BP_L_ARM =  new /datum/organ_description/arm/left/nashef_synthetic/full,
		BP_R_ARM =  new /datum/organ_description/arm/right/nashef_synthetic/full,
		BP_L_LEG =  new /datum/organ_description/leg/left/nashef_synthetic/full,
		BP_R_LEG =  new /datum/organ_description/leg/right/nashef_synthetic/full
		)

	has_process = list(    // which required-process checks are conducted and default organs for them.
		OP_CELL = /obj/item/organ/internal/cell,
		BP_BRAIN = /obj/item/organ/internal/brain/synthetic,
		OP_EYES = /obj/item/organ/internal/eyes/prosthetic/fbp
		)

	heat_discomfort_strings = list(
		"System analysis reports higher than normal heat levels.",
		"System analysis reports rising tempatures!",
		"System analysis reports dangerous levels of heat!."
		)
	cold_discomfort_strings = list(
		"System analysis reports lower than normal tempature.",
		"System analysis reports rapidly decreasing tempatures!",
		"System analysis reports dangerous levels of cold!."
		)

	stat_modifiers = list(
		STAT_BIO = 10
	)

	spawn_flags = IS_RESTRICTED

/datum/species/slime
	name = "Slime"
	name_plural = "slimes"

	default_form = FORM_SLIME
	obligate_form = TRUE
	reagent_tag = IS_SLIME
	unarmed_types = list(/datum/unarmed_attack/slime_glomp)
	flags = NO_SLIP | NO_BREATHE | NO_BLOOD | NO_SCAN | NO_MINOR_CUT
	siemens_coefficient = 3 //conductive
	darksight = 3
	virus_immune = TRUE
	always_blood = TRUE
	always_ingest = TRUE
	breath_type = null
	poison_type = null
	hunger_factor = 2
	spawn_flags = CAN_JOIN

	burn_mod = 1.15
	brute_mod = 1.15
	toxins_mod = 1 // fuck toxins_mod, we use a perk for this
	oxy_mod = 0

	cold_discomfort_level = 283
	heat_discomfort_level = 313

	cold_level_1 = 258 //Default 270
	cold_level_2 = 243 //Default 230
	cold_level_3 = 228  //Default 200

	heat_level_1 = 333 //Default 330
	heat_level_2 = 353 //Default 380
	heat_level_3 = 372 //Default 460

	has_process = list(
		BP_BRAIN = /obj/item/organ/internal/brain/slime,
		OP_STOMACH = /obj/item/organ/internal/stomach,
		)

	breath_type = null
	poison_type = null

	bump_flag = SLIME
	swap_flags = MONKEY|SLIME|SIMPLE_ANIMAL
	push_flags = MONKEY|SLIME|SIMPLE_ANIMAL

	has_limbs = list(
		BP_CHEST =  new /datum/organ_description/chest/slime,
		BP_GROIN =  new /datum/organ_description/groin/slime,
		BP_HEAD =   new /datum/organ_description/head/slime,
		BP_L_ARM =  new /datum/organ_description/arm/left/slime,
		BP_R_ARM =  new /datum/organ_description/arm/right/slime,
		BP_L_LEG =  new /datum/organ_description/leg/left/slime,
		BP_R_LEG =  new /datum/organ_description/leg/right/slime
	)

	perks = list(PERK_LIMB_REGEN, PERK_SLIMEBODY)

/*/datum/species/slime/handle_death(var/mob/living/carbon/human/H)
	spawn(1)
		if(H)
			H.gib()*/
