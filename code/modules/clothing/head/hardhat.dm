/obj/item/clothing/head/hardhat
	name = "hard hat"
	desc = "Headgear for dangerous working conditions. This one is an Union's standard yellow design with a built-in light."
	icon_state = "hardhat-y"
	item_state = "hardhat-y"
	action_button_name = "Toggle Headlamp"
	brightness_on = 4 //luminosity when on
	light_overlay = "hardhat_light"
	armor_list = list(
		melee = 10,
		bullet = 10,
		energy = 10,
		bomb = 10,
		bio = 10,
		rad = 25
	)
	siemens_coefficient = 0.8
	w_class = ITEM_SIZE_NORMAL
	price_tag = 30
	item_flags = STOPPRESSUREDAMAGE
	heat_protection = HEAD
	cold_protection = HEAD
	min_cold_protection_temperature = T0C - 20
	max_heat_protection_temperature = FIRE_HELMET_MAX_HEAT_PROTECTION_TEMPERATURE

/obj/item/clothing/head/hardhat/union_chief_helmet
	name = "union chief helmet"
	desc = "Headgear for dangerous working conditions with a built-in light. This one comes in standard Union's yellow."
	icon_state = "union_chief_helmet"
	item_state = "union_chief_helmet"

/obj/item/clothing/head/hardhat/union_engi_helmet
	name = "union engineer helmet"
	desc = "Headgear for dangerous working conditions with a built-in light. This one comes in standard Union's yellow."
	icon_state = "union_engi_helmet"
	item_state = "union_engi_helmet"

/obj/item/clothing/head/hardhat/union_miner_helmet
	name = "union miner helmet"
	desc = "Headgear for dangerous working conditions with a built-in light. This one comes in standard Union's yellow."
	icon_state = "union_miner_helmet"
	item_state = "union_miner_helmet"

/obj/item/clothing/head/hardhat/yellow
	name = "yellow hardhat"
	desc = "Headgear for dangerous working conditions with a built-in light. This one comes in standard Union's yellow."
	icon_state = "hardhat-y"
	item_state = "hardhat-y"

/obj/item/clothing/head/hardhat/orange
	name = "orange hardhat"
	desc = "Headgear for dangerous working conditions with a built-in light. This one comes in orange."
	icon_state = "hardhat-o"
	item_state = "hardhat-o"

/obj/item/clothing/head/hardhat/red
	name = "red hardhat"
	desc = "Headgear for dangerous working conditions with a built-in light. This one comes in red."
	icon_state = "hardhat-r"
	item_state = "hardhat-r"

/obj/item/clothing/head/hardhat/blue
	name = "blue hardhat"
	desc = "Headgear for dangerous working conditions with a built-in light. This one comes in blue."
	icon_state = "hardhat-b"
	item_state = "hardhat-b"

/obj/item/clothing/head/firefighter/chief
	name = "Union Chief helmet"
	desc = "A pure white fire resistant hard hat with a powerful headlight and built in nuclear cell. The best utility helmet the guild has."
	icon_state = "hardhat_white"
	item_flags = STOPPRESSUREDAMAGE
	heat_protection = HEAD
	max_heat_protection_temperature = FIRE_HELMET_MAX_HEAT_PROTECTION_TEMPERATURE
	action_button_name = "Toggle Headlamp"
	brightness_on = 6 //luminosity when on
	light_overlay = "hardhat_light"
	armor_list = list(
		melee = 30,
		bullet = 20,
		energy = 20,
		bomb = 35,
		bio = 10,
		rad = 25
	)
	siemens_coefficient = 0.8
	w_class = ITEM_SIZE_NORMAL
	price_tag = 100

/obj/item/clothing/head/firefighter/engineer_emergency
	name = "emergency engineering helmet"
	desc = "A heavy plated and radiation protected hard helmet meant for emergency repairs in the most dangerous areas."
	icon_state = "advanced_hardhat"
	item_flags = STOPPRESSUREDAMAGE
	heat_protection = HEAD
	max_heat_protection_temperature = FIRE_HELMET_MAX_HEAT_PROTECTION_TEMPERATURE
	action_button_name = "Toggle Headlamp"
	brightness_on = 8 //luminosity when on
	light_overlay = "hardhat_light"
	armor_list = list(
		melee = 40,
		bullet = 60,
		energy = 50,
		bomb = 75,
		bio = 80,
		rad = 100
	)
	siemens_coefficient = 0.8
	w_class = ITEM_SIZE_NORMAL
	price_tag = 100
