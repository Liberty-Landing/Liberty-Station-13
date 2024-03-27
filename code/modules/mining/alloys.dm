//Alloys that contain subsets of each other's ingredients must be ordered in the desired sequence

/datum/alloy
	var/name = "nameless"
	var/ore_input
	var/list/requires
	var/product_mod = 1
	var/product
	var/metaltag

// Post Industrial Materials
/datum/alloy/duralumin
	name = "Duralumin"
	metaltag = "duralumin"
	ore_input = 3
	requires = list(
		ORE_COPPER = 1,
		ORE_ALUMINIUM = 2,
		)
	product = /obj/item/stack/material/duralumin

/datum/alloy/indsteel
	name = "Industrial steel"
	metaltag = "indsteel"
	ore_input = 5
	requires = list(
		ORE_NIOBIUM = 1,
		ORE_LIGNITE = 2,
		ORE_IRON = 2
		)
	product = /obj/item/stack/material/indsteel

/datum/alloy/mendsilicate
	name = "Mendsilicate glass"
	metaltag = MATERIAL_BGLASS
	ore_input = 3
	requires = list(
		ORE_FRAGNACRE = 1,
		ORE_SAND = 2
		)
	product = /obj/item/stack/material/glass/mendsilicate

/datum/alloy/composite
	name = "Titanium Composite"
	metaltag = "composite"
	ore_input = 3
	requires = list(
		ORE_NIOBIUM = 1,
		ORE_TITANIUM = 2,
		)
	product = /obj/item/stack/material/composite

// Pre-Industrial Materials
/*
/datum/alloy/plasteel
	name = "Plasteel"
	metaltag = "plasteel"
	ore_input = 5
	requires = list(
		ORE_PLASMA = 1,
		ORE_CARBON = 2,
		ORE_IRON = 2
		)
	product_mod = 0.3
	product = /obj/item/stack/material/indsteel

/datum/alloy/aluminium
	name = "aluminium"
	metaltag = MATERIAL_ALUMINIUM
	ore_input = 2
	requires = list(
		ORE_CARBON = 1,
		ORE_IRON = 1
		)
	product = /obj/item/stack/material/aluminium

/datum/alloy/borosilicate
	name = "Borosilicate glass"
	metaltag = MATERIAL_LBGLASS
	ore_input = 3
	requires = list(
		ORE_PLASMA = 1,
		ORE_SAND = 2
		)
	product = /obj/item/stack/material/glass/mendsilicate
*/
