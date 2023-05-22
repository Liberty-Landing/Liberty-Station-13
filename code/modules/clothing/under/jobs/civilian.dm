//Alphabetical order of civilian jobs.
/* Assistant - Archive
/obj/item/clothing/under/rank/assistant
	desc = "A standard-issue black and orange colonist uniform."
	name = "colonist's uniform"
	icon_state = "assistant"
	item_state = "assistant"
*/
//Libery Assistant
/obj/item/clothing/under/rank/assistant
	name = "colonist's uniform"
	desc = "A standard-issue black and brown colonist uniform.  Get up, there's work to be done, and we work for ourselves now."
	cold_protection = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	min_cold_protection_temperature = T0C - 20
	icon_state = "liberassistant"
	item_state = "liberassistant"

/obj/item/clothing/under/rank/assistant/formal
	name = "colonist's formal uniform"
	desc = "An assistant's formal-wear. Why an assistant needs formal-wear is still unknown."
	icon_state = "assistant_formal"
	item_state = "gy_suit"

/obj/item/clothing/under/rank/bartender
	desc = "An expensive shirt and tie with tailored pants."
	name = "bartender's uniform"
	icon_state = "ba_suit"
	item_state = "ba_suit"

/obj/item/clothing/under/rank/bartender/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["bartender's uniform"] = "ba_suit"
	options["bartender's skirtsuit"] = "ba_skirt"
	options["waiter's skirtsuit"] = "waiter_skirt"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		item_state = options[choice]
		item_state_slots = null
		to_chat(M, "You adjust your [choice].")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1


/obj/item/clothing/under/rank/captain //Alright, technically not a 'civilian' but its better then giving a .dm file for a single define.
	desc = "An authoritative green uniform with gold flair denoting the rank of a Board Secretary."
	name = "secretary's uniform"
	icon_state = "captain"
	item_state = "b_suit"

/obj/item/clothing/under/rank/captain/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["secretary's uniform"] = "captain"
	options["secretary's formal uniform"] = "captain_formal"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		item_state = options[choice]
		item_state_slots = null
		to_chat(M, "You adjust your [choice].")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/under/rank/cargotech
	name = "skylight cargo uniform"
	desc = "A grey and orange Skylight jumpsuit to fit Skylight regulations."
	icon_state = "cargotech"
	item_state = "miner"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS

/obj/item/clothing/under/rank/cargoclerk
	name = "skylight office uniform"
	desc = "A grey and orange Skylight suit to fit Skylight regulations."
	icon_state = "cargoclerk"
	item_state = "miner"

	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS

/obj/item/clothing/under/custodian
	matter = list(MATERIAL_BIO_SILK = 15)

/obj/item/clothing/under/custodian/oathbound
	name = "oathbound underarmor"
	desc = "A comfortable Custodian underarmor that's easy to move in and reduces chafing when wearing their signature suits of armor."
	icon_state = "oathbound_underarmor"
	item_state = "oathbound_underarmor"

/obj/item/clothing/under/custodian/enkindled
	name = "enkindled underarmor"
	desc = "A comfortable Custodian underarmor that's easy to move in and reduces chafing when wearing their signature suits of armor."
	icon_state = "enkindled_underarmor"
	item_state = "enkindled_underarmor"

/obj/item/clothing/under/custodian/forgemaster
	name = "forgemaster underarmor"
	desc = "A comfortable Custodian underarmor that's easy to move in and reduces chafing when wearing their signature suits of armor."
	icon_state = "forgemaster_underarmor"
	item_state = "forgemaster_underarmor"

/obj/item/clothing/under/custodian/oathpledge
	name = "oathpledge underarmor"
	desc = "A comfortable Custodian underarmor that's easy to move in and reduces chafing when wearing their signature suits of armor."
	icon_state = "oathpledge_underarmor"
	item_state = "oathpledge_underarmor"

/obj/item/clothing/under/rank/chef
	desc = "A pleasant yet practical suit for professional kitchen staff."
	name = "chef's uniform"
	icon_state = "chef"
	item_state = "w_suit"

/obj/item/clothing/under/rank/botanist
	desc = "A hardy dark green jumpsuit, designed to provide protection from botanic dangers."
	name = "botanist's jumpsuit"
	icon_state = "hydroponics"
	item_state = "g_suit"
	permeability_coefficient = 0.50

/obj/item/clothing/under/rank/janitor
	desc = "A sturdy janitorial jumpsuit, designed to provide minor protection from biohazards."
	name = "janitor's jumpsuit"
	icon_state = "janitor"
	item_state = "janitor"
	permeability_coefficient = 0.50
	armor_list = list(
		melee = 0,
		bullet = 0,
		energy = 0,
		bomb = 0,
		bio = 10,
		rad = 0
	)

/obj/item/clothing/under/rank/artist
	name = "Jester's Garments"
	desc = "The bright colors are almost distracting."
	icon_state = "artist"
	item_state = "artist"

/obj/item/clothing/under/outcast
	name = "tactical baggy rags"
	desc = "A jury rugged set of baggy pants with leather reinforcement paddings and other fibers, as comfortable as clothes can get when made by whatever you scavenged off the land."
	icon_state = "tactical_rags"
	item_state = "tactical_rags"
	cold_protection = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	min_cold_protection_temperature = T0C - 20
	armor_list = list(melee = 5, bullet = 0, energy = 10, bomb = 0, bio = 0, rad = 5)

/obj/item/clothing/under/rank/Skylight_gorka
	name = "Skylight gorka jumpsuit"
	desc = "A gorka suit painted over with Skylight orange and black."
	icon_state = "ls_gorka"
	item_state = "ls_gorka"
