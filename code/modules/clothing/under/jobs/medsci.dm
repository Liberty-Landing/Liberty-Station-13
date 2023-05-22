/*
 * Science
 */
/obj/item/clothing/under/rank/expedition_overseer
	desc = "A brown suit complete with a white shirt and green tie. The fibre offers minor biohazard protection."
	name = "Research Provost's suit"
	icon_state = "director"
	item_state = "lb_suit"
	cold_protection = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	min_cold_protection_temperature = T0C - 15
	armor_list = list(melee = 0, bullet = 0, energy = 0, bomb = 0, bio = 10, rad = 0)

/obj/item/clothing/under/rank/scientist
	desc = "A dark navy scientist's jacket complete with navy pants. The fibre offers minor biohazard protection."
	name = "Phokorus Institute Scientist's uniform"
	icon_state = "science"
	item_state = "w_suit"
	cold_protection = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	min_cold_protection_temperature = T0C - 10
	permeability_coefficient = 0.50
	armor_list = list(melee = 0, bullet = 0, energy = 0, bomb = 10, bio = 0, rad = 0)

/*
 * Medical
 */
/obj/item/clothing/under/rank/cso
	desc = "A Surgeon Overseer's outfit in CAPSA Group colors. The fiber offers minor biohazard protection."
	name = "Surgeon Overseer's uniform"
	icon_state = "cso"
	item_state = "cso"
	permeability_coefficient = 0.50
	armor_list = list(melee = 0, bullet = 0, energy = 0, bomb = 0, bio = 10, rad = 0)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	cold_protection = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	min_cold_protection_temperature = T0C - 15

/obj/item/clothing/under/rank/cso/verb/toggle_style()
	set name = "Adjust style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["green shirt, white pants"] = "cso"
	options["white shirt, green pants"] = "cso_alt"
	options["girlboss"] = "cso_skirt"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		item_state_slots = list(
			slot_back_str = options[choice]
		)
		to_chat(M, "You decided to roll with the [choice] style.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/under/rank/medical
	desc = "A Doctor's outfit in CAPSA colors. The polymer fibers offer minor biohazard protection."
	name = "CAPSA Doctor's uniform"
	icon_state = "medical"
	item_state = "medical"
	permeability_coefficient = 0.50
	armor_list = list(melee = 0, bullet = 0, energy = 0, bomb = 0, bio = 10, rad = 0)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	cold_protection = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS

/obj/item/clothing/under/rank/medical/verb/toggle_style()
	set name = "Adjust style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["shirt and pants"] = "medical"
	options["shirt and skirt"] = "mediskirt"
	options["shirt with pencil skirt"] = "mediskirt_alt"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		item_state_slots = list(
			slot_back_str = options[choice]
		)
		to_chat(M, "You decided to roll with the [choice] style.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/under/rank/psych
	desc = "A warm and calming turtleneck in CAPSA medical colors."
	name = "CAPSA turtleneck"
	icon_state = "capsaturtle"
	item_state = "b_suit"
	permeability_coefficient = 0.50
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	cold_protection = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	min_cold_protection_temperature = T0C - 15

/obj/item/clothing/under/rank/psych/verb/toggle_style()
	set name = "Adjust style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["green with black pants"] = "capsaturtle"
	options["white with green pants"] = "capsaturtle_white"
	options["white with green skirt"] = "capsaturtle_whiteskirt"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		item_state_slots = list(
			slot_back_str = options[choice]
		)
		to_chat(M, "You decided to roll with the [choice] style.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/under/rank/paramedic
	desc = "A warm gorka made by CAPSA for their Paramedics. It's made with reinforced fiber to offer more protection for recovery operations in perilously cold climates."
	name = "CAPSA Paramedic jumpsuit"
	icon_state = "paramedic"
	item_state = "paramedic"
	permeability_coefficient = 0.50
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	cold_protection = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	min_cold_protection_temperature = T0C - 20
	armor_list = list(
		melee = 10,
		bullet = 5,
		energy = 5,
		bomb = 0,
		bio = 30,
		rad = 0
	)

/obj/item/clothing/under/rank/paramedic/bdu
	desc = "An old BDU that someone appears to have dyed in the signature colours of CAPSA Group. It is made with reinforced fibers and sterile materials."
	name = "CAPSA Paramedic bdu"
	icon_state = "bdutt"
	item_state = "bdutt"
	permeability_coefficient = 0.50
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	cold_protection = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	min_cold_protection_temperature = T0C - 20

/obj/item/clothing/under/rank/paramedic/bdu/verb/toggle_style()
	set name = "Adjust style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["suit up"] = ""
	options["suit down"] = "_pants"
	options["sleeves up"] = "_rolled"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		var/base = initial(icon_state)
		base += options[choice]
		icon_state = base
		item_state = base
		item_state_slots = null
		to_chat(M, "You roll your [choice].")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/* Misc CAPSA clothing */

// Scrubs, removed purple because it was horrid and un-fitting

/obj/item/clothing/under/scrubs
	name = "blue scrubs"
	desc = "A sterile blue uniform designed to protect against contamination."
	icon_state = "scrubsblue"
	item_state = "b_suit"
	permeability_coefficient = 0.50

/obj/item/clothing/under/scrubs/green
	name = "green scrubs"
	desc = "A sterile green uniform designed to protect against contamination."
	icon_state = "scrubsgreen"
	item_state = "scrubsgreen"

// Informal clothing, might expand in future.

/obj/item/clothing/under/rank/capsa_camo
	name = "CAPSA camo shirt with pants"
	desc = "A green camo combat shirt with matching CAPSA trousers."
	icon_state = "capsa_camo"
	item_state = "g_suit"
	armor_list = list(melee = 5, bullet = 0, energy = 10, bomb = 0, bio = 5, rad = 5)
	permeability_coefficient = 0.50
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	cold_protection = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	min_cold_protection_temperature = T0C - 20

/obj/item/clothing/under/rank/capsa_pants
	name = "CAPSA combat trousers"
	desc = "Green combat trousers for CAPSA personnel. For those that want to mix and match their own style."
	icon_state = "capsa_camo"
	item_state = "g_suit"
	permeability_coefficient = 0.25 // Half clothing!
	body_parts_covered = LOWER_TORSO|LEGS
	cold_protection = LOWER_TORSO|LEGS
	min_cold_protection_temperature = T0C - 5 // Half coverage!

