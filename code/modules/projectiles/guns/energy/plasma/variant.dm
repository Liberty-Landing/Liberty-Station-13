/obj/item/gun/hydrogen/pistol
	name = "\improper \"Classia\" hydrogen-plasma pistol"
	desc = "A volatile but powerful weapon that uses hydrogen flasks to fire destructive plasma bolts. The brainchild of Phokorus Institute Director Nakharan Mkne, meant to compete with and exceed capabilities of Absolutist \
	own plasma weapon designs, it succeeded. However, it did so by being extremely dangerous, requiring an intelligent and careful operator who can correctly manage the weapon's extreme heat generation over heating without being \
	burnt to a crisp. This variant is a pistol, capable of fitting a holster for discrete travel and easy drawing."
	icon = 'icons/obj/guns/plasma/hydrogen.dmi'
	icon_state = "pistol"
	twohanded = FALSE
	w_class = ITEM_SIZE_NORMAL
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 6, TECH_PLASMA = 5)
	matter = list(MATERIAL_INDSTEEL = 10, MATERIAL_MHYDROGEN = 1, MATERIAL_TRITIUM = 1)
	projectile_type = /obj/item/projectile/hydrogen/pistol
	use_plasma_cost = 10 // 15 shots
	heat_per_shot = 25

	init_firemodes = list(
		list(mode_name = "standard", mode_desc="A large ball of hydrogen to blow up bulwarks or weak targets", projectile_type = /obj/item/projectile/hydrogen/pistol, fire_sound = 'sound/weapons/energy/hydrogen.ogg', icon = "destroy", heat_per_shot = 25, use_plasma_cost = 10),
		list(mode_name = "overclock", mode_desc="A large ball of volatile hydrogen to blow up cover or targets", projectile_type = /obj/item/projectile/hydrogen/pistol/max, fire_sound = 'sound/weapons/energy/hydrogen_heavy.ogg', icon = "vaporize", heat_per_shot = 40, use_plasma_cost = 20)
	)

	wield_delay = 0.3 SECOND
	wield_delay_factor = 0.2 // 20 vig

/obj/item/gun/hydrogen/cannon
	name = "\improper \"Sollex\" hydrogen-plasma cannon"
	desc = "A volatile but powerful weapon that uses hydrogen flasks to fire destructive plasma bolts. The brainchild of Phokorus Institute Director Nakharan Mkne, meant to compete with and exceed capabilities of Absolutist \
	own plasma weapon designs, it succeeded. However, it did so by being extremely dangerous, requiring an intelligent and careful operator who can correctly manage the weapon's extreme heat generation over heating without being \
	burnt to a crisp."
	icon = 'icons/obj/guns/plasma/hydrogen.dmi'
	icon_state = "cannon"
	matter = list(MATERIAL_INDSTEEL = 25, MATERIAL_MHYDROGEN = 2, MATERIAL_TRITIUM = 1)
	origin_tech = list(TECH_COMBAT = 9, TECH_MATERIAL = 7, TECH_PLASMA = 10)
	projectile_type = /obj/item/projectile/hydrogen/cannon
	use_plasma_cost = 15 // 10 shots
	heat_per_shot = 50
	vent_level_timer = 10 SECONDS //10 seconds between vents, but builds heat a lot faster.
	init_firemodes = list(
		list(mode_name = "standard", mode_desc="A large ball of hydrogen to blow up bulwarks or weak targets", projectile_type = /obj/item/projectile/hydrogen/cannon, fire_sound = 'sound/weapons/energy/hydrogen.ogg', fire_delay = 30, icon = "destroy", use_plasma_cost = 15),
		list(mode_name = "overclock", mode_desc="A large ball of volatile hydrogen to blow up cover or targets", projectile_type = /obj/item/projectile/hydrogen/cannon/max, fire_sound = 'sound/weapons/energy/hydrogen_heavy.ogg', fire_delay = 50, icon = "vaporize", use_plasma_cost = 30)
	)
	twohanded = TRUE
	can_dual = FALSE

// Blue cross weapon, no overheat.
/obj/item/gun/hydrogen/incinerator
	name = "\improper \"Reclaimator\" hydrogen-plasma gun"
	desc = "An anomalous weapon refurbished by an unknown person (or group?), their work marked by a blue cross, these weapons are known to vanish and reappear when left alone. \
	This hydrogen-plasma gun has a built-in cooling system, making it impossible to heat up and requiring no venting at all while being incredibly cell-efficient."
	icon_state = "prifle"
	use_plasma_cost = 5 // 60 shots with its snowflake cell, 30 with normals.
	heat_per_shot = 0 // No heat gain.
	origin_tech = list(TECH_COMBAT = 15, TECH_MATERIAL = 7, TECH_PLASMA = 25)
	matter = list(MATERIAL_INDSTEEL = 35, MATERIAL_MHYDROGEN = 3, MATERIAL_TRITIUM = 2)
	init_firemodes = list(
		list(mode_name = "standard", mode_desc="A large ball of hydrogen to blow up bulwarks or weak targets", projectile_type = /obj/item/projectile/hydrogen, fire_sound = 'sound/weapons/energy/hydrogen.ogg', fire_delay = 30, icon = "destroy", use_plasma_cost = 5, icon_state = "prifle"),
		list(mode_name = "overclock", mode_desc="A large ball of volatile hydrogen to blow up cover or targets", projectile_type = /obj/item/projectile/hydrogen/max, fire_sound = 'sound/weapons/energy/hydrogen_heavy.ogg', fire_delay = 50, icon = "vaporize", use_plasma_cost = 10, icon_state = "prifle_crit")
	)
	serial_type = "BlueCross"

/obj/item/gun/hydrogen/incinerator/Initialize()
	..()
	flask = new/obj/item/hydrogen_fuel_cell/bluecross(src) // Comes with its own expanded cell.
