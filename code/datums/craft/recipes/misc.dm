/datum/craft_recipe/ashtray
	name = "ashtray"
	result = /obj/item/material/ashtray
	steps = list(
		list(CRAFT_MATERIAL, 1, MATERIAL_ALUMINIUM)
	)
	related_stats = list(STAT_COG)

/datum/craft_recipe/tray
	name = "dinner tray"
	result = /obj/item/tray
	steps = list(
		list(CRAFT_MATERIAL, 1, MATERIAL_ALUMINIUM, "time" = 40),
		list(QUALITY_WIRE_CUTTING, 10, 120)
	)
	related_stats = list(STAT_COG)

/datum/craft_recipe/folder
	name = "folder, black"
	steps = list(
		list(CRAFT_MATERIAL, 1, MATERIAL_CARDBOARD)
	)
	related_stats = list(STAT_COG)

/datum/craft_recipe/folder/blue
	name = "folder, blue"
	result = /obj/item/folder/blue

/datum/craft_recipe/folder/cyan
	name = "folder, cyan"
	result = /obj/item/folder/cyan

/datum/craft_recipe/folder/grey
	name = "folder, grey"
	result = /obj/item/folder

/datum/craft_recipe/folder/red
	name = "folder, red"
	result = /obj/item/folder/red

/datum/craft_recipe/folder/yellow
	name = "folder, yellow"
	result = /obj/item/folder/yellow

/datum/craft_recipe/plasticflaps
	name = "plastic flaps"
	result = /obj/structure/plasticflaps
	steps = list(
		list(CRAFT_MATERIAL, 4, MATERIAL_PLASTIC) //I can see people abusing this a lot
	)
	flags = CRAFT_ON_FLOOR|CRAFT_ONE_PER_TURF

/datum/craft_recipe/metal_rod
	name = "metal rod"
	result = /obj/item/stack/rods
	time = 0
	steps = list(
		list(CRAFT_MATERIAL, 1, MATERIAL_ALUMINIUM)
	)
	flags = CRAFT_BATCH
	related_stats = list(STAT_COG)

/datum/craft_recipe/pipe
	name = "Smoking pipe"
	result = /obj/item/clothing/mask/smokable/pipe
	icon_state = "woodworking"
	steps = list(
		list(CRAFT_MATERIAL, 5, MATERIAL_WOOD, "time" = 0),
		list(QUALITY_CUTTING, 10, 10)
	)
	related_stats = list(STAT_COG)

/datum/craft_recipe/cloth_stripe
	name = "salvage cloth from clothing" // Recycle every single clothing article!
	result = /obj/item/stack/material/cloth/random
	icon_state = "clothing"
	steps = list(
		list(/obj/item/clothing, 1, "time" = 20),
		list(QUALITY_CUTTING, 10, "time" = 30)
	)

// Recycle shoes into small amounts of leather strips. Inspired by CDDA/Project Zomboid (mods).
/datum/craft_recipe/recycle_shoes
	name = "salvage leather from shoes"
	result = /obj/item/stack/material/leather/random
	icon_state = "clothing"
	steps = list(
		list(/obj/item/clothing/shoes, 1, "time" = 20),
		list(QUALITY_CUTTING, 15, "time" = 30)
	)

/datum/craft_recipe/ameridian_spire
	name = "ameridian growth"
	flags = CRAFT_ON_FLOOR|CRAFT_ONE_PER_TURF
	result = /obj/structure/ameridian_crystal/spire/fake
	icon_state = "device"
	steps = list(
		list(/obj/item/ameridian_core, 1, "time" = 25),
		list(CRAFT_MATERIAL, 60, MATERIAL_AMERIDIAN, "time" = 25)
	)

/datum/craft_recipe/hair_pin
	name = "hair pin"
	result = /obj/item/clothing/head/pin
	steps = list(
		list(CRAFT_MATERIAL, 1, MATERIAL_ALUMINIUM)
	)

// Leaving the following commented out until Consumer crafts are finally coded
// This otherwise created an entire new tab for just one item, furthering crafting tab bloat
// Once the code for consumer goods and their items/recipes are finally coded,
// re-enable this and make every recipe a child of craft_recipe/consumer. - Seb

/*

// Consume!! Makes it's own tab. Not a big deal I guess.

/datum/craft_recipe/consumer
	category = "Consumer"
	time = 200
	related_stats = list(STAT_MEC)
	icon_state = "device"
*/

/datum/craft_recipe/toaster
	name = "toaster"
	result = /obj/item/toy/consumer/product/toaster
	steps = list(
		list(/obj/item/toy/consumer/kit/toaster, 1, "time" = 50),
		list(QUALITY_SCREW_DRIVING, 35, "time" = 170),
		list(QUALITY_BOLT_TURNING, 35, "time" =  200),
		list(QUALITY_SCREW_DRIVING, 35, "time" = 170),
		list(QUALITY_PRYING, 35, "time" = 170)
	)

