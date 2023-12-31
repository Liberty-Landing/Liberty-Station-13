/obj/item/gun/projectile/shotgun/judge
	name = "\"Judge\" automatic shotgun"
	desc = "A 12 gauge shotgun with an auto-ejector and capability of being fired without the need to pump its action. This impresive model, built by Martian Logistics, is a favorite galaxy wide. \
			Sporting little in the chance of jamming due to its blow-back feature, this amazing piece of work maintains the simplicity of a shotgun with the automatic firepower of a traditional mag-fed shotgun."
	icon = 'icons/obj/guns/projectile/judge.dmi'
	icon_state = "judge"
	item_state = "judge"
	max_shells = 8
	w_class = ITEM_SIZE_HUGE
	force = WEAPON_FORCE_PAINFUL
	flags = CONDUCT
	slot_flags = SLOT_BACK
	caliber = CAL_SHOTGUN
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 2)
	load_method = SINGLE_CASING|SPEEDLOADER
	ammo_type = /obj/item/ammo_casing/shotgun/beanbag
	handle_casings = EJECT_CASINGS
	fire_sound = 'sound/weapons/guns/fire/shotgun_combat.ogg'
	bulletinsert_sound 	= 'sound/weapons/guns/interact/shotgun_insert.ogg'
	matter = list(MATERIAL_INDSTEEL = 20, MATERIAL_PLASTIC = 10)
	price_tag = 1000
	penetration_multiplier = 1.2 //20% more ap
	damage_multiplier = 1.1 	//10% more damage
	fire_delay = 12				//Ouchie-oofie my fire delay - get mods to make it better
	init_recoil = RIFLE_RECOIL(1.6)
	max_upgrades = 5 			// Already too good, let's not get out of hand

	gun_tags = list(GUN_PROJECTILE, GUN_SCOPE, GUN_MAGWELL, GUN_SIGHT)
	init_firemodes = list(
	SEMI_AUTO_NODELAY,
	BURST_2_ROUND_NOLOSS)
	serial_type = "ML"
	gun_parts = list(/obj/item/part/gun/frame/judge = 1, /obj/item/part/gun/grip/rubber = 1, /obj/item/part/gun/mechanism/shotgun = 1, /obj/item/part/gun/barrel/shotgun = 1)

/obj/item/part/gun/frame/judge
	name = "Judge frame"
	desc = "A Judge shotgun frame. Judge, jury AND executioner!"
	icon_state = "frame_pug"
	result = /obj/item/gun/projectile/shotgun/judge
	resultvars = list(/obj/item/gun/projectile/shotgun/judge)
	gripvars = list(/obj/item/part/gun/grip/rubber)
	mechanismvar = /obj/item/part/gun/mechanism/shotgun
	barrelvars = list(/obj/item/part/gun/barrel/shotgun)

/obj/item/gun/projectile/shotgun/judge/update_icon()
	..()

	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if(ammo_magazine)
		add_overlay("_mag[ammo_magazine.max_ammo]")
	else
		cut_overlays()
		return

	if (!ammo_magazine || !length(ammo_magazine.stored_ammo))
		iconstring += "_slide"

	icon_state = iconstring
	set_item_state(itemstring)

/obj/item/gun/projectile/shotgun/judge/sawn
	name = "sawn-down \"Judge\" automatic shotgun"
	desc = "A 12 gauge shotgun with an auto-ejector and capability of being fired without the need to pump its action. This impresive model, built by Martian Logistics, is a favorite galaxy wide. \
			Sporting little in the chance of jamming due to its blow-back feature, this amazing piece of work maintains the simplicity of a shotgun with the automatic firepower of a traditional mag-fed shotgun. \
			This one appears to have its stock, barrel, and loading tube shortened. Sacrificing capacity and recoil for size."
	icon = 'icons/obj/guns/projectile/sawnoff/judge.dmi'
	icon_state = "judge"
	item_state = "judge"
	max_shells = 5
	w_class = ITEM_SIZE_NORMAL
	init_recoil = RIFLE_RECOIL(2)
	matter = list(MATERIAL_INDSTEEL = 20, MATERIAL_PLASTIC = 10)
	price_tag = 600
	penetration_multiplier = 1.1 //10% more ap
	damage_multiplier = 1.0

//Funni admin gun. Don't use this besides debugging.
/obj/item/gun/projectile/automatic/judge/admin
	name = "\"Purgeinator\" payload rifle"
	desc = "An obscene tool of destruction forged by ancient gods of warfare, sowing horror when you weild this Thunder Striking Wizard Thrasher."
	icon = 'icons/obj/guns/projectile/judge.dmi'
	icon_state = "judge"
	penetration_multiplier = 1.5
	damage_multiplier = 1.5
	init_recoil = RIFLE_RECOIL(1.1)
	fire_delay = 0.5
	init_firemodes = list(
	SEMI_AUTO_NODELAY,
	FULL_AUTO_300,
	)
	serial_type = "BlueCross"
