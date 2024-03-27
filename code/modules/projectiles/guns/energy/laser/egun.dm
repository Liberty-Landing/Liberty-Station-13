/obj/item/gun/energy/gun
	name = "\"Edison\" energy pistol"
	desc = "The Edison is a versatile energy based sidearm, capable of switching between low and high capacity projectile settings. In other words: Stun or Kill."
	icon = 'icons/obj/guns/energy/egun.dmi'
	icon_state = "energystun100"
	item_state = null	//so the human update icon uses the icon_state instead.
	item_charge_meter = TRUE
	can_dual = TRUE
	fire_sound = 'sound/weapons/energy/laser_pistol.ogg'
	charge_cost = 100
	matter = list(MATERIAL_INDSTEEL = 13, MATERIAL_PLASTIC = 6, MATERIAL_SILVER = 6)
	price_tag = 450

	projectile_type = /obj/item/projectile/beam/stun
	origin_tech = list(TECH_COMBAT = 3, TECH_MAGNET = 2)
	modifystate = "energystun"
	item_modifystate = "stun"

	init_firemodes = list(
		STUNBOLT,
		list(mode_name="kill", mode_desc="Fires a lethal laser projectile", projectile_type=/obj/item/projectile/beam, item_modifystate="kill", fire_sound='sound/weapons/energy/laser_pistol.ogg', icon="kill"), // This is so that it uses the laser pistol firing sound. Use the LETHAL define for stock energy rifles.
		WEAPON_CHARGE,
		)
	serial_type = "HEC"

	wield_delay = 0.3 SECOND
	wield_delay_factor = 0.2 // 20 vig

/obj/item/gun/energy/gun/mounted
	name = "mounted energy gun"
	self_recharge = 1
	use_external_power = 1
	safety = FALSE
	restrict_safety = TRUE

/obj/item/gun/energy/ntpistol
	name = "\"Odesk\" energy pistol"
	desc = "An Astrakhan brand laser pistol. Small, cheap, and easily concealable. Perfect for a gambler, a mother, or a child's first handgun - or at least that's what the label says."
	icon = 'icons/obj/guns/energy/ntpistol.dmi'
	icon_state = "ntpistol"
	item_state = "ntpistol"
	item_charge_meter = TRUE
	fire_sound = 'sound/weapons/energy/Laser.ogg'
	origin_tech = list(TECH_COMBAT = 2, TECH_MAGNET = 1)
	w_class = ITEM_SIZE_SMALL
	projectile_type = /obj/item/projectile/beam
	charge_cost = 50
	can_dual = TRUE
	matter = list(MATERIAL_INDSTEEL = 4, MATERIAL_WOOD = 4, MATERIAL_SILVER = 2)
	price_tag = 200
	init_firemodes = list(
		LETHAL,
		WEAPON_CHARGE
	)
	twohanded = FALSE
	suitable_cell = /obj/item/cell/small
	cell_type = /obj/item/cell/small
	serial_type = "Ast-Rak"
