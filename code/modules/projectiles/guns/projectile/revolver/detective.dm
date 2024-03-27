/obj/item/gun/projectile/revolver/detective
	name = "\"Pocket Prince\" revolver"
	desc = "A cheap H&S J-frame revolver, simple, reliable, uses 9mm."
	icon = 'icons/obj/guns/projectile/pocket.dmi'
	fire_sound = 'sound/weapons/guns/fire/9mm_revolver.ogg'
	icon_state = "detective"
	drawChargeMeter = FALSE
	w_class = ITEM_SIZE_SMALL
	max_shells = 6
	caliber = CAL_PISTOL
	origin_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 2)
	fire_sound = 'sound/weapons/Gunshot_light.ogg'
	matter = list(MATERIAL_INDSTEEL = 4, MATERIAL_ALUMINIUM = 8, MATERIAL_WOOD = 6)
	price_tag = 200 //cheap civ peashooter revolver
	damage_multiplier = 1.15 //because it's a revolver
	penetration_multiplier = 1.2
	init_recoil = HANDGUN_RECOIL(0.5) //Rule of Cool
	gun_tags = list(GUN_PROJECTILE, GUN_INTERNAL_MAG, GUN_REVOLVER, GUN_SILENCABLE)
	serial_type = "Car-Van"

	wield_delay = 0 SECOND //god it's bad
	gun_parts = list(/obj/item/part/gun/frame/detective= 1, /obj/item/part/gun/grip/wood = 1, /obj/item/part/gun/mechanism/revolver = 1, /obj/item/part/gun/barrel/pistol = 1)

/obj/item/part/gun/frame/detective
	name = "Pocket Prince frame"
	desc = "A Pocket Prince revolver frame. Personal defense in a small package."
	icon_state = "frame_havelock"
	result = /obj/item/gun/projectile/revolver/detective
	resultvars = list(/obj/item/gun/projectile/revolver/detective)
	gripvars = list(/obj/item/part/gun/grip/wood)
	mechanismvar = /obj/item/part/gun/mechanism/revolver
	barrelvars = list(/obj/item/part/gun/barrel/pistol)

/obj/item/gun/projectile/revolver/detective/update_icon()
	..()

	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if (silenced)
		iconstring += "_s"
		itemstring += "_s"

	icon_state = iconstring
	set_item_state(itemstring)
