/*
 * Bomb protection
 */
/obj/item/clothing/head/helmet/space/bomb
	name = "bomb helmet"
	desc = "A protective helmet designed for safety when handling explosives, biological problems, and radiation."
	icon_state = "bombsuit"
	armor_list = list(
		melee = 20,
		bullet = 20,
		energy = 30,
		bomb = 100,
		bio = 100,
		rad = 90
	)
	max_upgrades = 3
	siemens_coefficient = 0
	tint = TINT_LOW
	obscuration = HEAVY_OBSCURATION
	price_tag = 100

/obj/item/clothing/suit/space/bomb
	name = "bomb suit"
	desc = "A protective suit designed for safety when handling explosives, biological problems, and radiation."
	icon_state = "bombsuit"
	item_state = "bombsuit"
	gas_transfer_coefficient = 0.01
	permeability_coefficient = 0.01
	slowdown = 1
	armor_list = list(
		melee = 20,
		bullet = 20,
		energy = 30,
		bomb = 100,
		bio = 100,
		rad = 90
	)
	tool_qualities = list(QUALITY_ARMOR = 100)
	max_upgrades = 3
	heat_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	max_heat_protection_temperature = ARMOR_MAX_HEAT_PROTECTION_TEMPERATURE
	siemens_coefficient = 0
	equip_delay = 10 SECONDS
	price_tag = 300

/obj/item/clothing/suit/space/bomb/security
	name = "watchman bomb suit"
	desc = "A protective suit designed for safety when handling explosives, biological problems, and radiation. This one appears to be mildly reinforced and sports Watchmen security colors."
	icon_state = "eod_suit"
	item_state = "eod_suit"
	slowdown = 1.2		//Slightly higher slowdown for slightly higher protection.
	armor_list = list(
		melee = 30,
		bullet = 40,
		energy = 30,
		bomb = 100,
		bio = 100,
		rad = 90
	)

/obj/item/clothing/head/helmet/space/bomb/security
	name = "watchman E.O.D helmet"
	desc = "For use when bombs, bullets, toxic enviroments, lasers, and melee are all a concern but speed is not. Outfitted with Watchman colors."
	icon_state = "eod_helmet"
	item_state = "eod_helmet"
	equip_delay = 16 SECONDS
	slowdown = 1.25 //so with full suit is 3.5 or 4.5
	armor_list = list(
		melee = 60,
		bullet = 60,
		energy = 60,
		bomb = 100,
		bio = 100,
		rad = 90
	)

/obj/item/clothing/suit/space/bomb/security
	name = "watchman E.O.D suit"
	desc = "For use when bombs, bullets, toxic enviroments, lasers, and melee are all a concern but speed is not. Outfitted with Watchman colors."
	icon_state = "eod_suit"
	item_state = "eod_suit"
	slowdown = 2.25
	equip_delay = 16 SECONDS
	armor_list = list(
		melee = 60,
		bullet = 60,
		energy = 60,
		bomb = 100,
		bio = 100,
		rad = 90
	)
