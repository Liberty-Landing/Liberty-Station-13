// Cakes.

/datum/cooking_with_jane/recipe/plaincake
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/food/snacks/sliceable/plaincake
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/sliceable/butterstick),
		list(CWJ_ADD_REAGENT, "sugar", 15),
		list(CWJ_ADD_REAGENT, "flour", 15),
		list(CWJ_ADD_REAGENT, "milk", 5),
		list(CWJ_ADD_REAGENT, "egg", 9),
		list(CWJ_USE_OVEN, J_MED, 30 SECONDS)
	)

/datum/cooking_with_jane/recipe/cheesecake
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/food/snacks/sliceable/cheesecake
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/sliceable/butterstick),
		list(CWJ_ADD_REAGENT, "sugar", 15),
		list(CWJ_ADD_REAGENT, "flour", 15),
		list(CWJ_ADD_REAGENT, "milk", 5),
		list(CWJ_ADD_REAGENT, "egg", 9),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/cheesewedge, reagent_skip=TRUE),
		list(CWJ_USE_OVEN, J_MED, 30 SECONDS)
	)

/datum/cooking_with_jane/recipe/carrotcake
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/food/snacks/sliceable/carrotcake
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/sliceable/butterstick),
		list(CWJ_ADD_REAGENT, "sugar", 15),
		list(CWJ_ADD_REAGENT, "flour", 15),
		list(CWJ_ADD_REAGENT, "milk", 5),
		list(CWJ_ADD_REAGENT, "egg", 9),
		list(CWJ_ADD_PRODUCE, "carrot"),
		list(CWJ_USE_OVEN, J_MED, 30 SECONDS)
	)

/datum/cooking_with_jane/recipe/orangecake
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/food/snacks/sliceable/orangecake
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/sliceable/butterstick),
		list(CWJ_ADD_REAGENT, "sugar", 15),
		list(CWJ_ADD_REAGENT, "flour", 15),
		list(CWJ_ADD_REAGENT, "milk", 5),
		list(CWJ_ADD_REAGENT, "egg", 9),
		list(CWJ_ADD_PRODUCE, "orange", reagent_skip=TRUE),
		list(CWJ_USE_OVEN, J_MED, 30 SECONDS)
	)

/datum/cooking_with_jane/recipe/limecake
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/food/snacks/sliceable/limecake
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/sliceable/butterstick),
		list(CWJ_ADD_REAGENT, "sugar", 15),
		list(CWJ_ADD_REAGENT, "flour", 15),
		list(CWJ_ADD_REAGENT, "milk", 5),
		list(CWJ_ADD_REAGENT, "egg", 9),
		list(CWJ_ADD_PRODUCE, "lime", reagent_skip=TRUE),
		list(CWJ_USE_OVEN, J_MED, 30 SECONDS)
	)

/datum/cooking_with_jane/recipe/lemoncake
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/food/snacks/sliceable/lemoncake
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/sliceable/butterstick),
		list(CWJ_ADD_REAGENT, "sugar", 15),
		list(CWJ_ADD_REAGENT, "flour", 15),
		list(CWJ_ADD_REAGENT, "milk", 5),
		list(CWJ_ADD_REAGENT, "egg", 9),
		list(CWJ_ADD_PRODUCE, "lemon"),
		list(CWJ_USE_OVEN, J_MED, 30 SECONDS)
	)

/datum/cooking_with_jane/recipe/chocolatecake
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/food/snacks/sliceable/chocolatecake
	step_builder = list(
		list(CWJ_ADD_REAGENT, "sugar", 15),
		list(CWJ_ADD_REAGENT, "flour", 15),
		list(CWJ_ADD_REAGENT, "milk", 5),
		list(CWJ_ADD_REAGENT, "egg", 9),
		list(CWJ_ADD_REAGENT, "coco", 5),
		list(CWJ_USE_OVEN, J_MED, 30 SECONDS)
	)

/datum/cooking_with_jane/recipe/applecake
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/food/snacks/sliceable/applecake
	step_builder = list(
		list(CWJ_ADD_REAGENT, "sugar", 15),
		list(CWJ_ADD_REAGENT, "flour", 15),
		list(CWJ_ADD_REAGENT, "milk", 5),
		list(CWJ_ADD_REAGENT, "egg", 9),
		list(CWJ_ADD_PRODUCE, "apple"),
		list(CWJ_USE_OVEN, J_MED, 30 SECONDS)
	)

/datum/cooking_with_jane/recipe/brownies
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/food/snacks/sliceable/brownie
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/sliceable/butterstick),
		list(CWJ_ADD_REAGENT, "sugar", 15),
		list(CWJ_ADD_REAGENT, "coco", 10),
		list(CWJ_ADD_REAGENT, "milk", 5),
		list(CWJ_ADD_REAGENT, "egg", 9),
		list(CWJ_ADD_REAGENT, "cornoil", 3),
		list(CWJ_USE_OVEN, J_MED, 30 SECONDS)
	)

/datum/cooking_with_jane/recipe/birthdaycake
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/food/snacks/sliceable/birthdaycake
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/sliceable/plaincake),
		list(CWJ_ADD_ITEM, /obj/item/clothing/head/costume/misc/cake),
		list(CWJ_USE_OVEN, J_MED, 30 SECONDS)
	)

/datum/cooking_with_jane/recipe/braincake
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/food/snacks/sliceable/braincake
	step_builder = list(
		list(CWJ_ADD_REAGENT, "sugar", 15),
		list(CWJ_ADD_REAGENT, "flour", 15),
		list(CWJ_ADD_REAGENT, "milk", 5),
		list(CWJ_ADD_REAGENT, "egg", 9),
		list(CWJ_ADD_ITEM, /obj/item/organ/internal/brain),
		list(CWJ_USE_OVEN, J_MED, 30 SECONDS)
	)

/datum/cooking_with_jane/recipe/icing
	cooking_container = POT
	reagent_id = "glaze"
	reagent_amount = 30
	description = "A dollop of basic icing!"
	recipe_guide = "Add 30 units of sugar. Add 30 units of water. Cook on a stove set to 'Low' for 30 seconds."
	step_builder = list(
		list(CWJ_ADD_REAGENT, "sugar", 30),
		list(CWJ_ADD_REAGENT, "water", 30),
		list(CWJ_USE_STOVE, J_LO, 30 SECONDS)
	)
