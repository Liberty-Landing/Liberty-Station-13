/obj/random/rations
	name = "random preserved rations"
	icon_state = "food-green"

/obj/random/rations/item_to_spawn()
	return pickweight(list(/obj/item/reagent_containers/food/snacks/openable/chips = 2,\
				/obj/item/reagent_containers/food/snacks/candy = 2,\
				/obj/item/reagent_containers/food/snacks/openable/tastybread = 2,\
				/obj/item/reagent_containers/food/snacks/openable/no_raisin = 2,\
				/obj/item/reagent_containers/food/snacks/openable/selfheat_coffee = 2,\
				/obj/item/reagent_containers/food/snacks/openable/liquidfood = 4,\
				/obj/item/reagent_containers/food/snacks/donkpocket/sinpocket = 1,\
				/obj/item/storage/fancy/crayons = 0.1))

/obj/random/rations/low_chance
	name = "low chance preserved rations"
	icon_state = "food-green-low"
	spawn_nothing_percentage = 95

/obj/random/junkfood
	name = "random junkfood"
	icon_state = "food-red"

/obj/random/junkfood/item_to_spawn()
	return pickweight(list(/obj/item/reagent_containers/food/snacks/openable/chips = 3,
				/obj/item/reagent_containers/food/snacks/candy = 3,
				/obj/item/reagent_containers/food/snacks/cheesiehonkers = 3,
				/obj/item/reagent_containers/food/snacks/openable/tastybread = 3,
				/obj/item/reagent_containers/food/snacks/openable/no_raisin = 3,
				/obj/item/reagent_containers/food/snacks/openable/spacetwinkie = 3,
				/obj/item/reagent_containers/food/drinks/dry_ramen = 2,
				/obj/item/reagent_containers/food/snacks/hotdog = 1,
				/obj/item/reagent_containers/food/snacks/openable/liquidfood = 2,
				/obj/item/reagent_containers/food/snacks/pie = 1,
				/obj/item/reagent_containers/food/snacks/sandwich = 1))

/obj/random/junkfood/low_chance
	name = "low chance junkfood"
	icon_state = "food-red-low"
	spawn_nothing_percentage = 95

/obj/random/junkfood/onlypizza
	name = "random pizza"

/obj/random/junkfood/onlypizza/item_to_spawn()
	return pick(/obj/item/pizzabox/margherita,\
				/obj/item/pizzabox/mushroom,\
				/obj/item/pizzabox/meat,\
				/obj/item/pizzabox/vegetable,\
				/obj/item/pizzabox/hawaiianpizza)

/obj/random/junkfood/onlyburger
	name = "random burger"

/obj/random/junkfood/onlyburger/item_to_spawn()
	return pick(/obj/item/reagent_containers/food/snacks/bigbiteburger,\
				/obj/item/reagent_containers/food/snacks/cheeseburger,\
				/obj/item/reagent_containers/food/snacks/jellyburger,\
				/obj/item/reagent_containers/food/snacks/tofuburger)

/obj/random/junkfood/onlycake
	name = "random cake"

/obj/random/junkfood/onlycake/item_to_spawn()
	return pick(/obj/item/reagent_containers/food/snacks/sliceable/applecake,\
			/obj/item/reagent_containers/food/snacks/sliceable/birthdaycake,\
			/obj/item/reagent_containers/food/snacks/sliceable/carrotcake,\
			/obj/item/reagent_containers/food/snacks/sliceable/cheesecake,\
			/obj/item/reagent_containers/food/snacks/sliceable/chocolatecake,\
			/obj/item/reagent_containers/food/snacks/sliceable/lemoncake,\
			/obj/item/reagent_containers/food/snacks/sliceable/limecake,\
			/obj/item/reagent_containers/food/snacks/sliceable/orangecake,\
			/obj/item/reagent_containers/food/snacks/sliceable/plaincake)

/obj/random/junkfood/rotten
	name = "random spoiled food"
	icon_state = "food-red"
	has_postspawn = TRUE

/obj/random/junkfood/rotten/low_chance
	name = "low chance spoiled food"
	icon_state = "food-red-low"
	spawn_nothing_percentage = 60

/obj/random/junkfood/rotten/post_spawn(list/spawns)
	for(var/obj/item/reagent_containers/food in spawns)
		if(!food.reagents)
			return
		if(food.reagents)
			food.reagents.add_reagent("toxin", 15)
			food.reagents.add_reagent("mold", 15)
		if(prob(50)) // So sometimes the rot is visible.
			food.make_old()
	return spawns

/obj/random/rations/crayon
	name = "random crayon rations"
	icon_state = "food-green"

/obj/random/rations/crayon/item_to_spawn()
	return pickweight(list(/obj/item/pen/crayon/red = 2,\
				/obj/item/pen/crayon/orange = 2,\
				/obj/item/pen/crayon/yellow = 2,\
				/obj/item/pen/crayon/green = 2,\
				/obj/item/pen/crayon/blue = 2,\
				/obj/item/pen/crayon/purple = 2,\
				/obj/item/pen/crayon/mime = 0.2,\
				/obj/item/pen/crayon/rainbow = 0.2,\
				/obj/item/storage/fancy/crayons = 1))

/obj/random/rations/roachcube
	name = "random roachcube rations"
	icon_state = "food-green"

/obj/random/rations/roachcube/item_to_spawn()
	return pickweight(list(/obj/item/reagent_containers/food/snacks/cube/roach = 4,\
						/obj/item/reagent_containers/food/snacks/cube/roach/fuhrer = 1,\
						/obj/item/reagent_containers/food/snacks/cube/roach/jager = 3,\
						/obj/item/reagent_containers/food/snacks/cube/roach/kraftwerk = 2,\
						/obj/item/reagent_containers/food/snacks/cube/roach/roachling = 5,\
						/obj/item/reagent_containers/food/snacks/cube/roach/seuche = 2,\
						/obj/item/reagent_containers/food/snacks/cube/roach/panzer = 4,\
						/obj/item/reagent_containers/food/snacks/cube/roach/elektromagnetisch = 1,\
						/obj/item/reagent_containers/food/snacks/cube/roach/glowing = 2,\
						/obj/item/reagent_containers/food/snacks/cube/roach/grestrahlte = 2))

/obj/random/booze
	name = "random booze"
	icon_state = "cannister-red"

/obj/random/booze/item_to_spawn()
	return pickweight(list(/obj/item/reagent_containers/food/drinks/bottle/small/beer = 7,
				/obj/item/reagent_containers/food/drinks/bottle/small/ale = 1,
				/obj/item/reagent_containers/food/drinks/bottle/absinthe = 1,
				/obj/item/reagent_containers/food/drinks/bottle/bluecuracao = 1,
				/obj/item/reagent_containers/food/drinks/bottle/gin = 1,
				/obj/item/reagent_containers/food/drinks/bottle/kahlua = 1,
				/obj/item/reagent_containers/food/drinks/bottle/melonliquor = 1,
				/obj/item/reagent_containers/food/drinks/bottle/rum = 1,
				/obj/item/reagent_containers/food/drinks/bottle/tequilla = 1,
				/obj/item/reagent_containers/food/drinks/bottle/vodka = 2,
				/obj/item/reagent_containers/food/drinks/bottle/whiskey = 1,
				/obj/item/reagent_containers/food/drinks/bottle/patron = 1,
				/obj/item/reagent_containers/food/drinks/bottle/goldschlager = 1,
				/obj/item/reagent_containers/food/drinks/bottle/kitsunesake = 1,
				/obj/item/reagent_containers/food/drinks/bottle/wine = 1,
				/obj/item/reagent_containers/food/drinks/bottle/cognac = 1,
				/obj/item/reagent_containers/food/drinks/bottle/vermouth = 1,
				/obj/item/reagent_containers/food/drinks/bottle/pwine = 1))

/obj/random/booze/low_chance
	name = "low chance random booze"
	icon_state = "cannister-red-low"
	spawn_nothing_percentage = 90

/obj/random/soda
	name = "random soda"
	icon_state = "cannister-red"

/obj/random/soda/item_to_spawn()
	return pickweight(list(/obj/item/reagent_containers/food/drinks/cans/cola = 7,
				/obj/item/reagent_containers/food/drinks/cans/space_mountain_wind = 1,
				/obj/item/reagent_containers/food/drinks/cans/monster_sol = 1,
				/obj/item/reagent_containers/food/drinks/cans/monster_blood = 1,
				/obj/item/reagent_containers/food/drinks/cans/monster_jungel = 1,
				/obj/item/reagent_containers/food/drinks/cans/baton_commando = 1,
				/obj/item/reagent_containers/food/drinks/cans/baton_rent_a_cop = 1))

/obj/random/soda/low_chance
	name = "low chance random soda"
	icon_state = "cannister-red-low"
	spawn_nothing_percentage = 90
