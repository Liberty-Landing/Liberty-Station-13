/datum/cooking_with_jane/recipe/popcorn
	cooking_container = PAN
	product_type = /obj/item/reagent_containers/food/snacks/popcorn
	step_builder = list(
		list(CWJ_ADD_PRODUCE, "corn", reagent_skip=TRUE),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/butterslice),
		list(CWJ_ADD_REAGENT, "cornoil", 2),
		list(CWJ_ADD_REAGENT_OPTIONAL, "sodiumchloride", 1, base=1),
		list(CWJ_USE_STOVE, J_LO, 5 SECONDS)
	)

/datum/cooking_with_jane/recipe/eggplantparm
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/food/snacks/eggplantparm
	step_builder = list(
		list(CWJ_ADD_PRODUCE, "eggplant", reagent_skip=TRUE),
		list(CWJ_ADD_ITEM_OPTIONAL, /obj/item/reagent_containers/food/snacks/butterslice, base=3, reagent_skip=TRUE),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/cheesewedge),
		CWJ_BEGIN_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_PRODUCE_OPTIONAL, "mushrooms", reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "reishi", reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "amanita", reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "plumphelmet", reagent_skip=TRUE),
		CWJ_END_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/cheesewedge),
		list(CWJ_USE_STOVE, J_HI, 30 SECONDS)
	)

/datum/cooking_with_jane/recipe/boiledrice
	cooking_container = POT
	product_type = /obj/item/reagent_containers/food/snacks/boiledrice
	step_builder = list(
		list(CWJ_ADD_REAGENT, "water", 10),
		list(CWJ_ADD_REAGENT, "rice", 10),
		list(CWJ_ADD_REAGENT_OPTIONAL, "sodiumchloride", 1, base=1),
		list(CWJ_USE_STOVE, J_HI, 15 SECONDS)
	)

/datum/cooking_with_jane/recipe/boiledslimeextract
	cooking_container = POT
	product_type = /obj/item/reagent_containers/food/snacks/boiledslimecore
	step_builder = list(
		list(CWJ_ADD_REAGENT, "water", 10),
		list(CWJ_ADD_REAGENT_OPTIONAL, "sodiumchloride", 1, base=1),
		list(CWJ_ADD_ITEM, /obj/item/slime_extract),
		list(CWJ_USE_STOVE, J_HI, 15 SECONDS)
	)

/datum/cooking_with_jane/recipe/cracker
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/food/snacks/cracker
	step_builder = list(
		list(CWJ_ADD_REAGENT, "sodiumchloride", 1),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/doughslice),
		list(CWJ_USE_OVEN, J_LO, 15 SECONDS)
	)
