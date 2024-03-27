/obj/item/gun/projectile/automatic/kraut
	name = "\"Kraut\" caseless rifle"
	desc = "A nifty looking futuristic rifle from Earth, even in spite of its date. Chambered in 7mm Caseless.  \
			The rifle appears to have a select fire switch, lacking a full auto but making up for it in both two and three round bursts."
	icon = 'icons/obj/guns/projectile/kraut.dmi'
	icon_state = "kraut"
	item_state = "kraut"
	w_class = ITEM_SIZE_HUGE
	force = WEAPON_FORCE_PAINFUL
	caliber = CAL_CLRIFLE
	origin_tech = list(TECH_COMBAT = 6, TECH_MATERIAL = 1)
	load_method = SINGLE_CASING|MAGAZINE
	mag_well = MAG_WELL_RIFLE
	auto_eject = 1
	matter = list(MATERIAL_INDSTEEL = 25, MATERIAL_PLASTIC = 15)
	price_tag = 1200	//Caseless, scope, that shit.
	fire_sound = 'sound/weapons/guns/fire/m41_shoot.ogg'
	unload_sound 	= 'sound/weapons/guns/interact/ltrifle_magout.ogg'
	reload_sound 	= 'sound/weapons/guns/interact/m41_reload.ogg'
	cocked_sound 	= 'sound/weapons/guns/interact/m41_cocked.ogg'
	damage_multiplier = 1.2
	penetration_multiplier = 1.2
	init_recoil = LMG_RECOIL(0.7)
	gun_tags = list(GUN_PROJECTILE, GUN_MAGWELL)
	gun_parts = list(/obj/item/part/gun/frame/kraut = 1, /obj/item/part/gun/grip/rubber = 1, /obj/item/part/gun/mechanism/autorifle = 1, /obj/item/part/gun/barrel/clrifle = 1)

	init_firemodes = list(
		SEMI_AUTO_NODELAY,
		BURST_2_ROUND,
		BURST_3_ROUND
		)
	serial_type = "ML"

	extra_damage_mult_scoped = 0.2
	zoom_factors = list(0.8)

	wield_delay = 1.4 SECOND
	wield_delay_factor = 0.4 // 40 vig for insta wield

/obj/item/gun/projectile/automatic/kraut/update_icon()
	..()

	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if (ammo_magazine)
		iconstring += "_mag"

	if (!ammo_magazine || !length(ammo_magazine.stored_ammo))
		iconstring += "_slide"

	if (silenced)
		iconstring += "_s"
		itemstring += "_s"

	icon_state = iconstring
	set_item_state(itemstring)

/obj/item/part/gun/frame/kraut
	name = "Kraut frame"
	desc = "A Kraut caseless rifle frame. For true Krauts."
	icon_state = "frame_dallas"
	result = /obj/item/gun/projectile/automatic/kraut
	resultvars = list(/obj/item/gun/projectile/automatic/kraut)
	gripvars = list(/obj/item/part/gun/grip/rubber)
	mechanismvar = /obj/item/part/gun/mechanism/autorifle
	barrelvars = list(/obj/item/part/gun/barrel/clrifle)
