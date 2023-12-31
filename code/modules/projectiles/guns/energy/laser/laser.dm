/obj/item/gun/energy/laser
	name = "\"Kalmyk\" laser rifle"
	desc = "A Astrakhan brand laser carbine. Cheap, outdated, but decent laser rifle for its cost."
	icon = 'icons/obj/guns/energy/laser.dmi' // No longer scoped, stop the lies!
	icon_state = "laser"
	item_state = "laser"
	item_charge_meter = TRUE
	fire_sound = 'sound/weapons/energy/laser_rifle.ogg'
	slot_flags = SLOT_BACK
	w_class = ITEM_SIZE_NORMAL
	force = WEAPON_FORCE_NORMAL
	origin_tech = list(TECH_COMBAT = 3, TECH_MAGNET = 2)
	matter = list(MATERIAL_INDSTEEL = 20, MATERIAL_WOOD = 8, MATERIAL_SILVER = 5)
	price_tag = 550
	projectile_type = /obj/item/projectile/beam/midlaser
	fire_delay = 5
	gun_tags = list(GUN_LASER, GUN_ENERGY, GUN_SCOPE)
	init_firemodes = list(
		WEAPON_NORMAL,
		WEAPON_CHARGE
	)
	twohanded = TRUE
	serial_type = "Ast-Rak"

	wield_delay = 0.4 SECOND
	wield_delay_factor = 0.2 // 20 vig

/obj/item/gun/energy/laser/mounted
	self_recharge = TRUE
	use_external_power = TRUE
	safety = FALSE
	restrict_safety = TRUE
	damage_multiplier = 0.7
	twohanded = FALSE
	serial_type = "PI"

/obj/item/gun/energy/laser/mounted/blitz
	name = "SRF LR \"Strahl\""
	desc = "A miniaturized laser rifle, remounted for robotic use only. Also has the ablity to have a Master Unmaker integrated into it."
	icon_state = "laser_turret"
	damage_multiplier = 0.9
	charge_meter = FALSE
	twohanded = FALSE
	serial_type = "SR"
	gun_tags = list(GUN_LASER, GUN_ENERGY, GUN_SCOPE)
	allow_simulacrum_mods = TRUE

/obj/item/gun/energy/laser/mounted/cyborg
	name = "integrated \"Cog\" laser carbine"
	desc = "A Simulacrum Robotics design, cheap and widely produced. In the distant past - this was the main weapon of low-rank police forces, billions of copies of this gun were made."
	icon = 'icons/obj/guns/energy/cog.dmi'
	icon_state = "cog"
	recharge_time = 4 //Time it takes for shots to recharge (in ticks)
	damage_multiplier = 0.8
	projectile_type = /obj/item/projectile/beam/heavylaser
	cell_type = /obj/item/cell/medium/moebius/high
	charge_cost = 50

/obj/item/gun/energy/captain
	name = "\"Destiny\" energy pistol"
	icon = 'icons/obj/guns/energy/capgun.dmi'
	icon_state = "caplaser"
	item_state = "caplaser"
	item_charge_meter = TRUE
	desc = "This self-recharging weapon is old, yet still robust and reliable. It's marked with an old Simulacrum Robotics brand, a distant reminder of what this corporation was, before it fell to ruin. Also has the ablity to have a Master Unmaker integrated into it."
	force = WEAPON_FORCE_PAINFUL
	fire_sound = 'sound/weapons/energy/laser_pistol.ogg'
	slot_flags = SLOT_BELT|SLOT_BACK|SLOT_HOLSTER
	w_class = ITEM_SIZE_NORMAL
	can_dual = TRUE
	projectile_type = /obj/item/projectile/beam
	origin_tech = null
	self_recharge = TRUE
	price_tag = 2250
	gun_tags = list(GUN_LASER, GUN_ENERGY, GUN_SCOPE)
	init_firemodes = list(
		WEAPON_NORMAL,
		WEAPON_CHARGE
	)
	twohanded = FALSE
	allow_simulacrum_mods = TRUE
	serial_type = "SR"

	wield_delay = 0.3 SECOND
	wield_delay_factor = 0.2 // 20 vig
