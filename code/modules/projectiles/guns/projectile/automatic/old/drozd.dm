/obj/item/gun/projectile/automatic/drozd
	name = "\"Drozd\" SMG"
	desc = "\"The supremacy of the proletariat will cause them to vanish still faster.\"\nAn excellent, fully automatic compact submachinegun. \
			Famous for its perfomance in close quarters, and used terrorist cells and militias over the galaxy. \
			Chambered in 10mm, it takes both pistol and SMG magazines."
	icon = 'icons/obj/guns/projectile/drozd.dmi'
	icon_state = "drozd"
	item_state = "drozd"
	w_class = ITEM_SIZE_NORMAL
	can_dual = TRUE
	force = WEAPON_FORCE_PAINFUL
	caliber = CAL_MAGNUM
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 2)
	load_method = SINGLE_CASING|MAGAZINE
	mag_well = MAG_WELL_PISTOL|MAG_WELL_SMG
	matter = list(MATERIAL_INDSTEEL = 15, MATERIAL_PLASTIC = 3)
	price_tag = 800
	damage_multiplier = 0.95
	init_recoil = SMG_RECOIL(0.4)
	twohanded = FALSE
	gun_tags = list(GUN_PROJECTILE, GUN_MAGWELL)
	init_firemodes = list(
		FULL_AUTO_300_NOLOSS,
		SEMI_AUTO_NODELAY
		)
	serial_type = "LIB"

	wield_delay = 0.5 SECOND
	wield_delay_factor = 0.1 // 10 vig
	gun_parts = list(/obj/item/part/gun/frame/drozd = 1, /obj/item/part/gun/grip/excel = 1, /obj/item/part/gun/mechanism/smg = 1, /obj/item/part/gun/barrel/magnum = 1)
	//gun_parts = list(/obj/item/part/gun/frame/drozd = 1, /obj/item/part/gun/grip/rubber = 1, /obj/item/part/gun/mechanism/smg = 1, /obj/item/part/gun/barrel/magnum = 1)

/obj/item/gun/projectile/automatic/drozd/update_icon()
	..()

	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if (ammo_magazine)
		iconstring += "[ammo_magazine? "_mag[ammo_magazine.max_ammo]": ""]"

	if (!ammo_magazine || !length(ammo_magazine.stored_ammo))
		iconstring += "_slide"

	if (silenced)
		iconstring += "_s"
		itemstring += "_s"

	icon_state = iconstring
	item_state = itemstring

/obj/item/part/gun/frame/drozd
	name = "Drozd frame"
	desc = "A Drozd SMG frame. Workhorse of the Excelsior force."
	icon_state = "frame_excelsmg"
	result = /obj/item/gun/projectile/automatic/drozd
	gripvars = list(/obj/item/part/gun/grip/excel, /obj/item/part/gun/grip/rubber)
	mechanismvar = /obj/item/part/gun/mechanism/smg
	barrelvars = list(/obj/item/part/gun/barrel/magnum)
	resultvars = list(/obj/item/gun/projectile/automatic/drozd, /obj/item/gun/projectile/automatic/drozd/NM_colony)
