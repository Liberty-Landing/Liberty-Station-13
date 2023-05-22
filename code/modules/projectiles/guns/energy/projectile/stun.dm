/obj/item/gun/energy/taser
	name = "\"Counselor\" stun pistol"
	desc = "The OT \"Counselor\" is a taser gun used for non-lethal takedowns. Designed by Hellion Electronics Concern this pistol is a staple of self-defense and police forces galaxy wide. \
			Unlike many energy weapons, this weapon only features a non-lethal mode. Its compact size allows it to fit within a user's belt however, "
	icon = 'icons/obj/guns/energy/taser.dmi'
	icon_state = "taser"
	item_state = "taser"
	item_charge_meter = TRUE
	matter = list(MATERIAL_PLASTEEL = 12, MATERIAL_PLASTIC = 6, MATERIAL_SILVER = 3)
	price_tag = 450
	charge_cost = 50
	fire_sound = 'sound/weapons/energy/Taser.ogg'
	can_dual = TRUE
	projectile_type = /obj/item/projectile/beam/stun

	init_firemodes = list(
		STUNBOLT
	)

	serial_type = "HEC"
	wield_delay = 0.3 SECOND
	wield_delay_factor = 0.2 // 20 vig

/obj/item/gun/energy/taser/mounted
	name = "mounted taser gun"
	self_recharge = 1
	use_external_power = 1
	safety = FALSE
	restrict_safety = TRUE

	init_firemodes = list(
		STUNBOLT
	)

/obj/item/gun/energy/taser/mounted/cyborg
	name = "taser gun"
	recharge_time = 10 //Time it takes for shots to recharge (in ticks)
	init_firemodes = list(
		STUNBOLT
	)

/obj/item/gun/energy/stunrevolver
	name = "\"Zeus\" stun revolver"
	desc = "Also know as stunrevolver. Older and less precise Hellion Eletronics Concern for non-lethal takedowns. This gun has smaller capacity in exchange for S-cells use.."
	icon = 'icons/obj/guns/energy/stunrevolver.dmi'
	icon_state = "stunrevolver"
	item_state = "stunrevolver"
	fire_sound = 'sound/weapons/Gunshot.ogg'
	can_dual = TRUE
	origin_tech = list(TECH_COMBAT = 3, TECH_MATERIAL = 3, TECH_POWER = 2)
	charge_cost = 50
	matter = list(MATERIAL_PLASTEEL = 12, MATERIAL_STEEL = 6, MATERIAL_SILVER = 2, MATERIAL_PLASTIC = 5)
	price_tag = 750
	suitable_cell = /obj/item/cell/small
	cell_type = /obj/item/cell/small
	projectile_type = /obj/item/projectile/energy/electrode

/obj/item/gun/energy/stunrevolver/sci
	name = "\"Hera\" stun revolver"
	desc = "Also know as stunrevolver. A PIRS copy of the older and less precise Hellion Electronics Concern for non-lethal takedowns. This gun has smaller capacity in exchange for S-cells use."
	icon = 'icons/obj/guns/energy/si_stunrevolver.dmi'
	serial_type = "PI"
