/obj/item/gun/projectile/martian
	name = "\"Martian\" heavy pistol"
	desc = "The \"Martian\", a massive handgun based on sidearms issued to Federation marines, repackaged by Martian Logistics for civilian and law enforcement use. Uses 10mm."
	icon = 'icons/obj/guns/projectile/martian.dmi'
	icon_state = "martian"
	item_state = "martian"
	fire_sound = 'sound/weapons/guns/fire/hpistol_fire.ogg'
	caliber = CAL_MAGNUM
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 4)
	can_dual = TRUE
	load_method = SINGLE_CASING|MAGAZINE
	mag_well = MAG_WELL_PISTOL
	matter = list(MATERIAL_PLASTEEL = 15, MATERIAL_PLASTIC = 8)
	price_tag = 500
	unload_sound 	= 'sound/weapons/guns/interact/hpistol_magout.ogg'
	reload_sound 	= 'sound/weapons/guns/interact/hpistol_magin.ogg'
	cocked_sound 	= 'sound/weapons/guns/interact/hpistol_cock.ogg'
	damage_multiplier = 1.2
	penetration_multiplier = 1.3
	init_recoil = HANDGUN_RECOIL(1.3)
	gun_tags = list(GUN_PROJECTILE, GUN_MAGWELL)
	serial_type = "ML"
	auto_eject = 1

	wield_delay = 0.6 SECOND
	wield_delay_factor = 0.6 // 60 vig
	gun_parts = list(/obj/item/part/gun/frame/martian = 1, /obj/item/part/gun/grip/rubber = 1, /obj/item/part/gun/mechanism/pistol = 1, /obj/item/part/gun/barrel/magnum = 1)

/obj/item/part/gun/frame/martian
	name = "Martian frame"
	desc = "An Martian pistol frame. Fuckin' feds."
	icon_state = "frame_lamia"
	result = /obj/item/gun/projectile/martian
	resultvars = list(/obj/item/gun/projectile/martian)
	gripvars = list(/obj/item/part/gun/grip/rubber)
	mechanismvar = /obj/item/part/gun/mechanism/pistol
	barrelvars = list(/obj/item/part/gun/barrel/magnum)

/obj/item/gun/projectile/martian/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "martian-[round(ammo_magazine.stored_ammo.len,2)]"
	else
		icon_state = "martian"
	return
