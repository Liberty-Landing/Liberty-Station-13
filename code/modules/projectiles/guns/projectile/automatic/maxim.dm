/obj/item/gun/projectile/automatic/maxim
	name = "\"Maxim\" machine gun"
	desc = "The design of the \"Maxim\" is centuries old, but still somehow ends up making its way to some war footage somewhere in the universe. \
			Though, this model differs from the historical Maxim machine gun in some ways. Firstly its light-weight build and use of other non-freezing liquids other than water. \
			Secondly is its use of unique 7.62mm pan-magazines, likely borrowed from other top-feeding historical models. An odd work of art.. of course its made by Caravan Enterprise."
	icon = 'icons/obj/guns/projectile/maxim.dmi'
	icon_state = "maxim"
	item_state = "maxim"
	w_class = ITEM_SIZE_HUGE
	force = WEAPON_FORCE_PAINFUL
	slot_flags = SLOT_BACK
	max_shells = 1
	slowdown_hold = 1
	caliber = CAL_RIFLE
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 2)
	load_method = SINGLE_CASING|MAGAZINE
	mag_well = MAG_WELL_PAN
	tac_reloads = FALSE
	matter = list(MATERIAL_PLASTEEL = 42, MATERIAL_PLASTIC = 15, MATERIAL_WOOD = 5)
	price_tag = 2500
	unload_sound 	= 'sound/weapons/guns/interact/lmg_magout.ogg'
	reload_sound 	= 'sound/weapons/guns/interact/lmg_magin.ogg'
	cocked_sound 	= 'sound/weapons/guns/interact/lmg_cock.ogg'
	fire_sound = 'sound/weapons/guns/fire/lmg_fire.ogg'
	init_recoil = HMG_RECOIL(0.8)
	gun_tags = list(GUN_PROJECTILE, GUN_INTERNAL_MAG)
	twohanded = TRUE
	serial_type = "Car-Van"

	init_firemodes = list(
		FULL_AUTO_600,
		list(mode_name="short bursts", mode_desc="dakka 5 shots in quick succession", burst=5,    burst_delay=2, move_delay=6,  icon="burst"),
		list(mode_name="long bursts", mode_desc="Dakka 8 shots in succession",  burst=8, burst_delay=4, move_delay=8,  icon="burst"),
		list(mode_name="suppressing fire", mode_desc="DAKKA 16 shots back to back to keep targets inside cover",  burst=16, burst_delay=4, move_delay=11,  icon="burst")
		)

	wield_delay = 2 SECOND
	wield_delay_factor = 0.5 // 50 vig, it's a heavy mf
	gun_parts = list(/obj/item/part/gun/frame/maxim = 1, /obj/item/part/gun/grip/black = 1, /obj/item/part/gun/mechanism/machinegun = 1, /obj/item/part/gun/barrel/lrifle = 1)

/obj/item/gun/projectile/automatic/maxim/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "[initial(icon_state)]_full"
		set_item_state("_full")
	else
		icon_state = initial(icon_state)
		set_item_state()
	return

/obj/item/part/gun/frame/maxim
	name = "Maxim frame"
	desc = "A Maxim HMG frame. Whatever happens, we have got the Maxim gun and they have not."
	icon_state = "frame_maxim"
	result = /obj/item/gun/projectile/automatic/maxim
	gripvars = list(/obj/item/part/gun/grip/black)
	mechanismvar = /obj/item/part/gun/mechanism/machinegun
	barrelvars = list(/obj/item/part/gun/barrel/lrifle)
	resultvars = list(/obj/item/gun/projectile/automatic/maxim)
