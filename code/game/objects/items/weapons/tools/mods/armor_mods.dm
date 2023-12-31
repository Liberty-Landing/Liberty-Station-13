
//Armor mods
/obj/item/tool_upgrade/armor/melee
	name = "melee plating"
	desc = "A sturdy bit of indsteel that can be bolted onto any armor to enhance its melee resistance."
	icon_state = "melee"
	matter = list(MATERIAL_ALUMINIUM = 30)
	price_tag = 275

/obj/item/tool_upgrade/armor/melee/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
	UPGRADE_MELEE_ARMOR = 20,
	UPGRADE_SLOWDOWN_ARMOR = 0.2,
	UPGRADE_STIFFNESS_ARMOR = 0.1
//	UPGRADE_OBSCURATION_ARMOR = 0.1 this is here just so anyone can see that it actually works easier
	)
	I.prefix = "reinforced"
	I.required_qualities = list(QUALITY_ARMOR)

/obj/item/tool_upgrade/armor/bullet
	name = "ballistic plating"
	desc = "A sturdy bit of indsteel that can be bolted onto any armor to enhance its ballistic resistance."
	icon_state = "bullet"
	matter = list(MATERIAL_ALUMINIUM = 10, MATERIAL_INDSTEEL = 10, MATERIAL_PLASTIC = 10)
	price_tag = 750

/obj/item/tool_upgrade/armor/bullet/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
	UPGRADE_BALLISTIC_ARMOR = 20,
	UPGRADE_SLOWDOWN_ARMOR = 0.2,
	UPGRADE_STIFFNESS_ARMOR = 0.1
	)
	I.prefix = "kevlar-plated"
	I.required_qualities = list(QUALITY_ARMOR)

/obj/item/tool_upgrade/armor/energy
	name = "energy plating"
	desc = "A sturdy bit of indsteel that can be bolted onto any armor to enhance its energy resistance."
	icon_state = "energy"
	matter = list(MATERIAL_PLATINUM = 3, MATERIAL_PLASTIC = 12)
	price_tag = 1000

/obj/item/tool_upgrade/armor/energy/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
	UPGRADE_ENERGY_ARMOR = 20,
	UPGRADE_SLOWDOWN_ARMOR = 0.2,
	UPGRADE_STIFFNESS_ARMOR = 0.1
	)
	I.prefix = "ablative-plated"
	I.required_qualities = list(QUALITY_ARMOR)

/obj/item/tool_upgrade/armor/bomb
	name = "bomb proofing"
	desc = "A sturdy bit of indsteel that can be bolted onto any armor to enhance its bomb resistance."
	icon_state = "bomb"
	matter = list(MATERIAL_ALUMINIUM = 20, MATERIAL_INDSTEEL = 20)
	price_tag = 450

/obj/item/tool_upgrade/armor/bomb/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
	UPGRADE_BOMB_ARMOR = 40,
	UPGRADE_SLOWDOWN_ARMOR = 0.2,
	UPGRADE_STIFFNESS_ARMOR = 0.1
	)
	I.prefix = "bomb-proofed"
	I.required_qualities = list(QUALITY_ARMOR)

// Custodian variants, pathing is different to avoid them spawning on dungeons
// These are meant to be Forgemaster exclusive, and give great bonuses
// But some gimp the use of firearms greatly due to their melee-oriented nature

/obj/item/tool_upgrade/custodian/armor
	name = "custodian armor plate design"
	desc = "You shouldn't be seeing this."
	matter = list()
	price_tag = 600

/obj/item/tool_upgrade/custodian/armor/melee
	name = "carbon fiber armor plating"
	desc = "A lightweight carbon fiber layer offers protection from blunt force while maintaining mobility in combat scenarios, \
			but makes it rather cumbersome to fire guns with."
	icon_state = "carbonfiber_plating"
	matter = list(MATERIAL_CARBON_FIBER = 60)

/obj/item/tool_upgrade/custodian/armor/melee/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
	UPGRADE_MELEE_ARMOR = 30,		// This might sound massive, but we become far worse at firearms through it.
	UPGRADE_STIFFNESS_ARMOR = 0.5, // Increased gun recoil
	UPGRADE_OBSCURATION_ARMOR = 0.5 // Massive decreased accuracy
	)
	I.prefix = "carbon-lined"
	I.required_qualities = list(QUALITY_ARMOR)

/obj/item/tool_upgrade/custodian/armor/bullet
	name = "silk polymer armor plating"
	desc = "High-tensile and tough silk combined with other polymers provides major protection against ballistic threats. \
			Lightweight and sturdy - perfect for battles where speed is a necessity."
	icon_state = "polymer_plating"
	matter = list(MATERIAL_BIO_SILK = 40, MATERIAL_INDSTEEL = 10, MATERIAL_PLASTIC = 10)

/obj/item/tool_upgrade/custodian/armor/bullet/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
	UPGRADE_BALLISTIC_ARMOR = 30,
	UPGRADE_STIFFNESS_ARMOR = 0.2,
	UPGRADE_OBSCURATION_ARMOR = 0.2 // Values are lower so we can justify selling these to Watch
	)
	I.prefix = "polymer-woven"
	I.required_qualities = list(QUALITY_ARMOR)

/obj/item/tool_upgrade/custodian/armor/energy
	name = "dark silver armor plating"
	desc = "A lightweight plate that contains silver nanoparticles within carbon nanotubes. \
			This design provides antimicrobial properties, high tensile strength, \
			and the ability to reflect or absorb plasma beams depending on its protective limits."
	icon_state = "darksilver_plating"
	matter = list(MATERIAL_CARBON_FIBER = 30, MATERIAL_BIO_SILK = 15, MATERIAL_SILVER = 15)

/obj/item/tool_upgrade/custodian/armor/energy/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
	UPGRADE_ENERGY_ARMOR = 30,
	UPGRADE_STIFFNESS_ARMOR = 0.2,
	UPGRADE_OBSCURATION_ARMOR = 0.2 // Values are lower so we can justify selling these to Watch
	)
	I.prefix = "silver-forged"
	I.required_qualities = list(QUALITY_ARMOR)

/obj/item/tool_upgrade/custodian/armor/fireproofing
	name = "fireproof plating"
	desc = "Bioengineered marvel of custodian synthetic protein and fire-resistant compounds. \
			The critical attribute of Custodian foam of being lightweight, adaptive self-sealing \
			and enhanced insulation keeps the user protected from fire no matter the environment."
	icon_state = "fluoropolymer_plating"
	matter = list(MATERIAL_BIO_SILK = 30, MATERIAL_BIOMATTER = 30) // CAPSA can provide biomatter for FOAM

/obj/item/tool_upgrade/custodian/armor/fireproofing/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
	UPGRADE_ARMOR_PYRORES = FIRESUIT_MAX_HEAT_PROTECTION_TEMPERATURE,
	UPGRADE_ITEMFLAGPLUS = STOPPRESSUREDAMAGE,
	UPGRADE_ENERGY_ARMOR = 10,
	UPGRADE_STIFFNESS_ARMOR = 0.5,
	UPGRADE_OBSCURATION_ARMOR = 0.5
	)
	I.prefix = "antipyretic"
	I.required_qualities = list(QUALITY_ARMOR)

	/obj/item/tool_upgrade/armor/handmade
	name = "Handmade Armor Upgrade kit"//is the replacement for every armor plating the union can make, its pretty weak but will do the work of be an armor upgrade even if its shitty, the guys with quality are the custodians, plus they can mass produce cheap armor upgrades if some miner is providing indsteel.
	desc = "A Very improvised set of armor plates and tiny metal reinforcements made out with metal remains by someone with knowledge of metalworking, it that can be bolted onto any armor to lightly enhance its general resistance in desperate times or times with low budget."
	icon_state = "metal_plating"
	matter = list(MATERIAL_ALUMINIUM = 25, MATERIAL_INDSTEEL = 5)
	price_tag = 150

/obj/item/tool_upgrade/armor/handmade/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
	UPGRADE_MELEE_ARMOR = 8,
	UPGRADE_ENERGY_ARMOR = 8,
	UPGRADE_BALLISTIC_ARMOR = 8,
	UPGRADE_BOMB_ARMOR = 10,// best armor quality here due to being mostly indsteel and aluminium welded together
	UPGRADE_SLOWDOWN_ARMOR = 0.2,
	UPGRADE_STIFFNESS_ARMOR = 0.1
//	UPGRADE_OBSCURATION_ARMOR = 0.1 this is here just so anyone can see that it actually works easier
	)
	I.prefix = "Metal Plated"
	I.required_qualities = list(QUALITY_ARMOR)

