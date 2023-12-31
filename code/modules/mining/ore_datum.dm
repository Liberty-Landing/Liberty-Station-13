var/global/list/ore_data = list()

/ore
	var/name
	var/display_name
	var/alloy
	var/smelts_to
	var/compresses_to
	var/result_amount     // How much ore?
	var/spread = 1	      // Does this type of deposit spread?
	var/spread_chance     // Chance of spreading in any direction
	var/ore	              // Path to the ore produced when tile is mined.
	var/scan_icon         // Overlay for ore scanners.
	// Xenoarch stuff. No idea what it's for, just refactored it to be less awful.
	var/list/xarch_ages = list(
		"thousand" = 999,
		"million" = 999
		)
	var/xarch_source_mineral = "iron"

/ore/New()
	. = ..()
	if(!display_name)
		display_name = name

/ore/uranium
	name = ORE_URANIUM
	display_name = "pitchblende"
	smelts_to = MATERIAL_URANIUM
	result_amount = 8
	spread_chance = 8
	ore = /obj/item/stack/ore/uranium
	scan_icon = "mineral_uncommon"
	xarch_ages = list(
		"thousand" = 999,
		"million" = 704
		)
	xarch_source_mineral = "potassium"

/ore/hematite
	name = ORE_IRON
	display_name = "hematite"
	smelts_to = MATERIAL_IRON
	alloy = TRUE
	result_amount = 10
	spread_chance = 15
	ore = /obj/item/stack/ore/iron
	scan_icon = "mineral_common"

/ore/lignite
	name = ORE_LIGNITE
	display_name = "raw lignite"
	smelts_to = MATERIAL_PLASTIC
	compress_to = MATERIAL_BRIQUETTE
	alloy = TRUE
	result_amount = 10
	spread_chance = 15
	ore = /obj/item/stack/ore/lignite
	scan_icon = "mineral_common"

/ore/glass
	name = ORE_SAND
	display_name = "sand"
	smelts_to = MATERIAL_GLASS
	compresses_to = MATERIAL_SANDSTONE
	alloy = TRUE

/ore/hydrogen
	name = ORE_CLATHRATES
	display_name = "Gaseous Clathrates"
	compresses_to = MATERIAL_MHYDROGEN
	smelts_to = MATERIAL_TRITIUM
	alloy = TRUE
	result_amount = 6
	spread_chance = 8
	ore = /obj/item/stack/ore/hydrogen
	scan_icon = "mineral_uncommon"
	xarch_ages = list(
		"thousand" = 999,
		"million" = 999,
		"billion" = 13,
		"billion_lower" = 10
		)
	xarch_source_mineral = "hydrogen"

/ore/silver
	name = ORE_SILVER
	display_name = "native silver"
	smelts_to = MATERIAL_SILVER
	result_amount = 8
	spread_chance = 10
	ore = /obj/item/stack/ore/silver
	scan_icon = "mineral_uncommon"

/ore/gold
	smelts_to = MATERIAL_GOLD
	name = ORE_GOLD
	display_name = "native gold"
	result_amount = 8
	spread_chance = 10
	ore = /obj/item/stack/ore/gold
	scan_icon = "mineral_uncommon"
	xarch_ages = list(
		"thousand" = 999,
		"million" = 999,
		"billion" = 4,
		"billion_lower" = 3
		)

/ore/diamond
	name = ORE_DIAMOND
	display_name = "diamond"
	compresses_to = MATERIAL_DIAMOND
	result_amount = 4
	spread_chance = 10
	ore = /obj/item/stack/ore/diamond
	scan_icon = "mineral_rare"
	xarch_source_mineral = "nitrogen"

/ore/niobium
	name = ORE_NIOBIUM
	display_name = "pyrochlore"
	smelts_to = MATERIAL_NIOBIUM //why would you do this?
	alloy = TRUE
	result_amount = 8
	spread_chance = 10
	ore = /obj/item/stack/ore/niobium
	scan_icon = "mineral_uncommon"
	xarch_ages = list(
		"thousand" = 999,
		"million" = 704
		)
	xarch_source_mineral = "potassium"

/ore/copper
	name = ORE_COPPER
	display_name = "Malachite"
	smelts_to = MATERIAL_COPPER
	result_amount = 10
	spread_chance = 25
	ore = /obj/item/stack/ore/copper
	scan_icon = "mineral_uncommon"
	xarch_ages = list(
		"thousand" = 999,
		"million" = 704
		)
	xarch_source_mineral = "potassium"

/ore/aluminium
	name = ORE_ALUMINIUM
	display_name = "bauxite"
	smelts_to = MATERIAL_ALUMINIUM
	result_amount = 10
	spread_chance = 25
	ore = /obj/item/stack/ore/aluminium
	scan_icon = "mineral_uncommon"
	xarch_ages = list(
		"thousand" = 999,
		"million" = 704
		)
	xarch_source_mineral = "oxides"

/ore/titanium
	name = ORE_TITANIUM
	display_name = "ilminite"
	smelts_to = MATERIAL_TITANIUM
	result_amount = 10
	spread_chance = 10
	ore = /obj/item/stack/ore/uranium
	scan_icon = "mineral_uncommon"
	xarch_ages = list(
		"thousand" = 999,
		"million" = 704
		)
	xarch_source_mineral = "potassium"

/ore/fragnacre
	name = ORE_FRAGNACRE
	display_name = "Fragmented Nacre"
	smelts_to = MATERIAL_FRAGNACRE
	result_amount = 0
	spread_chance = 0
	ore = /obj/item/stack/ore/fragnacre
	scan_icon = "mineral_uncommon"
	xarch_ages = list(
		"thousand" = 999,
		"million" = 704
		)
	xarch_source_mineral = "potassium"

/* /ore/platinum
	name = ORE_PLATINUM
	display_name = "raw platinum"
	smelts_to = MATERIAL_PLATINUM
	compresses_to = MATERIAL_OSMIUM
	alloy = 1
	result_amount = 5
	spread_chance = 10
	ore = /obj/item/stack/ore/osmium
	scan_icon = "mineral_rare"
*/