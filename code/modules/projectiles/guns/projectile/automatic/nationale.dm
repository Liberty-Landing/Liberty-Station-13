/obj/item/gun/projectile/automatic/nationale
	name = "\"Nationale\" rifle"
	desc = "Commonly called the 'Right Arm of Free Space' the \"Nationale\" assault rifle is a time-old classic, repdoduced by many frontier and core-world companies. \
			Chambered in 7.62mm, this gun packs a punch in spite of its kick. High quality, decent price - what's not to love?"
	icon = 'icons/obj/guns/projectile/nationale.dmi'
	icon_state = "nationale"
	item_state = "nationale"
	item_suffix = ""
	w_class = ITEM_SIZE_BULKY
	force = WEAPON_FORCE_PAINFUL
	caliber = CAL_RIFLE
	origin_tech = list(TECH_COMBAT = 6, TECH_MATERIAL = 1, TECH_ILLEGAL = 4)
	slot_flags = SLOT_BACK
	load_method = SINGLE_CASING|MAGAZINE
	mag_well = MAG_WELL_RIFLE
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_PLASTIC = 10)
	price_tag = 1000
	fire_sound = 'sound/weapons/guns/fire/ak.ogg'
	unload_sound 	= 'sound/weapons/guns/interact/ltrifle_magout.ogg'
	reload_sound 	= 'sound/weapons/guns/interact/ltrifle_magin.ogg'
	cocked_sound 	= 'sound/weapons/guns/interact/ltrifle_cock.ogg'
	penetration_multiplier = 1.1
	damage_multiplier = 1.2
	init_recoil = RIFLE_RECOIL(0.9)
	gun_tags = list(GUN_PROJECTILE, GUN_SCOPE, GUN_MAGWELL)

	wield_delay = 0.8 SECOND
	wield_delay_factor = 0.3 // 30 vig to insta wield, it is a rifle n' a bit heavy.

	gun_parts = list(/obj/item/part/gun/frame/nationale = 1, /obj/item/part/gun/grip/serb = 1, /obj/item/part/gun/mechanism/autorifle = 1, /obj/item/part/gun/barrel/lrifle = 1)

	init_firemodes = list(
		FULL_AUTO_300,
		SEMI_AUTO_NODELAY
		)
	serial_type = "Car-Van"

/obj/item/part/gun/frame/nationale
	name = "Nationale frame"
	desc = "An Nationale rifle frame. The right arm of free space."
	icon_state = "frame_ak"
	matter = list(MATERIAL_PLASTEEL = 8)
	result = /obj/item/gun/projectile/automatic/nationale
	gripvars = list(/obj/item/part/gun/grip/serb, /obj/item/part/gun/grip/rubber)
	resultvars = list(/obj/item/gun/projectile/automatic/nationale, /obj/item/gun/projectile/automatic/nationale/dragon)
	mechanismvar = /obj/item/part/gun/mechanism/autorifle
	barrelvars = list(/obj/item/part/gun/barrel/lrifle)

/obj/item/gun/projectile/automatic/nationale/update_icon()
	..()

	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if (ammo_magazine)
		iconstring += "[ammo_magazine? "_mag[ammo_magazine.max_ammo]": ""]"
		itemstring += "_full"

	if(wielded)
		itemstring += "_doble"

	icon_state = iconstring
	set_item_state(itemstring)

/obj/item/gun/projectile/automatic/nationale/Initialize()
	. = ..()
	update_icon()

/obj/item/gun/projectile/automatic/nationale/dragon
	name = "\"Dragon\" marksman rifle"
	desc = "An improved version of a \"Nationale\" rifle but with added stability, a more comfortable grip, and forged barrel. \
			This model seems to have lost its ability of fully-automatic fire, but makes up for it with controlled burst-modes."
	icon = 'icons/obj/guns/projectile/marksman.dmi'
	icon_state = "marksman"
	item_state = "marksman"
	item_suffix = ""
	w_class = ITEM_SIZE_BULKY
	force = WEAPON_FORCE_PAINFUL
	caliber = CAL_RIFLE
	origin_tech = list(TECH_COMBAT = 6, TECH_MATERIAL = 1, TECH_ILLEGAL = 4)
	slot_flags = SLOT_BACK
	load_method = SINGLE_CASING|SPEEDLOADER|MAGAZINE
	mag_well = MAG_WELL_RIFLE
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_PLASTIC = 10)
	price_tag = 1000
	fire_sound = 'sound/weapons/guns/fire/ak.ogg'
	unload_sound 	= 'sound/weapons/guns/interact/ltrifle_magout.ogg'
	reload_sound 	= 'sound/weapons/guns/interact/ltrifle_magin.ogg'
	cocked_sound 	= 'sound/weapons/guns/interact/ltrifle_cock.ogg'
	damage_multiplier = 1.1
	penetration_multiplier = 1.2
	init_recoil = RIFLE_RECOIL(0.8)
	gun_tags = list(GUN_PROJECTILE, GUN_MAGWELL)
	extra_damage_mult_scoped = 0.2
	zoom_factors = list(0.8)

	gun_parts = list(/obj/item/part/gun/frame/nationale = 1, /obj/item/part/gun/grip/rubber = 1, /obj/item/part/gun/mechanism/autorifle = 1, /obj/item/part/gun/barrel/lrifle = 1)

	init_firemodes = list(
		BURST_3_ROUND,
		BURST_2_ROUND,
		SEMI_AUTO_NODELAY
		)
