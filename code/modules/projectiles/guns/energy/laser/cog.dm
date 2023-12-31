/obj/item/gun/energy/cog
	name = "\"Cog\" laser carbine"
	icon = 'icons/obj/guns/energy/cog.dmi'
	icon_state = "cog"
	item_state = null	//so the human update icon uses the icon_state instead.
	item_charge_meter = TRUE
	desc = "A Simulacrum Robotics design, cheap and widely produced. In the distant past - this was the main weapon of low-rank police forces, billions of copies of this gun were made. They are ubiquitous."
	fire_sound = 'sound/weapons/energy/Laser.ogg' // Leaving the OG sound as it's not only iconic but also fitting for an old gun
	slot_flags = SLOT_BELT|SLOT_BACK
	w_class = ITEM_SIZE_BULKY
	matter = list(MATERIAL_ALUMINIUM = 10, MATERIAL_PLASTIC = 15, MATERIAL_GLASS = 5)
	projectile_type = /obj/item/projectile/beam
	fire_delay = 10 //old technology
	charge_cost = 50
	price_tag = 600
	gun_tags = list(GUN_LASER, GUN_ENERGY, GUN_SCOPE)
	init_firemodes = list(
		WEAPON_NORMAL
	)
	twohanded = TRUE
	serial_type = "SR"
	max_upgrades = 4 //Older platform meaning 1 less

	wield_delay = 0.4 SECOND
	wield_delay_factor = 0.2 // 20 vig
	allow_simulacrum_mods = TRUE

	saw_off = TRUE
	sawn = /obj/item/gun/energy/cog/sawn

/obj/item/gun/energy/cog/sawn
	name = "sawn \"Cog\" laser carbine"
	icon = 'icons/obj/guns/energy/obrez_retro.dmi'
	desc = "A Simulacrum Robotics design, cheap and widely produced. In the distant past - this was the main weapon of low-rank police forces, billions of copies of this gun were made. They are ubiquitous.\
			This model appears to have been sawn down. While it appears to have lost one of its focusing lens, it at least fits in a holster now."
	icon_state = "shorty"
	item_state = "shorty"
	fire_sound = 'sound/weapons/energy/laser_pistol.ogg'
	slot_flags = SLOT_BACK|SLOT_HOLSTER
	matter = list(MATERIAL_ALUMINIUM = 5, MATERIAL_PLASTIC = 10, MATERIAL_GLASS = 5)
	damage_multiplier = 0.8
	penetration_multiplier = 0.8
	charge_cost = 50
	price_tag = 350
	gun_tags = list(GUN_LASER, GUN_ENERGY, GUN_SCOPE)
	twohanded = FALSE
	init_recoil = HANDGUN_RECOIL(0.2)
	serial_type = "SR"
	allow_simulacrum_mods = FALSE

