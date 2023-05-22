/obj/item/gun/projectile/automatic/specialist
	name = "\"Five-Oh\" SMG"
	desc = "Commonly found around various police forces galaxy wide, the \"Five-Oh\" SMG. \
			The frame is based off an SMG with a screen for ammunition counting. Chambered in 9mm, it surprisingly punches upwards for its caliber."
	icon = 'icons/obj/guns/projectile/specialist.dmi'
	icon_state = "specialist"
	item_state = "specialist"
	w_class = ITEM_SIZE_NORMAL
	can_dual = TRUE
	caliber = CAL_PISTOL
	slot_flags = SLOT_BELT|SLOT_HOLSTER
	ammo_type = /obj/item/ammo_casing/pistol_35
	load_method = MAGAZINE
	mag_well = MAG_WELL_PISTOL|MAG_WELL_H_PISTOL|MAG_WELL_SMG|MAG_WELL_DRUM
	matter = list(MATERIAL_STEEL = 10, MATERIAL_PLASTIC = 5, MATERIAL_WOOD = 12)
	init_firemodes = list(
		FULL_AUTO_600_NOLOSS,
		BURST_3_ROUND_NOLOSS,
		SEMI_AUTO_NODELAY
		)
	damage_multiplier = 0.9			//Gets better when stock is unfolded
	init_recoil = SMG_RECOIL(1.1)		//Gets better when stock is unfolded
	origin_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 2)
	serial_type = "INDEX"
	folding_stock = TRUE //we can fold our stocks
	gun_tags = list(GUN_PROJECTILE, GUN_SILENCABLE, GUN_MAGWELL)
	gun_parts = list(/obj/item/part/gun/frame/specialist = 1, /obj/item/part/gun/grip/rubber = 1, /obj/item/part/gun/mechanism/smg = 1, /obj/item/part/gun/barrel/pistol = 1)

	extra_damage_mult_scoped = 0.2		//Holosight
	zoom_factors = list(0.4)			//Holosight

	wield_delay = 0.4 SECOND
	wield_delay_factor = 0.3 // Heavy smg , 30 vig to insta wield

/obj/item/part/gun/frame/specialist
	name = "Five-Oh frame"
	desc = "A Five-Oh SMG. A hallway pirate's best dream."
	icon_state = "frame_luty"
	matter = list(MATERIAL_STEEL = 5)
	resultvars = list(/obj/item/gun/projectile/automatic/specialist)
	gripvars = list(/obj/item/part/gun/grip/rubber)
	mechanismvar = /obj/item/part/gun/mechanism/smg
	barrelvars = list(/obj/item/part/gun/barrel/pistol)

/obj/item/gun/projectile/automatic/specialist/update_icon()
	..()
	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if(!folded)
		iconstring += "_stock"

	if (ammo_magazine)
		iconstring += "_mag"

	if (!ammo_magazine || !length(ammo_magazine.stored_ammo))
		iconstring += "_slide"

	if(wielded)
		itemstring += "_doble"

	if (silenced)
		iconstring += "_s"

	icon_state = iconstring
	set_item_state(itemstring)

/obj/item/gun/projectile/automatic/specialist/Initialize()
	. = ..()
	update_icon()
