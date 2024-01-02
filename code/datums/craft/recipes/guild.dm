/datum/craft_recipe/terra
	category = "Terra-Therma"
	time = 100
	related_stats = list(STAT_MEC)
	requiredPerk = PERK_HANDYMAN

// Armor platings back because they belong here more than with science

/datum/craft_recipe/terra/handmade
	name = "Union Improvised Armor Upgrade Kit"
	result = /obj/item/tool_upgrade/armor/handmade
	icon_state = "armor_frame"
	steps = list(
		list(CRAFT_MATERIAL, 25, MATERIAL_ALUMINIUM, "time" = 40),
		list(QUALITY_WELDING, 35, "time" = 60),
		list(QUALITY_CUTTING, 30, "time" = 60),
		list(CRAFT_MATERIAL, 5, MATERIAL_INDSTEEL, 40),
		list(QUALITY_WELDING, 35, "time" = 40),
		list(/obj/item/tool_upgrade/reinforcement/plating, 1, "time" = 20),
		list(QUALITY_WELDING, 35, "time" = 60),
		list(QUALITY_HAMMERING, 30, "time" = 60),
		list(QUALITY_SCREW_DRIVING, 35, "time" = 20),
		list(/obj/item/tool_upgrade/reinforcement/rubbermesh, 1),
		list(QUALITY_BOLT_TURNING, 30, "time" = 120),
		list(QUALITY_HAMMERING, 30, "time" = 60),
		list(QUALITY_ADHESIVE, 10, "time" = 20),
	)

/*/datum/craft_recipe/terra/melee//deleted recipes due to balance
	name = "melee plating"
	result = /obj/item/tool_upgrade/armor/melee
	icon_state = "clothing"
	steps = list(
		list(CRAFT_MATERIAL, 30, MATERIAL_ALUMINIUM, "time" = 60),
		list(QUALITY_WELDING, 35, "time" = 60),
		list(QUALITY_CUTTING, 30, "time" = 180),
		list(QUALITY_HAMMERING, 30, "time" = 180),
		list(QUALITY_SCREW_DRIVING, 35, "time" = 90),
		list(/obj/item/tool_upgrade/reinforcement/rubbermesh, 1),
		list(QUALITY_BOLT_TURNING, 30, "time" = 120),
		list(QUALITY_SAWING, 30, "time" = 60)
	)

/datum/craft_recipe/terra/bullet
	name = "ballistic plating"
	result = /obj/item/tool_upgrade/armor/bullet
	icon_state = "clothing"
	steps = list(
		list(CRAFT_MATERIAL, 10, MATERIAL_INDSTEEL, "time" = 20),
		list(CRAFT_MATERIAL, 10, MATERIAL_PLASTIC , "time" = 20),
		list(CRAFT_MATERIAL, 10, MATERIAL_ALUMINIUM, "time" = 20),
		list(QUALITY_WELDING, 35, "time" = 60),
		list(QUALITY_CUTTING, 30, "time" = 180),
		list(QUALITY_HAMMERING, 30, "time" = 180),
		list(/obj/item/tool_upgrade/reinforcement/rubbermesh, 1),
		list(QUALITY_SCREW_DRIVING, 35, "time" = 90),
		list(QUALITY_BOLT_TURNING, 30, "time" = 120),
		list(QUALITY_SAWING, 30, "time" = 60)
	)

/datum/craft_recipe/terra/energy
	name = "energy plating"
	result = /obj/item/tool_upgrade/armor/energy
	icon_state = "clothing"
	steps = list(
		list(CRAFT_MATERIAL, 2, MATERIAL_TITANIUM, "time" = 30),
		list(CRAFT_MATERIAL, 5, MATERIAL_PLASTIC , "time" = 30),
		list(QUALITY_WELDING, 35, "time" = 60),
		list(QUALITY_CUTTING, 30, "time" = 180),
		list(QUALITY_HAMMERING, 30, "time" = 180),
		list(QUALITY_SCREW_DRIVING, 35, "time" = 90),
		list(/obj/item/tool_upgrade/reinforcement/rubbermesh, 1),
		list(QUALITY_BOLT_TURNING, 30, "time" = 120),
		list(QUALITY_SAWING, 30, "time" = 60)
	)

/datum/craft_recipe/terra/bomb
	name = "bomb proofing"
	result = /obj/item/tool_upgrade/armor/bomb
	icon_state = "clothing"
	steps = list(
		list(CRAFT_MATERIAL, 10, MATERIAL_INDSTEEL, "time" = 60),
		list(CRAFT_MATERIAL, 30, MATERIAL_ALUMINIUM, "time" = 60),
		list(QUALITY_WELDING, 35, "time" = 60),
		list(QUALITY_CUTTING, 30, "time" = 180),
		list(QUALITY_HAMMERING, 30, "time" = 180),
		list(QUALITY_SCREW_DRIVING, 35, "time" = 90),
		list(/obj/item/tool_upgrade/reinforcement/rubbermesh, 1),
		list(QUALITY_BOLT_TURNING, 30, "time" = 120),
		list(QUALITY_SAWING, 30, "time" = 60)
	)
*/
//Material Craft ------------------

/datum/craft_recipe/terra/plasma_glass
	name = "mendsilicate glass"
	result = /obj/item/stack/material/glass/mendsilicate
	icon_state = "clothing"
	steps = list(
		list(CRAFT_MATERIAL, 2, MATERIAL_GLASS, "time" = 1),
		list(QUALITY_WELDING, 40, "time" = 5), //Insainly quick do tobeing 1 sheet a time
		list(CRAFT_MATERIAL, 1, MATERIAL_HYDROGENC, "time" = 1),
		list(QUALITY_WELDING, 40, "time" = 5),
		list(QUALITY_SAWING, 30, "time" = 5)
	)

//Tools --------------------------
/datum/craft_recipe/terra/arcwelder
	name = "arc welder"
	result = /obj/item/tool/baton/arcwelder
	steps = list(
		list(CRAFT_MATERIAL, 2, MATERIAL_INDSTEEL, "time" = 60),
		list(QUALITY_CUTTING, 20, "time" = 40),
		list(QUALITY_HAMMERING, 25, "time" = 40),
		list(/obj/item/stack/cable_coil, 5, "time" = 20),
		list(QUALITY_WIRE_CUTTING, 20, 30),
		list(QUALITY_SCREW_DRIVING, 20, "time" = 60),
		list(QUALITY_BOLT_TURNING, 25, "time" = 40)
	)
/* Currently high end tool loot, and ordered through Skylight
/datum/craft_recipe/terra/omnitool
	name = "Munchkin 5000"
	result = /obj/item/tool/omnitool
	steps = list(
		list(CRAFT_MATERIAL, 4, MATERIAL_INDSTEEL, "time" = 60),
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
		list(CRAFT_MATERIAL, 6, MATERIAL_INDSTEEL, "time" = 60),
		list(QUALITY_SCREW_DRIVING, 20, "time" = 30),
		list(/obj/item/tool_upgrade/augment/spikes, 1),
		list(QUALITY_BOLT_TURNING, 30, "time" = 10)
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
		list(CRAFT_MATERIAL, 1, MATERIAL_INDSTEEL, "time" = 20),
		list(QUALITY_WIRE_CUTTING, 20, 30),
		list(QUALITY_SCREW_DRIVING, 20, "time" = 60),
		list(QUALITY_BOLT_TURNING, 30, "time" = 40)
	)

/datum/craft_recipe/terra/engimultitool
	name = "\"Little Helper\" Omnitool"
	result = /obj/item/tool/engimultitool
	steps = list(
		list(CRAFT_MATERIAL, 5, MATERIAL_INDSTEEL, 60),
		list(QUALITY_WELDING, 30, 20),
		list(/obj/item/circuitboard, 1),
		list(QUALITY_SCREW_DRIVING, 20, 40),
		list(QUALITY_WIRE_CUTTING, 20, 40),
		list(CRAFT_MATERIAL, 3, MATERIAL_ALUMINIUM, 20),
		list(QUALITY_BOLT_TURNING, 30, 40),
		list(QUALITY_HAMMERING, 30, 20),
		list(/obj/item/stack/cable_coil, 30, 20),
		list(QUALITY_WIRE_CUTTING, 20, 40),
		list(/obj/item/stock_parts/capacitor/super, 1, 40),
		list(QUALITY_PULSING, 30, 20),
		list(/obj/item/stock_parts/manipulator/pico, 1, 30),
		list(QUALITY_SCREW_DRIVING, 30)
	)

//Weapons ------------------------

/datum/craft_recipe/terra/nanopistol
	name = "MKI Forger compressed-matter pistol"
	result = /obj/item/gun/projectile/matter_gun
	steps = list(
		list(CRAFT_MATERIAL, 15, MATERIAL_INDSTEEL, "time" = 15),
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
		list(CRAFT_MATERIAL, 10, MATERIAL_INDSTEEL, "time" = 15),
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
		list(CRAFT_MATERIAL, 20, MATERIAL_INDSTEEL, "time" = 15),
		list(QUALITY_CUTTING, 30, "time" = 10),
		list(CRAFT_MATERIAL, 4, MATERIAL_HYDROGENC, "time" = 15),
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
		list(CRAFT_MATERIAL, 6, MATERIAL_LGLASS, "time" = 10),
		list(/obj/item/stock_parts/capacitor/adv, 1, "time" = 10),
		list(/obj/item/stock_parts/micro_laser/high, 1, "time" = 10),
		list(/obj/item/computer_hardware/tesla_link, 1, "time" = 10),
		list(QUALITY_SCREW_DRIVING, 40, "time" = 20),
		list(CRAFT_MATERIAL, 1, MATERIAL_LBGLASS, "time" = 20),
		list(CRAFT_MATERIAL, 1, MATERIAL_URANIUM, "time" = 20),
		list(QUALITY_HAMMERING, 40, "time" = 30),
		list(CRAFT_MATERIAL, 15, MATERIAL_PLASTIC, "time" = 20),
		list(CRAFT_MATERIAL, 4, MATERIAL_ALUMINIUM, "time" = 5),
		list(QUALITY_SCREW_DRIVING, 40, "time" = 5)
	)
*/

/datum/craft_recipe/terra/mace
	name = "Combat Mace"
	result = /obj/item/tool/hammer/mace
	steps = list(
		list(CRAFT_MATERIAL, 15, MATERIAL_ALUMINIUM, "time" = 30),
		list(QUALITY_SAWING, 30, "time" = 60),
		list(CRAFT_MATERIAL, 1, MATERIAL_INDSTEEL, "time" = 30),
		list(QUALITY_HAMMERING, 30, "time" = 40),
		list(QUALITY_WELDING, 40, "time" = 60)
	)

/datum/craft_recipe/terra/claymore
	name = "Combat Sword"
	result = /obj/item/tool/sword/union
	steps = list(
		list(CRAFT_MATERIAL, 15, MATERIAL_ALUMINIUM, "time" = 30),
		list(QUALITY_SAWING, 30, "time" = 60),
		list(QUALITY_HAMMERING, 30, "time" = 40),
		list(QUALITY_WELDING, 40, "time" = 60)
	)

/datum/craft_recipe/terra/machete
	name = "machete"
	result = /obj/item/tool/sword/machete
	steps = list(
		list(CRAFT_MATERIAL, 15, MATERIAL_ALUMINIUM, "time" = 30),
		list(QUALITY_SAWING, 30, "time" = 60),
		list(QUALITY_HAMMERING, 30, "time" = 40),
		list(QUALITY_WELDING, 40, "time" = 60)
	)

/datum/craft_recipe/terra/katana
	name = "Diamond Edge Sword"
	result = /obj/item/tool/sword/katana/union
	steps = list(
	list(CRAFT_MATERIAL, 10, MATERIAL_INDSTEEL, "time" = 30),
		list(QUALITY_SAWING, 30, "time" = 60),
	list(CRAFT_MATERIAL, 5, MATERIAL_ALUMINIUM, "time" = 30),
		list(QUALITY_WELDING, 40, "time" = 60),
		list(CRAFT_MATERIAL, 1, MATERIAL_DIAMOND, "time" = 30),
		list(QUALITY_HAMMERING, 45, "time" = 40),
		list(/obj/item/tool_upgrade/productivity/whetstone, 1, "time" = 30)
	)

/datum/craft_recipe/terra/firebrand
	name = "Firebrand"
	result = /obj/item/tool/sword/katana/firebrand
	steps = list(
	list(CRAFT_MATERIAL, 10, MATERIAL_INDSTEEL, "time" = 30),
	list(QUALITY_SAWING, 30, "time" = 60),
	list(CRAFT_MATERIAL, 5, MATERIAL_ALUMINIUM, "time" = 30),
	list(QUALITY_WELDING, 40, "time"= 60),
	list(/obj/item/tool_upgrade/productivity/oxyjet, 1, "time" = 30),
	list(QUALITY_HAMMERING, 45, "time" = 40),
	list(/obj/item/tool_upgrade/augment/fuel_tank, 1, "time" = 30)
	)

/datum/craft_recipe/terra/bastion //Terra can craft this without the shield
	name = "Bastion Shield"
	result = /obj/item/shield/riot/bastion
	steps = list(
	list(CRAFT_MATERIAL, 3, MATERIAL_INDSTEEL, "time" = 30),
	list(QUALITY_SAWING, 30, "time" = 60),
	list(CRAFT_MATERIAL, 2, MATERIAL_ALUMINIUM, "time" = 30),
	list(QUALITY_WELDING, 40, "time"= 60),
	list(CRAFT_MATERIAL, 10, MATERIAL_INDSTEEL, "time" = 30),
	list(QUALITY_HAMMERING, 45, "time" = 40),
	list(CRAFT_MATERIAL, 1, MATERIAL_LBGLASS, "time" = 30)
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
		list(CRAFT_MATERIAL, 6, MATERIAL_INDSTEEL),
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
		list(CRAFT_MATERIAL, 1, MATERIAL_LGLASS),
		list(QUALITY_WELDING, 40, "time"= 60),
		list(CRAFT_MATERIAL, 1, MATERIAL_INDSTEEL, "time" = 30),
		list(QUALITY_BOLT_TURNING, 40, "time" = 40),
		list(CRAFT_MATERIAL, 1, MATERIAL_URANIUM, "time" = 20),
		list(QUALITY_WIRE_CUTTING, 40, 30),
		list(/obj/item/stack/cable_coil, 2, "time" = 20),
		list(QUALITY_SCREW_DRIVING, 40, "time" = 60)
	)

//Base union suit that all suits are crafted from
/datum/craft_recipe/terra/technosuit
	name = "'Mark V' environmental protection suit"
	result = /obj/item/clothing/suit/armor/vest/technomancersuit
	icon_state = "clothing"
	steps = list(
		list(CRAFT_MATERIAL, 20, MATERIAL_INDSTEEL, "time" = 60),
		list(QUALITY_SAWING, 35, "time" = 60),
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
		list(CRAFT_MATERIAL, 10, MATERIAL_INDSTEEL, "time" = 60),
		list(QUALITY_SAWING, 35, "time" = 60),
		list(QUALITY_WELDING, 40, "time" = 60),
		list(QUALITY_CUTTING, 30, "time" = 40),
		list(QUALITY_HAMMERING, 45, "time" = 40),
		list(CRAFT_MATERIAL, 2, MATERIAL_LGLASS, "time" = 20),
		list(/obj/item/stack/cable_coil, 15, "time" = 20),
		list(QUALITY_WIRE_CUTTING, 40, 30),
		list(QUALITY_BOLT_TURNING, 35, "time" = 40),
		list(QUALITY_SCREW_DRIVING, 40, "time" = 60)
	)

/datum/craft_recipe/terra/union_suit
	name = "Terra Engineer Protection Suit"
	result = /obj/item/clothing/suit/space/void/union
	icon_state = "clothing"
	steps = list(
		list(/obj/item/clothing/suit/armor/vest/technomancersuit, 1, "time" = 20),
		list(CRAFT_MATERIAL, 5, MATERIAL_PLASTIC, "time" = 5),
		list(CRAFT_MATERIAL, 5, MATERIAL_ALUMINIUM, "time" = 5),
		list(CRAFT_MATERIAL, 5, MATERIAL_INDSTEEL, "time" = 5),
		list(QUALITY_WELDING, 40, "time" = 15),
		list(QUALITY_HAMMERING, 45, "time" = 10),
		list(/obj/item/clothing/head/helmet/technomancersuit, 1, "time" = 20),
		list(CRAFT_MATERIAL, 3, MATERIAL_INDSTEEL, "time" = 5),
		list(CRAFT_MATERIAL, 3, MATERIAL_ALUMINIUM, "time" = 5),
		list(/obj/item/device/lighting/toggleable/flashlight/heavy, 1, "time" = 20),
		list(CRAFT_MATERIAL, 2, MATERIAL_LGLASS),
		list(QUALITY_WIRE_CUTTING, 30, 5),
		list(QUALITY_SCREW_DRIVING, 30, "time" = 20)
	)

/datum/craft_recipe/terra/union_suit_heavy
	name = "Terra Engineer Heavy Protection Suit"
	result = /obj/item/clothing/suit/space/void/union/heavy
	icon_state = "clothing"
	steps = list(
		list(/obj/item/clothing/suit/space/void/union, 1, "time" = 20),
		list(CRAFT_MATERIAL, 10, MATERIAL_ALUMINIUM, "time" = 5),
		list(CRAFT_MATERIAL, 5, MATERIAL_INDSTEEL, "time" = 5),
		list(QUALITY_WELDING, 40, "time" = 15),
		list(QUALITY_HAMMERING, 35, "time" = 10),
		list(/obj/item/tool_upgrade/reinforcement/plating, 1, "time" = 20),//someone forgot that the union can't craft melee armor upgrades
		list(QUALITY_WIRE_CUTTING, 30, 5),
		list(QUALITY_SCREW_DRIVING, 30, "time" = 20)
	)

/datum/craft_recipe/terra/union_miner_suit
	name = "Terra Miner Protection Suit"
	result = /obj/item/clothing/suit/space/void/union/tminer_suit
	icon_state = "clothing"
	steps = list(
		list(/obj/item/clothing/suit/space/void/union, 1, "time" = 20),
		list(CRAFT_MATERIAL, 5, MATERIAL_INDSTEEL, "time" = 5),
		list(QUALITY_WELDING, 40, "time" = 15),
		list(QUALITY_HAMMERING, 35, "time" = 10),
		list(/obj/item/clothing/head/helmet/space/void/union, 1, "time" = 20),
		list(/obj/item/gun_upgrade/tacticool_flashlight, 1, "time" = 20),
		list(/obj/item/tool_upgrade/reinforcement/rubbermesh, 1, "time" = 20),
		list(QUALITY_WIRE_CUTTING, 40, 5),
		list(QUALITY_SCREW_DRIVING, 40, "time" = 20)
	)

/datum/craft_recipe/terra/union_miner_suit_heavy
	name = "Terra Miner Heavy Protection Suit"
	result = /obj/item/clothing/suit/space/void/union/heavy_tminer_suit
	icon_state = "clothing"
	steps = list(
		list(/obj/item/clothing/suit/space/void/union/tminer_suit, 1, "time" = 20),
		list(CRAFT_MATERIAL, 10, MATERIAL_ALUMINIUM, "time" = 5),
		list(CRAFT_MATERIAL, 5, MATERIAL_INDSTEEL, "time" = 5),
		list(QUALITY_WELDING, 40, "time" = 15),
		list(QUALITY_HAMMERING, 45, "time" = 10),
		list(/obj/item/tool_upgrade/reinforcement/plating, 1, "time" = 5),
		list(QUALITY_WIRE_CUTTING, 40, 5),
		list(QUALITY_SCREW_DRIVING, 40, "time" = 20)
	)

/datum/craft_recipe/terra/union_chief_suit
	name = "Terra Chief Protection Suit"
	result = /obj/item/clothing/suit/space/void/union/chief_suit
	icon_state = "clothing"
	steps = list(
		list(/obj/item/clothing/suit/space/void/union, 1, "time" = 20),
		list(CRAFT_MATERIAL, 1, MATERIAL_ALUMINIUM, "time" = 5),
		list(QUALITY_WELDING, 40, "time" = 15),
		list(/obj/item/device/lighting/toggleable/flashlight/heavy, 1, "time" = 20),//why someone previously added a flashlight that isn't craftable by the union
		list(QUALITY_HAMMERING, 45, "time" = 10),,
		list(/obj/item/clothing/head/helmet/space/void/union, 1, "time" = 20),
		list(QUALITY_WIRE_CUTTING, 40, 5),
		list(QUALITY_SCREW_DRIVING, 40, "time" = 20)
	)

/datum/craft_recipe/terra/union_heavy_chief_suit
	name = "Terra Chief Heavy Protection Suit"
	result = /obj/item/clothing/suit/space/void/union/heavy/chief
	icon_state = "clothing"
	steps = list(
		list(/obj/item/clothing/suit/space/void/union/chief_suit, 1, "time" = 20),
		list(CRAFT_MATERIAL, 10, MATERIAL_ALUMINIUM, "time" = 5),
		list(CRAFT_MATERIAL, 5, MATERIAL_INDSTEEL, "time" = 5),
		list(QUALITY_WELDING, 40, "time" = 15),
		list(QUALITY_HAMMERING, 45, "time" = 10),
		list(/obj/item/tool_upgrade/reinforcement/plating, 1, "time" = 20),
		list(QUALITY_WIRE_CUTTING, 40, 5),
		list(QUALITY_SCREW_DRIVING, 40, "time" = 20)
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
		list(CRAFT_MATERIAL, 1, MATERIAL_ALUMINIUM),
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
		list(CRAFT_MATERIAL, 2, MATERIAL_ALUMINIUM, "time" = 60),
		list(QUALITY_ADHESIVE, 10, "time" = 60),
		list(/obj/item/stack/cable_coil, 30, "time" = 30),
		list(CRAFT_MATERIAL, 3, MATERIAL_INDSTEEL, "time" = 30),
	)

// Crafting a stack of sandbags material to convert into sandbag items,
// that can in turn be deployed into sandbag structures

/datum/craft_recipe/terra/sandbag_mat
	name = "sandbags stack (x10)"
	icon_state = "clothing"
	result = /obj/item/stack/material/sandbag/full
	steps = list(
		list(CRAFT_MATERIAL, 10, MATERIAL_CLOTH), // Make the bags
		list(QUALITY_CUTTING, 20), // Shape them
		list(/obj/item/stack/ore/glass, 10), // Fill with sand, not glass!
		list(QUALITY_ADHESIVE, 10, "time" = 60), // Seal them up nice and tight
	)

// TODO: Barbed wire crafting and deployable structure!

/**************/
/* EXPLOSIVES */
/**************/

// LOGIC: As demolitionists and builders, as well as miners, Terra-Therma has its share of knowledge
// On how to manufacture explosive charges for the sake of easily leveling places for construction

/datum/craft_recipe/terra/c4_charge
	name = "C4 explosive charge"
	result = /obj/item/plastique
	icon_state = "gun_part_7"
	steps = list(
		list(CRAFT_MATERIAL, 10, MATERIAL_PLASTIC, "time" = 30),
		list(/obj/item/rdx_block, 1, "time" = 30),
		list(CRAFT_MATERIAL, 5, MATERIAL_CARDBOARD, "time" = 30),
		list(/obj/item/device/assembly/igniter, 1),
		list(QUALITY_SCREW_DRIVING, 40, "time" = 20),
		list(/obj/item/circuitboard, 1, "time" = 30),
		list(QUALITY_SCREW_DRIVING, 40, "time" = 20),
		list(/obj/item/device/assembly/timer, 1),
		list(QUALITY_SCREW_DRIVING, 40, "time" = 20),
		list(/obj/item/stack/cable_coil, 5, "time" = 20),
		list(QUALITY_WIRE_CUTTING, 40, "time" = 30),
		list(QUALITY_PULSING, 30, "time" = 30),
		list(QUALITY_BOLT_TURNING, 40, "time" = 30)
	)

/************/
/* GRENADES */
/************/

// All of the following crafts require large chem grenade frames from PIRS as a base
// and chemistry-based explosive blocks from CAPSA, to foster departamental interaction
// Non-lethal grenades can also be sold to Watch to help with arrests and such.

/datum/craft_recipe/terra/grenade_smoke
	name = "Smoke Grenade"
	result = /obj/item/grenade/smokebomb
	icon_state = "gun_part_7"
	steps = list(
		list(CRAFT_MATERIAL, 5, MATERIAL_ALUMINIUM, "time" = 30), // This one is actually terrible so let's make it easier
		list(/obj/item/wp_block, 1),
		list(/obj/item/device/assembly/timer, 1),
		list(/obj/item/stack/cable_coil, 5, "time" = 20),
		list(QUALITY_WIRE_CUTTING, 30, "time" = 30),
		list(QUALITY_BOLT_TURNING, 30, "time" = 30)
	)

/datum/craft_recipe/terra/grenade_flashbang
	name = "Flashbang Grenade"
	result = /obj/item/grenade/flashbang
	icon_state = "gun_part_7"
	steps = list(
		list(/obj/item/grenade/chem_grenade/large/moebius, 1, "time" = 30),
		list(/obj/item/wp_block, 1),
		list(CRAFT_MATERIAL, 5, MATERIAL_SILVER, "time" = 30),
		list(/obj/item/device/assembly/timer, 1),
		list(/obj/item/stack/cable_coil, 5, "time" = 20),
		list(QUALITY_WIRE_CUTTING, 30, "time" = 30),
		list(QUALITY_BOLT_TURNING, 30, "time" = 30)
	)

/datum/craft_recipe/terra/grenade_rubber
	name = "Rubber Ball Grenade"
	result = /obj/item/grenade/frag/stinger
	icon_state = "gun_part_7"
	steps = list(
		list(/obj/item/grenade/chem_grenade/large/moebius, 1, "time" = 30),
		list(/obj/item/wp_block, 1),
		list(/obj/item/tool_upgrade/reinforcement/rubbermesh, 1), // Repurpose the rubber into pellets
		list(QUALITY_CUTTING, 20, "time" = 30),
		list(/obj/item/device/assembly/timer, 1),
		list(/obj/item/stack/cable_coil, 5, "time" = 20),
		list(QUALITY_WIRE_CUTTING, 30, "time" = 30),
		list(QUALITY_BOLT_TURNING, 30, "time" = 30)
	)

/datum/craft_recipe/terra/grenade_he
	name = "Grenade, Explosive"
	result = /obj/item/grenade/explosive
	icon_state = "gun_part_7"
	steps = list(
		list(/obj/item/grenade/chem_grenade/large/moebius, 1, "time" = 30),
		list(/obj/item/rdx_block, 1),
		list(CRAFT_MATERIAL, 5, MATERIAL_HYDROGENC, "time" = 30),
		list(/obj/item/device/assembly/timer, 1),
		list(/obj/item/stack/cable_coil, 5, "time" = 20),
		list(QUALITY_WIRE_CUTTING, 30, "time" = 30),
		list(QUALITY_BOLT_TURNING, 30, "time" = 30)
	)

/datum/craft_recipe/terra/grenade_frag
	name = "Grenade, Fragmentation"
	result = /obj/item/grenade/frag
	icon_state = "gun_part_7"
	steps = list(
		list(/obj/item/grenade/chem_grenade/large/moebius, 1, "time" = 30),
		list(/obj/item/rdx_block, 1),
		list(/obj/item/tool_upgrade/augment/spikes, 1), // Serves as the shrapnel
		list(/obj/item/device/assembly/timer, 1),
		list(/obj/item/stack/cable_coil, 5, "time" = 20),
		list(QUALITY_WIRE_CUTTING, 30, "time" = 30),
		list(QUALITY_BOLT_TURNING, 30, "time" = 30)
	)

/datum/craft_recipe/terra/grenade_heatwave
	name = "Grenade, Heatwave"
	result = /obj/item/grenade/heatwave
	icon_state = "gun_part_7"
	steps = list(
		list(/obj/item/grenade/chem_grenade/large/moebius, 1, "time" = 30),
		list(/obj/item/wp_block, 1),
		list(/obj/item/tool_upgrade/augment/fuel_tank, 1, "time" = 30),
		list(/obj/item/device/assembly/timer, 1),
		list(/obj/item/stack/cable_coil, 5, "time" = 20),
		list(QUALITY_WIRE_CUTTING, 30, "time" = 30),
		list(QUALITY_BOLT_TURNING, 30, "time" = 30)
	)

/datum/craft_recipe/terra/grenade_white_p
	name = "Grenade, Incendiary"
	result = /obj/item/grenade/frag/white_phosphorous
	icon_state = "gun_part_7"
	steps = list(
		list(/obj/item/grenade/chem_grenade/large/moebius, 1, "time" = 30),
		list(/obj/item/wp_block, 1),
		list(/obj/item/tool_upgrade/augment/fuel_tank, 1),
		list(CRAFT_MATERIAL, 5, MATERIAL_HYDROGENC, "time" = 30), // Very lethal
		list(/obj/item/device/assembly/timer, 1),
		list(/obj/item/stack/cable_coil, 5, "time" = 20),
		list(QUALITY_WIRE_CUTTING, 30, "time" = 30),
		list(QUALITY_BOLT_TURNING, 30, "time" = 30)
	)

/datum/craft_recipe/terra/grenade_emp
	name = "Grenade, EMP"
	result = /obj/item/grenade/empgrenade
	icon_state = "gun_part_7"
	steps = list(
		list(/obj/item/grenade/chem_grenade/large/moebius, 1, "time" = 30),
		list(/obj/item/wp_block, 1),
		list(CRAFT_MATERIAL, 5, MATERIAL_TRITIUM, "time" = 30), // Balance purposes
		list(/obj/item/device/assembly/timer, 1),
		list(/obj/item/stack/cable_coil, 5, "time" = 20),
		list(QUALITY_WIRE_CUTTING, 30, "time" = 30),
		list(QUALITY_BOLT_TURNING, 30, "time" = 30)
	)

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
		list(CRAFT_MATERIAL, 12, MATERIAL_INDSTEEL, "time" = 90),
		list(CRAFT_MATERIAL, 2, MATERIAL_LGLASS, "time" = 20),
		list(QUALITY_BOLT_TURNING, 10, 70),
		list(QUALITY_WELDING, 30, "time" = 90),
		list(/obj/item/stack/cable_coil, 10, "time" = 90),
		list(CRAFT_MATERIAL, 1, MATERIAL_DIAMOND, "time" = 20),
		list(/obj/item/stock_parts/manipulator, 1, "time" = 120),
		list(QUALITY_HAMMERING, 30, "time" = 40),
		list(QUALITY_SAWING, 30, "time" = 60),
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
		list(CRAFT_MATERIAL, 1, MATERIAL_INDSTEEL), //Quite useless in most cases so were cheaper
		list(CRAFT_MATERIAL, 1, MATERIAL_LBGLASS),
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
		list(CRAFT_MATERIAL, 2, MATERIAL_INDSTEEL), //Are main thing were exspensive do to being the main crafted item
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
		list(CRAFT_MATERIAL, 1, MATERIAL_LBGLASS),
		list(CRAFT_MATERIAL, 1, MATERIAL_LGLASS),
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
