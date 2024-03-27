/obj/item/gun/projectile/automatic/operator_rifle
	name = "\"Operator\" caseless carbine"
	desc = "A relatively strange yet sleek caseless design, the \"Operator\" is a tactical modern military's dream. Its display lighting up its current round count and mag-state. \
			With incredibly good recoil control this rifle truly sports the best of both worlds for a carbine. However, its niche caliber of 7mm troubles it."
	icon = 'icons/obj/guns/projectile/operator.dmi'
	icon_state = "operator"
	item_state = "operator"
	w_class = ITEM_SIZE_NORMAL
	can_dual = TRUE
	caliber = CAL_CLRIFLE
	fire_sound = 'sound/weapons/guns/fire/dp_fire.ogg'
	slot_flags = SLOT_BELT|SLOT_HOLSTER
	load_method = MAGAZINE
	mag_well = MAG_WELL_RIFLE
	matter = list(MATERIAL_ALUMINIUM = 10, MATERIAL_PLASTIC = 10, MATERIAL_INDSTEEL = 12)
	init_firemodes = list(
		FULL_AUTO_300,
		SEMI_AUTO_NODELAY,
		)
	damage_multiplier = 1.0
	init_recoil = RIFLE_RECOIL(1)
	origin_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 2)
	serial_type = "ML"
	gun_tags = list(GUN_PROJECTILE, GUN_MAGWELL)
	gun_parts = list(/obj/item/part/gun/frame/operator_rifle = 1, /obj/item/part/gun/grip/black = 1, /obj/item/part/gun/mechanism/autorifle = 1, /obj/item/part/gun/barrel/clrifle = 1)

	wield_delay = 0.8 SECOND
	wield_delay_factor = 0.3 // 30 vig to insta wield, it is a rifle n' a bit heavy.

/obj/item/part/gun/frame/operator_rifle
	name = "Operator frame"
	desc = "A Operator carbine. Peak shipbreaker technology."
	icon_state = "frame_mamba"
	resultvars = list(/obj/item/gun/projectile/automatic/operator_rifle)
	gripvars = list(/obj/item/part/gun/grip/black)
	mechanismvar = /obj/item/part/gun/mechanism/autorifle
	barrelvars = list(/obj/item/part/gun/barrel/clrifle)

/obj/item/gun/projectile/automatic/operator_rifle/update_icon()
	..()
	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if (ammo_magazine)
		iconstring += "_mag"

	if (!ammo_magazine || !length(ammo_magazine.stored_ammo))
		iconstring += "_slide"

	icon_state = iconstring
	set_item_state(itemstring)

/obj/item/gun/projectile/automatic/operator_rifle/Initialize()
	. = ..()
	update_icon()
