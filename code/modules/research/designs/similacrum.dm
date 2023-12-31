/datum/design/research/item/simulacrum/cog
	name = "SR \"Cog\" laser carbine"
	build_path = /obj/item/gun/energy/cog
	category = CAT_WEAPON

/datum/design/research/item/simulacrum/iron_lock_security_armor
	name = "Simulacrum Robotics Ablative Vest"
	build_path = /obj/item/clothing/suit/armor/vest/iron_lock_security
	materials = list(MATERIAL_ALUMINIUM = 15, MATERIAL_PLASTIC = 10) //So its costs more for being RnD printed
	category = CAT_CLOTHING

/datum/design/research/item/simulacrum/iron_lock_security_helmet
	name = "Simulacrum Robotics Ablative Helmet"
	build_path = /obj/item/clothing/head/helmet/laserproof/iron_lock_security
	materials = list(MATERIAL_ALUMINIUM = 15, MATERIAL_PLASTIC = 10) //So its costs more for being RnD printed
	category = CAT_CLOTHING

/datum/design/research/item/simulacrum/iron_lock_security_boots
	name = "Simulacrum Robotics Ablative Jackboots"
	build_path = /obj/item/clothing/shoes/ablasive/iron_lock_security
	materials = list(MATERIAL_ALUMINIUM = 15, MATERIAL_PLASTIC = 10) //So its costs more for being RnD printed
	category = CAT_CLOTHING

/datum/design/research/item/simulacrum/iron_lock_security_gloves
	name = "Simulacrum Robotics Ablative Gloves"
	build_path = /obj/item/clothing/gloves/thick/ablasive/iron_lock_security
	materials = list(MATERIAL_ALUMINIUM = 15, MATERIAL_PLASTIC = 10) //So its costs more for being RnD printed
	category = CAT_CLOTHING

/datum/design/research/item/simulacrum/thermals
	name = "SR Thermal Goggles"
	build_path = /obj/item/clothing/glasses/powered/thermal/onestar
	category = CAT_CLOTHING

/datum/design/research/item/simulacrum/combat_shield
	name = "SR Combat Shield"
	build_path = /obj/item/shield_projector/rectangle
	category = CAT_CLOTHING

/datum/design/research/item/simulacrum/manhacks_roomba
	name = "SR-PI roomba grenade"
	build_path = /obj/item/grenade/spawnergrenade/manhacks/roomba
	category = CAT_WEAPON

/datum/design/research/item/simulacrum/manhacks_roomba_tripper
	name = "SR-PI roomba sec grenade"
	build_path = /obj/item/grenade/spawnergrenade/manhacks/roomba/trippers
	category = CAT_WEAPON

/datum/design/research/item/simulacrum/manhacks_roomba_gunne
	name = "SR-PI sword drone grenade"
	build_path = /obj/item/grenade/spawnergrenade/manhacks/roomba/sword
	category = CAT_WEAPON

/datum/design/research/item/simulacrum/manhacks_roomba_fbp
	name = "SR-PI mantis drone grenade"
	build_path = /obj/item/grenade/spawnergrenade/manhacks/roomba/mantis
	category = CAT_WEAPON

/datum/design/research/item/simulacrum/glass_widow
	name = "SR \"Glass Widow\" infuser"
	build_path = /obj/item/gun_upgrade/mechanism/glass_widow
	category = CAT_GUNMODS

/datum/design/research/item/simulacrum/unmaker
	name = "SR \"Master Unmaker\" infuser"
	build_path = /obj/item/gun_upgrade/mechanism/simulacrum_master_catalyst
	category = CAT_GUNMODS

/datum/design/research/item/powercell/large/simulacrum
	name = "SR-PI \"Posi-cell 16000L\""
	build_type = PROTOLATHE | MECHFAB
	build_path = /obj/item/cell/large/simulacrum

/datum/design/research/item/powercell/medium/simulacrum
	name = "SR-PI \"Posi-cell 1600M\""
	build_type = PROTOLATHE | MECHFAB
	build_path = /obj/item/cell/medium/simulacrum

/datum/design/research/item/powercell/small/simulacrum
	name = "SR-SI \"Posi-cell 400S\""
	build_type = PROTOLATHE | MECHFAB
	build_path = /obj/item/cell/small/simulacrum

//Upgraded prosthesis ========================
/datum/design/research/item/mechfab/prosthesis_simulacrum
	category = CAT_PROSTHESIS

/datum/design/research/item/mechfab/prosthesis_simulacrum/r_arm
	build_path = /obj/item/organ/external/robotic/one_star/r_arm

/datum/design/research/item/mechfab/prosthesis_simulacrum/l_arm
	build_path = /obj/item/organ/external/robotic/one_star/l_arm

/datum/design/research/item/mechfab/prosthesis_simulacrum/r_leg
	build_path = /obj/item/organ/external/robotic/one_star/r_leg

/datum/design/research/item/mechfab/prosthesis_simulacrum/l_leg
	build_path = /obj/item/organ/external/robotic/one_star/l_leg
//Todo chest/lower and head?

//Simulacrum Tool / Upgrades ========================

/datum/design/research/item/simulacrum/holding_tank
	name = "SR Expanded Fuel Tank of Holding"
	build_path = /obj/item/tool_upgrade/augment/holding_tank
	category = CAT_TOOLMODS //Tool mod rather then bluespace for constancy

/datum/design/research/item/simulacrum/repair_nano
	name = "SR Repair Nano Repair Tool Upgrade"
	build_path = /obj/item/tool_upgrade/augment/repair_nano
	category = CAT_TOOLMODS

/datum/design/research/item/simulacrum/grav_enhancer
	name = "SR Microgravity Stabilizer"
	build_path = /obj/item/tool_upgrade/refinement/gravenhancer
	category = CAT_TOOLMODS

/datum/design/research/item/simulacrum/ai_tool
	name = "SR Nano-integrated AI Tool Upgrade"
	build_path = /obj/item/tool_upgrade/augment/ai_tool
	category = CAT_TOOLMODS

/datum/design/research/item/tool/crowbar_onestar
	name = "Simulacrum positronic crowbar"
	build_path = /obj/item/tool/crowbar/onestar

/datum/design/research/item/tool/multitool/multitool_onestar
	name = "Simulacrum positronic multitool"
	build_path = /obj/item/tool/multitool/advanced/onestar

/datum/design/research/item/tool/weldertool_onestar
	name = "Simulacrum positronic welding tool"
	build_path = /obj/item/tool/weldingtool/onestar

/datum/design/research/item/tool/combi_driver_onestar
	name = "Simulacrum positronic combination drill"
	build_path = /obj/item/tool/screwdriver/combi_driver/onestar

/datum/design/research/item/tool/onestar_pliers
	name = "Simulacrum positronic pliers"
	build_path = /obj/item/tool/wirecutters/onestar_pliers

/datum/design/research/item/tool/hammer_onestar
	name = "Simulacrum positronic power hammer"
	build_path = /obj/item/tool/hammer/powered_hammer/onestar_hammer

/datum/design/research/item/tool/jackhammer_onestar
	name = "Simulacrum positronic jackhammer"
	build_path = /obj/item/tool/pickaxe/jackhammer/onestar

/datum/design/research/item/tool/drill_onestar
	name = "Simulacrum positronic drill"
	build_path = /obj/item/tool/pickaxe/drill/onestar

/datum/design/research/item/tool/pickaxe_onestar
	name = "Simulacrum positronic pickaxe"
	build_path = /obj/item/tool/pickaxe/onestar

/datum/design/research/item/tool/onestar_shovel
	name = "Simulacrum positronic shovel"
	build_path = /obj/item/tool/shovel/onestar_shovel

/datum/design/research/item/tool/onestar_saw
	name = "Simulacrum positronic saw"
	build_path = /obj/item/tool/saw/onestar_saw

/datum/design/research/item/tool/omni_surgery_onestar
	name = "Simulacrum positronic medical multitool"
	build_path = /obj/item/tool/medmultitool

//Upgraded stock parts ========================

/datum/design/research/item/part/simulacrum_laser
	name = "Simulacrum positronic micro-laser"
	build_path = /obj/item/stock_parts/micro_laser/one_star

/datum/design/research/item/part/simulacrum_matter
	name = "Simulacrum positronic matter bin"
	build_path = /obj/item/stock_parts/matter_bin/one_star

/datum/design/research/item/part/simulacrum_module
	name = "Simulacrum positronic scanning module"
	build_path = /obj/item/stock_parts/scanning_module/one_star

/datum/design/research/item/part/simulacrum_capacitor
	name = "Simulacrum positronic capacitor"
	build_path = /obj/item/stock_parts/capacitor/one_star

/datum/design/research/item/part/simulacrum_manipulator
	name = "Simulacrum positronic manipulator"
	build_path = /obj/item/stock_parts/manipulator/one_star

// Simulacrum Machines ========================

/datum/design/research/circuit/simulacrum_autolathe
	name = "Simulacrum Autolathe"
	build_path = /obj/item/circuitboard/autolathe_simulacrum
	category = CAT_MACHINE
