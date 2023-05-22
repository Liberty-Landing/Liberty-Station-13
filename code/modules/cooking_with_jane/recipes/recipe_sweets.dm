/datum/cooking_with_jane/recipe/bananabread
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/food/snacks/sliceable/bananabread

	replace_reagents = TRUE

	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/dough),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/dough),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/dough),
		list(CWJ_ADD_REAGENT, "milk", 2),
		list(CWJ_ADD_REAGENT, "sugar", 15),
		list(CWJ_ADD_PRODUCE, "banana", 1),
		list(CWJ_USE_OVEN, J_MED, 40 SECONDS)
	)

/datum/cooking_with_jane/recipe/chocolatebar
	cooking_container = POT
	product_type = /obj/item/reagent_containers/food/snacks/chocolatebar
	step_builder = list(
		list(CWJ_ADD_REAGENT, "water", 5),
		list(CWJ_ADD_REAGENT, "milk", 5),
		list(CWJ_ADD_REAGENT, "sugar", 15),
		list(CWJ_ADD_REAGENT, "coco", 10),
		list(CWJ_ADD_REAGENT, "sodiumchloride", 1),
		list(CWJ_USE_STOVE, J_LO, 30 SECONDS)
	)

/datum/cooking_with_jane/recipe/cookie
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/food/snacks/cookie
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/butterslice),
		list(CWJ_ADD_REAGENT_OPTIONAL, "cornoil", 2),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/doughslice),
		list(CWJ_ADD_REAGENT, "milk", 5),
		list(CWJ_ADD_REAGENT, "sugar", 5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/chocolatebar),
		list(CWJ_USE_STOVE, J_LO, 5 SECONDS)
	)

/datum/cooking_with_jane/recipe/muffin
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/food/snacks/muffin
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/doughslice),
		list(CWJ_ADD_REAGENT, "milk", 5),
		list(CWJ_ADD_REAGENT, "sugar", 5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/chocolatebar),
		list(CWJ_USE_STOVE, J_LO, 5 SECONDS)
	)

/datum/cooking_with_jane/recipe/ricepudding
	cooking_container = BOWL
	product_type = /obj/item/reagent_containers/food/snacks/ricepudding
	step_builder = list(
		list(CWJ_ADD_REAGENT, "milk", 5),
		list(CWJ_ADD_REAGENT_OPTIONAL, "cream", 10),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/boiledrice)
	)

/datum/cooking_with_jane/recipe/pancakes
	cooking_container = PAN
	product_type = /obj/item/reagent_containers/food/snacks/pancakes
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/butterslice),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/doughslice),
		list(CWJ_ADD_REAGENT, "sugar", 10),
		list(CWJ_ADD_REAGENT_OPTIONAL, "sodiumchloride", 1, base=1),
		list(CWJ_ADD_REAGENT_OPTIONAL, "honey", 3, base=3),
		list(CWJ_ADD_REAGENT, "milk", 5),
		list(CWJ_ADD_REAGENT, "flour", 5),
		list(CWJ_USE_STOVE, J_LO, 15 SECONDS)
	)

/datum/cooking_with_jane/recipe/waffles
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/food/snacks/waffles
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/butterslice),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/doughslice),
		list(CWJ_ADD_REAGENT, "sugar", 10),
		list(CWJ_ADD_REAGENT_OPTIONAL, "sodiumchloride", 1, base=1),
		list(CWJ_ADD_REAGENT_OPTIONAL, "honey", 3, base=3),
		list(CWJ_ADD_REAGENT, "milk", 5),
		list(CWJ_ADD_REAGENT, "flour", 5),
		list(CWJ_USE_TOOL, QUALITY_CUTTING, 1),
		list(CWJ_USE_OVEN, J_LO, 5 SECONDS)
	)

/datum/cooking_with_jane/recipe/rofflewaffles
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/food/snacks/rofflewaffles
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/rofflewaffles),
		list(CWJ_ADD_REAGENT, "psilocybin", 5),
		CWJ_BEGIN_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_REAGENT_OPTIONAL, "pwine", 5, base=6, remain_percent=0.1, prod_desc="The fancy wine soaks up into the fluffy waffles."),
		list(CWJ_ADD_REAGENT_OPTIONAL, "space_drugs", 5, base=6, remain_percent=0.5, prod_desc="The space drugs soak into the waffles."),
		list(CWJ_ADD_REAGENT_OPTIONAL, "lean", 5, base=6, remain_percent=0.5, prod_desc="Normally not for breakfast."),
		list(CWJ_ADD_REAGENT_OPTIONAL, "mindbreaker", 5, base=6, remain_percent=0.1, prod_desc="Not for waking up to."),
		list(CWJ_ADD_REAGENT_OPTIONAL, "psi_juice", 5, base=6, prod_desc="For when you wake up feeling droggy still."),
		CWJ_END_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_REAGENT, "sugar", 5),
		list(CWJ_USE_OVEN, J_LO, 5 SECONDS)
	)

/datum/cooking_with_jane/recipe/candiedapple
	cooking_container = PAN
	product_type = /obj/item/reagent_containers/food/snacks/candiedapple
	step_builder = list(
		list(CWJ_ADD_PRODUCE, "apple", reagent_skip=TRUE),
		list(CWJ_ADD_REAGENT, "water", 5),
		list(CWJ_ADD_REAGENT, "sugar", 5),
		list(CWJ_ADD_REAGENT_OPTIONAL, "cornoil", 1, base=1),
		list(CWJ_USE_STOVE, J_LO, 15 SECONDS)
	)

/datum/cooking_with_jane/recipe/appletart
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/food/snacks/appletart
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/sliceable/flatdough),
		list(CWJ_ADD_PRODUCE, "goldapple", reagent_skip=TRUE),
		list(CWJ_ADD_REAGENT, "sugar", 5),
		list(CWJ_ADD_REAGENT, "milk", 5),
		list(CWJ_ADD_REAGENT, "flour", 10),
		list(CWJ_ADD_REAGENT, "egg", 3),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/butterslice),
		list(CWJ_USE_OVEN, J_LO, 15 SECONDS)
	)

/datum/cooking_with_jane/recipe/plumphelmetbiscuit
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/food/snacks/plumphelmetbiscuit
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/sliceable/flatdough),
		list(CWJ_ADD_PRODUCE, "plumphelmet", reagent_skip=TRUE),
		list(CWJ_ADD_REAGENT, "water", 5),
		list(CWJ_ADD_REAGENT, "flour", 5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/butterslice),
		list(CWJ_USE_OVEN, J_LO, 15 SECONDS)
	)
