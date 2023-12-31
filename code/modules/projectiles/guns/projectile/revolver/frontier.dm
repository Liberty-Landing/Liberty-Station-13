/obj/item/gun/projectile/revolver/frontier
	name = "\"Frontier\" revolver"
	desc = "The Caravaner Enterprise's \"Frontier\" is a revolver of choice when you absolutely, positively need to make a fist-sized hole in someone, but can't afford to do it in style. Uses 10mm Magnum bullets... always wanting more."
	icon = 'icons/obj/guns/projectile/frontier.dmi'
	icon_state = "rev10"
	item_state = "rev10"
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
	matter = list(MATERIAL_INDSTEEL = 15, MATERIAL_PLASTIC = 8)
	price_tag = 650
	fire_delay = 3 //all revolvers can fire faster, but have huge recoil
	damage_multiplier = 1.2
	armor_penetration = 0.9
	init_recoil = HANDGUN_RECOIL(1.3)
	gun_tags = list(GUN_PROJECTILE, GUN_INTERNAL_MAG, GUN_REVOLVER)
	fire_animatio = TRUE
	allow_racking = FALSE
	serial_type = "Car-Van"

	wield_delay = 0.3 SECOND
	wield_delay_factor = 0.3 // 30 vig

	gun_parts = list(/obj/item/part/gun/frame/frontier = 1, /obj/item/part/gun/grip/wood = 1, /obj/item/part/gun/mechanism/revolver = 1, /obj/item/part/gun/barrel/magnum = 1)

/obj/item/part/gun/frame/frontier
	name = "frontier frame"
	desc = "A Frontier revolver frame. The survivalists choice."
	icon_state = "frame_revolver"
	result = /obj/item/gun/projectile/revolver/frontier
	resultvars = list(/obj/item/gun/projectile/revolver/frontier)
	gripvars = list(/obj/item/part/gun/grip/wood)
	mechanismvar = /obj/item/part/gun/mechanism/revolver
	barrelvars = list(/obj/item/part/gun/barrel/magnum)

/obj/item/gun/projectile/revolver/frontier/update_icon()
	..()
	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if (loaded.len == 0)
		iconstring += "_slide"
	else
		iconstring = initial(icon_state) + "_full"


	icon_state = iconstring
	set_item_state(itemstring)

/obj/item/gun/projectile/revolver/frontier/Initialize()
	. = ..()
	update_icon()
