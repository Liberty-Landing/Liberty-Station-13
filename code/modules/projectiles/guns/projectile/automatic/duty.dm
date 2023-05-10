/obj/item/gun/projectile/automatic/duty
	name = "\"Duty\" marksman carbine"
	desc = "A well-designed wooden stocked marksman rifle, built to take 6.5mm rounds. \
			While incapable of fully-auomatic fire, the gun can be reloaded either through mags, individual casings, or stripper-clips."
	icon = 'icons/obj/guns/projectile/duty.dmi'
	icon_state = "duty"
	item_state = "duty"
	item_suffix = ""
	w_class = ITEM_SIZE_BULKY
	force = WEAPON_FORCE_PAINFUL
	caliber = CAL_SRIFLE
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
	gun_tags = list(GUN_PROJECTILE, GUN_SCOPE, GUN_MAGWELL)
	serial_type = "Car-Van"

	wield_delay = 0.8 SECOND
	wield_delay_factor = 0.2 // 20 vig for insta wield

	gun_parts = list(/obj/item/part/gun/frame/duty = 1, /obj/item/part/gun/grip/wood = 1, /obj/item/part/gun/mechanism/autorifle = 1, /obj/item/part/gun/barrel/srifle = 1)

	init_firemodes = list(
		BURST_3_ROUND,
		BURST_2_ROUND,
		SEMI_AUTO_NODELAY
		)

/obj/item/part/gun/frame/duty
	name = "Duty frame"
	desc = "A Duty marksman carbine frame. Perfect for small game."
	icon_state = "frame_ak"
	matter = list(MATERIAL_PLASTEEL = 8)
	result = /obj/item/gun/projectile/automatic/duty
	gripvars = list(/obj/item/part/gun/grip/wood)
	resultvars = list(/obj/item/gun/projectile/automatic/duty)
	mechanismvar = /obj/item/part/gun/mechanism/autorifle
	barrelvars = list(/obj/item/part/gun/barrel/srifle)

/obj/item/gun/projectile/automatic/duty/update_icon()
	..()

	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if (ammo_magazine)
		iconstring += "[ammo_magazine? "_mag[ammo_magazine.max_ammo]": ""]"
		itemstring += "_full"

	if (!ammo_magazine || !length(ammo_magazine.stored_ammo))
		iconstring += "_slide"

	icon_state = iconstring
	set_item_state(itemstring)
