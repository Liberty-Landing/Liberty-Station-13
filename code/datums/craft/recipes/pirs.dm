/datum/craft_recipe/pirs
	category = "PIRS"
	time = 100
	related_stats = list(STAT_COG)
	requiredPerk = PERK_ROBOTICS_EXPERT // Research Provost and Roboticist can craft these

/datum/craft_recipe/pirs/bastion
	name = "Bastion Shield"
	result = /obj/item/shield/riot/bastion
	steps = list(
	list(CRAFT_MATERIAL, 3, MATERIAL_INDSTEEL, "time" = 30),
	list(QUALITY_SAWING, 30, "time" = 60),
	list(CRAFT_MATERIAL, 2, MATERIAL_ALUMINIUM, "time" = 30),
	list(QUALITY_WELDING, 35, "time"= 60),
	list(/obj/item/shield/riot, 1, "time" = 30),
	list(QUALITY_HAMMERING, 45, "time" = 40),
	list(CRAFT_MATERIAL, 1, MATERIAL_LBGLASS, "time" = 30)
	)

// High-end toolmods
// These are no longer researched, just handcrafted.

/datum/craft_recipe/pirs/booster
	name = "Booster"
	result = /obj/item/tool_upgrade/productivity/booster
	steps = list(
		list(CRAFT_MATERIAL, 2, MATERIAL_ALUMINIUM, "time" = 30),
		list(QUALITY_HAMMERING, 30, "time" = 40),
		list(/obj/item/circuitboard, 1),
		list(QUALITY_SCREW_DRIVING, 25, "time" = 90),
		list(/obj/item/stack/cable_coil, 5, "time" = 30),
		list(QUALITY_WIRE_CUTTING, 30, "time" = 10),
		list(/obj/item/stock_parts/micro_laser/ultra, 1, "time" = 30),
		list(QUALITY_PULSING, 15, "time" = 30),
		list(CRAFT_MATERIAL, 1, MATERIAL_PLASTIC, "time" = 30),
		list(CRAFT_MATERIAL, 1, MATERIAL_GOLD, "time" = 30),
		list(QUALITY_BOLT_TURNING, 20, "time" = 40)
	)

/datum/craft_recipe/pirs/plasma_inject
	name = "plasma injector"
	result = /obj/item/tool_upgrade/productivity/injector
	steps = list(
		list(CRAFT_MATERIAL, 5, MATERIAL_INDSTEEL, "time" = 30),
		list(QUALITY_DRILLING, 30, "time" = 40),
		list(CRAFT_MATERIAL, 5, MATERIAL_ALUMINIUM, "time" = 30),
		list(QUALITY_HAMMERING, 30, "time" = 40),
		list(CRAFT_MATERIAL, 5, MATERIAL_HYDROGENC, "time" = 30),
		list(QUALITY_WELDING, 30, "time" = 40),
		list(/obj/item/stock_parts/capacitor/super, 1, "time" = 30),
		list(QUALITY_SCREW_DRIVING, 25, "time" = 90),
		list(QUALITY_PULSING, 15, "time" = 30),
		list(/obj/item/stack/cable_coil, 5, "time" = 30),
		list(QUALITY_WIRE_CUTTING, 30, "time" = 10)
	)

/datum/craft_recipe/pirs/rocket_engine
	name = "rocket engine"
	result = /obj/item/tool_upgrade/productivity/rocket_engine
	icon_state = "electronic"
	steps = list(
		list(CRAFT_MATERIAL, 3, MATERIAL_INDSTEEL, "time" = 60),
		list(CRAFT_MATERIAL, 1, MATERIAL_GOLD, "time" = 20),
		list(QUALITY_CUTTING, 30, "time" = 40),
		list(QUALITY_HAMMERING, 30, "time" = 40),
		list(/obj/item/stack/cable_coil, 10, "time" = 20),
		list(QUALITY_WIRE_CUTTING, 40, 30),
		list(QUALITY_SCREW_DRIVING, 40, "time" = 60),
		list(QUALITY_BOLT_TURNING, 40, "time" = 40)
	)

// NV scope. Really high tech. Requires an ACOG and borosilicate.
/datum/craft_recipe/pirs/watchman
	name = "PIRS \"All Seeing\" scope"
	result = /obj/item/gun_upgrade/scope/watchman
	icon_state = "gun"
	steps = list(
		list(/obj/item/gun_upgrade/scope/acog, 1), // So we rely upon Watch or a sec disk to make
		list(CRAFT_MATERIAL, 3, MATERIAL_INDSTEEL, "time" = 30),
		list(QUALITY_SAWING, 30, "time" = 60),
		list(QUALITY_HAMMERING, 20, "time" = 40),
		list(QUALITY_WELDING, 35, "time" = 40),
		list(CRAFT_MATERIAL, 2, MATERIAL_LBGLASS, "time" = 30),
		list(CRAFT_MATERIAL, 2, MATERIAL_URANIUM, "time" = 30),
		list(QUALITY_CUTTING, 25, "time" = 90)
	)

//STOCK PARTS | PIRS and Union can both craft T3 and T4, but PIRS gets the bulk T4 craft.

/datum/craft_recipe/pirs/handmade_bin
	name = "Hand Giga Matter Bin"
	result = /obj/item/stock_parts/matter_bin/handmade
	steps = list(
		list(/obj/item/stock_parts/matter_bin/super, 1),
		list(QUALITY_SCREW_DRIVING, 10, 70),
		list(CRAFT_MATERIAL, 1, MATERIAL_INDSTEEL), //Quite useless in most cases so were cheaper
		list(CRAFT_MATERIAL, 1, MATERIAL_LBGLASS),
		list(QUALITY_BOLT_TURNING, 10, 70),
		list(QUALITY_WELDING, 35),
		list(QUALITY_HAMMERING, 30),
		list(QUALITY_SAWING, 30)
	)

/datum/craft_recipe/pirs/handmade_manip
	name = "Perfected Flexi-Pico Manipulator"
	result = /obj/item/stock_parts/manipulator/handmade
	steps = list(
		list(/obj/item/stock_parts/manipulator/pico, 1),
		list(QUALITY_SCREW_DRIVING, 35, 70),
		list(CRAFT_MATERIAL, 2, MATERIAL_INDSTEEL), //Are main thing were exspensive do to being the main crafted item
		list(CRAFT_MATERIAL, 2, MATERIAL_PLASTIC),
		list(QUALITY_BOLT_TURNING, 10, 70),
		list(QUALITY_WELDING, 35),
		list(/obj/item/stack/cable_coil, 10),
		list(QUALITY_HAMMERING, 30),
		list(QUALITY_SAWING, 30)
	)

/datum/craft_recipe/pirs/handmade_laser
	name = "Handmade Perfected Ultra High Power Micro-Lasers"
	result = /obj/item/stock_parts/micro_laser/handmade
	steps = list(
		list(/obj/item/stock_parts/micro_laser/ultra, 1),
		list(QUALITY_SCREW_DRIVING, 35, 70),
		list(CRAFT_MATERIAL, 1, MATERIAL_LBGLASS),
		list(CRAFT_MATERIAL, 1, MATERIAL_LGLASS),
		list(QUALITY_BOLT_TURNING, 10, 70),
		list(QUALITY_WELDING, 35),
		list(QUALITY_SAWING, 30)
	)

/datum/craft_recipe/pirs/handmade_scanner
	name = "Overtuned Scanning Module"
	result = /obj/item/stock_parts/scanning_module/handmade
	steps = list(
		list(/obj/item/stock_parts/scanning_module/phasic, 1),
		list(QUALITY_SCREW_DRIVING, 35, 70),
		list(CRAFT_MATERIAL, 1, MATERIAL_GOLD),
		list(QUALITY_BOLT_TURNING, 10, 70),
		list(QUALITY_WELDING, 35),
		list(CRAFT_MATERIAL, 1, MATERIAL_SILVER),
		list(QUALITY_SAWING, 30)
	)

/datum/craft_recipe/pirs/handmade_capacitor
	name = "Crafted Experimental Capacitor"
	result = /obj/item/stock_parts/capacitor/handmade
	steps = list(
		list(/obj/item/stock_parts/capacitor/super, 1),
		list(QUALITY_SCREW_DRIVING, 35, 70),
		list(CRAFT_MATERIAL, 1, MATERIAL_GOLD),
		list(QUALITY_BOLT_TURNING, 10, 70),
		list(QUALITY_WELDING, 35),
		list(CRAFT_MATERIAL, 1, MATERIAL_SILVER),
		list(QUALITY_SAWING, 30)
	)

/datum/craft_recipe/pirs/handmade_bin_box
	name = "Box of Giga Matter Bins"
	result = /obj/item/storage/box/handmade_bin
	steps = list(
		list(/obj/item/stock_parts/matter_bin/super, 4),
		list(QUALITY_SCREW_DRIVING, 10, 70),
		list(CRAFT_MATERIAL, 4, MATERIAL_INDSTEEL),
		list(CRAFT_MATERIAL, 4, MATERIAL_LBGLASS),
		list(QUALITY_BOLT_TURNING, 10, 70),
		list(QUALITY_WELDING, 35),
		list(QUALITY_HAMMERING, 40),
		list(QUALITY_SAWING, 60),
		list(CRAFT_MATERIAL, 1, MATERIAL_CARDBOARD)
	)

/datum/craft_recipe/pirs/handmade_manip_box
	name = "Box of Flexi-Pico Manipulators"
	result = /obj/item/storage/box/handmade_manip
	steps = list(
		list(/obj/item/stock_parts/manipulator/pico, 4),
		list(QUALITY_SCREW_DRIVING, 35, 70),
		list(CRAFT_MATERIAL, 8, MATERIAL_INDSTEEL),
		list(CRAFT_MATERIAL, 8, MATERIAL_PLASTIC),
		list(QUALITY_BOLT_TURNING, 10, 70),
		list(QUALITY_WELDING, 35),
		list(/obj/item/stack/cable_coil, 10),
		list(QUALITY_HAMMERING, 40),
		list(QUALITY_SAWING, 60),
		list(CRAFT_MATERIAL, 1, MATERIAL_CARDBOARD)
	)

/datum/craft_recipe/pirs/handmade_laser_box
	name = "Box of Perfected Ultra High Power Micro-Lasers"
	result = /obj/item/storage/box/handmade_laser
	steps = list(
		list(/obj/item/stock_parts/micro_laser/ultra, 4),
		list(QUALITY_SCREW_DRIVING, 35, 70),
		list(CRAFT_MATERIAL, 4, MATERIAL_LBGLASS),
		list(CRAFT_MATERIAL, 4, MATERIAL_LGLASS),
		list(QUALITY_BOLT_TURNING, 10, 70),
		list(QUALITY_WELDING, 35),
		list(QUALITY_SAWING, 60),
		list(CRAFT_MATERIAL, 1, MATERIAL_CARDBOARD)
	)

/datum/craft_recipe/pirs/handmade_scanner_box
	name = "Box of Over-Tuned Scanning Modules"
	result = /obj/item/storage/box/handmade_scanner
	steps = list(
		list(/obj/item/stock_parts/scanning_module/phasic, 4),
		list(QUALITY_SCREW_DRIVING, 35, 70),
		list(CRAFT_MATERIAL, 4, MATERIAL_GOLD),
		list(QUALITY_BOLT_TURNING, 10, 70),
		list(QUALITY_WELDING, 35),
		list(CRAFT_MATERIAL, 4, MATERIAL_SILVER),
		list(QUALITY_SAWING, 60),
		list(CRAFT_MATERIAL, 1, MATERIAL_CARDBOARD)
	)

/datum/craft_recipe/pirs/handmade_capacitor_box
	name = "Box of Crafted Experimental Capacitors"
	result = /obj/item/storage/box/handmade_capacitor
	steps = list(
		list(/obj/item/stock_parts/capacitor/super, 4),
		list(QUALITY_SCREW_DRIVING, 35, 70),
		list(CRAFT_MATERIAL, 4, MATERIAL_GOLD),
		list(QUALITY_BOLT_TURNING, 10, 70),
		list(QUALITY_WELDING, 35),
		list(CRAFT_MATERIAL, 4, MATERIAL_SILVER),
		list(QUALITY_SAWING, 60),
		list(CRAFT_MATERIAL, 1, MATERIAL_CARDBOARD)
	)
