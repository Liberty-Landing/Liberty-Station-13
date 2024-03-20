/datum/trade_station/nt_cruisers
	icon_states = "nt_cruiser"
	markup = RARE_GOODS	// dept-specific stuff should be more expensive for guild
	name_pool = list(
		"GAV 'Frontline'" = "Gatepyre Assault Vessel 'Frontline': \"Selling assets for the colony is not an standard activity, yet for you we can make an exception. Just don't ask how we got guns to sell.\"",
		"GAV 'Champion'" = "Gatepyre Assault Vessel 'Champion': \"You know we are getting these guns from your fellow void pirates we just killed, right? No problem with that? Then come get these goods back with thy coins.\""
		)
	icon_states = list("nt_frigate", "ship")
	uid = "nt_basic"
	tree_x = 0.34
	tree_y = 0.9
	start_discovered = TRUE
	spawn_always = TRUE
	base_income = 1600
	wealth = 0
	hidden_inv_threshold = 2000
	recommendation_threshold = 4000
	stations_recommended = list("trapper")
	inventory = list(
		"Biomatter products" = list(
			/obj/item/reagent_containers/food/snacks/meat,
			/obj/item/reagent_containers/food/drinks/milk,
			/obj/item/soap/bonfire,
			/obj/item/storage/pouch/medium_generic,
			/obj/item/storage/pouch/large_generic,
			/obj/item/storage/pouch/medical_supply,
			/obj/item/storage/pouch/engineering_tools,
			/obj/item/storage/pouch/tubular,
			/obj/item/storage/pouch/tubular/vial,
			/obj/item/storage/pouch/ammo,
			/obj/item/clothing/accessory/holster,
			/obj/item/clothing/accessory/holster/armpit,
			/obj/item/clothing/accessory/holster/waist,
			/obj/item/clothing/accessory/holster/hip
		),
		"Agro Supply" = list(
			/obj/structure/largecrate/animal/corgi,
			/obj/structure/largecrate/animal/cow,
			/obj/structure/largecrate/animal/goat,
			/obj/structure/largecrate/animal/cat,
			/obj/structure/largecrate/animal/chick,
			/obj/structure/largecrate/animal/pig
		),
		"Bee & Plant Supply" = list(
			/obj/item/bee_pack,
			/obj/item/beehive_assembly,
			/obj/item/honey_frame,
			/obj/item/bee_smoker,
			/obj/item/circuitboard/honey_extractor = good_data("Honey Extractor Board", list(-1, 2), 300),
			/obj/item/reagent_containers/spray/plantbgone,
			/obj/item/reagent_containers/glass/bottle/ammonia,
			/obj/item/tool/hatchet,
			/obj/item/tool/minihoe,
			/obj/item/device/scanner/plant,
			/obj/item/clothing/gloves/botanic_leather,
			/obj/machinery/portable_atmospherics/hydroponics
		),
		"Custodial Supply" = list(
			/obj/item/reagent_containers/glass/bucket,
			/obj/item/mop,
			/obj/item/caution,
			/obj/item/storage/bag/trash,
			/obj/item/device/lightreplacer,
			/obj/item/reagent_containers/spray/cleaner,
			/obj/item/reagent_containers/glass/rag,
			/obj/item/grenade/chem_grenade/cleaner/nt_cleaner,
			/obj/item/grenade/chem_grenade/antiweed/nt_antiweed,
			/obj/structure/mopbucket
		),
		"Energy Weapons" = list(
			/obj/item/gun/energy/taser,
			/obj/item/gun/energy/ntpistol,
			/obj/item/gun/energy/laser = custom_good_amount_range(list(1, 5)),
			/obj/item/gun/energy/ionrifle = custom_good_amount_range(list(1, 4)),
			/obj/item/gun/energy/sniperrifle = custom_good_amount_range(list(-8, 1)),
		),
		"Ballistic weapons" = list(
			/obj/item/gun/projectile/revolver/detective,
			/obj/item/gun/projectile/colt,
			/obj/item/gun/projectile/colt/freedom,
			/obj/item/gun/projectile/shotgun/pump,
			/obj/item/gun/projectile/grenade
		)
	)

	hidden_inventory = list(
		"Melee weapons" = list(
			/obj/item/tool/sword/custodian/shortsword,
			/obj/item/tool/sword/custodian/horseaxe = custom_good_amount_range(list(-1, 2)),
			/obj/item/tool/knife/dagger/custodian,
			/obj/item/tool/sword/custodian/throwaxe,
			/obj/item/shield/buckler/custodian
		),
		"Holy Grenades" = list(
			/obj/item/grenade/smokebomb/nt = custom_good_amount_range(list(1, 4)),
			/obj/item/grenade/flashbang/nt = custom_good_amount_range(list(1, 4))
		),
		"Tool & Weapon Mods" = list(
			/obj/item/tool_upgrade/augment/sanctifier,
			/obj/item/tool_upgrade/productivity/whetstone = custom_good_amount_range(list(-3, 2)),
			/obj/item/gun_upgrade/barrel/excruciator = custom_good_amount_range(list(-3, 2))
		),
		"Plasma weapons" = list(
			/obj/item/gun/energy/plasma = custom_good_amount_range(list(-3, 2)),
			/obj/item/gun/energy/plasma/destroyer = custom_good_amount_range(list(-3, 2))
		),
		"Wine" = list(
			/obj/item/reagent_containers/food/drinks/cans/cahors/cargo,
			/obj/item/reagent_containers/food/drinks/bottle/bonfirebrew/cargo
		),
		"Seeds and Exodic Seeds" = list(
			/obj/item/seeds/chiliseed,
			/obj/item/seeds/berryseed,
			/obj/item/seeds/cornseed,
			/obj/item/seeds/eggplantseed,
			/obj/item/seeds/tomatoseed,
			/obj/item/seeds/appleseed,
			/obj/item/seeds/soyaseed,
			/obj/item/seeds/wheatseed,
			/obj/item/seeds/carrotseed,
			/obj/item/seeds/harebell,
			/obj/item/seeds/lemonseed,
			/obj/item/seeds/orangeseed,
			/obj/item/seeds/grassseed,
			/obj/item/seeds/sunflowerseed,
			/obj/item/seeds/chantermycelium,
			/obj/item/seeds/potatoseed,
			/obj/item/seeds/sugarcaneseed,
			/obj/item/seeds/libertymycelium,
			/obj/item/seeds/reishimycelium,
			/obj/item/seeds/random = good_data("Random Exodic Seed", list(-2, 1), 500),
			/obj/item/seeds/kudzuseed
		)
	)
	offer_types = list(
		/obj/item/clothing/suit/space/void/huscarl = offer_data("huscarl voidsuit", 1250, 15),
		/obj/item/clothing/shoes/hermes_shoes = offer_data("hermes shoes", 420, 10),
		/obj/item/reagent_containers/food/snacks/grown = offer_data("spare grown food", 10, 120),
		/obj/item/reagent_containers/food/snacks/meat = offer_data("meat", 80, 20) //Buys it for less than Dionis/McRonalds, but is willing to buy more of it.
	)

/obj/item/reagent_containers/food/drinks/cans/cahors/cargo
	price_tag = 600

/obj/item/reagent_containers/food/drinks/cans/cahors/cargo/New()
	price_tag = 60

/obj/item/reagent_containers/food/drinks/bottle/bonfirebrew/cargo
	price_tag = 1200

/obj/item/reagent_containers/food/drinks/bottle/bonfirebrew/cargo/New()
	price_tag = 100
