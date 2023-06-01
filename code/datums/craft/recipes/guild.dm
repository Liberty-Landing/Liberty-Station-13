//PIRS/TFIRMA SPLIT HAS REMOVED LOTS OF STUFF
/datum/craft_recipe/terra
	category = "Terra-Therma"
	time = 100
	related_stats = list(STAT_MEC)
	requiredPerk = PERK_HANDYMAN

//Materal Craft ------------------

/datum/craft_recipe/terra/plasma_glass
	name = "borosilicate glass"
	result = /obj/item/stack/material/glass/plasmaglass
	icon_state = "clothing"
	steps = list(
		list(CRAFT_MATERIAL, 2, MATERIAL_GLASS, "time" = 1),
		list(QUALITY_WELDING, 40, "time" = 5), //Insainly quick do tobeing 1 sheet a time
		list(CRAFT_MATERIAL, 1, MATERIAL_PLASMA, "time" = 1),
		list(QUALITY_WELDING, 40, "time" = 5),
		list(QUALITY_SAWING, 30, "time" = 5)
	)

//Tools --------------------------
/datum/craft_recipe/terra/arcwelder
	name = "arc welder"
	result = /obj/item/tool/baton/arcwelder
	steps = list(
		list(CRAFT_MATERIAL, 2, MATERIAL_PLASTEEL, "time" = 60),
		list(QUALITY_CUTTING, 20, "time" = 40),
		list(QUALITY_HAMMERING, 25, "time" = 40),
		list(/obj/item/stack/cable_coil, 5, "time" = 20),
		list(QUALITY_WIRE_CUTTING, 20, 30),
		list(QUALITY_SCREW_DRIVING, 20, "time" = 60),
		list(QUALITY_BOLT_TURNING, 25, "time" = 40)
	)
/* Currently high end tool loot, and for Skylight
/datum/craft_recipe/terra/omnitool
	name = "Munchkin 5000"
	result = /obj/item/tool/omnitool
	steps = list(
		list(CRAFT_MATERIAL, 4, MATERIAL_PLASTEEL, "time" = 60),
		list(QUALITY_CUTTING, 20, "time" = 40),
		list(QUALITY_HAMMERING, 25, "time" = 40),
		list(/obj/item/stack/cable_coil, 15, "time" = 20),
		list(QUALITY_WIRE_CUTTING, 20, 30),
		list(QUALITY_SCREW_DRIVING, 20, "time" = 60),
		list(QUALITY_BOLT_TURNING, 25, "time" = 40)
	)
*/
/datum/craft_recipe/terra/polytool
	name = "\"jolly co-operation\" polytool"
	result = /obj/item/tool/polytool
	steps = list(
		list(/obj/item/tool/omnitool, 1, "time" = 60),
		list(QUALITY_CUTTING, 20, "time" = 40),
		list(QUALITY_HAMMERING, 30, "time" = 40),
		list(/obj/item/cell/medium, 1, "time" = 60),
		list(/obj/item/stack/cable_coil, 5, "time" = 20),
		list(QUALITY_WIRE_CUTTING, 20, 30),
		list(/obj/item/tool_upgrade/augment/fuel_tank, 1, "time" = 60),
		list(QUALITY_SCREW_DRIVING, 20, "time" = 60),
		list(QUALITY_BOLT_TURNING, 30, "time" = 40)
	)

/datum/craft_recipe/terra/combat_shovel
	name = "combat crovel"
	result = /obj/item/tool/shovel/combat
	steps = list(
		list(/obj/item/tool/shovel, 1),
		list(QUALITY_SAWING, 20, "time" = 40),
		list(QUALITY_HAMMERING, 30, "time" = 40),
		list(CRAFT_MATERIAL, 6, MATERIAL_PLASTEEL, "time" = 60),
		list(QUALITY_SCREW_DRIVING, 20, "time" = 30),
		list(/obj/item/tool_upgrade/augment/spikes, 1),
		list(QUALITY_BOLT_TURNING, 30, "time" = 10)
	)

/datum/craft_recipe/terra/rocket_engine
	name = "rocket engine"
	result = /obj/item/tool_upgrade/productivity/rocket_engine
	icon_state = "electronic"
	steps = list(
		list(CRAFT_MATERIAL, 3, MATERIAL_PLASTEEL, "time" = 60),
		list(CRAFT_MATERIAL, 1, MATERIAL_GOLD, "time" = 20),
		list(QUALITY_CUTTING, 30, "time" = 40),
		list(QUALITY_HAMMERING, 30, "time" = 40),
		list(/obj/item/stack/cable_coil, 10, "time" = 20),
		list(QUALITY_WIRE_CUTTING, 40, 30),
		list(QUALITY_SCREW_DRIVING, 40, "time" = 60),
		list(QUALITY_BOLT_TURNING, 40, "time" = 40)
	)

/datum/craft_recipe/terra/supermop
	name = "pneumatic condensing mop"
	result = /obj/item/mop/guild
	steps = list(
		list(/obj/item/mop, 1),
		list(CRAFT_MATERIAL, 1, MATERIAL_PLASTIC, "time" = 40),
		list(QUALITY_CUTTING, 20, "time" = 40),
		list(QUALITY_HAMMERING, 30, "time" = 40),
		list(/obj/item/stack/cable_coil, 5, "time" = 20),
		list(CRAFT_MATERIAL, 1, MATERIAL_PLASTEEL, "time" = 20),
		list(QUALITY_WIRE_CUTTING, 20, 30),
		list(QUALITY_SCREW_DRIVING, 20, "time" = 60),
		list(QUALITY_BOLT_TURNING, 30, "time" = 40)
	)

/datum/craft_recipe/terra/engimultitool
	name = "\"Little Helper\" Omnitool"
	result = /obj/item/tool/engimultitool
	steps = list(
		list (QUALITY_SCREW_DRIVING, 20, 40),
		list (QUALITY_WIRE_CUTTING, 20, 40),
		list (CRAFT_MATERIAL, 1, MATERIAL_OSMIUM, 60),
		list (QUALITY_WELDING, 30, 20),
		list (CRAFT_MATERIAL, 5, MATERIAL_PLASTEEL, 20),
		list (QUALITY_BOLT_TURNING, 30, 40),
		list (QUALITY_HAMMERING, 30, 20),
		list (/obj/item/stack/cable_coil, 30, 20),
		list (QUALITY_WIRE_CUTTING, 20, 40),
		list (/obj/item/stock_parts/capacitor/super, 1, 40),
		list (QUALITY_PULSING, 30, 20),
		list (/obj/item/stock_parts/manipulator/pico, 1, 30),
		list (QUALITY_SCREW_DRIVING, 30)
	)

//Weapons ------------------------

/datum/craft_recipe/terra/nanopistol
	name = "MKI Forger compressed-matter pistol"
	result = /obj/item/gun/projectile/matter_gun
	steps = list(
		list(CRAFT_MATERIAL, 15, MATERIAL_PLASTEEL, "time" = 15),
		list(QUALITY_CUTTING, 30, "time" = 10),
		list(CRAFT_MATERIAL, 5, MATERIAL_PLASTIC, "time" = 15),
		list(QUALITY_BOLT_TURNING, 40, "time" = 20),
		list(/obj/item/cell/medium, 1, "time" = 5),
		list(/obj/item/computer_hardware/tesla_link, 1, "time" = 10),
		list(QUALITY_SCREW_DRIVING, 40, "time" = 20),
		list(/obj/item/stack/cable_coil, 10, "time" = 15),
		list(QUALITY_WIRE_CUTTING, 40, "time" = 15),
		list(/obj/item/stock_parts/manipulator/nano, 1, "time" = 15),
		list(/obj/item/stock_parts/matter_bin/adv, 1, "time" = 5),
		list(QUALITY_SCREW_DRIVING, 40, "time" = 20),
	)

/datum/craft_recipe/terra/nanoshotgun //kinda bad
	name = "MKII Forger compressed-matter shotgun"
	result = /obj/item/gun/projectile/matter_gun/shotgun
	steps = list(
		list(/obj/item/gun/projectile/matter_gun, 1, "time" = 15),
		list(CRAFT_MATERIAL, 10, MATERIAL_PLASTEEL, "time" = 15),
		list(QUALITY_CUTTING, 30, "time" = 10),
		list(CRAFT_MATERIAL, 12, MATERIAL_PLASTIC, "time" = 15),
		list(QUALITY_BOLT_TURNING, 40, "time" = 20),
		list(/obj/item/cell/large, 1, "time" = 5),
		list(/obj/item/computer_hardware/tesla_link, 1, "time" = 10),
		list(QUALITY_SCREW_DRIVING, 40, "time" = 20),
		list(/obj/item/stack/cable_coil, 20, "time" = 15),
		list(QUALITY_WIRE_CUTTING, 40, "time" = 15),
		list(/obj/item/stock_parts/capacitor/adv, 1, "time" = 10),
		list(/obj/item/stock_parts/micro_laser/high, 1, "time" = 10),
		list(QUALITY_SCREW_DRIVING, 40, "time" = 20),
	)

/* Kept for reference for now. Replacement soon (tm)
//An exspensive but powerful CQC weapon that also can be used as a flar gun
/datum/craft_recipe/terra/abdicatorshotgun
	name ="abdicator energy shotgun"
	result = /obj/item/gun/energy/laser/railgun/abdicator
	steps = list(
		list(CRAFT_MATERIAL, 20, MATERIAL_PLASTEEL, "time" = 15),
		list(QUALITY_CUTTING, 30, "time" = 10),
		list(CRAFT_MATERIAL, 4, MATERIAL_PLASMA, "time" = 15),
		list(QUALITY_BOLT_TURNING, 40, "time" = 20),
		list(QUALITY_HAMMERING, 10, "time" = 20),
		list(/obj/item/stock_parts/smes_coil, 1, "time" = 5),
		list(QUALITY_WELDING, 40, "time" = 15),
		list(/obj/item/cell/large, 1, "time" = 5),
		list(QUALITY_SCREW_DRIVING, 40, "time" = 20),
		list(/obj/item/stack/cable_coil, 30, "time" = 15),
		list(QUALITY_WIRE_CUTTING, 40, "time" = 15),
		list(/obj/item/stock_parts/subspace/ansible, 1, "time" = 1),
		list(QUALITY_SCREW_DRIVING, 40, "time" = 20),
		list(CRAFT_MATERIAL, 10, MATERIAL_WOOD, "time" = 20),
		list(QUALITY_HAMMERING, 30, "time" = 20),
		list(CRAFT_MATERIAL, 6, MATERIAL_RGLASS, "time" = 10),
		list(/obj/item/stock_parts/capacitor/adv, 1, "time" = 10),
		list(/obj/item/stock_parts/micro_laser/high, 1, "time" = 10),
		list(/obj/item/computer_hardware/tesla_link, 1, "time" = 10),
		list(QUALITY_SCREW_DRIVING, 40, "time" = 20),
		list(CRAFT_MATERIAL, 1, MATERIAL_PLASMAGLASS, "time" = 20),
		list(CRAFT_MATERIAL, 1, MATERIAL_URANIUM, "time" = 20),
		list(QUALITY_HAMMERING, 40, "time" = 30),
		list(CRAFT_MATERIAL, 15, MATERIAL_PLASTIC, "time" = 20),
		list(CRAFT_MATERIAL, 4, MATERIAL_STEEL, "time" = 5),
		list(QUALITY_SCREW_DRIVING, 40, "time" = 5)
	)
*/

/datum/craft_recipe/terra/mace
	name = "Combat Mace"
	result = /obj/item/tool/hammer/mace
	steps = list(
		list(CRAFT_MATERIAL, 15, MATERIAL_STEEL, "time" = 30),
		list(QUALITY_SAWING, 30, "time" = 60),
		list(CRAFT_MATERIAL, 1, MATERIAL_PLASTEEL, "time" = 30),
		list(QUALITY_HAMMERING, 30, "time" = 40),
		list(QUALITY_WELDING, 40, "time" = 60)
	)

/datum/craft_recipe/terra/claymore
	name = "Combat Sword"
	result = /obj/item/tool/sword/union
	steps = list(
		list(CRAFT_MATERIAL, 15, MATERIAL_STEEL, "time" = 30),
		list(QUALITY_SAWING, 30, "time" = 60),
		list(QUALITY_HAMMERING, 30, "time" = 40),
		list(QUALITY_WELDING, 40, "time" = 60)
	)

/datum/craft_recipe/terra/machete
	name = "machete"
	result = /obj/item/tool/sword/machete
	steps = list(
		list(CRAFT_MATERIAL, 15, MATERIAL_STEEL, "time" = 30),
		list(QUALITY_SAWING, 30, "time" = 60),
		list(QUALITY_HAMMERING, 30, "time" = 40),
		list(QUALITY_WELDING, 40, "time" = 60)
	)

/datum/craft_recipe/terra/katana
	name = "Diamond Edge Sword"
	result = /obj/item/tool/sword/katana/union
	steps = list(
	list(CRAFT_MATERIAL, 10, MATERIAL_PLASTEEL, "time" = 30),
		list(QUALITY_SAWING, 30, "time" = 60),
	list(CRAFT_MATERIAL, 5, MATERIAL_STEEL, "time" = 30),
		list(QUALITY_WELDING, 40, "time" = 60),
		list(CRAFT_MATERIAL, 1, MATERIAL_DIAMOND, "time" = 30),
		list(QUALITY_HAMMERING, 45, "time" = 40),
		list(/obj/item/tool_upgrade/productivity/whetstone, 1, "time" = 30)
	)

/datum/craft_recipe/terra/firebrand
	name = "firebrand"
	result = /obj/item/tool/sword/katana/firebrand
	steps = list(
	list(CRAFT_MATERIAL, 10, MATERIAL_PLASTEEL, "time" = 30),
	list(QUALITY_SAWING, 30, "time" = 60),
	list(CRAFT_MATERIAL, 5, MATERIAL_STEEL, "time" = 30),
	list(QUALITY_WELDING, 40, "time"= 60),
	list(/obj/item/tool_upgrade/productivity/oxyjet, 1, "time" = 30),
	list(QUALITY_HAMMERING, 45, "time" = 40),
	list(/obj/item/tool_upgrade/augment/fuel_tank, 1, "time" = 30)
	)

/datum/craft_recipe/terra/bastion //Terra can craft this without the shield
	name = "Bastion Shield"
	result = /obj/item/shield/riot/bastion
	steps = list(
	list(CRAFT_MATERIAL, 3, MATERIAL_PLASTEEL, "time" = 30),
	list(QUALITY_SAWING, 30, "time" = 60),
	list(CRAFT_MATERIAL, 2, MATERIAL_STEEL, "time" = 30),
	list(QUALITY_WELDING, 40, "time"= 60),
	list(CRAFT_MATERIAL, 10, MATERIAL_PLASTEEL, "time" = 30),
	list(QUALITY_HAMMERING, 45, "time" = 40),
	list(CRAFT_MATERIAL, 1, MATERIAL_PLASMAGLASS, "time" = 30)
	)

/datum/craft_recipe/terra/safety_clamp
	name = "Hydraulic clamp overclock: KILL CLAMP"
	result = /obj/item/mecha_parts/mecha_equipment/tool/safety_clamp
	steps = list(
		list(/obj/item/mecha_parts/mecha_equipment/tool/hydraulic_clamp, 1, "time" = 60),
		list(QUALITY_BOLT_TURNING, 30, "time" = 40),
		list(/obj/item/tool_upgrade/productivity/motor, 1, "time" = 60),
		list(QUALITY_SCREW_DRIVING, 10, 70),
		list(/obj/item/tool_upgrade/augment/hydraulic, 1, "time" = 60),
		list(QUALITY_SCREW_DRIVING, 10, 70),
		list(CRAFT_MATERIAL, 6, MATERIAL_PLASTEEL),
		list(QUALITY_WELDING, 30, "time" = 40),
		list(/obj/item/tool_upgrade/augment/spikes, 1, "time" = 60)
	)

//Wearables =========================
/datum/craft_recipe/terra/nv_guild
	name = "Optimized NV-MESON Goggles"
	result = /obj/item/clothing/glasses/powered/night/guild/crafted
	icon_state = "clothing"
	steps = list(
		list(/obj/item/clothing/glasses/powered/meson, 1, "time" = 30),
		list(CRAFT_MATERIAL, 1, MATERIAL_RGLASS),
		list(QUALITY_WELDING, 40, "time"= 60),
		list(CRAFT_MATERIAL, 1, MATERIAL_PLASTEEL, "time" = 30),
		list(QUALITY_BOLT_TURNING, 40, "time" = 40),
		list(CRAFT_MATERIAL, 1, MATERIAL_URANIUM, "time" = 20),
		list(QUALITY_WIRE_CUTTING, 40, 30),
		list(/obj/item/stack/cable_coil, 2, "time" = 20),
		list(QUALITY_SCREW_DRIVING, 40, "time" = 60),
	)

/datum/craft_recipe/terra/technosuit
	name = "'Mark V' environmental protection suit"
	result = /obj/item/clothing/suit/armor/vest/technomancersuit
	icon_state = "clothing"
	steps = list(
		list(CRAFT_MATERIAL, 20, MATERIAL_PLASTEEL, "time" = 60),
		list(QUALITY_SAWING, 60, "time" = 60),
		list(QUALITY_WELDING, 40, "time" = 60),
		list(QUALITY_CUTTING, 30, "time" = 40),
		list(QUALITY_HAMMERING, 45, "time" = 40),
		list(/obj/item/stack/cable_coil, 15, "time" = 20),
		list(QUALITY_WIRE_CUTTING, 40, 30),
		list(QUALITY_SCREW_DRIVING, 40, "time" = 60),
		list(QUALITY_BOLT_TURNING, 40, "time" = 40)
	)

/datum/craft_recipe/terra/technohelmet
	name = "'Mark V' environmental protection helmet"
	result = /obj/item/clothing/head/helmet/technomancersuit
	icon_state = "clothing"
	steps = list(
		list(CRAFT_MATERIAL, 10, MATERIAL_PLASTEEL, "time" = 60),
		list(QUALITY_SAWING, 60, "time" = 60),
		list(QUALITY_WELDING, 40, "time" = 60),
		list(QUALITY_CUTTING, 30, "time" = 40),
		list(QUALITY_HAMMERING, 45, "time" = 40),
		list(/obj/item/stack/cable_coil, 15, "time" = 20),
		list(QUALITY_WIRE_CUTTING, 40, 30),
		list(QUALITY_SCREW_DRIVING, 40, "time" = 60),
		list(QUALITY_BOLT_TURNING, 40, "time" = 40)
	)

/datum/craft_recipe/terra/swat_yellow
	name = "Union insulated gloves"
	result = /obj/item/clothing/gloves/insulated/union
	steps = list(
		list(/obj/item/clothing/gloves/thick, 1, "time" = 15),
		list(QUALITY_CUTTING, 15, 10),
		list(/obj/item/clothing/gloves/insulated, 1, "time" = 15),
		list(/obj/item/stack/cable_coil, 2, "time" = 5),
		list(QUALITY_CUTTING, 15, 10),
		list(CRAFT_MATERIAL, 1, MATERIAL_PLASTIC), //So if we use buget we have a reason to think its really shock proof
		list(QUALITY_WELDING, 10, "time" = 40),
		list(CRAFT_MATERIAL, 1, MATERIAL_STEEL),
		list(QUALITY_HAMMERING, 15, 10)
	)

/datum/craft_recipe/terra/webbing
	name = "Terra-Therma Worker's Union web harness"
	icon_state = "clothing"
	result = /obj/item/storage/belt/webbing/union
	steps = list(
		list(/obj/item/storage/belt, 1, "time" = 30),
		list(/obj/item/storage/belt, 1, "time" = 30),
		list(/obj/item/stack/cable_coil, 30, "time" = 30),
		list(/obj/item/storage/pouch/medium_generic, 1, "time" = 40)
	)

/datum/craft_recipe/terra/sheet_stacker
	name = "advanced sheet snatcher"
	icon_state = "woodworking"
	result = /obj/item/storage/bag/sheetsnatcher/guild
	steps = list(
		list(CRAFT_MATERIAL, 4, MATERIAL_WOOD, "time" = 30),
		list(QUALITY_SCREW_DRIVING, 40, "time" = 20),
		list(CRAFT_MATERIAL, 2, MATERIAL_STEEL, "time" = 60),
		list(QUALITY_ADHESIVE, 10, "time" = 60),
		list(/obj/item/stack/cable_coil, 30, "time" = 30),
		list(CRAFT_MATERIAL, 3, MATERIAL_PLASTEEL, "time" = 30),
	)

//Productivity
/datum/craft_recipe/terra/booster
	name = "Booster"
	result = /obj/item/tool_upgrade/productivity/booster
	steps = list(
		list(CRAFT_MATERIAL, 2, MATERIAL_STEEL, "time" = 30),
		list(QUALITY_HAMMERING, 30, "time" = 40),
		list(CRAFT_MATERIAL, 1, MATERIAL_PLASTIC, "time" = 30),
		list(QUALITY_SCREW_DRIVING, 25, "time" = 90),
		list(CRAFT_MATERIAL, 1, MATERIAL_GOLD, "time" = 30),
		list(QUALITY_BOLT_TURNING, 20, "time" = 40)
	)
/*
//Traps
/datum/craft_recipe/terra/guild_mine_trap
	name = "land mine trap"
	result = /obj/item/mine
	icon_state = "gun"
	steps = list(
		list(/obj/item/mine/improvised, 1, "time" = 120),
		list(QUALITY_SCREW_DRIVING, 10, 70),
		list(CRAFT_MATERIAL, 20, MATERIAL_STEEL),
		list(QUALITY_BOLT_TURNING, 10, 70),
		list(/obj/item/stack/cable_coil, 2, "time" = 10)
	)*/

//Machines
/datum/craft_recipe/terra/turretcircuit
	name = "Circuit: Union Turret"
	result = /obj/item/circuitboard/artificer_turret
	icon_state = "electronic"
	steps = list(
		list(/obj/item/computer_hardware/processor_unit/adv, 1, "time" = 30),
		list(/obj/item/stack/cable_coil, 5, "time" = 20),
		list(QUALITY_SCREW_DRIVING, 40, "time" = 90),
		list(QUALITY_WELDING, 40, "time" = 90)
	)

/datum/craft_recipe/terra/matter_nanoforge
	name = "Circuit: Matter Nano-Forge"
	result = /obj/item/circuitboard/matter_nanoforge
	icon_state = "electronic"
	steps = list(
		list(/obj/item/circuitboard/autolathe, 1, "time" = 30),
		list(CRAFT_MATERIAL, 1, MATERIAL_GOLD),
		list(CRAFT_MATERIAL, 1, MATERIAL_SILVER),
		list(/obj/item/stack/cable_coil, 5, "time" = 20),
		list(QUALITY_SCREW_DRIVING, 20, "time" = 90),
		list(QUALITY_WELDING, 30, "time" = 90)
	)

/datum/craft_recipe/terra/matter_nanoforge_blackbox
	name = "Black Box: Matter Nano-Forge"
	result = /obj/item/oddity/blackbox_nanoforge
	steps = list(
		list(/obj/item/computer_hardware/processor_unit, 1, "time" = 120),
		list(QUALITY_SCREW_DRIVING, 20, 70, "time" = 10),
		list(CRAFT_MATERIAL, 12, MATERIAL_PLASTEEL, "time" = 90),
		list(CRAFT_MATERIAL, 2, MATERIAL_RGLASS, "time" = 20),
		list(QUALITY_BOLT_TURNING, 10, 70),
		list(QUALITY_WELDING, 30, "time" = 90),
		list(/obj/item/stack/cable_coil, 10, "time" = 90),
		list(CRAFT_MATERIAL, 1, MATERIAL_DIAMOND, "time" = 20),
		list(/obj/item/stock_parts/manipulator, 1, "time" = 120),
		list(QUALITY_HAMMERING, 30, "time" = 40),
		list(QUALITY_SAWING, 30, "time" = 60),
		//list(QUALITY_DRILLING, 60, "time" = 90),
		list(CRAFT_MATERIAL, 1, MATERIAL_GOLD),
		list(QUALITY_BOLT_TURNING, 10, 70),
		list(CRAFT_MATERIAL, 1, MATERIAL_SILVER)
	)

//T4 stock parts, if you want bulk crafts go to PIRS.

/datum/craft_recipe/terra/handmade_bin
	name = "Hand Giga Matter Bin"
	result = /obj/item/stock_parts/matter_bin/handmade
	steps = list(
		list(/obj/item/stock_parts/matter_bin/super, 1),
		list(QUALITY_SCREW_DRIVING, 10, 70),
		list(CRAFT_MATERIAL, 1, MATERIAL_PLASTEEL), //Quite useless in most cases so were cheaper
		list(CRAFT_MATERIAL, 1, MATERIAL_PLASMAGLASS),
		list(QUALITY_BOLT_TURNING, 10, 70),
		list(QUALITY_WELDING, 35),
		list(QUALITY_HAMMERING, 30),
		list(QUALITY_SAWING, 30)
	)

/datum/craft_recipe/terra/handmade_manip
	name = "Perfected Flexi-Pico Manipulator"
	result = /obj/item/stock_parts/manipulator/handmade
	steps = list(
		list(/obj/item/stock_parts/manipulator/pico, 1),
		list(QUALITY_SCREW_DRIVING, 35, 70),
		list(CRAFT_MATERIAL, 2, MATERIAL_PLASTEEL), //Are main thing were exspensive do to being the main crafted item
		list(CRAFT_MATERIAL, 2, MATERIAL_PLASTIC),
		list(QUALITY_BOLT_TURNING, 10, 70),
		list(QUALITY_WELDING, 35),
		list(/obj/item/stack/cable_coil, 10),
		list(QUALITY_HAMMERING, 30),
		list(QUALITY_SAWING, 30)
	)

/datum/craft_recipe/terra/handmade_laser
	name = "Handmade Perfected Ultra High Power Micro-Lasers"
	result = /obj/item/stock_parts/micro_laser/handmade
	steps = list(
		list(/obj/item/stock_parts/micro_laser/ultra, 1),
		list(QUALITY_SCREW_DRIVING, 35, 70),
		list(CRAFT_MATERIAL, 1, MATERIAL_PLASMAGLASS),
		list(CRAFT_MATERIAL, 1, MATERIAL_RGLASS),
		list(QUALITY_BOLT_TURNING, 10, 70),
		list(QUALITY_WELDING, 35),
		list(QUALITY_SAWING, 30)
	)

/datum/craft_recipe/terra/handmade_scanner
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

/datum/craft_recipe/terra/handmade_capacitor
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
