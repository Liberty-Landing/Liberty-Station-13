/datum/trade_station/simulacrum_ship
	icon_states = list("similacrum_frigate", "ship")
	uid = "simulacrum"
	tree_x = 0.66
	tree_y = 0.7
	start_discovered = FALSE
	spawn_always = TRUE
	markup = UNIQUE_GOODS
	recommendations_needed = 2
	hidden_inv_threshold = 2000
	recommendation_threshold = 4000
	stations_recommended = list("simulacrum_printer")
	name_pool = list("Tuixiaoayuan" = "A still functioning, heavily armed Simulacrum ship that still produces and offers wares, likely entirely unaware of Simulacrum Robotics collapse given its \
	automated. It's a wonder it hasn't been raided, but then again it has guns that could level a planet on it. Plus, it hardly offers things of real value...")
	inventory = list(
		"Fuzhuang" = list(
			/obj/item/clothing/head/helmet/space/os,
			/obj/item/clothing/suit/space/os,
			/obj/item/clothing/suit/greatcoat/os,
			/obj/item/clothing/head/os_cap,
			/obj/item/clothing/under/os_jumpsuit
		)
	)
	hidden_inventory = list(
		"Jiguang Kuijia" = list(
			/obj/item/clothing/under/iron_lock_security = custom_good_name("ILS Security Uniform"),
			/obj/item/clothing/head/soft/iron_lock_security = custom_good_name("ILS Security Cap"),
			/obj/item/clothing/gloves/thick/ablasive/iron_lock_security = custom_good_name("ILS Ablasive Gloves"),
			/obj/item/clothing/shoes/ablasive/iron_lock_security = custom_good_name("ILS Ablasive Shoes"),
			/obj/item/clothing/head/helmet/laserproof/iron_lock_security = custom_good_name("ILS Ablasive Helmet"),
			/obj/item/clothing/suit/armor/vest/iron_lock_security = custom_good_name("ILS Ablasive Vest")
		),
		"Chilun" = list(
			/obj/item/gun/energy/cog = custom_good_name("SR Cog")
		)
	)

	//Return policy I guess

	offer_types = list(
		/obj/item/computer_hardware/hard_drive/portable/design/onestar/stockparts = offer_data("SR Stockparts Disk", 500, 1),
		/obj/item/computer_hardware/hard_drive/portable/design/onestar/armor = offer_data("SR Ablasive Armor Disk", 500, 1),
		/*/obj/item/computer_hardware/hard_drive/portable/design/onestar/spring = offer_data("GP Spring Disk", 2000, 1),
		/obj/item/computer_hardware/hard_drive/portable/design/onestar/rivet = offer_data("GP Rivet Disk", 2000, 1),
		/obj/item/computer_hardware/hard_drive/portable/design/onestar/rebar = offer_data("GP Rebar Disk", 2000, 1),
		/obj/item/computer_hardware/hard_drive/portable/design/onestar/nail_gun = offer_data("GP Nail Gun Disk", 2000, 1),
		/obj/item/computer_hardware/hard_drive/portable/design/onestar/scaffold = offer_data("GP Scaffold Disk", 2000, 1),*/
		/obj/item/computer_hardware/hard_drive/portable/design/onestar/cog = offer_data("SR Cog Disk", 150, 1),
		/obj/item/computer_hardware/hard_drive/portable/design/onestar = offer_data("SR Tools Disk", 100, 1)
	)

