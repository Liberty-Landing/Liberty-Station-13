/datum/craft_recipe/trapper
	category = "Trapper"
	time = 100
	related_stats = list(STAT_BIO)
	requiredPerk = PERK_BUTCHER

// Weaponry -----------------
/datum/craft_recipe/trapper/crossbow_bolts
	name = "Crossbow Bolts"
	result = /obj/item/ammo_casing/crossbow_bolts/bulk
	time = 0
	steps = list(
		list(/obj/item/stack/rods, 5)
	)
	flags = CRAFT_BATCH

/datum/craft_recipe/trapper/crossbow_bolts/lethal
	name = "Fragment Crossbow Bolt"
	result = /obj/item/ammo_casing/crossbow_bolts/fragment/bulk
	steps = list(
		list(/obj/item/stack/rods, 5),
		list(/obj/item/stack/ore, 1)
	)

/datum/craft_recipe/trapper/crossbow_bolts/speed
	name = "Aerodynamic Crossbow Bolts"
	result = /obj/item/ammo_casing/crossbow_bolts/speed/bulk
	time = 0
	steps = list(
		list(/obj/item/stack/rods, 5),
		list(CRAFT_MATERIAL, 1, MATERIAL_BONE, "time" = 1), //Takes a second
		list(CRAFT_MATERIAL, 1, MATERIAL_LEATHER, "time" = 1) //Takes a second
	)

/datum/craft_recipe/trapper/arrow_hunting
	name = "hunting arrows"
	result = /obj/item/ammo_casing/arrow/hunting/bulk
	time = 0
	flags = CRAFT_BATCH
	steps = list(
		list(/obj/item/stack/rods, 3),
		list(CRAFT_MATERIAL, 2, MATERIAL_BONE, "time" = 1), //Takes a second
		list(/obj/item/reagent_containers/food/snacks/grown, 3, "time" = 1) //Takes a second
	)

/datum/craft_recipe/trapper/arrow_hunting/heavy
	name = "broadhead hunting arrows"
	result = /obj/item/ammo_casing/arrow/hunting/heavy/bulk
	steps = list(
		list(/obj/item/stack/rods, 3),
		list(CRAFT_MATERIAL, 3, MATERIAL_BONE, "time" = 1), //Takes a second
		list(/obj/item/reagent_containers/food/snacks/grown, 3, "time" = 1) //Takes a second
	)

/datum/craft_recipe/trapper/recurve_bow
	name = "Recurve Bow"
	result = /obj/item/gun/projectile/bow/hunting
	icon_state = "woodworking"
	steps = list(
		list(/obj/item/animal_part/stalker_chitin, "time" = 60),
		list(QUALITY_HAMMERING, 30, "time" = 40),
		list(CRAFT_MATERIAL, 10, MATERIAL_WOOD, "time" = 20),
		list(QUALITY_SAWING, 30, "time" = 40),
		list(QUALITY_HAMMERING, 30, "time" = 40),
		list(CRAFT_MATERIAL, 10, MATERIAL_BONE, "time" = 60),
		list(QUALITY_ADHESIVE, 30, "time" = 60),
		list(QUALITY_CUTTING, 30, "time" = 40),
		list(CRAFT_MATERIAL, 2, MATERIAL_CLOTH, "time" = 1),
		list(QUALITY_WIRE_CUTTING, 30, "time" = 40)
	)

/datum/craft_recipe/trapper/skinning_knife
	name = "Skinning Knife"
	result = /obj/item/tool/knife/dagger/skinning
	icon_state = "woodworking"
	steps = list(
		list(CRAFT_MATERIAL, 3, MATERIAL_PLASTEEL, "time" = 60),
		list(CRAFT_MATERIAL, 2, MATERIAL_WOOD, "time" = 20),
		list(QUALITY_SAWING, 10, "time" = 60),
		list(QUALITY_SCREW_DRIVING, 20, "time" = 30),
		list(QUALITY_HAMMERING, 15, "time" = 40),
		list(/obj/item/tool_upgrade/productivity/whetstone, 1, "time" = 30)
	)

/datum/craft_recipe/trapper/bone_shield
	name = "Bone Buckler"
	result = /obj/item/shield/buckler/handmade/bone
	icon_state = "woodworking"
	steps = list(
		list(CRAFT_MATERIAL, 6, MATERIAL_BONE, "time" = 60),
		list(CRAFT_MATERIAL, 1, MATERIAL_WOOD, "time" = 20),
		list(QUALITY_SAWING, 10, "time" = 40),
		list(/obj/item/stack/cable_coil, 5, "time" = 20),
		list(QUALITY_WIRE_CUTTING, 10, "time" = 40)
	)

/datum/craft_recipe/trapper/cleaver
	name = "Trappers cleaver"
	result = /obj/item/tool/sword/cleaver
	icon_state = "woodworking"
	steps = list(
		list(CRAFT_MATERIAL, 4, MATERIAL_PLASTEEL, "time" = 30),
		list(QUALITY_WELDING, 15, "time" = 60),
		list(QUALITY_HAMMERING, 15, "time" = 60),
		list(QUALITY_WELDING, 15, "time" = 60),
		list(CRAFT_MATERIAL, 2, MATERIAL_WOOD, "time" = 30),
		list(QUALITY_CUTTING, 15, "time" = 40),
		list(QUALITY_WIRE_CUTTING, 10, "time" = 40)
	)

// Armor --------------------
/datum/craft_recipe/trapper/hunter_hood
	name = "Trappers's hat"
	result = /obj/item/clothing/head/trapper
	icon_state = "clothing"
	steps = list(
		list(CRAFT_MATERIAL, 10, MATERIAL_LEATHER, "time" = 60),
		list(QUALITY_CUTTING, 10, "time" = 50),
		list(CRAFT_MATERIAL, 5, MATERIAL_STEEL, "time" = 40),
		list(/obj/item/stack/cable_coil, 10, "time" = 20),
		list(QUALITY_WIRE_CUTTING, 15, 30)
	)

/datum/craft_recipe/trapper/hunter_armor_basic
	name = "Trapper coat"
	result = /obj/item/clothing/suit/greatcoat/trapper
	icon_state = "clothing"
	steps = list(
		list(CRAFT_MATERIAL, 20, MATERIAL_LEATHER, "time" = 60),
		list(QUALITY_CUTTING, 15, "time" = 50),
		list(CRAFT_MATERIAL, 10, MATERIAL_STEEL, "time" = 60),
		list(QUALITY_WELDING, 20, "time" = 90),
		list(/obj/item/stack/cable_coil, 10, "time" = 20),
		list(QUALITY_WIRE_CUTTING, 15, 30),
	)
/*
/datum/craft_recipe/lodge/hunter_armor_bonedaddy
	name = "Hunter Armor - Bone Armor"
	result = /obj/item/clothing/suit/armor/hunter/bone
	icon_state = "clothing"
	steps = list(
		list(/obj/item/clothing/suit/armor/hunter, 1, "time" = 20),
		list(QUALITY_CUTTING, 15, "time" = 50),
		list(CRAFT_MATERIAL, 15, MATERIAL_BONE, "time" = 40),
		list(/obj/item/stack/cable_coil, 10, "time" = 20),
		list(QUALITY_WIRE_CUTTING, 15, 30)
	)

/datum/craft_recipe/lodge/hunter_armor_metalman
	name = "Hunter Armor - Metal Plating"
	result = /obj/item/clothing/suit/armor/hunter/reinforced
	icon_state = "clothing"
	steps = list(
		list(/obj/item/clothing/suit/armor/hunter, 1, "time" = 20),
		list(CRAFT_MATERIAL, 20, MATERIAL_STEEL, "time" = 60),
		list(QUALITY_SCREW_DRIVING, 15, "time" = 50),
		list(/obj/item/stack/cable_coil, 10, "time" = 20),
		list(QUALITY_WIRE_CUTTING, 15, 30),
		list(QUALITY_WELDING, 20, "time" = 90)
	)

/datum/craft_recipe/lodge/hunter_armor_leatherdom
	name = "Hunter Armor - Reinforced Leather"
	result = /obj/item/clothing/suit/armor/hunter/leather
	icon_state = "clothing"
	steps = list(
		list(/obj/item/clothing/suit/armor/hunter, 1, "time" = 20),
		list(CRAFT_MATERIAL, 20, MATERIAL_LEATHER, "time" = 60),
		list(QUALITY_CUTTING, 15, "time" = 50),
		list(/obj/item/stack/cable_coil, 10, "time" = 20),
		list(QUALITY_WIRE_CUTTING, 15, 30)
	)

/datum/craft_recipe/lodge/hunter_boots
	name = "Hunter Boots"
	result = /obj/item/clothing/shoes/hunterboots
	icon_state = "clothing"
	steps = list(
		list(CRAFT_MATERIAL, 8, MATERIAL_LEATHER, "time" = 60),
		list(QUALITY_CUTTING, 15, "time" = 50),
		list(CRAFT_MATERIAL, 4, MATERIAL_WOOD, "time" = 30),
		list(QUALITY_HAMMERING, 15, 30)
	)

/datum/craft_recipe/lodge/hunter_gloves
	name = "Hunter Gloves"
	result = /obj/item/clothing/gloves/thick/hunter
	icon_state = "clothing"
	steps = list(
		list(CRAFT_MATERIAL, 4, MATERIAL_LEATHER, "time" = 60),
		list(QUALITY_CUTTING, 15, "time" = 50),
		list(CRAFT_MATERIAL, 2, MATERIAL_BONE, "time" = 10),
		list(/obj/item/stack/cable_coil, 10, "time" = 20),
		list(QUALITY_WIRE_CUTTING, 15, 30)
	)
*/
// Medicine -----------------
/datum/craft_recipe/trapper/tahca_tongue
	name = "tahca blood tongue"
	result = /obj/item/stack/medical/bruise_pack/advanced/tahca_tongue
	icon_state = "clothing"
	steps = list(
		list(/obj/item/animal_part/tahca_tongue, 1, "time" = 20),
		list(QUALITY_HAMMERING, 15, "time" = 40)
	)

/*
/datum/craft_recipe/trapper/powder_pouch
	name = "Tatonka powder pouch"
	result = /obj/item/stack/medical/ointment/advanced/powder_pouch
	icon_state = "clothing"
	steps = list(
		list(CRAFT_MATERIAL, 1, MATERIAL_LEATHER, "time" = 60),
		list(/obj/item/animal_part/tatonka_horn, 1, "time" = 20),
		list(QUALITY_HAMMERING, 15, "time" = 40)
	)
*/

/datum/craft_recipe/trapper/tangu_juice
	name = "Tangu Extract"
	result = /obj/item/reagent_containers/glass/bottle/tangu_extract
	icon_state = "clothing"
	steps = list(
		list(/obj/item/reagent_containers/glass/bottle, 1, "time" = 20),
		list(/obj/item/animal_part/tangu_horn, 1, "time" = 20),
		list(QUALITY_HAMMERING, 30, "time" = 40)
	)

/datum/craft_recipe/trapper/clucker_juice
	name = "Clucker Feather extract"
	result = /obj/item/reagent_containers/glass/bottle/clucker_extract
	icon_state = "clothing"
	steps = list(
		list(/obj/item/reagent_containers/glass/bottle, 1, "time" = 20),
		list(/obj/item/animal_part/clucker_feather, 1, "time" = 20),
		list(QUALITY_HAMMERING, 15, "time" = 40)
	)

/datum/craft_recipe/trapper/tahca_antiviral
	name = "Tahca Extract"
	result = /obj/item/reagent_containers/glass/bottle/tahcacillin
	icon_state = "clothing"
	steps = list(
		list(/obj/item/reagent_containers/glass/bottle, 1, "time" = 20),
		list(/obj/item/animal_part/tahca_antler, 1, "time" = 20),
		list(QUALITY_HAMMERING, 15, "time" = 40)
	)

// Misc. --------------------

/datum/craft_recipe/trapper/soap
	name = "Handmade Soap"
	result = /obj/item/soap/hunters
	steps = list(
		list(CRAFT_MATERIAL, 3, MATERIAL_WOOD, "time" = 60),
		list(/obj/item/animal_part/cerberus_snout, 1, "time" = 20),
		list(/obj/item/reagent_containers/food/snacks/egg/clucker, 1, "time" = 20),
		list(QUALITY_HAMMERING, 15, "time" = 40)
	)

/datum/craft_recipe/trapper/duct_tape_weak
	name = "Duct Tape"
	result = /obj/item/tool/tape_roll
	icon_state = "clothing"
	steps = list(
		list(CRAFT_MATERIAL, 3, MATERIAL_WOOD, "time" = 60),
		list(/obj/item/animal_part/cerberus_snout, 1, "time" = 20),
		list(QUALITY_HAMMERING, 15, "time" = 40)
	)

/datum/craft_recipe/trapper/duct_tape
	name = "Flex Tape"
	result = /obj/item/tool/tape_roll/flextape
	icon_state = "clothing"
	steps = list(
		list(CRAFT_MATERIAL, 3, MATERIAL_WOOD, "time" = 60),
		list(/obj/item/animal_part/slepnir_hoof, 1, "time" = 20),
		list(QUALITY_HAMMERING, 15, "time" = 40)
	)

/datum/craft_recipe/trapper/chimera_fang
	name = "Chimera Fang Trophy"
	result = /obj/item/oddity/chimeric_fang_trophy
	icon_state = "clothing"
	steps = list(
		list(/obj/item/animal_part/chimera_fang, 1, "time" = 10),
		list(QUALITY_CUTTING, 50, "time" = 90)
	)

/datum/craft_recipe/trapper/hunting_belt
	name = "Hunting Belt"
	result = /obj/item/storage/belt/hunter
	icon_state = "clothing"
	steps = list(
		list(CRAFT_MATERIAL, 8, MATERIAL_LEATHER, "time" = 60),
		list(QUALITY_CUTTING, 15, "time" = 50),
		list(/obj/item/stack/cable_coil, 10, "time" = 20),
		list(QUALITY_WIRE_CUTTING, 10, 30),
		list(CRAFT_MATERIAL, 3, MATERIAL_LEATHER, "time" = 30),
		list(QUALITY_CUTTING, 15, "time" = 50)
	)

/datum/craft_recipe/trapper/leather_medium_pouch
	name = "medium leather pouch"
	result = /obj/item/storage/pouch/medium_generic/leather
	icon_state = "clothing"
	steps = list(
		list(CRAFT_MATERIAL, 4, MATERIAL_LEATHER, "time" = 30),
		list(QUALITY_ADHESIVE, 10, "time" = 60)
	)

/datum/craft_recipe/trapper/leather_large_pouch
	name = "large leather pouch"
	result = /obj/item/storage/pouch/large_generic/leather
	icon_state = "clothing"
	steps = list(
		list(CRAFT_MATERIAL, 8, MATERIAL_LEATHER, "time" = 30),
		list(QUALITY_ADHESIVE, 10, "time" = 60)
	)

/datum/craft_recipe/trapper/hunter_necklace
	name = "Fang Tooth Necklace"
	result = /obj/item/clothing/accessory/hunter_necklace
	icon_state = "clothing"
	steps = list(
		list(CRAFT_MATERIAL, 3, MATERIAL_LEATHER, "time" = 60),
		list(QUALITY_CUTTING, 15, "time" = 50),
		list(/obj/item/stack/wolf_tooth, 5, "time" = 10),
		list(QUALITY_WIRE_CUTTING, 15, "time" = 70)
	)
