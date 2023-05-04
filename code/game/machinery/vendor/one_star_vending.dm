/obj/machinery/vending/one_star
	name = "HexaOptimum General Vendor"
	desc = "A vendor full of Similacrum Robotics products stamped over with HexaOptimum logo."
	icon = 'icons/obj/machines/one_star/vending.dmi'
	icon_state = "vendor_guns"
	icon_vend = "vendor_printing"
	//product_slogans = "Usually no carcinogens!;Best sports!;Become the strongest!"
	//product_ads = "Strength!;Cheap!;There are contraindications, it is recommended to consult a medical specialist."
	vendor_department = DEPARTMENT_SIMILACRUM
	alt_currency_path = /obj/item/stack/gal_cred

/obj/machinery/vending/one_star/Initialize()
	. = ..()
	set_light(1.4, 1, COLOR_LIGHTING_CYAN_BRIGHT)
	earnings_account = department_accounts[DEPARTMENT_SIMILACRUM]

/obj/machinery/vending/one_star/guns
	name = "HexaOptimum Weapon Vendor"
	desc = "A vendor full of Similacrum Robotics products stamped over with HexaOptimum logo. This one sells firearms."
	icon_state = "vendor_guns"

	products = list(
		/obj/item/gun/energy/cog = 3
		)

	prices = list(
		/obj/item/gun/energy/cog = 50
		)

/obj/machinery/vending/one_star/food
	name = "HexaOptimum Food Vendor"
	desc = "A vendor full of Similacrum Robotics products stamped over with HexaOptimum logo. This one sells food."
	product_slogans = "It's a Vending Machine!;We all eat lunch from a Vending Machine!"
	product_ads = "You must be the new guy!;Hows is your child doing?;Real Meals!;Some people say its not real food but many quite like and many think you will to!"

	icon_state = "vendor_food"

	products = list(
		/obj/item/clothing/mask/smokable/cigarette/os = 12,
		/obj/item/reagent_containers/food/drinks/os_coffee = 12,
		/obj/item/reagent_containers/food/snacks/openable/os_soypack = 6,
		/obj/item/reagent_containers/food/snacks/openable/os_bun = 6,
		/obj/item/reagent_containers/food/snacks/openable/os_meat = 6,
		/obj/item/reagent_containers/food/snacks/openable/candy/os = 6,
		/obj/item/reagent_containers/food/snacks/openable/mre/os = 6,
		/obj/item/reagent_containers/food/snacks/os_paste = 3,
		/obj/item/reagent_containers/food/snacks/openable/os_heart = 2,
		/obj/item/reagent_containers/food/snacks/openable/os_liver = 2
		)

	prices = list(
		/obj/item/clothing/mask/smokable/cigarette/os = 5,
		/obj/item/reagent_containers/food/drinks/os_coffee = 7,
		/obj/item/reagent_containers/food/snacks/openable/os_soypack = 60,
		/obj/item/reagent_containers/food/snacks/openable/os_bun = 30,
		/obj/item/reagent_containers/food/snacks/openable/os_meat = 75,
		/obj/item/reagent_containers/food/snacks/openable/candy/os = 50,
		/obj/item/reagent_containers/food/snacks/openable/mre/os = 65,
		/obj/item/reagent_containers/food/snacks/os_paste = 80,
		/obj/item/reagent_containers/food/snacks/openable/os_heart = 200,
		/obj/item/reagent_containers/food/snacks/openable/os_liver = 120
		)

/obj/machinery/vending/one_star/health
	name = "HexaOptimum Medical Vendor"
	desc = "A vendor full of Similacrum Robotics products stamped over with HexaOptimum logo. This one sells medical equipment and supplies."
	icon_state = "vendor_health"

	products = list(
		/obj/item/storage/pill_bottle/bloodregen = 10,
		/obj/item/storage/pill_bottle/njoy/red = 10,
		/obj/item/reagent_containers/syringe/large = 10,
		/obj/item/reagent_containers/syringe/stim/ultra_surgeon = 10,
		/obj/item/reagent_containers/syringe/stim/turbo = 10,
		/obj/item/reagent_containers/syringe/stim/menace = 10,
		/obj/item/reagent_containers/syringe/stim/party_drops = 10,
		/obj/item/reagent_containers/syringe/stim/boxer = 10,
		/obj/item/reagent_containers/syringe/stim/violence_ultra = 10,
		/obj/item/storage/firstaid/surgery/traitor = 4,
		/obj/item/storage/firstaid/combat = 4,
		)

	prices = list(
		/obj/item/storage/pill_bottle/bloodregen = 40,
		/obj/item/storage/pill_bottle/njoy/red = 40,
		/obj/item/reagent_containers/syringe/large = 20,
		/obj/item/reagent_containers/syringe/stim/ultra_surgeon = 40,
		/obj/item/reagent_containers/syringe/stim/turbo = 40,
		/obj/item/reagent_containers/syringe/stim/menace = 40,
		/obj/item/reagent_containers/syringe/stim/party_drops = 40,
		/obj/item/reagent_containers/syringe/stim/boxer = 40,
		/obj/item/reagent_containers/syringe/stim/violence_ultra = 40,
		/obj/item/storage/firstaid/surgery/traitor = 100,
		/obj/item/storage/firstaid/combat = 80,
		)
