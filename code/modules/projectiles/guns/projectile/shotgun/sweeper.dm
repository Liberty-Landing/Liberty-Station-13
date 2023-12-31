/obj/item/gun/projectile/shotgun/sweeper
	name = "\"Street Sweeper\" auto-shotgun"
	desc = "This magazine-fed shotgun was designed for close quarters combat, nicknamed 'Striker' by boarding parties. \
			Its robust and reliable design allows you to swap magazines on the go and dump as many shells at your foes as you want... \
			if you can manage its recoil, of course. Compatible only with special M12 12 gauge drum magazines."
	icon = 'icons/obj/guns/projectile/sweeper.dmi'
	icon_state = "sweeper"
	w_class = ITEM_SIZE_BULKY
	force = WEAPON_FORCE_PAINFUL
	caliber = CAL_SHOTGUN
	slot_flags = SLOT_BACK
	load_method = SINGLE_CASING|MAGAZINE
	mag_well = MAG_WELL_DRUM //Made for drums, this way it can't be OP despite being literal contractor shotgun
	matter = list(MATERIAL_INDSTEEL = 20, MATERIAL_PLASTIC = 10)
	price_tag = 900
	fire_sound = 'sound/weapons/guns/fire/riot_shotgun.ogg' //Meatier sound
	unload_sound = 'sound/weapons/guns/interact/ltrifle_magout.ogg'
	reload_sound = 'sound/weapons/guns/interact/ltrifle_magin.ogg'
	cocked_sound = 'sound/weapons/guns/interact/ltrifle_cock.ogg'
	damage_multiplier = 0.8		//Strong full-auto due to fire-rate
	init_recoil = RIFLE_RECOIL(0.7)
	serial_type = "LG"
	gun_parts = list(/obj/item/part/gun/frame/sweeper = 1, /obj/item/part/gun/grip/black = 1, /obj/item/part/gun/mechanism/shotgun = 1, /obj/item/part/gun/barrel/shotgun = 1)

	//while also preserving ability to shoot as fast as you can click and maintain recoil good enough
	init_firemodes = list(
		FULL_AUTO_300,
		SEMI_AUTO_NODELAY
		)

	wield_delay = 0.8 SECOND
	wield_delay_factor = 0.4 // 40 vig , after all its designed for CQC

/obj/item/part/gun/frame/sweeper
	name = "Street Sweeper frame"
	desc = "A Street Sweeper shotgun frame. Specially designed to sweep streets and spaceship halls."
	icon_state = "frame_pug"
	result = /obj/item/gun/projectile/shotgun/sweeper
	resultvars = list(/obj/item/gun/projectile/shotgun/sweeper)
	gripvars = list(/obj/item/part/gun/grip/black)
	mechanismvar = /obj/item/part/gun/mechanism/shotgun
	barrelvars = list(/obj/item/part/gun/barrel/shotgun)

/obj/item/gun/projectile/shotgun/sweeper/update_icon()
	cut_overlays()
	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if(ammo_magazine)
		if(ammo_magazine.max_ammo==10)
			add_overlay("sbaw")
		else
			add_overlay("m12[ammo_magazine.ammo_color]")

	if (!ammo_magazine || !length(ammo_magazine.stored_ammo))
		add_overlay("slide")

	if(wielded)
		itemstring += "_doble"
		if(ammo_magazine)
			item_state = wielded_item_state + "_mag"
		else
			item_state = wielded_item_state

	icon_state = iconstring
	set_item_state(itemstring)

/obj/item/gun/projectile/shotgun/sweeper/Initialize()
	. = ..()
	update_icon()
