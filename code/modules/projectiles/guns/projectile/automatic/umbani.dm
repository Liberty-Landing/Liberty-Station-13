/obj/item/gun/projectile/automatic/umbani
	name = "\"Umbani\" SMG"
	desc = "The \"Umbani\" SMG is a firearm most commonly known for being used at frontiersman and gangsters on a budget. \
			While made decent it's not exactly a quality gun; its stock feeling somewhat unwieldy for a user. Chambered in 10mm."
	icon = 'icons/obj/guns/projectile/umbani.dmi'
	icon_state = "umbani"
	item_state = "umbani"
	w_class = ITEM_SIZE_NORMAL
	can_dual = TRUE
	caliber = CAL_MAGNUM
	slot_flags = SLOT_BELT|SLOT_HOLSTER
	ammo_type = /obj/item/ammo_casing/pistol_35
	fire_sound = 'sound/weapons/guns/fire/grease_fire.ogg'
	load_method = MAGAZINE
	mag_well = MAG_WELL_PISTOL|MAG_WELL_H_PISTOL|MAG_WELL_SMG
	matter = list(MATERIAL_ALUMINIUM = 10, MATERIAL_PLASTIC = 5, MATERIAL_WOOD = 12)
	init_firemodes = list(
		FULL_AUTO_300,
		SEMI_AUTO_NODELAY,
		)
	damage_multiplier = 0.9
	penetration_multiplier = 1
	init_recoil = SMG_RECOIL(1.1)
	origin_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 2)
	serial_type = "INDEX"
	gun_tags = list(GUN_PROJECTILE, GUN_SILENCABLE, GUN_MAGWELL)
	gun_parts = list(/obj/item/part/gun/frame/umbani = 1, /obj/item/part/gun/grip/wood = 1, /obj/item/part/gun/mechanism/smg = 1, /obj/item/part/gun/barrel/magnum = 1)

	wield_delay = 0.4 SECOND
	wield_delay_factor = 0.3 // Heavy smg , 30 vig to insta wield

/obj/item/part/gun/frame/umbani
	name = "Umbani frame"
	desc = "A Umbani SMG. For those on a budget but still wanting to blow someone away."
	icon_state = "frame_luty"
	matter = list(MATERIAL_ALUMINIUM = 5)
	resultvars = list(/obj/item/gun/projectile/automatic/umbani)
	gripvars = list(/obj/item/part/gun/grip/wood)
	mechanismvar = /obj/item/part/gun/mechanism/smg
	barrelvars = list(/obj/item/part/gun/barrel/magnum)

/obj/item/gun/projectile/automatic/umbani/update_icon()
	..()
	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if (ammo_magazine)
		if(ammo_magazine.max_ammo==30)
			iconstring += "_longmag"
		else
			iconstring += "_mag"

	if(wielded)
		itemstring += "_doble"

	icon_state = iconstring
	set_item_state(itemstring)

/obj/item/gun/projectile/automatic/umbani/Initialize()
	. = ..()
	update_icon()
