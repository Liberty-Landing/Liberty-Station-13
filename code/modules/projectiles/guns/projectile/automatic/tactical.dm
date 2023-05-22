/obj/item/gun/projectile/automatic/tactical
	name = "\"Tactical\" SMG"
	desc = "A shipbreakers wet dream, the \"Tactical\" SMG is a posterchild for shipbreakers, elite response forces, and other organizations alike.\
			This autopistol sports a collasping stock and is capable of fitting in a holster, chambered in 10mm."
	icon = 'icons/obj/guns/projectile/autopistol.dmi'
	icon_state = "freedom"
	item_state = "freedom"
	w_class = ITEM_SIZE_NORMAL
	can_dual = TRUE
	caliber = CAL_MAGNUM
	slot_flags = SLOT_BELT|SLOT_HOLSTER
	ammo_type = /obj/item/ammo_casing/magnum_40
	load_method = MAGAZINE
	mag_well = MAG_WELL_PISTOL|MAG_WELL_H_PISTOL|MAG_WELL_SMG
	matter = list(MATERIAL_STEEL = 10, MATERIAL_PLASTIC = 5, MATERIAL_WOOD = 12)
	init_firemodes = list(
		FULL_AUTO_300,
		SEMI_AUTO_NODELAY,
		)
	damage_multiplier = 0.9			//Gets better when stock is unfolded
	init_recoil = SMG_RECOIL(1.2)	//Gets better when stock is unfolded
	origin_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 2)
	serial_type = "LG"
	folding_stock = TRUE //we can fold our stocks
	gun_tags = list(GUN_PROJECTILE, GUN_SILENCABLE, GUN_MAGWELL)
	gun_parts = list(/obj/item/part/gun/frame/tactical = 1, /obj/item/part/gun/grip/rubber = 1, /obj/item/part/gun/mechanism/smg = 1, /obj/item/part/gun/barrel/magnum = 1)

	wield_delay = 0.4 SECOND
	wield_delay_factor = 0.3 // Heavy smg , 30 vig to insta wield

/obj/item/part/gun/frame/tactical
	name = "Tactical frame"
	desc = "A Tactical SMG. Finely crafted, made with care."
	icon_state = "frame_colt"
	resultvars = list(/obj/item/gun/projectile/automatic/tactical)
	gripvars = list(/obj/item/part/gun/grip/rubber)
	mechanismvar = /obj/item/part/gun/mechanism/smg
	barrelvars = list(/obj/item/part/gun/barrel/magnum)

/obj/item/gun/projectile/automatic/tactical/update_icon()
	..()
	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if(!folded)
		iconstring += "_stock"

	if (ammo_magazine)
		if(ammo_magazine.max_ammo==30)
			iconstring += "_longmag"
		else
			iconstring += "_mag"

	if (!ammo_magazine || !length(ammo_magazine.stored_ammo))
		iconstring += "_slide"

	if(wielded)
		itemstring += "_doble"

	if (silenced)
		iconstring += "_s"

	icon_state = iconstring
	set_item_state(itemstring)

/obj/item/gun/projectile/automatic/tactical/Initialize()
	. = ..()
	update_icon()
