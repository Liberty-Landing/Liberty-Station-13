// This gun is meant to be a boltgun bad sadly do to being a caseless gun,
// it has to be automatic untill someone rewrights the code for how boltguns handle caseless ammo

/obj/item/gun/projectile/automatic/contractor
	name = "\"Contractor\" caseless auto boltgun"
	desc = "A strange design the internally suppressed caseless \"Contractor\" autobolt action rifle is a high-end manufactured 'sporting' weapon. \
			Chambered in 7mm, this weapon is perfect for stealthy assassins, scouting missions, and for rich people looking to say they hunt.."
	icon = 'icons/obj/guns/projectile/contractor.dmi'
	icon_state = "contractor"
	item_state = "contractor"
	w_class = ITEM_SIZE_HUGE
	force = WEAPON_FORCE_ROBUST
	slot_flags = SLOT_BACK
	origin_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 2)
	caliber = CAL_CLRIFLE
	fire_delay = 2.5
	damage_multiplier = 1.6
	penetration_multiplier  = 1.6
	init_recoil = HMG_RECOIL(0.6)
	handle_casings = HOLD_CASINGS
	load_method = SINGLE_CASING|SPEEDLOADER
	max_shells = 20
	fire_sound = 'sound/weapons/guns/fire/vintorez.ogg'
	reload_sound = 'sound/weapons/guns/interact/rifle_load.ogg'
	matter = list(MATERIAL_INDSTEEL = 25, MATERIAL_PLASTIC = 15)
	price_tag = 500
	sharp = FALSE
	gun_tags = list(GUN_PROJECTILE, GUN_INTERNAL_MAG)
	saw_off = FALSE
	serial_type = "ML"
	silenced = TRUE

	extra_damage_mult_scoped = 0.4
	zoom_factors = list(0.6, 1.4, 2)

	wield_delay = 0.3 SECOND
	wield_delay_factor = 0.2 // 20 vig
	gun_parts = list(/obj/item/part/gun/frame/boltgun = 1, /obj/item/part/gun/grip/rubber = 1, /obj/item/part/gun/mechanism/boltgun = 1, /obj/item/part/gun/barrel/clrifle = 1)

/obj/item/gun/projectile/automatic/contractor/handle_post_fire()
	..()
	flick("anime", src)
