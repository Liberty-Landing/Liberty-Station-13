/obj/item/gun/projectile/automatic/ak47
	name = "\"Kalash\" rifle"
	desc = "Weapon of the oppressed, oppressors, and extremists of all flavours. \
			A copy of the Kalashnikov pattern chambered in 7.62mm. This is an polymer, printed copy of the famous wooden design."
	icon = 'icons/obj/guns/projectile/ak.dmi'
	icon_state = "AK"
	item_state = "AK"
	item_suffix = ""
	w_class = ITEM_SIZE_BULKY
	force = WEAPON_FORCE_PAINFUL
	caliber = CAL_RIFLE
	origin_tech = list(TECH_COMBAT = 6, TECH_MATERIAL = 1, TECH_ILLEGAL = 4)
	slot_flags = SLOT_BACK
	load_method = SINGLE_CASING|MAGAZINE
	mag_well = MAG_WELL_RIFLE
	matter = list(MATERIAL_INDSTEEL = 20, MATERIAL_PLASTIC = 10)
	price_tag = 750
	fire_sound = 'sound/weapons/guns/fire/ak.ogg'
	unload_sound 	= 'sound/weapons/guns/interact/ltrifle_magout.ogg'
	reload_sound 	= 'sound/weapons/guns/interact/ltrifle_magin.ogg'
	cocked_sound 	= 'sound/weapons/guns/interact/ltrifle_cock.ogg'
	damage_multiplier = 1
	init_recoil = RIFLE_RECOIL(1)
	gun_tags = list(GUN_PROJECTILE, GUN_SCOPE, GUN_MAGWELL)

	wield_delay = 0.8 SECOND
	wield_delay_factor = 0.3 // 30 vig to insta wield, it is a rifle n' a bit heavy.

	saw_off = TRUE
	sawn = /obj/item/gun/projectile/automatic/ak47/sawn

	gun_parts = list(/obj/item/part/gun/frame/ak47 = 1, /obj/item/part/gun/grip/black = 1, /obj/item/part/gun/mechanism/autorifle = 1, /obj/item/part/gun/barrel/lrifle = 1)

	init_firemodes = list(
		FULL_AUTO_300,
		SEMI_AUTO_NODELAY
		)
	serial_type = "Car-Van"

/obj/item/gun/projectile/automatic/ak47/sawn
	name = "sawn-off \"Kalash\" rifle"
	desc = "Weapon of the oppressed, oppressors, and extremists of all flavours. \
			A copy of the Kalashnikov pattern chambered in 7.62mm and crudely sawed down to a shadow of its former self. Rifle was fine. Was."
	icon = 'icons/obj/guns/projectile/sawnoff/ak.dmi'
	icon_state = "AK"
	item_state = "AK"
	excelsior = FALSE
	w_class = ITEM_SIZE_NORMAL
	force = WEAPON_FORCE_NORMAL
	matter = list(MATERIAL_INDSTEEL = 15, MATERIAL_WOOD = 5)
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 2)
	price_tag = 600
	init_recoil = RIFLE_RECOIL(1.2)
	damage_multiplier = 0.9
	saw_off = FALSE
	serial_type = "Car-Van"
	wield_delay = 0.8 SECOND
	wield_delay_factor = 0.2 // 20 vig for insta wield

//AK-47 base-frame
/obj/item/part/gun/frame/ak47
	name = "AK frame"
	desc = "An AK rifle frame. The eternal firearm."
	icon_state = "frame_ak"
	matter = list(MATERIAL_INDSTEEL = 8)
	result = /obj/item/gun/projectile/automatic/ak47
	gripvars = list(/obj/item/part/gun/grip/black, /obj/item/part/gun/grip/wood)
	resultvars = list(/obj/item/gun/projectile/automatic/ak47, /obj/item/gun/projectile/automatic/ak47/sa)
	mechanismvar = /obj/item/part/gun/mechanism/autorifle
	barrelvars = list(/obj/item/part/gun/barrel/lrifle, /obj/item/part/gun/barrel/srifle)

/obj/item/gun/projectile/automatic/ak47/update_icon()
	..()

	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if (ammo_magazine)
		iconstring += "[ammo_magazine? "_mag[ammo_magazine.max_ammo]": ""]"
		itemstring += "_full"

	if(wielded)
		itemstring += "_doble"

	icon_state = iconstring
	set_item_state(itemstring)

/obj/item/gun/projectile/automatic/ak47/Initialize()
	. = ..()
	update_icon()

/obj/item/gun/projectile/automatic/ak47/sa
	name = "\"Ugil\" carbine"
	desc = "Weapon of the oppressed, oppressors, and extremists of all flavours. \
		 	A copy of the AKM pattern, shortened into a mid-length rifle and chambered in 6.5mm. The left arm of the unfree world."
	icon = 'icons/obj/guns/projectile/ak5.dmi'
	icon_state = "AK"
	item_state = "AK"
	caliber = CAL_SRIFLE
	matter = list(MATERIAL_INDSTEEL = 20, MATERIAL_WOOD = 10)
	price_tag = 700
	init_recoil = RIFLE_RECOIL(1)
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 2)
	saw_off = FALSE
	folding_stock = TRUE
	serial_type = "LG"
	gun_parts = list(/obj/item/part/gun/frame/ak47 = 1, /obj/item/part/gun/grip/wood = 1, /obj/item/part/gun/mechanism/autorifle = 1, /obj/item/part/gun/barrel/srifle = 1)

	wield_delay = 0.6 SECOND
	wield_delay_factor = 0.2 // 20 vig for insta wield

	init_firemodes = list(
		FULL_AUTO_600,
		SEMI_AUTO_NODELAY
		)

/obj/item/gun/projectile/automatic/ak47/sa/update_icon()
	..()

	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if (ammo_magazine)
		iconstring += "[ammo_magazine? "_mag[ammo_magazine.max_ammo]": ""]"
		itemstring += "_full"

	if(!folded)
		iconstring += "_stock"

	if(wielded)
		itemstring += "_doble"

	icon_state = iconstring
	set_item_state(itemstring)

/obj/item/gun/projectile/automatic/ak47/makeshift
	name = "Homemade \"Kalash\" rifle"
	desc = "Weapon of the oppressed, oppressors, and extremists of all flavours. \
			This is a copy of an ancient semi-automatic rifle chambered for 7.62mm. If it won't fire, percussive maintenance should get it working again. \
			It is known for its easy maintenance, and low price. This gun is not in active military service anymore, but has become ubiquitous among criminals and insurgents. \
			This crude copy shows just how forgiving the design can be."
	icon = 'icons/obj/guns/projectile/ak_homemade.dmi'
	w_class = ITEM_SIZE_HUGE
	init_recoil = RIFLE_RECOIL(0.9)
	mag_well = MAG_WELL_RIFLE
	excelsior = FALSE
	gun_parts = list(/obj/item/part/gun = 3 ,/obj/item/stack/material/indsteel = 7)

	origin_tech = list(TECH_COMBAT = 2)	//bad copies don't give good science
	matter = list(MATERIAL_ALUMINIUM = 20, MATERIAL_WOOD = 10)
	damage_multiplier = 1.1
	penetration_multiplier = 0.8

	init_firemodes = list(
		SEMI_AUTO_NODELAY	//too poorly made for burst or automatic
	)
	matter = list(MATERIAL_ALUMINIUM = 22, MATERIAL_INDSTEEL = 18, MATERIAL_PLASTIC = 5, MATERIAL_WOOD = 12)
	price_tag = 500
	serial_type = "INDEX"
	serial_shown = FALSE
	gun_parts = list(/obj/item/part/gun/frame/kalash = 1, /obj/item/part/gun/grip/black = 1, /obj/item/part/gun/mechanism/autorifle/aluminium = 1, /obj/item/part/gun/barrel/lrifle/aluminium = 1)

/obj/item/gun/projectile/automatic/ak47/makeshift/update_icon()
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

/obj/item/part/gun/frame/kalash
	name = "Homemade Kalash frame"
	desc = "A homemade Kalash rifle frame. Cobbled together, but as good as new. Sort of."
	icon_state = "frame_kalash"
	matter = list(MATERIAL_ALUMINIUM = 10)
	resultvars = list(/obj/item/gun/projectile/automatic/ak47/makeshift)
	gripvars = list(/obj/item/part/gun/grip/black)
	mechanismvar = /obj/item/part/gun/mechanism/autorifle/aluminium
	barrelvars = list(/obj/item/part/gun/barrel/lrifle/aluminium, /obj/item/part/gun/barrel/srifle/aluminium)	//6.5mm or 7.62mm.
	nra = FALSE		//This controls if the weapon checks for barrels or not. If you want a gun to have MULTIPLE calibers that it can be chambered in, put FALSE.
