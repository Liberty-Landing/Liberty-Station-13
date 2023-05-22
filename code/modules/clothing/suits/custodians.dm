//Master file is in storage.dm
/obj/item/clothing/suit/storage/custodian
	name = "base custodian coat item"
	desc = "Not meant to appear in-game"
	icon_state = "oathbound_garb"
	item_state = "oathbound_garb"
	blood_overlay_type = "coat"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	armor_list = list(melee = 20, bullet = 15, energy = 15, bomb = 10, bio = 0, rad = 0)
	cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	min_cold_protection_temperature = T0C - 20

/obj/item/clothing/suit/storage/custodian/oathbound
	name = "oathbound coat"
	desc = "A basic Oathbound coat tailored for the front line of the Custodians."
	icon_state = "oathbound_garb"
	item_state = "oathbound_garb"

/obj/item/clothing/suit/storage/custodian/oathpledge
	name = "oathpledge coat"
	desc = "A sleek fiber weaved suit that bears the mark of the Oathpledge."
	icon_state = "oathpledge_garb"
	item_state = "oathpledge_garb"

/obj/item/clothing/suit/storage/custodian/enkindled
	name = "enkindled coat"
	desc = "A victorian style silk coat made to protect those who call themselves Enkindled."
	icon_state = "enkindled_garb"
	item_state = "enkindled_garb"

/obj/item/clothing/suit/storage/custodian/forgemaster
	name = "forgemaster coat"
	desc = "A tough biosilk coat to keep Forgemasters protected and fashionable."
	icon_state = "forgemaster_garb"
	item_state = "forgemaster_garb"
