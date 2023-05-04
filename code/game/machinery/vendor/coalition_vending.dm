/obj/machinery/vending/carvan
	name = "Car-Van Coalition Vendor"
	desc = "An armory vendor sporting Car-Van and Coalition symbols across it. It appears to be rusted with time; probably an old model for a dropship of some sort."
	icon_state = "carvan"
	icon_vend = "carvan-vending"
	product_slogans = "For unity, order, and peace!;Pre-paid by the Pallas Coalition!;Arm up and protect your family!"
	product_ads = "A fair selection of assault rifles!;Coalition certified space suits!;Firearms better than the Federation's!"
	vendor_department = DEPARTMENT_SIMILACRUM
	alt_currency_path = /obj/item/stack/dinar

/obj/machinery/vending/carvan/Initialize()
	. = ..()
	set_light(1.4, 1, COLOR_LIGHTING_CYAN_BRIGHT)
	earnings_account = department_accounts[DEPARTMENT_SIMILACRUM]

/obj/machinery/vending/carvan/guns

	products = list(
		/obj/item/gun/projectile/automatic/duty = 3,
		/obj/item/gun/projectile/automatic/nationale = 3,
		/obj/item/gun/projectile/automatic/lmg/pk = 2,
		/obj/item/gun/projectile/automatic/maxim = 1,
		/obj/item/gun/projectile/revolver/frontier = 4,

		/obj/item/ammo_magazine/light_rifle_257 = 6,
		/obj/item/ammo_magazine/ammobox/light_rifle_257 = 2,
		/obj/item/ammo_magazine/rifle_75 = 6,
		/obj/item/ammo_magazine/rifle_75_linked_box = 4,
		/obj/item/ammo_magazine/maxim_75 = 3,
		/obj/item/ammo_magazine/ammobox/rifle_75 = 4,
		/obj/item/ammo_magazine/speed_loader_magnum_40 = 10,
		/obj/item/ammo_magazine/ammobox/magnum_40 = 4,

		/obj/item/clothing/suit/space/void/merc = 4,
		)

	prices = list(
		/obj/item/gun/projectile/automatic/duty = 900,
		/obj/item/gun/projectile/automatic/nationale = 1000,
		/obj/item/gun/projectile/automatic/lmg/pk = 3000,
		/obj/item/gun/projectile/automatic/maxim = 5000,
		/obj/item/gun/projectile/revolver/frontier = 500,

		/obj/item/ammo_magazine/light_rifle_257 = 50,
		/obj/item/ammo_magazine/ammobox/light_rifle_257 = 150,
		/obj/item/ammo_magazine/rifle_75 = 100,
		/obj/item/ammo_magazine/rifle_75_linked_box = 150,
		/obj/item/ammo_magazine/maxim_75 = 125,
		/obj/item/ammo_magazine/ammobox/rifle_75 = 250,
		/obj/item/ammo_magazine/speed_loader_magnum_40 = 25,
		/obj/item/ammo_magazine/ammobox/magnum_40 = 100,

		/obj/item/clothing/suit/space/void/merc = 1500,
		)
