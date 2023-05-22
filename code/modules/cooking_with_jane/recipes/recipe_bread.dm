/datum/cooking_with_jane/recipe/bread
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/food/snacks/sliceable/bread
	recipe_guide = "Put dough in an oven, bake for 30 seconds on medium."
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/dough),
		list(CWJ_USE_OVEN, J_MED, 30 SECONDS)
	)

/datum/cooking_with_jane/recipe/bread_meat
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/food/snacks/sliceable/meatbread
	recipe_guide = "Put dough in an oven, bake for 30 seconds on medium."
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/dough),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/dough),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/meat),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/meat),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/cheesewedge),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/cheesewedge),
		list(CWJ_USE_OVEN, J_MED, 30 SECONDS)
	)

/datum/cooking_with_jane/recipe/bread_synthmeat
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/food/snacks/sliceable/meatbread
	recipe_guide = "Put dough in an oven, bake for 30 seconds on medium."
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/dough),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/dough),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/meat/syntiflesh),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/meat/syntiflesh),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/cheesewedge),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/cheesewedge),
		list(CWJ_USE_OVEN, J_MED, 30 SECONDS)
	)

/datum/cooking_with_jane/recipe/bread_xenomeat
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/food/snacks/sliceable/xenomeatbread
	recipe_guide = "Put dough in an oven, bake for 30 seconds on medium."
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/dough),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/dough),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/meat/xenomeat),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/meat/xenomeat),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/cheesewedge),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/cheesewedge),
		list(CWJ_USE_OVEN, J_MED, 30 SECONDS)
	)

/datum/cooking_with_jane/recipe/bread_tofu
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/food/snacks/sliceable/tofubread
	recipe_guide = "Put dough in an oven, bake for 30 seconds on medium."
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/dough),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/dough),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/tofu),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/tofu),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/cheesewedge),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/cheesewedge),
		list(CWJ_USE_OVEN, J_MED, 30 SECONDS)
	)

/datum/cooking_with_jane/recipe/flatbread
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/food/snacks/flatbread
	product_count = 3
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/sliceable/flatdough),
		list(CWJ_USE_OVEN, J_HI, 5 SECONDS)
	)

/datum/cooking_with_jane/recipe/baguette
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/food/snacks/baguette
	step_builder = list(
		list(CWJ_ADD_REAGENT, "blackpepper", 1),
		list(CWJ_ADD_REAGENT, "sodiumchloride", 1),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/dough),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/dough),
		list(CWJ_USE_OVEN, J_MED, 30 SECONDS)
	)

/datum/cooking_with_jane/recipe/sandwich_basic
	cooking_container = CUTTING_BOARD
	product_type = /obj/item/reagent_containers/food/snacks/sandwich
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/breadslice),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/cheesewedge),
		list(CWJ_ADD_PRODUCE, "cabbage", reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE, "tomato", reagent_skip=TRUE),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/cutlet, desc="Add any kind of cooked cutlet."),
		list(CWJ_ADD_REAGENT_OPTIONAL, "sodiumchloride", 1),
		list(CWJ_ADD_REAGENT_OPTIONAL, "blackpepper", 1),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/breadslice)
	)

/datum/cooking_with_jane/recipe/blt
	cooking_container = CUTTING_BOARD
	product_type = /obj/item/reagent_containers/food/snacks/blt
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/breadslice),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/bacon),
		list(CWJ_ADD_PRODUCE, "cabbage", reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE, "tomato", reagent_skip=TRUE),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/cutlet, desc="Add any kind of cooked cutlet."),
		list(CWJ_ADD_REAGENT_OPTIONAL, "sodiumchloride", 1),
		list(CWJ_ADD_REAGENT_OPTIONAL, "blackpepper", 1),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/breadslice)
	)

/datum/cooking_with_jane/recipe/twobread
	cooking_container = CUTTING_BOARD
	product_type = /obj/item/reagent_containers/food/snacks/twobread
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/breadslice),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/breadslice),
		list(CWJ_ADD_REAGENT, "wine", 5)
	)

/datum/cooking_with_jane/recipe/slimesandwich
	cooking_container = CUTTING_BOARD
	product_type = /obj/item/reagent_containers/food/snacks/jellysandwich/slime
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/breadslice),
		list(CWJ_ADD_REAGENT, "slimejelly", 5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/breadslice)
	)

/datum/cooking_with_jane/recipe/cherrysandwich
	cooking_container = CUTTING_BOARD
	product_type = /obj/item/reagent_containers/food/snacks/jellysandwich/cherry
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/breadslice),
		list(CWJ_ADD_REAGENT, "cherryjelly", 5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/breadslice)
	)

/datum/cooking_with_jane/recipe/jelliedtoast
	cooking_container = CUTTING_BOARD
	product_type = /obj/item/reagent_containers/food/snacks/jelliedtoast/cherry
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/breadslice),
		list(CWJ_ADD_REAGENT, "cherryjelly", 5),
		list(CWJ_USE_TOOL, QUALITY_CUTTING, 1)
	)

/datum/cooking_with_jane/recipe/slimetoast
	cooking_container = CUTTING_BOARD
	product_type = /obj/item/reagent_containers/food/snacks/jelliedtoast/slime
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/breadslice),
		list(CWJ_ADD_REAGENT, "slimejelly", 5),
		list(CWJ_USE_TOOL, QUALITY_CUTTING, 1)
	)

/datum/cooking_with_jane/recipe/grilledcheese
	cooking_container = GRILL
	product_type = /obj/item/reagent_containers/food/snacks/grilledcheese
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/breadslice),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/butterslice),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/cheesewedge),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/breadslice),
		list(CWJ_USE_GRILL, J_LO, 5 SECONDS)
	)

/datum/cooking_with_jane/recipe/toastedsandwich
	cooking_container = GRILL
	product_type = /obj/item/reagent_containers/food/snacks/toastedsandwich
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/sandwich),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/butterslice),
		list(CWJ_USE_GRILL, J_LO, 15 SECONDS)
	)
