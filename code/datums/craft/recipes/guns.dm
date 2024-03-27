/datum/craft_recipe/gun
	category = "Guns"
	time = 25
	related_stats = list(STAT_MEC)

/datum/craft_recipe/gun/ammo_kit
	name = "scrap ammo kit"
	result = /obj/item/ammo_kit
	icon_state = "woodworking"
	steps = list(
		list(/obj/item/stack/rods, 5, "time" = 60),
		list(CRAFT_MATERIAL, 2, MATERIAL_ALUMINIUM, "time" = 60),
		list(CRAFT_MATERIAL, 1, MATERIAL_CARDBOARD, "time" = 60),
		list(/obj/item/tool/wirecutters/improvised, 1, "time" = 60),
		list(QUALITY_WELDING, 15, "time" = 30),
		list(QUALITY_CUTTING, 10, "time" = 30),
		list(QUALITY_ADHESIVE, 15, "time" = 30),
		list(QUALITY_SCREW_DRIVING, 15, "time" = 30),
		list(QUALITY_SAWING, 15, "time" = 30)
	)

/datum/craft_recipe/gun/stripper1
	name = "handmade 6.5mm carbine stripper clip"
	result = /obj/item/ammo_magazine/speed_loader_light_rifle_257/empty
	steps = list(
		list(CRAFT_MATERIAL, 1, MATERIAL_ALUMINIUM, "time" = 30),
		list(QUALITY_SAWING, 10, "time" = 30), // Cut the unneeded corners...
		list(QUALITY_HAMMERING, 10, "time" = 30) // ...and hammer them into shape!
	)

/datum/craft_recipe/gun/stripper2
	name = "handmade 7.62mm rifle stripper clip"
	result = /obj/item/ammo_magazine/speed_loader_rifle_75/empty
	steps = list(
		list(CRAFT_MATERIAL, 1, MATERIAL_ALUMINIUM, "time" = 30),
		list(QUALITY_SAWING, 10, "time" = 30),
		list(QUALITY_HAMMERING, 10, "time" = 30)
	)

/datum/craft_recipe/gun/arrows
	name = "Crude arrows (x5)"
	result = /obj/item/ammo_casing/arrow/bulk
	icon_state = "woodworking"
	flags = CRAFT_BATCH
	steps = list(
		list(CRAFT_MATERIAL, 1, MATERIAL_WOOD, "time" = 10),
		list(CRAFT_MATERIAL, 1, MATERIAL_ALUMINIUM, "time" = 10),
		list(CRAFT_MATERIAL, 1, MATERIAL_CARDBOARD, "time" = 10)
	)

/datum/craft_recipe/gun/arrows/practice
	name = "Training arrows (x10)"
	result = /obj/item/ammo_casing/arrow/practice/bulk
	icon_state = "woodworking"
	steps = list(
		list(CRAFT_MATERIAL, 1, MATERIAL_PLASTIC, "time" = 30)
	)

/datum/craft_recipe/gun/arrows/broad
	name = "Broadhead arrows (x5)"
	result = /obj/item/ammo_casing/arrow/broadhead/bulk
	steps = list(
		list(CRAFT_MATERIAL, 1, MATERIAL_WOOD, "time" = 10),
		list(CRAFT_MATERIAL, 1, MATERIAL_ALUMINIUM, "time" = 10),
		list(QUALITY_HAMMERING, 10, "time" = 20), // Flatten the tip so it's broad
		list(CRAFT_MATERIAL, 1, MATERIAL_PLASTIC, "time" = 10),
	)

/datum/craft_recipe/gun/arrows/serrated
	name = "Serrated arrows (x5)"
	result = /obj/item/ammo_casing/arrow/serrated/bulk
	steps = list(
		list(CRAFT_MATERIAL, 1, MATERIAL_WOOD, "time" = 10),
		list(CRAFT_MATERIAL, 1, MATERIAL_ALUMINIUM, "time" = 10),
		list(QUALITY_SAWING, 10, "time" = 20), // Serrate the tip so that it penetrates better
		list(CRAFT_MATERIAL, 1, MATERIAL_PLASTIC, "time" = 10),
	)

/datum/craft_recipe/gun/payload_arrows
	name = "payload arrows (x4)" // Quadrupling the mats needed so that it's not a chore
	result = /obj/item/ammo_casing/arrow/empty_payload/bulk
	icon_state = "woodworking"
	steps = list(
		list(CRAFT_MATERIAL, 4, MATERIAL_INDSTEEL, "time" = 1),
		list(QUALITY_WELDING, 40, "time" = 5),
		list(CRAFT_MATERIAL, 8, MATERIAL_PLASTIC, "time" = 1),
		list(QUALITY_CUTTING, 40, "time" = 5)
	)

/datum/craft_recipe/gun/crossbow_bolts
	name = "crude crossbow bolts"
	result = /obj/item/ammo_casing/rod_bolt/bulk
	icon_state = "gun_part_7"
	steps = list(
		list(/obj/item/stack/rods, 10, "time" = 1),
		list(QUALITY_SAWING, 10, "time" = 5),
		list(QUALITY_HAMMERING, 10, "time" = 5)
	)

/datum/craft_recipe/gun/tacticool_flashlight
	name = "Gun mod: Attachable Flashlight"
	result = /obj/item/gun_upgrade/tacticool_flashlight
	steps = list(
		list(/obj/item/device/lighting/toggleable/flashlight/seclite, 1, "time" = 60),
		list(CRAFT_MATERIAL, 1, MATERIAL_PLASTIC), // The flashlight holder
		list(QUALITY_ADHESIVE, 15, 30) // Tape it together
	)

// Ranged weaponry start here, from basic to laser.

/datum/craft_recipe/gun/bow
	name = "Simple Bow"
	result = /obj/item/gun/projectile/bow
	icon_state = "woodworking"
	steps = list(
		list(CRAFT_MATERIAL, 5, MATERIAL_WOOD, "time" = 20),
		list(QUALITY_SAWING, 10, "time" = 20),
		list(QUALITY_HAMMERING, 10, "time" = 20),
		list(/obj/item/stack/cable_coil, 10, "time" = 10),
		list(QUALITY_WIRE_CUTTING, 10, "time" = 10)
	)

/datum/craft_recipe/weapon/crossbow
	name = "Crossbow"
	result = /obj/item/gun/projectile/crossbow
	steps = list(
		list(CRAFT_MATERIAL, 5, MATERIAL_WOOD),
		list(/obj/item/stack/rods, 3, "time" = 20),
		list(QUALITY_WELDING, 10, "time" = 30),
		list(/obj/item/stack/cable_coil, 10, "time" = 10),
		list(CRAFT_MATERIAL, 3, MATERIAL_PLASTIC, "time" = 10),
		list(QUALITY_SCREW_DRIVING, 5, 10,"time" = 3)
	)

/datum/craft_recipe/gun/rxd
	name = "RXD - Rapid Crossbow Device"
	result = /obj/item/gun/projectile/crossbow/RCD
	steps = list(
		list(/obj/item/rcd, 1, "time" = 30),
		list(QUALITY_SCREW_DRIVING, 10, 30),
		list(QUALITY_SAWING, 10, "time" = 60),
		list(CRAFT_MATERIAL, 5, MATERIAL_WOOD),
		list(QUALITY_WELDING, 10, "time" = 30),
		list(/obj/item/stack/cable_coil, 2, "time" = 10)
	)

// Same as above, using a mech mounted RCD. Recycling!
/datum/craft_recipe/gun/rxd_mech
	name = "Rapid Crossbow Device (Alt)"
	result = /obj/item/gun/projectile/crossbow/RCD
	steps = list(
		list(/obj/item/mecha_parts/mecha_equipment/tool/rcd, 1, "time" = 30),
		list(QUALITY_SCREW_DRIVING, 10, 30),
		list(QUALITY_SAWING, 10, "time" = 60),
		list(CRAFT_MATERIAL, 5, MATERIAL_WOOD),
		list(QUALITY_WELDING, 10, "time" = 30),
		list(/obj/item/stack/cable_coil, 2, "time" = 10)
	)

/datum/craft_recipe/gun/handmaderevolver
	name = "Handmade Revolver"
	result = /obj/item/gun/projectile/revolver/handmade
	steps = list(
		list(CRAFT_MATERIAL, 2, MATERIAL_INDSTEEL),
		list(QUALITY_ADHESIVE, 15, 70),
		list(CRAFT_MATERIAL, 15, MATERIAL_ALUMINIUM),
		list(QUALITY_WELDING, 10, 20),
		list(CRAFT_MATERIAL, 10, MATERIAL_WOOD),
		list(QUALITY_SCREW_DRIVING, 10)
	)

/datum/craft_recipe/gun/partizaner
	name = "Handmade pistol \"Partizaner\""
	result = /obj/item/gun/projectile/partizaner
	steps = list(
		list(CRAFT_MATERIAL, 5, MATERIAL_ALUMINIUM),
		list(QUALITY_WELDING, 10, 20),
		list(CRAFT_MATERIAL, 6, MATERIAL_WOOD),
		list(QUALITY_SCREW_DRIVING, 10),
		list(QUALITY_HAMMERING, 10),
		list(QUALITY_ADHESIVE, 15, 70)
	)

/datum/craft_recipe/gun/luty
	name = "Handmade SMG \"Luty\""
	result = /obj/item/gun/projectile/automatic/luty
	steps = list(
		list(CRAFT_MATERIAL, 10, MATERIAL_ALUMINIUM),
		list(QUALITY_WELDING, 10, 20),
		list(CRAFT_MATERIAL, 5, MATERIAL_PLASTIC),
		list(QUALITY_SCREW_DRIVING, 10),
		list(CRAFT_MATERIAL, 6, MATERIAL_WOOD),
		list(QUALITY_HAMMERING, 10),
		list(QUALITY_ADHESIVE, 15, 70)
	)

/datum/craft_recipe/gun/armgun
	name = "embedded SMG"
	result = /obj/item/organ_module/active/simple/armsmg
	steps = list(
		list(/obj/item/gun/projectile/automatic/luty, 1),
		list(QUALITY_HAMMERING, 10),
		list(CRAFT_MATERIAL, 12, MATERIAL_INDSTEEL, "time" = 10),
		list(QUALITY_WELDING, 10, "time" = 40),
		list(/obj/item/stack/cable_coil, 5, "time" = 20),
		list(CRAFT_MATERIAL, 5, MATERIAL_PLASTIC, "time" = 10),
		list(QUALITY_SCREW_DRIVING, 10),
		list(QUALITY_ADHESIVE, 15, 70)
	)

/datum/craft_recipe/gun/slidebarrelshotgun
	name = "slide barrel shotgun"
	result = /obj/item/gun/projectile/shotgun/slidebarrel
	steps = list(
		list(CRAFT_MATERIAL, 3, MATERIAL_INDSTEEL),
		list(QUALITY_ADHESIVE, 15, 70),
		list(CRAFT_MATERIAL, 20, MATERIAL_ALUMINIUM),
		list(QUALITY_WELDING, 10, 20),
		list(CRAFT_MATERIAL, 10, MATERIAL_WOOD),
		list(QUALITY_SCREW_DRIVING, 10)
	)

/datum/craft_recipe/gun/handmaderifle
	name = "Handmade bolt action rifle"
	result = /obj/item/gun/projectile/boltgun/handmade
	steps = list(
		list(CRAFT_MATERIAL, 3, MATERIAL_INDSTEEL),
		list(QUALITY_ADHESIVE, 15, 70),
		list(CRAFT_MATERIAL, 10, MATERIAL_ALUMINIUM),
		list(QUALITY_WELDING, 10, 20),
		list(CRAFT_MATERIAL, 5, MATERIAL_WOOD),
		list(QUALITY_SCREW_DRIVING, 10)
	)

/datum/craft_recipe/gun/kalash
	name = "Makeshift 7.62 \"Kalash\""
	result = /obj/item/gun/projectile/automatic/ak47/makeshift
	steps = list(
		list(CRAFT_MATERIAL, 20, MATERIAL_ALUMINIUM),
		list(QUALITY_WELDING, 10, 20),
		list(CRAFT_MATERIAL, 5, MATERIAL_PLASTIC),
		list(QUALITY_SCREW_DRIVING, 10),
		list(/obj/item/stack/rods, 2, "time" = 10),
		list(QUALITY_HAMMERING, 10),
		list(CRAFT_MATERIAL, 6, MATERIAL_WOOD),
		list(QUALITY_HAMMERING, 10),
		list(QUALITY_ADHESIVE, 15, 70)
	)

/datum/craft_recipe/gun/makeshiftgl
	name = "makeshift grenade launcher"
	result = /obj/item/gun/projectile/shotgun/pump/china/makeshift
	steps = list(
		list(CRAFT_MATERIAL, 3, MATERIAL_INDSTEEL),
		list(QUALITY_ADHESIVE, 15, 70),
		list(CRAFT_MATERIAL, 20, MATERIAL_ALUMINIUM),
		list(QUALITY_WELDING, 10, 20),
		list(CRAFT_MATERIAL, 10, MATERIAL_WOOD),
		list(QUALITY_SCREW_DRIVING, 10)
	)

/datum/craft_recipe/gun/shrapnelcannon
	name = "\"Shellshock\" scrap rifle"
	result = /obj/item/gun/energy/shrapnel
	icon_state = "gun"
	steps = list(
		list(CRAFT_MATERIAL, 20, MATERIAL_INDSTEEL, "time" = 60),
		list(CRAFT_MATERIAL, 8, MATERIAL_ALUMINIUM, "time" = 60),
		list(QUALITY_CUTTING, 20, "time" = 40),
		list(QUALITY_HAMMERING, 20, "time" = 40),
		list(/obj/item/stack/cable_coil, 10, "time" = 20),
		list(QUALITY_WIRE_CUTTING, 20, 30),
		list(QUALITY_SCREW_DRIVING, 20, "time" = 60),
		list(QUALITY_BOLT_TURNING, 30, "time" = 40)
	)

/datum/craft_recipe/gun/makeshiftlaser
	name = "makeshift laser carbine"
	result = /obj/item/gun/energy/laser/makeshift
	steps = list(
		list(CRAFT_MATERIAL, 4, MATERIAL_INDSTEEL, "time" = 60),
		list(QUALITY_ADHESIVE, 15, 70),
		list(CRAFT_MATERIAL, 20, MATERIAL_ALUMINIUM),
		list(QUALITY_WELDING, 10, 20),
		list(CRAFT_MATERIAL, 15, MATERIAL_PLASTIC),
		list(/obj/item/stock_parts/micro_laser , 4),
		list(QUALITY_SCREW_DRIVING, 10)
	)

/datum/craft_recipe/gun/multi_laser
	name = "Pulse-Laser Cannon"
	result = /obj/item/mecha_parts/mecha_equipment/ranged_weapon/energy/laser/heavy/auto
	steps = list(
		list(/obj/item/mecha_parts/mecha_equipment/ranged_weapon/energy/laser/heavy, 1, "time" = 60),
		list(QUALITY_WELDING, 30, "time" = 180),
		list(CRAFT_MATERIAL, 4, MATERIAL_INDSTEEL, "time" = 60),
		list(QUALITY_ADHESIVE, 15, 70),
		list(CRAFT_MATERIAL, 20, MATERIAL_ALUMINIUM),
		list(QUALITY_WELDING, 10, 20),
		list(CRAFT_MATERIAL, 15, MATERIAL_PLASTIC),
		list(/obj/item/stock_parts/micro_laser , 4),
		list(QUALITY_SCREW_DRIVING, 30)
	)
