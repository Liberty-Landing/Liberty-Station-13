/obj/item/gun/projectile/automatic/federalist
	name = "\"Federalist\" carbine"
	desc = "A weapon of a true Solarian Federation patriot. A home-owners dream rifle. \
			A copy of the famous \"Federalist\" pattern carbine, chambered in 6.5mm."
	icon = 'icons/obj/guns/projectile/ar.dmi'
	icon_state = "AR"
	item_state = "AR"
	item_suffix = ""
	w_class = ITEM_SIZE_BULKY
	force = WEAPON_FORCE_PAINFUL
	caliber = CAL_SRIFLE
	origin_tech = list(TECH_COMBAT = 6, TECH_MATERIAL = 1, TECH_ILLEGAL = 4)
	slot_flags = SLOT_BACK
	load_method = SINGLE_CASING|MAGAZINE
	mag_well = MAG_WELL_RIFLE
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_PLASTIC = 10)
	price_tag = 750
	fire_sound = 'sound/weapons/guns/fire/ak.ogg'
	unload_sound 	= 'sound/weapons/guns/interact/ltrifle_magout.ogg'
	reload_sound 	= 'sound/weapons/guns/interact/ltrifle_magin.ogg'
	cocked_sound 	= 'sound/weapons/guns/interact/ltrifle_cock.ogg'
	damage_multiplier = 1.1
	penetration_multiplier = 1.2
	init_recoil = RIFLE_RECOIL(0.9)
	gun_tags = list(GUN_PROJECTILE, GUN_SCOPE, GUN_MAGWELL)

	saw_off = TRUE
	sawn = /obj/item/gun/projectile/automatic/federalist/sawn

	gun_parts = list(/obj/item/part/gun/frame/federalist = 1, /obj/item/part/gun/grip/black = 1, /obj/item/part/gun/mechanism/autorifle = 1, /obj/item/part/gun/barrel/srifle = 1)

	init_firemodes = list(
		FULL_AUTO_300,
		BURST_3_ROUND,
		SEMI_AUTO_NODELAY
		)
	serial_type = "ML"

/obj/item/gun/projectile/automatic/federalist/update_icon()
	..()

	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if(ammo_magazine)
		add_overlay("_mag[ammo_magazine.max_ammo]")
	else
		cut_overlays()
		return

	if (!ammo_magazine || !length(ammo_magazine.stored_ammo))
		iconstring += "_slide"

	icon_state = iconstring
	set_item_state(itemstring)

/obj/item/gun/projectile/automatic/federalist/sawn
	name = "sawn-off \"Federalist\" carbine"
	desc = "This gun was fine. Was.. You know for a fact Terran Federal Police would have a field day with this gun."
	icon = 'icons/obj/guns/projectile/sawnoff/ar.dmi'
	init_recoil = RIFLE_RECOIL(1.2)
	damage_multiplier = 1.1
	penetration_multiplier = 1

/obj/item/part/gun/frame/federalist
	name = "Federalist frame"
	desc = "An Federalist carbine frame. The homeowner's dream."
	icon_state = "frame_ak"
	matter = list(MATERIAL_PLASTEEL = 8)
	result = /obj/item/gun/projectile/automatic/federalist
	gripvars = list(/obj/item/part/gun/grip/black, /obj/item/part/gun/grip/rubber)
	resultvars = list(/obj/item/gun/projectile/automatic/federalist, /obj/item/gun/projectile/automatic/federalist/homemaker)
	mechanismvar = /obj/item/part/gun/mechanism/autorifle
	barrelvars = list(/obj/item/part/gun/barrel/srifle)

/obj/item/gun/projectile/automatic/federalist/homemaker
	name = "\"Homemaker\" marksman carbine"
	desc = "A weapon of a True Solarian Federaltion patriot. A home-owners dream rifle. \
			A copy of the famous \"Federalist\" carbine, chambered in 6.5mm. This variant appears to have lost its capability to switch to full-auto, but a better barrel and scope attached to compensate."
	icon = 'icons/obj/guns/projectile/ar_scope.dmi'
	price_tag = 800
	extra_damage_mult_scoped = 0.4
	zoom_factors = list(0.8)
	init_recoil = RIFLE_RECOIL(0.9)
	saw_off = FALSE

	init_firemodes = list(
		SEMI_AUTO_NODELAY,
		BURST_2_ROUND
		)
