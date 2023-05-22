// Soups

/datum/cooking_with_jane/recipe/tomatosoup
	cooking_container = POT
	product_type = /obj/item/reagent_containers/food/snacks/tomatosoup
	step_builder = list(
		list(CWJ_ADD_REAGENT, "water", 10),
		list(CWJ_ADD_REAGENT_OPTIONAL, "sodiumchloride", 1, base=1),
		list(CWJ_ADD_PRODUCE, "tomato", reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE, "tomato", reagent_skip=TRUE),
		CWJ_BEGIN_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_REAGENT_OPTIONAL, "cream", 5, base=3, prod_desc="The soup turns a lighter red and thickens with the cream."),
		list(CWJ_ADD_REAGENT_OPTIONAL, "honey", 5 ,base=5, prod_desc="The thickens as the honey mixes in."),
		CWJ_END_EXCLUSIVE_OPTIONS,
		list(CWJ_USE_STOVE, J_LO, 30 SECONDS)
	)

/datum/cooking_with_jane/recipe/meatballsoup
	cooking_container = POT
	product_type = /obj/item/reagent_containers/food/snacks/meatballsoup
	step_builder = list(
		list(CWJ_ADD_REAGENT, "water", 10),
		list(CWJ_ADD_REAGENT_OPTIONAL, "sodiumchloride", 1, base=1),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/meatball),
		list(CWJ_ADD_PRODUCE, "carrot", reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE, "potato", reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "tomato", reagent_skip=TRUE),
		list(CWJ_USE_STOVE, J_LO, 30 SECONDS)
	)

/datum/cooking_with_jane/recipe/vegetablesoup
	cooking_container = POT
	product_type = /obj/item/reagent_containers/food/snacks/vegetablesoup
	step_builder = list(
		list(CWJ_ADD_REAGENT, "water", 10),
		list(CWJ_ADD_REAGENT_OPTIONAL, "sodiumchloride", 1, base=1),
		list(CWJ_ADD_PRODUCE, "carrot", reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE, "potato", reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE, "eggplant", reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE, "cabbage", reagent_skip=TRUE),
		list(CWJ_USE_STOVE, J_LO, 30 SECONDS)
	)

/datum/cooking_with_jane/recipe/nettlesoup
	cooking_container = POT
	product_type = /obj/item/reagent_containers/food/snacks/nettlesoup
	step_builder = list(
		list(CWJ_ADD_REAGENT, "water", 10),
		list(CWJ_ADD_REAGENT_OPTIONAL, "sodiumchloride", 1, base=1),
		list(CWJ_ADD_PRODUCE, "potato", reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE, "nettle", reagent_skip=TRUE),
		list(CWJ_USE_STOVE, J_LO, 30 SECONDS)
	)

/datum/cooking_with_jane/recipe/wishsoup
	cooking_container = POT
	product_type = /obj/item/reagent_containers/food/snacks/wishsoup
	step_builder = list(
		list(CWJ_ADD_REAGENT, "water", 40),
		list(CWJ_ADD_REAGENT_OPTIONAL, "sodiumchloride", 1, base=1),
		list(CWJ_USE_STOVE, J_LO, 5 SECONDS)
	)

/datum/cooking_with_jane/recipe/hotchili
	cooking_container = POT
	product_type = /obj/item/reagent_containers/food/snacks/hotchili
	step_builder = list(
		list(CWJ_ADD_REAGENT, "water", 10),
		list(CWJ_ADD_REAGENT_OPTIONAL, "sodiumchloride", 1, base=1),
		list(CWJ_ADD_PRODUCE, "chili", reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE, "tomato", reagent_skip=TRUE),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/meat, exclude_reagents=list("carpotoxin", "blattedin")),
		list(CWJ_USE_STOVE, J_LO, 30 SECONDS)
	)

/datum/cooking_with_jane/recipe/hotchili
	cooking_container = POT
	product_type = /obj/item/reagent_containers/food/snacks/coldchili
	step_builder = list(
		list(CWJ_ADD_REAGENT, "water", 10),
		list(CWJ_ADD_REAGENT_OPTIONAL, "sodiumchloride", 1, base=1),
		list(CWJ_ADD_PRODUCE, "icechili", reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE, "tomato", reagent_skip=TRUE),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/meat, exclude_reagents=list("carpotoxin", "blattedin")),
		list(CWJ_USE_STOVE, J_LO, 30 SECONDS)
	)

/datum/cooking_with_jane/recipe/bearchili
	cooking_container = POT
	product_type = /obj/item/reagent_containers/food/snacks/bearchili
	step_builder = list(
		list(CWJ_ADD_REAGENT, "water", 10),
		list(CWJ_ADD_REAGENT_OPTIONAL, "sodiumchloride", 1, base=1),
		list(CWJ_ADD_PRODUCE, "chili", reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE, "tomato", reagent_skip=TRUE),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/meat/bearmeat, exclude_reagents=list("carpotoxin", "blattedin")),
		list(CWJ_USE_STOVE, J_LO, 30 SECONDS)
	)

/datum/cooking_with_jane/recipe/stew
	cooking_container = POT
	product_type = /obj/item/reagent_containers/food/snacks/stew
	step_builder = list(
		list(CWJ_ADD_REAGENT, "water", 10),
		list(CWJ_ADD_REAGENT_OPTIONAL, "sodiumchloride", 1, base=1),
		list(CWJ_ADD_PRODUCE, "carrot", reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE, "potato", reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE, "mushrooms", reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE, "tomato", reagent_skip=TRUE),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/meat, exclude_reagents=list("carpotoxin", "blattedin")),
		list(CWJ_USE_STOVE, J_MED, 15 SECONDS)
	)

/datum/cooking_with_jane/recipe/milosoup
	cooking_container = POT
	product_type = /obj/item/reagent_containers/food/snacks/milosoup
	step_builder = list(
		list(CWJ_ADD_REAGENT, "water", 10),
		list(CWJ_ADD_REAGENT_OPTIONAL, "sodiumchloride", 1, base=1),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/soydope, exclude_reagents=list("carpotoxin", "blattedin")),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/soydope, exclude_reagents=list("carpotoxin", "blattedin")),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/tofu, exclude_reagents=list("carpotoxin", "blattedin")),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/tofu, exclude_reagents=list("carpotoxin", "blattedin")),
		list(CWJ_USE_STOVE, J_MED, 15 SECONDS)
	)

/datum/cooking_with_jane/recipe/beetsoup
	cooking_container = POT
	product_type = /obj/item/reagent_containers/food/snacks/beetsoup
	step_builder = list(
		list(CWJ_ADD_REAGENT, "water", 10),
		list(CWJ_ADD_REAGENT_OPTIONAL, "sodiumchloride", 1, base=1),
		list(CWJ_ADD_PRODUCE, "whitebeet", reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "potato", reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE, "cabbage", reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "tomato", reagent_skip=TRUE),
		list(CWJ_ADD_REAGENT_OPTIONAL, "cream", 5, base=1),
		list(CWJ_ADD_REAGENT_OPTIONAL, "blackpepper", 1, base=1),
		list(CWJ_USE_STOVE, J_MED, 15 SECONDS)
	)

/datum/cooking_with_jane/recipe/mushroomsoup
	cooking_container = POT
	product_type = /obj/item/reagent_containers/food/snacks/mushroomsoup
	step_builder = list(
		list(CWJ_ADD_REAGENT, "water", 10),
		list(CWJ_ADD_REAGENT_OPTIONAL, "sodiumchloride", 1, base=1),
		list(CWJ_ADD_REAGENT, "cream", 5),
		list(CWJ_ADD_REAGENT, "milk", 5),
		list(CWJ_ADD_REAGENT, "sodiumchloride", 1),
		list(CWJ_ADD_REAGENT, "blackpepper", 1),
		list(CWJ_ADD_PRODUCE, "mushrooms", reagent_skip=TRUE),
		list(CWJ_USE_STOVE, J_LO, 5 SECONDS),
		CWJ_BEGIN_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_PRODUCE_OPTIONAL, "reishi", reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "amanita", reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "plumphelmet", reagent_skip=TRUE),
		CWJ_END_EXCLUSIVE_OPTIONS,
		list(CWJ_USE_STOVE, J_MED, 15 SECONDS)
	)

/datum/cooking_with_jane/recipe/mysterysoup
	cooking_container = POT
	product_type = /obj/item/reagent_containers/food/snacks/mysterysoup
	step_builder = list(
		list(CWJ_ADD_REAGENT, "water", 10),
		list(CWJ_ADD_REAGENT_OPTIONAL, "sodiumchloride", 1, base=1),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/badrecipe),
		list(CWJ_USE_STOVE, J_LO, 5 SECONDS),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/tofu),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/egg),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/cheesewedge),
		list(CWJ_USE_STOVE, J_MED, 20 SECONDS)
	)

/datum/cooking_with_jane/recipe/bloodsoup
	cooking_container = POT
	product_type = /obj/item/reagent_containers/food/snacks/bloodsoup
	step_builder = list(
		list(CWJ_ADD_REAGENT, "blood", 30),
		list(CWJ_ADD_REAGENT_OPTIONAL, "sodiumchloride", 1, base=1),
		list(CWJ_USE_STOVE, J_MED, 15 SECONDS)
	)

/datum/cooking_with_jane/recipe/slimesoup
	cooking_container = POT
	product_type = /obj/item/reagent_containers/food/snacks/slimesoup
	step_builder = list(
		list(CWJ_ADD_REAGENT, "water", 10),
		list(CWJ_ADD_REAGENT, "slimejelly", 5),
		list(CWJ_ADD_REAGENT_OPTIONAL, "sodiumchloride", 1, base=1),
		list(CWJ_USE_STOVE, J_MED, 15 SECONDS)
	)
