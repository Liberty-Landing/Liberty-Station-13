/obj/item/gun/projectile/revolver/ranger
	name = "\"Ranger\" revolver"
	desc = "The Martian Logistics \"Ranger\" is a revolver of tact, firepower, and for when you really need to blow someone away. \
			Designed for Federation officers, this brand of revolvers really can punch through even armored suits in spite of its 10mm rounds."
	icon = 'icons/obj/guns/projectile/ranger.dmi'
	icon_state = "ranger"
	item_state = "ranger"
	caliber = CAL_MAGNUM
	force = WEAPON_FORCE_NORMAL
	can_dual = TRUE
	origin_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 2)
	handle_casings = CYCLE_CASINGS
	max_shells = 6
	ammo_type = /obj/item/ammo_casing/magnum_40
	unload_sound 	= 'sound/weapons/guns/interact/rev_magout.ogg'
	reload_sound 	= 'sound/weapons/guns/interact/rev_magin.ogg'
	cocked_sound 	= 'sound/weapons/guns/interact/rev_cock.ogg'
	fire_sound = 'sound/weapons/guns/fire/revolver_fire.ogg'
	matter = list(MATERIAL_PLASTEEL = 15, MATERIAL_PLASTIC = 8)
	price_tag = 650
	fire_delay = 3 //all revolvers can fire faster, but have huge recoil
	damage_multiplier = 1.3
	armor_penetration = 1.1
	init_recoil = HANDGUN_RECOIL(1.3)
	gun_tags = list(GUN_PROJECTILE, GUN_INTERNAL_MAG, GUN_REVOLVER)
	fire_animatio = TRUE
	allow_racking = FALSE
	serial_type = "ML"

	wield_delay = 0.4 SECOND
	wield_delay_factor = 0.4 // 40 vig

	gun_parts = list(/obj/item/part/gun/frame/ranger = 1, /obj/item/part/gun/grip/black = 1, /obj/item/part/gun/mechanism/revolver = 1, /obj/item/part/gun/barrel/magnum = 1)

/obj/item/part/gun/frame/ranger
	name = "Ranger frame"
	desc = "A Ranger revolver frame. For a true frontier ranger."
	icon_state = "frame_revolver"
	result = /obj/item/gun/projectile/revolver/ranger
	resultvars = list(/obj/item/gun/projectile/revolver/ranger)
	gripvars = list(/obj/item/part/gun/grip/black)
	mechanismvar = /obj/item/part/gun/mechanism/revolver
	barrelvars = list(/obj/item/part/gun/barrel/magnum)
