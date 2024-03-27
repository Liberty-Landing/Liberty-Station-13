/obj/item/gun/projectile/colt
	name = "\"Colt\" pistol"
	desc = "An old repoduction of an M1911 produced by Martian Logistics. It doesn't feel great to use with its grip. Uses 10mm rounds."
	icon = 'icons/obj/guns/projectile/colt.dmi'
	icon_state = "colt"
	item_state = "colt"
	caliber = CAL_MAGNUM
	origin_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 2)
	matter = list(MATERIAL_INDSTEEL = 12, MATERIAL_WOOD = 5)
	price_tag = 450
	fire_sound = 'sound/weapons/guns/fire/pistol_fire.ogg'
	can_dual = TRUE
	load_method = SINGLE_CASING|MAGAZINE
	mag_well = MAG_WELL_PISTOL | MAG_WELL_H_PISTOL
	damage_multiplier = 0.9
	init_recoil = HANDGUN_RECOIL(0.4)
	gun_tags = list(GUN_PROJECTILE, GUN_SILENCABLE, GUN_MAGWELL)
	serial_type = "ML"

	wield_delay = 0.3 SECOND
	wield_delay_factor = 0.2 // 20 vig
	gun_parts = list(/obj/item/part/gun/frame/colt = 1, /obj/item/part/gun/grip/wood = 1, /obj/item/part/gun/mechanism/pistol = 1, /obj/item/part/gun/barrel/magnum = 1)

/obj/item/gun/projectile/colt/freedom
	name = "\"Freedom\" pistol"
	desc = "A classy high-powered semi-automatic M1911 model with significant reinforcements produced by Liberty Group. Chambered in 10mm."
	icon_state = "delta"
	item_state = "colt"
	w_class = ITEM_SIZE_NORMAL
	caliber = CAL_MAGNUM
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 2)
	load_method = SINGLE_CASING|MAGAZINE
	mag_well = MAG_WELL_PISTOL
	matter = list(MATERIAL_INDSTEEL = 18, MATERIAL_PLASTIC = 8)
	price_tag = 550
	load_method = MAGAZINE
	mag_well = MAG_WELL_PISTOL
	init_recoil = HANDGUN_RECOIL(0.5)
	damage_multiplier = 1.1
	gun_tags = list(GUN_PROJECTILE, GUN_MAGWELL, GUN_SILENCABLE)
	serial_type = "LG"

	wield_delay = 0.4 SECOND
	wield_delay_factor = 0.4 // 40 vig
	gun_parts = list(/obj/item/part/gun/frame/colt = 1, /obj/item/part/gun/grip/black = 1, /obj/item/part/gun/mechanism/pistol = 1, /obj/item/part/gun/barrel/magnum = 1)

/obj/item/gun/projectile/colt/update_icon()
	..()

	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if (!ammo_magazine || !length(ammo_magazine.stored_ammo))
		iconstring += "_slide"

	if (silenced)
		iconstring += "_s"
		itemstring += "_s"

	icon_state = iconstring
	set_item_state(itemstring)

/obj/item/gun/projectile/colt/Initialize()
	. = ..()
	update_icon()

/obj/item/part/gun/frame/colt
	name = "Colt 1911 frame"
	desc = "A Colt pistol frame. Winner of dozens of world wars, and loser of many more guerilla wars."
	icon_state = "frame_1911"
	result = /obj/item/gun/projectile/colt
	gripvars = list(/obj/item/part/gun/grip/wood, /obj/item/part/gun/grip/black)
	mechanismvar = /obj/item/part/gun/mechanism/pistol
	barrelvars = list(/obj/item/part/gun/barrel/magnum) // Both guns are 10mm, no cheating
	resultvars = list(/obj/item/gun/projectile/colt, /obj/item/gun/projectile/colt/freedom)

