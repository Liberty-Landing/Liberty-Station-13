/obj/item/clothing/head/hood
	name = "hood"
	desc = "A generic hood."
	icon_state = "generic_hood"
	body_parts_covered = HEAD
	cold_protection = HEAD
	flags_inv = HIDEEARS | BLOCKHAIR

/*
// Winter coats
/obj/item/clothing/head/hood/winter
	name = "winter hood"
	desc = "A hood attached to a heavy winter jacket."
	icon_state = "generic_hood"
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/head/hood/winter/captain
	name = "premier's winter hood"
	armor_list = list(melee = 20, bullet = 15, energy = 10, bomb = 15, bio = 0, rad = 0)

/obj/item/clothing/head/hood/winter/security
	name = "security winter hood"
	armor_list = list(melee = 25, bullet = 20, energy = 15, bomb = 20, bio = 0, rad = 0)

/obj/item/clothing/head/hood/winter/medical
	name = "medical winter hood"
	armor_list = list(melee = 0, bullet = 0,energy = 0, bomb = 0, bio = 50, rad = 0)

/obj/item/clothing/head/hood/winter/science
	name = "science winter hood"
	armor_list = list(melee = 0, bullet = 0,energy = 0, bomb = 10, bio = 0, rad = 0)

/obj/item/clothing/head/hood/winter/engineering
	name = "guild winter hood"
	armor_list = list(melee = 0, bullet = 0, energy = 0, bomb = 0, bio = 0, rad = 20)

/obj/item/clothing/head/hood/winter/engineering/atmos
	name = "atmospherics winter hood"

/obj/item/clothing/head/hood/winter/botany
	name = "botany winter hood"

/obj/item/clothing/head/hood/winter/cargo
	name = "cargo winter hood"

/obj/item/clothing/head/hood/winter/cargo/miner
	name = "mining winter hood"
	armor_list = list(melee = 10, bullet = 0, energy = 0, bomb = 0, bio = 0, rad = 0)
*/
// Explorer gear
/obj/item/clothing/head/hood/explorer
	name = "explorer hood"
	desc = "An armoured hood for exploring harsh environments."
	icon_state = "explorer"
	flags = THICKMATERIAL
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	siemens_coefficient = 0.9
	armor_list = list(melee = 20, bullet = 20, energy = 20, bomb = 35, bio = 75, rad = 35)

// Costumes
/obj/item/clothing/head/hood/carp_hood
	name = "carp hood"
	desc = "A hood attached to a carp costume."
	icon_state = "carp"
	item_state_slots = list(slot_r_hand_str = "carp_casual", slot_l_hand_str = "carp_casual") //Does not exist -S2-
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE	//Space carp like space, so you should too

/obj/item/clothing/head/hood/ian_hood
	name = "corgi hood"
	desc = "A hood that looks just like a corgi's head, it won't guarantee dog biscuits."
	icon_state = "ian"
	item_state_slots = list(slot_r_hand_str = "ian", slot_l_hand_str = "ian") //Does not exist -S2-

/obj/item/clothing/head/hood/techpriest
	name = "techpriest hood"
	desc = "For larping as the other techno cult."
	icon_state = "techpriest"
	item_state = "techpriest"

/obj/item/clothing/head/hood/absolutecloakhood
	name = "Cultist cloak hood"
	desc = "Protect yourself from the elements or conceal your identity, in the name of the Two Divines."
	armor_list = list(
		melee = 0,
		bullet = 0, //unarmoured, but bioproof
		energy = 0,
		bomb = 0,
		bio = 100,
		rad = 0,
	)
	icon_state = "absolutecloakhood"
	item_state = "absolutecloakhood"

/obj/item/clothing/head/hood/trapper
	name = "trapper hood"
	desc = "A captivating blend of warmth and intrigue from trappers, to trappers. This headgear is fashioned from animal skin, fleece lining, and furs, just enough to be life saving against the cold - but don't offer much protection against damage."
	icon_state = "hood_trapper"
	item_state = "hood_trapper"
	armor_list = list(
		melee = 20,
		bullet = 20,
		energy = 20,
		bomb = 35,
		bio = 75,
		rad = 35
	)

/obj/item/clothing/head/hood/trapper/bone
	name = "boneplated hood"
	desc = "A warm, handmade woolen hood adorned with the emblem of Fontaine and reinforced with dark bones from this planet's fauna due to the well know hardness and ability to dissipate energy from the creature's bones."
	icon_state = "hood_bones"
	item_state = "hood_bones"
	armor_list = list(
		melee = 25,
		bullet = 45,
		energy = 25,
		bomb = 10,
		bio = 100,
		rad = 50
	)

/obj/item/clothing/head/hood/trapper/shell
	name = "Shellclad Hood"
	desc = "A handcrafted, warm woolen hood bearing the emblem of Fontaine, reinforced with unnatural shells designed to absorb impacts and thwart blade penetration. Everything will turn into alien crab one day, and the user of this hood is far too clueless about it."
	icon_state = "hood_chitin"
	item_state = "hood_chitin"
	armor_list = list(
		melee = 45,
		bullet = 25,
		energy = 25,
		bomb = 10,
		bio = 100,
		rad = 50
	)
