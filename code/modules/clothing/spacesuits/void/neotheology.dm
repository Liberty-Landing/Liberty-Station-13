/obj/item/clothing/head/helmet/space/void/acolyte
	name = "vector hood"
	desc = "Even the most devout deserve head protection."
	icon_state = "acolyte"
	item_state = "acolyte"
	armor_list = list(
		melee = 25,
		bullet = 25,
		energy = 25,
		bomb = 25,
		bio = 100,
		rad = 75
	)

/obj/item/clothing/suit/space/void/acolyte
	name = "vector armor"
	desc = "Worn, heavy, steadfast in the name of God."
	icon_state = "acolyte"
	item_state = "acolyte"
	slowdown = 0.15
	matter = list(MATERIAL_PLASTIC = 30, MATERIAL_STEEL = 25, MATERIAL_BIOMATTER = 40)
	armor_list = list(
		melee = 25,
		bullet = 25,
		energy = 25,
		bomb = 25,
		bio = 100,
		rad = 75
	)
	helmet = /obj/item/clothing/head/helmet/space/void/acolyte

/obj/item/clothing/head/helmet/space/void/agrolyte
	name = "agrolyte hood"
	desc = "Don't want anything getting in your eyes."
	icon_state = "botanist"
	item_state = "botanist"
	armor_list = list(
		melee = 25,
		bullet = 25,
		energy = 25,
		bomb = 25,
		bio = 100,
		rad = 75
	)

/obj/item/clothing/suit/space/void/agrolyte
	name = "agrolyte armor"
	desc = "Every rose has its thorns."
	icon_state = "botanist"
	item_state = "botanist"
	slowdown = 0
	matter = list(MATERIAL_PLASTIC = 30, MATERIAL_STEEL = 15, MATERIAL_BIOMATTER = 40)
	armor_list = list(
		melee = 25,
		bullet = 25,
		energy = 25,
		bomb = 25,
		bio = 100,
		rad = 75
	)
	helmet = /obj/item/clothing/head/helmet/space/void/agrolyte

/obj/item/clothing/head/helmet/space/void/janitor
	name = "custodian helmet"
	desc = "Cleaning floors is more dangerous than it looks."
	icon_state = "custodian"
	item_state = "custodian"
	armor_list = list(
		melee = 25,
		bullet = 25,
		energy = 25,
		bomb = 25,
		bio = 100,
		rad = 90
	)
	unacidable = TRUE

/obj/item/clothing/suit/space/void/janitor
	name = "custodian armor"
	desc = "Someone's gotta clean this mess. Skylight janitors often use this armor to protect themselves from the colonies various dangerous pests."
	icon_state = "custodian"
	item_state = "custodian"
	slowdown = 0.05
	matter = list(MATERIAL_PLASTIC = 40, MATERIAL_STEEL = 15, MATERIAL_BIOMATTER = 40)
	armor_list = list(
		melee = 25,
		bullet = 25,
		energy = 25,
		bomb = 25,
		bio = 100,
		rad = 90
	)
	unacidable = TRUE
	helmet = /obj/item/clothing/head/helmet/space/void/janitor

/obj/item/clothing/head/helmet/space/void/huscarl
	name = "huscarl voidsuit helmet"
	desc = "A voidsuit helmet designed by the Custodians using a mix of Bio-Silk and Carbon Fiber."
	icon_state = "huscarl_voidsuit_helmet"
	item_state = "huscarl_voidsuit_helmet"
	action_button_name = "Toggle Helmet Light"
	brightness_on = 4 //luminosity when on
	armor_list = list(
		melee = 40,
		bullet = 30,
		energy = 30,
		bomb = 30,
		bio = 100,
		rad = 50
	)
	siemens_coefficient = 0.35
	light_overlay = "helmet_light"

/obj/item/clothing/suit/space/void/huscarl
	name = "huscarl voidsuit"
	desc = "A voidsuit designed by the Custodians using a mix of Bio-Silk and Carbon Fiber."
	icon_state = "huscarl_voidsuit"
	item_state = "huscarl_voidsuit"
	matter = list(MATERIAL_STEEL = 45, MATERIAL_SILVER = 6, MATERIAL_PLASTEEL = 24, MATERIAL_BIO_SILK = 45, MATERIAL_PLASTIC = 30, MATERIAL_WOOD = 10, MATERIAL_CARBON_FIBER = 15)
	slowdown = 0.15
	armor_list = list(
		melee = 40,
		bullet = 30,
		energy = 30,
		bomb = 30,
		bio = 100,
		rad = 50
	)
	siemens_coefficient = 0.35
	breach_threshold = 10
	resilience = 0.07
	price_tag = 300


	helmet = /obj/item/clothing/head/helmet/space/void/huscarl

	min_cold_protection_temperature = SPACE_HELMET_MIN_COLD_PROTECTION_TEMPERATURE
	flash_protection = FLASH_PROTECTION_MODERATE
	item_flags = STOPPRESSUREDAMAGE|THICKMATERIAL|AIRTIGHT|COVER_PREVENT_MANIPULATION
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|BLOCKHAIR
