/obj/item/gun/projectile/partizaner
	name = "\"Partizaner\" homemade pistol"
	desc = "The \"Partizaner\" is a relatively known abliet laughed at design. Treated as a last-ditch weapon, it saw major usage during insurections in Coalition space. \
			This gun is typically used to kill someone and take their gun after as it would objectively be better. A bit.. strange, but it worked for them, why not for you?"
	icon = 'icons/obj/guns/projectile/partizaner.dmi'
	icon_state = "partizaner"
	item_state = "partizaner"
	w_class = ITEM_SIZE_SMALL	//"Pocket-sand!"
	caliber = CAL_PISTOL
	origin_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 2)
	matter = list(MATERIAL_INDSTEEL = 12, MATERIAL_WOOD = 5)
	price_tag = 50
	fire_sound = 'sound/weapons/guns/fire/9mm_pistol.ogg'
	can_dual = TRUE
	load_method = SINGLE_CASING|MAGAZINE
	mag_well = MAG_WELL_PISTOL | MAG_WELL_H_PISTOL
	damage_multiplier = 0.8		//Short barrel, tiny as hell, pea-shooter.
	init_recoil = HANDGUN_RECOIL(0.4)
	gun_tags = list(GUN_PROJECTILE, GUN_SILENCABLE)
	serial_type = "INDEX"
	serial_shown = FALSE

	wield_delay = 0 SECOND
	wield_delay_factor = 0		//It's bad.
	gun_parts = list(/obj/item/part/gun/frame/partizaner = 1, /obj/item/part/gun/grip/wood = 1, /obj/item/part/gun/mechanism/pistol/aluminium = 1, /obj/item/part/gun/barrel/pistol/aluminium = 1)

/obj/item/part/gun/frame/partizaner
	name = "Partizaner frame"
	desc = "A Partizaner homemade pistol frame. Yid du partizaner..."
	icon_state = "frame_colt"
	result = /obj/item/gun/projectile/partizaner
	resultvars = list(/obj/item/gun/projectile/partizaner)
	gripvars = list(/obj/item/part/gun/grip/wood)
	mechanismvar = /obj/item/part/gun/mechanism/pistol/aluminium
	barrelvars = list(/obj/item/part/gun/barrel/pistol/aluminium, /obj/item/part/gun/barrel/magnum/aluminium)	//9mm or 10mm.
	nra = FALSE		//This controls if the weapon checks for barrels or not. If you want a gun to have MULTIPLE calibers that it can be chambered in, put FALSE.

/obj/item/gun/projectile/partizaner/update_icon()
	..()

	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if (!ammo_magazine || !length(ammo_magazine.stored_ammo))
		iconstring += "_slide"

	if (silenced)
		iconstring += "_s"
		itemstring += "_s"

	icon_state = iconstring
	set_item_state(itemstring)

/obj/item/gun/projectile/partizaner/Initialize()
	. = ..()
	update_icon()
