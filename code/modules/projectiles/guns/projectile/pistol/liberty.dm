/obj/item/gun/projectile/liberty
	name = "\"Liberty\" pistol"
	desc = "Staple of the Liberty Group, the \"Liberty\" was designed as a weapon made for civilian markets and sold with self defense in mind. \
			The gun by this point is a bit outdated, being first introduced to markets nearly 100 years ago now. But this 9mm classic just won't die."
	icon = 'icons/obj/guns/projectile/liberty.dmi'
	icon_state = "liberty"
	item_state = "liberty"
	w_class = ITEM_SIZE_SMALL
	caliber = CAL_PISTOL
	can_dual = TRUE
	origin_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 2)
	matter = list(MATERIAL_PLASTIC = 6)
	price_tag = 250
	fire_sound = 'sound/weapons/guns/fire/9mm_pistol.ogg'
	load_method = SINGLE_CASING|MAGAZINE
	mag_well = MAG_WELL_PISTOL | MAG_WELL_H_PISTOL
	gun_tags = list(GUN_PROJECTILE, GUN_SILENCABLE, GUN_MAGWELL)
	init_recoil = HANDGUN_RECOIL(1)
	serial_type = "LG"

	wield_delay = 0 SECOND
	gun_parts = list(/obj/item/part/gun/frame/liberty = 1, /obj/item/part/gun/grip/black = 1, /obj/item/part/gun/mechanism/pistol = 1, /obj/item/part/gun/barrel/pistol = 1)

/obj/item/part/gun/frame/liberty
	name = "Liberty frame"
	desc = "A Liberty pistol frame. Give me liberty, or give me death!"
	icon_state = "frame_liberty"
	result = /obj/item/gun/projectile/liberty
	resultvars = list(/obj/item/gun/projectile/liberty)
	gripvars = list(/obj/item/part/gun/grip/black)
	mechanismvar = /obj/item/part/gun/mechanism/pistol
	barrelvars = list(/obj/item/part/gun/barrel/pistol)

/obj/item/gun/projectile/liberty/preloaded

/obj/item/gun/projectile/liberty/preloaded/New()
	. = ..()
	ammo_magazine = new /obj/item/ammo_magazine/highcap_pistol_35/rubber(src)

/obj/item/gun/projectile/liberty/update_icon()
	..()

	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if (ammo_magazine)
		iconstring += "_mag"

	if (!ammo_magazine || !length(ammo_magazine.stored_ammo))
		iconstring += "_slide"

	if(flashlight_attachment)
		iconstring += "_tac"

	if (silenced)
		iconstring += "_s"
		itemstring += "_s"

	icon_state = iconstring
	set_item_state(itemstring)
