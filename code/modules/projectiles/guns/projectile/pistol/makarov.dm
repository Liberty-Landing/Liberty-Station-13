/obj/item/gun/projectile/makarov
	name = "\"Makarov\" pistol"
	desc = "Old-designed pistol used by space communists. Small and easily concealable. Uses 9mm rounds."
	icon = 'icons/obj/guns/projectile/makarov.dmi'
	icon_state = "makarov"
	w_class = ITEM_SIZE_SMALL
	caliber = CAL_PISTOL
	can_dual = TRUE
	silenced = 0
	matter = list(MATERIAL_PLASTEEL = 8, MATERIAL_PLASTIC = 6)
	fire_sound = 'sound/weapons/guns/fire/9mm_pistol.ogg'
	load_method = SINGLE_CASING|MAGAZINE
	mag_well = MAG_WELL_PISTOL | MAG_WELL_H_PISTOL | MAG_WELL_DRUM
	gun_tags = list(GUN_PROJECTILE, GUN_SILENCABLE, GUN_MAGWELL)
	damage_multiplier = 1.1
	init_recoil = HANDGUN_RECOIL(0.4)
	price_tag = 500
	origin_tech = list(TECH_COMBAT = 3, TECH_MATERIAL = 2, TECH_ILLEGAL = 3)
	init_firemodes = list(
		SEMI_AUTO_NODELAY
		)
	serial_type = "Sol Fed"
	wield_delay = 0.3 SECOND
	wield_delay_factor = 0.2 // 20 vig
	gun_parts = list(/obj/item/part/gun/frame/makarov = 1, /obj/item/part/gun/grip/serb = 1, /obj/item/part/gun/mechanism/pistol = 1, /obj/item/part/gun/barrel/pistol = 1)

/obj/item/part/gun/frame/makarov
	name = "Makarov frame"
	desc = "A Makarov pistol frame. Technology may have stagnated, but effectiveness hasn't."
	icon_state = "frame_makarov"
	result = /obj/item/gun/projectile/makarov
	resultvars = list(/obj/item/gun/projectile/makarov)
	gripvars = list(/obj/item/part/gun/grip/serb)
	mechanismvar = /obj/item/part/gun/mechanism/pistol
	barrelvars = list(/obj/item/part/gun/barrel/pistol)

/obj/item/gun/projectile/makarov/preloaded

/obj/item/gun/projectile/makarov/preloaded/New()
	. = ..()
	ammo_magazine = new /obj/item/ammo_magazine/highcap_pistol_35/rubber(src)

/obj/item/gun/projectile/makarov/update_icon()
	..()

	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if (ammo_magazine)
		iconstring += "_mag"

	if (!ammo_magazine || !length(ammo_magazine.stored_ammo))
		iconstring += "_slide"

	if (flashlight_attachment)
		iconstring += "_tac"

	if (silenced)
		iconstring += "_s"
		itemstring += "_s"

	icon_state = iconstring
	set_item_state(itemstring)


/obj/item/gun/projectile/makarov/capsa
	name = " 9mm \"Malpractice\""
	desc = "A specialized \"Stinger-S\" pistol with improved internals, painted in CAPSA stripes. The CSO's only means of nonlethal defense against problematic patients. Uses 9mm rounds."
	icon = 'icons/obj/guns/projectile/stinger.dmi'
	fire_sound = 'sound/weapons/guns/fire/9mm_pistol.ogg'
	damage_multiplier = 1.2
	penetration_multiplier = 1.1
	price_tag = 200
	serial_type = "PI"
	icon_state = "stingercso"
	item_state = "stingercso"
	gun_parts = list(/obj/item/stack/material/plastic = 6)

/obj/item/gun/projectile/makarov/capsa/auto_eject
	initialized_upgrades = list(/obj/item/gun_upgrade/magwell/auto_eject/no_removal
								)

/obj/item/gun/projectile/makarov/capsa/preloaded_cso
	initialized_upgrades = list(/obj/item/gun_upgrade/muzzle/silencer
								)

/obj/item/gun/projectile/makarov/capsa/preloaded_cso/New()
	. = ..()
	ammo_magazine = new /obj/item/ammo_magazine/highcap_pistol_35/drum/soporific_cso(src)

/obj/item/gun/projectile/makarov/capsa/preloaded

/obj/item/gun/projectile/makarov/capsa/preloaded/New()
	. = ..()
	ammo_magazine = new /obj/item/ammo_magazine/highcap_pistol_35/rubber(src)
