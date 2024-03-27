/obj/item/gun/projectile/shotgun/pump/ks
	name = "\"Kerm Streak\" SG KS-23"
	desc = "\"Kerm Streak\", designed by Car-Van for extensive crowd control, said to be made with reused anti-aircraft barrels."
	icon = 'icons/obj/guns/projectile/ks23.dmi'
	icon_state = "ks23"
	item_state = "ks23"
	max_shells = 4
	w_class = ITEM_SIZE_HUGE
	force = WEAPON_FORCE_ROBUST
	slot_flags = SLOT_BACK
	matter = list(MATERIAL_INDSTEEL = 20, MATERIAL_PLASTIC = 10, MATERIAL_ALUMINIUM = 15)
	proj_step_multiplier = 1.2
	ammo_type = /obj/item/ammo_casing/shotgun/pellet/scrap
	price_tag = 750
	damage_multiplier = 1.2
	penetration_multiplier = 1.5
	init_recoil = CARBINE_RECOIL(3)
	can_dual = FALSE
	saw_off = FALSE
	serial_type = "Car-Van"