/datum/craft_recipe/custodians
	category = "Custodians"
	time = 100
	related_stats = list(STAT_MEC)
	requiredPerk = PERK_CHANNELING
	icon_state = "dischargemisc_mold"

/datum/craft_recipe/custodians/oathbound_set
	name = "Oathbound Armor Set"
	result = /obj/item/storage/box/oathbound_set
	icon_state = "dischargearmor_mold"
	steps = list(
		list(/obj/item/mold/armor, 1),
		list(/obj/item/stack/mold_kit/tailoring, 2),
		list(QUALITY_CUTTING, 20, "time" = 10),
		list(QUALITY_PRYING, 20, "time" = 10),
		list(QUALITY_BOLT_TURNING, 30, "time" = 10),
		list(QUALITY_WIRE_CUTTING, 30, "time" = 10),
		list(/obj/item/stack/mold_kit/blacksmithing, 2),
		list(QUALITY_WELDING, 30, "time" = 20),
		list(CRAFT_MATERIAL, 10, MATERIAL_PLASTEEL, "time" = 5),
		list(QUALITY_BOLT_TURNING, 30, "time" = 10),
		list(QUALITY_WIRE_CUTTING, 30, "time" = 10),
		list(/obj/item/clothing/suit/armor/custodian/firesuit, 1),
		list(/obj/item/clothing/head/helmet/custodian/firesuit, 1),
		list(QUALITY_SAWING, 30, "time" = 10),
	)

/datum/craft_recipe/custodians/enkindled_set
	name = "Enkindled Armor Set"
	result = /obj/item/storage/box/enkindled_set
	icon_state = "dischargearmor_mold"
	steps = list(
		list(/obj/item/mold/armor, 1),
		list(/obj/item/stack/mold_kit/tailoring, 2),
		list(QUALITY_CUTTING, 20, "time" = 10),
		list(QUALITY_PRYING, 20, "time" = 10),
		list(QUALITY_BOLT_TURNING, 30, "time" = 10),
		list(QUALITY_WIRE_CUTTING, 30, "time" = 10),
		list(/obj/item/stack/mold_kit/blacksmithing, 2),
		list(QUALITY_WELDING, 30, "time" = 20),
		list(CRAFT_MATERIAL, 10, MATERIAL_PLASTEEL, "time" = 5),
		list(QUALITY_BOLT_TURNING, 30, "time" = 10),
		list(QUALITY_WIRE_CUTTING, 30, "time" = 10),
		list(/obj/item/clothing/suit/armor/custodian/firesuit, 1),
		list(/obj/item/clothing/head/helmet/custodian/firesuit, 1),
		list(QUALITY_SAWING, 30, "time" = 10),
	)

/datum/craft_recipe/custodians/forgemaster_set
	name = "Forgemaster Armor Set"
	result = /obj/item/storage/box/forgemaster_set
	icon_state = "dischargearmor_mold"
	steps = list(
		list(/obj/item/mold/armor, 1),
		list(/obj/item/stack/mold_kit/tailoring, 2),
		list(QUALITY_CUTTING, 20, "time" = 10),
		list(QUALITY_PRYING, 20, "time" = 10),
		list(QUALITY_BOLT_TURNING, 30, "time" = 10),
		list(QUALITY_WIRE_CUTTING, 30, "time" = 10),
		list(/obj/item/stack/mold_kit/blacksmithing, 2),
		list(QUALITY_WELDING, 30, "time" = 20),
		list(CRAFT_MATERIAL, 10, MATERIAL_PLASTEEL, "time" = 5),
		list(QUALITY_BOLT_TURNING, 30, "time" = 10),
		list(QUALITY_WIRE_CUTTING, 30, "time" = 10),
		list(/obj/item/clothing/suit/armor/custodian/firesuit, 1),
		list(/obj/item/clothing/head/helmet/custodian/firesuit, 1),
		list(QUALITY_SAWING, 30, "time" = 10),
	)

/datum/craft_recipe/custodians/oathpledge_set
	name = "Oathpledge Armor Set"
	result = /obj/item/storage/box/oathpledge_set
	icon_state = "dischargearmor_mold"
	steps = list(
		list(/obj/item/mold/armor, 1),
		list(/obj/item/stack/mold_kit/tailoring, 3),
		list(QUALITY_WIRE_CUTTING, 30, "time" = 10),
		list(QUALITY_CUTTING, 20, "time" = 10),
		list(QUALITY_PRYING, 20, "time" = 10),
		list(QUALITY_BOLT_TURNING, 30, "time" = 10),
		list(/obj/item/stack/mold_kit/blacksmithing, 4),
		list(QUALITY_WELDING, 30, "time" = 20),
		list(QUALITY_BOLT_TURNING, 30, "time" = 10),
		list(QUALITY_WIRE_CUTTING, 30, "time" = 10),
		list(/obj/item/clothing/suit/armor/custodian/firesuit, 1),
		list(/obj/item/clothing/head/helmet/custodian/firesuit, 1),
		list(/obj/item/mold/oathpledge_neuron, 1),
		list(QUALITY_SAWING, 30, "time" = 10),
	)

/datum/craft_recipe/custodians/voidsuit
	name = "Huscarl Voidsuit"
	result = /obj/item/clothing/suit/space/void/huscarl
	icon_state = "dischargearmor_mold"
	steps = list(
		list(/obj/item/mold/armor, 1),
		list(/obj/item/stack/mold_kit/tailoring, 3),
		list(QUALITY_WIRE_CUTTING, 30, "time" = 20),
		list(/obj/item/stack/mold_kit/masonry, 1),
		list(QUALITY_WELDING, 30, "time" = 10),
		list(QUALITY_WIRE_CUTTING, 30, "time" = 20),
		list(QUALITY_WELDING, 30, "time" = 10),
		list(QUALITY_HAMMERING, 30, "time" = 10),
		list(/obj/item/stack/mold_kit/blacksmithing, 3),
		list(QUALITY_WELDING, 30, "time" = 20),
		list(QUALITY_CUTTING, 20, "time" = 10),
		list(QUALITY_HAMMERING, 30, "time" = 10),
		list(/obj/item/stack/mold_kit/radiance_sigil, 1),
		list(QUALITY_SCREW_DRIVING, 30, "time" = 10),
	)

/datum/craft_recipe/custodians/knife_custodian
	name = "Custodian Seax"
	result = /obj/item/tool/knife/dagger/custodian
	icon_state = "dischargeweapon_mold"
	steps = list(
		list(/obj/item/mold/weapon, 1),
		list(CRAFT_MATERIAL, 10, MATERIAL_BIO_SILK, "time" = 5),
		list(CRAFT_MATERIAL, 10, MATERIAL_STEEL, "time" = 5),
		list(QUALITY_WELDING, 30, "time" = 20),
	)

/datum/craft_recipe/custodians/ulfberht
	name = "Ulfberht"
	result = /obj/item/tool/sword/custodian/shortsword
	icon_state = "dischargeweapon_mold"
	steps = list(
		list(/obj/item/mold/weapon, 1),
		list(/obj/item/stack/mold_kit/tailoring, 1),
		list(QUALITY_WIRE_CUTTING, 30, "time" = 10),
		list(CRAFT_MATERIAL, 10, MATERIAL_STEEL, "time" = 5),
		list(QUALITY_SCREW_DRIVING, 30, "time" = 10),
	)

/datum/craft_recipe/custodians/horseman_axe
	name = "Horseman Axe"
	result = /obj/item/tool/sword/custodian/horseaxe
	icon_state = "dischargeweapon_mold"
	steps = list(
		list(/obj/item/mold/weapon, 1),
		list(/obj/item/stack/mold_kit/tailoring, 1),
		list(QUALITY_WELDING, 30, "time" = 10),
		list(/obj/item/stack/mold_kit/blacksmithing, 2),
		list(QUALITY_WELDING, 30, "time" = 10),
		list(QUALITY_HAMMERING, 25, "time" = 10),
		list(QUALITY_WELDING, 30, "time" = 10),
		list(QUALITY_WIRE_CUTTING, 30, "time" = 10),
		list(CRAFT_MATERIAL, 8, MATERIAL_CARBON_FIBER, "time" = 5),
		list(QUALITY_PULSING, 30, "time" = 10),
	)

/datum/craft_recipe/custodians/atgeir
	name = "Custodian Atgeir"
	result = /obj/item/tool/spear/atgeir
	icon_state = "dischargeweapon_mold"
	steps = list(
		list(/obj/item/mold/weapon, 1),
		list(/obj/item/stack/mold_kit/tailoring, 1),
		list(QUALITY_WELDING, 30, "time" = 10),
		list(/obj/item/stack/mold_kit/masonry, 1),
		list(QUALITY_WELDING, 30, "time" = 10),
		list(QUALITY_HAMMERING, 25, "time" = 10),
		list(QUALITY_WELDING, 30, "time" = 10),
		list(QUALITY_WIRE_CUTTING, 30, "time" = 10),
		list(/obj/item/stack/mold_kit/blacksmithing, 1),
		list(QUALITY_BOLT_TURNING, 30, "time" = 10),
	)

/datum/craft_recipe/custodians/emberblaze
	name = "Emberblaze Warhammer"
	result = /obj/item/tool/sword/custodian/warhammer
	icon_state = "dischargeweapon_mold"
	steps = list(
		list(/obj/item/mold/weapon, 1),
		list(/obj/item/stack/mold_kit/tailoring, 1),
		list(QUALITY_WELDING, 30, "time" = 10),
		list(/obj/item/stack/mold_kit/blacksmithing, 2),
		list(QUALITY_WELDING, 30, "time" = 10),
		list(QUALITY_HAMMERING, 25, "time" = 10),
		list(QUALITY_WELDING, 30, "time" = 10),
		list(QUALITY_WIRE_CUTTING, 30, "time" = 10),
		list(CRAFT_MATERIAL, 2, MATERIAL_SILVER, "time" = 5),
		list(QUALITY_PULSING, 30, "time" = 10),
	)

/datum/craft_recipe/custodians/conflagration
	name = "Conflagration Sword"
	result = /obj/item/tool/sword/custodian/conflagration
	icon_state = "dischargeweapon_mold"
	steps = list(
		list(/obj/item/mold/weapon, 1),
		list(/obj/item/mold/weapon, 1),
		list(/obj/item/stack/mold_kit/tailoring, 2),
		list(QUALITY_WELDING, 30, "time" = 10),
		list(/obj/item/stack/mold_kit/blacksmithing, 1),
		list(QUALITY_SAWING, 30, "time" = 10),
		list(QUALITY_BOLT_TURNING, 30, "time" = 10),
		list(QUALITY_WELDING, 30, "time" = 10),
		list(QUALITY_HAMMERING, 25, "time" = 10),
		list(QUALITY_WELDING, 30, "time" = 10),
		list(QUALITY_WIRE_CUTTING, 30, "time" = 10),
		list(/obj/item/stack/mold_kit/radiance_sigil, 1),
		list(CRAFT_MATERIAL, 10, MATERIAL_CARBON_FIBER, "time" = 5),
		list(/obj/item/stack/mold_kit/masonry, 1),
		list(QUALITY_PULSING, 30, "time" = 10),
	)

/datum/craft_recipe/custodians/francisca
	name = "Custodian Francisca"
	result = /obj/item/tool/sword/custodian/throwaxe
	icon_state = "dischargeweapon_mold"
	steps = list(
		list(/obj/item/mold/weapon, 1),
		list(QUALITY_HAMMERING, 25, "time" = 10),
		list(CRAFT_MATERIAL, 2, MATERIAL_PLASTEEL, "time" = 5),
		list(QUALITY_WELDING, 30, "time" = 20),
		list(QUALITY_WIRE_CUTTING, 30, "time" = 10),
		list(CRAFT_MATERIAL, 5, MATERIAL_STEEL, "time" = 5),
		list(QUALITY_CUTTING, 20, "time" = 10),
		list(CRAFT_MATERIAL, 15, MATERIAL_BIO_SILK, "time" = 5),
		list(QUALITY_WELDING, 30, "time" = 20),
		list(QUALITY_WIRE_CUTTING, 30, "time" = 10),
	)

/datum/craft_recipe/custodians/nagaika
	name = "Custodian Nagaika"
	result = /obj/item/tool/sword/custodian/whip
	icon_state = "dischargeweapon_mold"
	steps = list(
		list(/obj/item/mold/weapon, 1),
		list(CRAFT_MATERIAL, 20, MATERIAL_BIO_SILK, "time" = 5),
		list(CRAFT_MATERIAL, 2, MATERIAL_PLASTEEL, "time" = 5),
		list(QUALITY_WIRE_CUTTING, 30, "time" = 10),
		list(CRAFT_MATERIAL, 20, MATERIAL_BIO_SILK, "time" = 5),
		list(QUALITY_CUTTING, 20, "time" = 10),
		list(CRAFT_MATERIAL, 10, MATERIAL_STEEL, "time" = 5),
		list(CRAFT_MATERIAL, 10, MATERIAL_CARBON_FIBER, "time" = 5),
		list(QUALITY_HAMMERING, 25, "time" = 10),
	)

/datum/craft_recipe/custodians/scutum
	name = "Custodian Scutum"
	result = /obj/item/shield/riot/custodian
	icon_state = "dischargearmor_mold"
	steps = list(
		list(/obj/item/mold/armor, 1),
		list(/obj/item/stack/mold_kit/masonry, 1),
		list(/obj/item/stack/mold_kit/blacksmithing, 2),
		list(QUALITY_HAMMERING, 30, "time" = 10),
		list(QUALITY_WIRE_CUTTING, 30, "time" = 10),
		list(/obj/item/stack/mold_kit/tailoring, 2),
		list(QUALITY_SCREW_DRIVING, 30, "time" = 10),
		list(QUALITY_HAMMERING, 30, "time" = 10),
		list(/obj/item/stack/mold_kit/radiance_sigil, 1),
		list(QUALITY_SCREW_DRIVING, 30, "time" = 10),
	)

/datum/craft_recipe/custodians/heater_shield
	name = "Custodian Heater Shield"
	result = /obj/item/shield/buckler/custodian
	icon_state = "dischargearmor_mold"
	steps = list(
		list(/obj/item/mold/armor, 1),
		list(/obj/item/stack/mold_kit/masonry, 1),
		list(QUALITY_HAMMERING, 30, "time" = 10),
		list(QUALITY_WIRE_CUTTING, 30, "time" = 10),
		list(/obj/item/stack/mold_kit/tailoring, 1),
		list(QUALITY_SCREW_DRIVING, 30, "time" = 10),
		list(/obj/item/stack/mold_kit/blacksmithing, 1),
		list(/obj/item/book/ritual/cruciform, 1),
		list(QUALITY_HAMMERING, 30, "time" = 10),
	)

/datum/craft_recipe/custodians/sludge_staff
	name = "Sludge Staff"
	result = /obj/item/gun/matter/launcher/nt_sprayer
	icon_state = "dischargeweapon_mold"
	steps = list(
		list(/obj/item/mold/weapon, 1),
		list(/obj/item/stack/mold_kit/masonry, 2),
		list(QUALITY_BOLT_TURNING, 30, "time" = 20),
		list(/obj/item/stack/mold_kit/tailoring, 1),
		list(QUALITY_SCREW_DRIVING, 30, "time" = 10),
	)


/datum/craft_recipe/custodians/melee_plating
	name = "melee plating"
	result = /obj/item/tool_upgrade/armor/melee
	icon_state = "dischargearmor_mold"
	steps = list(
		list(/obj/item/mold/armor, 1),
		list(/obj/item/stack/mold_kit/blacksmithing, 3),
		list(/obj/item/stack/mold_kit/masonry, 2),
		list(QUALITY_WELDING, 30, "time" = 90),
		list(QUALITY_CUTTING, 20, "time" = 90),
		list(QUALITY_HAMMERING, 30, "time" = 90),
		list(QUALITY_SCREW_DRIVING, 30, "time" = 90),
		list(QUALITY_BOLT_TURNING, 30, "time" = 90),
		list(QUALITY_SAWING, 30, "time" = 90)
	)


/datum/craft_recipe/custodians/bullet_plating
	name = "bullet plating"
	result = /obj/item/tool_upgrade/armor/bullet
	icon_state = "dischargearmor_mold"
	steps = list(
		list(/obj/item/mold/armor, 1),
		list(/obj/item/stack/mold_kit/blacksmithing, 3),
		list(/obj/item/stack/mold_kit/masonry, 2),
		list(QUALITY_WELDING, 30, "time" = 90),
		list(QUALITY_CUTTING, 20, "time" = 90),
		list(QUALITY_HAMMERING, 30, "time" = 90),
		list(QUALITY_SCREW_DRIVING, 30, "time" = 90),
		list(QUALITY_BOLT_TURNING, 30, "time" = 90),
		list(QUALITY_SAWING, 30, "time" = 90)
	)

/datum/craft_recipe/custodians/energy_plating
	name = "energy plating"
	result = /obj/item/tool_upgrade/armor/energy
	icon_state = "dischargearmor_mold"
	steps = list(
		list(/obj/item/mold/armor, 1),
		list(/obj/item/stack/mold_kit/blacksmithing, 3),
		list(/obj/item/stack/mold_kit/masonry, 2),
		list(QUALITY_WELDING, 30, "time" = 90),
		list(QUALITY_CUTTING, 20, "time" = 90),
		list(QUALITY_HAMMERING, 30, "time" = 90),
		list(QUALITY_SCREW_DRIVING, 30, "time" = 90),
		list(QUALITY_BOLT_TURNING, 30, "time" = 90),
		list(QUALITY_SAWING, 30, "time" = 90)
	)

/datum/craft_recipe/custodians/bomb_plating
	name = "bomb plating"
	result = /obj/item/tool_upgrade/armor/bomb
	icon_state = "dischargearmor_mold"
	steps = list(
		list(/obj/item/mold/armor, 1),
		list(/obj/item/stack/mold_kit/blacksmithing, 3),
		list(/obj/item/stack/mold_kit/masonry, 2),
		list(QUALITY_WELDING, 30, "time" = 90),
		list(QUALITY_CUTTING, 20, "time" = 90),
		list(QUALITY_HAMMERING, 30, "time" = 90),
		list(QUALITY_SCREW_DRIVING, 30, "time" = 90),
		list(QUALITY_BOLT_TURNING, 30, "time" = 90),
		list(QUALITY_SAWING, 30, "time" = 90)
	)
