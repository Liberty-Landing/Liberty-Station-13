/datum/craft_recipe/trapper
	category = "Tribal"
	time = 100
	related_stats = list(STAT_BIO)
	requiredPerk = PERK_BUTCHER

// Weaponry -----------------


/datum/craft_recipe/trapper/arrow_hunting
	name = "hunting arrows"
	result = /obj/item/ammo_casing/arrow/hunting/bulk
	time = 0
	flags = CRAFT_BATCH
	steps = list(
		list(/obj/item/stack/rods, 5),
		list(CRAFT_MATERIAL, 2, MATERIAL_BONE, "time" = 1), //Takes a second
		list(/obj/item/reagent_containers/food/snacks/grown, 3, "time" = 1) // Grass clippings
	)

/datum/craft_recipe/trapper/arrow_hunting/heavy
	name = "broadhead hunting arrows"
	result = /obj/item/ammo_casing/arrow/hunting/heavy/bulk
	steps = list(
		list(/obj/item/stack/rods, 5),
		list(/obj/item/stack/wolf_tooth, 5, "time" = 1), // Really good arrows, but these are decently easy to come by.
		list(/obj/item/reagent_containers/food/snacks/grown, 3, "time" = 1) // Grass clippings
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
		list(CRAFT_MATERIAL, 3, MATERIAL_INDSTEEL, "time" = 60),
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

/datum/craft_recipe/tribal/totem
	name = "War Totem"
	result = /obj/item/tool/totem
	icon_state = "woodworking"
	steps = list(
		list(CRAFT_MATERIAL, 5, MATERIAL_DURALUMIN, "time" = 60),
		list(CRAFT_MATERIAL, 30, MATERIAL_WOOD, "time" = 20),
		list(QUALITY_SAWING, 10, "time" = 40),
		list(QUALITY_CUTTING, 10, "time" = 40),
		list(QUALITY_WIRE_CUTTING, 10, "time" = 40)
	)

/datum/craft_recipe/tribal/macuahuitl
	name = "Stone Blade"
	result = /obj/item/tool/sword/macuahuitl
	icon_state = "woodworking"
	steps = list(
		list(CRAFT_MATERIAL, 10, MATERIAL_DURALUMIN, "time" = 60),
		list(CRAFT_MATERIAL, 25, MATERIAL_WOOD, "time" = 20),
		list(QUALITY_SAWING, 10, "time" = 40),
		list(QUALITY_CUTTING, 10, "time" = 40),
		list(QUALITY_WIRE_CUTTING, 10, "time" = 40)
	)

/datum/craft_recipe/tribal/rungu
	name = "Throwing Cudgel"
	result = /obj/item/tool/sword/rungu
	icon_state = "woodworking"
	steps = list(
		list(CRAFT_MATERIAL, 15, MATERIAL_WOOD, "time" = 20),
		list(QUALITY_SAWING, 10, "time" = 40),
		list(QUALITY_CUTTING, 10, "time" = 40),
		list(QUALITY_SCREW_DRIVING, 10, "time" = 40)
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

