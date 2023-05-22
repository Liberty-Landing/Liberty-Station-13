/*
 * Baseline Armor
 */

/obj/item/clothing/suit/armor
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	item_flags = THICKMATERIAL|DRAG_AND_DROP_UNEQUIP
	cold_protection = UPPER_TORSO|LOWER_TORSO
	min_cold_protection_temperature = ARMOR_MIN_COLD_PROTECTION_TEMPERATURE
	heat_protection = UPPER_TORSO|LOWER_TORSO
	max_heat_protection_temperature = ARMOR_MAX_HEAT_PROTECTION_TEMPERATURE
	siemens_coefficient = 0.6
	price_tag = 200
	tool_qualities = list(QUALITY_ARMOR = 100)
	max_upgrades = 1
	extra_allowed = list(/obj/item/tool/hammer/ironhammer)
	stiffness = 0

/obj/item/clothing/suit/armor/refresh_upgrades()
	var/obj/item/clothing/suit/armor/referencecarmor = new type()
	armor = referencecarmor.armor
	qdel(referencecarmor)
	..()

/*
 * Vests
 */

/obj/item/clothing/suit/armor/vest
	name = "armor vest"
	desc = "An armored vest that protects against some damage. Not designed for serious operations."
	icon_state = "armor"
	item_state = "armor"
	blood_overlay_type = "armor"
	var/has_alternative_armor_icon = TRUE
	armor_list = list(
		melee = 35,
		bullet = 35,
		energy = 35,
		bomb = 10,
		bio = 0,
		rad = 0
	)

/obj/item/clothing/suit/armor/vest/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr
	var/mob/M = usr

	if(!isliving(loc))
		return

	if(!has_alternative_armor_icon)
		to_chat(M, "This clothing has no alternative styles!")
		return

	var/list/options = list()
	options["Baseline"] = "armor"
	options["Security"] = "armor_security"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		to_chat(M, "You adjusted your attire's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/suit/armor/vest/full
	name = "full body armor"
	desc = "A generic armor vest, but with shoulderpads and kneepads included to cover all parts of the body. Not designed for serious operations."
	icon_state = "armor_fullbody"
	item_state = "armor_fullbody"
	blood_overlay_type = "armor"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	stiffness = LIGHT_STIFFNESS

/obj/item/clothing/suit/armor/vest/full/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Baseline"] = "armor_fullbody"
	options["Security"] = "armor_security_fullbody"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		to_chat(M, "You adjusted your attire's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/suit/armor/vest/handmade
	name = "handmade armor vest"
	desc = "An armored vest of dubious quality. Provides decent protection against physical damage, for a piece of crap."
	icon_state = "armor_handmade"
	armor_list = list(
		melee = 25, // Please don't modify values without looking at overall armor standardizing
		bullet = 15,
		energy = 10,
		bomb = 10,
		bio = 0,
		rad = 0
	)
	price_tag = 150

/obj/item/clothing/suit/armor/vest/handmade/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Orange"] = "armor_handmade"
	options["Black"] = "hm_armorvest_black"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		to_chat(M, "You adjusted your attire's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/suit/armor/vest/handmade/full
	name = "full handmade armor vest"
	desc = "An armored vest of dubious quality. This one has had metal sheets attached to the shoulders and knees to be used as makeshift shoulderpads and kneepads."
	icon_state = "armor_handmade_fullbody"
	item_state = "armor_handmade_fullbody"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	stiffness = LIGHT_STIFFNESS

/obj/item/clothing/suit/armor/vest/handmade/full/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Orange"] = "armor_handmade_fullbody"
	options["Black"] = "hm_armorvest_black_full"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		to_chat(M, "You adjusted your attire's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

////////////

/*
 * Faction Vests
*/

/obj/item/clothing/suit/armor/vest/ironhammer
	name = "watchmen armor vest"
	desc = "An armored vest that protects against some damage. This one has been done in Watchmen security colors. Not designed for serious operations."
	icon_state = "watch_basic"
	has_alternative_armor_icon = FALSE

/obj/item/clothing/suit/armor/vest/ironhammer/full
	name = "watchmen tactical unit armor"
	desc = "An armored vest painted in Watchmen colors. This one has shoulderpads and kneepads included to protect all parts of the body."
	icon_state = "watch_basic_full"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	stiffness = LIGHT_STIFFNESS

/obj/item/clothing/suit/armor/vest/ironhammer/detective
	name = "watchmen criminal investigator vest"
	desc = "An armored vest that protects against some damage. This one appears to be in Watchmen colors and uses lighweight fibers; allowing for heavier armor without compromising on added weight."
	icon_state = "watch_detective"
	armor_list = list(
		melee = 45,
		bullet = 45,
		energy = 45,
		bomb = 20,
		bio = 0,
		rad = 0
	)

/obj/item/clothing/suit/armor/vest/ironhammer_wintercoat //pieced together thanks to Rebel's Supply spec coat - Dongels
	name = "security armored coat"
	desc = "An armored winter coat with vest that protects against some damage. This one has been done in Watchmen security colors. Not designed for serious operations. You're pretty sure the coat is just thick enough to keep warm, and that's all. Why you would want that on a planet like Phokorus is beyond thought."
	icon_state = "coatsecurity_long"
	has_alternative_armor_icon = FALSE

/obj/item/clothing/suit/armor/bulletproof/ironhammer
	name = "watchmen bulletproof suit"
	desc = "A bulky vest that excels in protecting the wearer against high-velocity solid projectiles with added shoulderpads and kneepads for extra coverage produced by Seinemetall Defense GmbH."
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	stiffness = LIGHT_STIFFNESS
	slowdown = 0.6 // Heavier since it now covers more of the body
	icon_state = "watch_bulletproof"
	item_state = "watch_bulletproof"

/obj/item/clothing/suit/armor/vest/ablative/ironhammer
	name = "watchmen ablative armor"
	desc = "A specialized armored plate carrier outfitted with light absorption and heat disperesion technology. This one has been done in Watchmen security colors."
	icon_state = "watch_ablative"
	item_state = "watch_ablative"

////////////

/*
 * Factions
*/

//Custodians
/obj/item/clothing/suit/armor/custodian
	name = "base custodian armor item"
	desc = "Not meant to appear in-game."
	icon_state = "oathbound"
	item_state = "oathbound"
	item_flags = THICKMATERIAL | COVER_PREVENT_MANIPULATION
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	armor_list = list(melee = 30, bullet = 30, energy = 30, bomb = 30, bio = 0, rad = 0)
	max_upgrades = 2
	flags_inv = HIDEJUMPSUIT
	heat_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	max_heat_protection_temperature = FIRESUIT_MAX_HEAT_PROTECTION_TEMPERATURE
	cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	min_cold_protection_temperature = T0C - 20
	matter = list(MATERIAL_STEEL = 15, MATERIAL_PLASTEEL = 13, MATERIAL_BIO_SILK = 30, MATERIAL_PLASTIC = 10)
	var/modifiable = TRUE //used to determine if you can use wire-cutters on this item to change the appearance

/obj/item/clothing/suit/armor/custodian/attackby(var/obj/item/I, var/mob/user)
	if(modifiable)
		if(!(QUALITY_WIRE_CUTTING in I.tool_qualities))
			return ..()
		var/options = list("Yes","No")
		var/selection = input(user,"Remove Custodian markings from this armor?","Armor Modification") in options
		if(selection == "Yes")
			if(is_equipped())
				to_chat(user, SPAN_NOTICE("You must drop the [src] before doing this."))
				return
			if(!do_after(user, 60, src))
				return
			name = "dark-silver armor"
			desc = "A suit of plate armor with no discernable markings. Protective, fire-resistant, and easy to move in."
			icon_state = initial(icon_state) + "_wirecutter"
			item_state = initial(item_state) + "_wirecutter"
			modifiable = FALSE
			to_chat(user,"You cut and carve away all Custodian markings.")

		else
			to_chat(user,"You change your mind.")

	return ..()

/obj/item/clothing/suit/armor/custodian/firesuit //keeps the temperature protection, has no armor and is slow
	name = "flameshield suit"
	desc = "A heavy suit used by the Custodians to operate the Bonfire and to protect them from high heat sources. \
	Flameshield suits are composed of specialized threads and porous foam that offer no protection whatsoever to physical trauma, energy weaponry, and other forms of damage."
	icon_state = "custodian_firesuit"
	item_state = "custodian_firesuit"
	armor_list = list(melee = 0, bullet = 0, energy = 0, bomb = 0, bio = 0, rad = 0)
	matter = list(MATERIAL_BIO_SILK = 20)
	stiffness = MEDIUM_STIFFNESS
	slowdown = 1.5
	modifiable = FALSE

/obj/item/clothing/suit/armor/custodian/oathbound
	name = "dark-silver oathbound armor"
	desc = "Artwork of purity and might, protective and light to the feet, the plate armors of the Oathbounds shine ever so slightly and protect against the flames."
	icon_state = "oathbound"
	item_state = "oathbound"

/obj/item/clothing/suit/armor/custodian/forgemaster
	name = "dark-silver forgemaster armor"
	desc = "The hammer and fist of the Custodians, the Forgemasters are extremely important personnel - and as such are provided an armor of their own to tame the fire."
	icon_state = "forgemaster"
	item_state = "forgemaster"

/obj/item/clothing/suit/armor/custodian/enkindled
	name = "dark-silver enkindled armor"
	desc = "The fire-resistant armor of the blood transmuters and alchemists of the Custodians, made in the image of forgotten legends of deranged plague-healers."
	icon_state = "enkindled"
	item_state = "enkindled"

/obj/item/clothing/suit/armor/custodian/oathpledge
	name = "dark-silver oathpledge armor"
	desc = "The formidable armor of the leaders and guides of the Custodians. A sturdy and fire-resistant design."
	icon_state = "oathpledge"
	item_state = "oathpledge"
	armor_list = list(melee = 40, bullet = 40, energy = 40, bomb = 40, bio = 0, rad = 0)
	modifiable = FALSE
	matter = list(MATERIAL_STEEL = 30, MATERIAL_PLASTEEL = 16, MATERIAL_BIO_SILK = 30, MATERIAL_PLASTIC = 15)

//Guild
/obj/item/clothing/suit/armor/vest/technomancersuit
	name = "'Mark V' environmental protection suit"
	desc = "For working in hazardous environments. While it is built for most environments, one of those is not space. As a tradeoff, it can be modified more."
	icon_state = "technosuit"
	has_alternative_armor_icon = FALSE
	item_flags = THICKMATERIAL | COVER_PREVENT_MANIPULATION
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	armor_list = list(melee = 40, bullet = 40, energy = 40, bomb = 50, bio = 100, rad = 100)
	max_upgrades = 2
	extra_allowed = list(/obj/item/extinguisher,
						 /obj/item/tool,
						 /obj/item/tool_upgrade,
						 /obj/item/stack/cable_coil,
						 /obj/item/device/t_scanner,
						 /obj/item/device/scanner/gas,
						 /obj/item/taperoll/engineering,
						 /obj/item/storage/toolbox)
	flags_inv = HIDEJUMPSUIT

//PIRS
/obj/item/clothing/suit/armor/vest/pirssuit
	name = "'Mark II' environmental protection suit"
	desc = "For working in hazardous environments. While its built for most environments, one of those is not space. This suit is a cheap and badly made copy of the Terra-Therma Worker's Unions original design. \
	Unlike its superior variant, it offers significantly less armor but it is made out of basic steel, making it a cheaper, easier alternative to build while also being easier to modify."
	icon_state = "science_armor"
	has_alternative_armor_icon = FALSE
	item_flags = THICKMATERIAL | COVER_PREVENT_MANIPULATION
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	cold_protection = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	min_cold_protection_temperature = T0C - 20
	max_upgrades = 2
	armor_list = list(melee = 35, bullet = 25, energy = 25, bomb = 30, bio = 50, rad = 50)
	extra_allowed = list(/obj/item/extinguisher,
						 /obj/item/tool,
						 /obj/item/tool_upgrade,
						 /obj/item/stack/cable_coil,
						 /obj/item/device/t_scanner,
						 /obj/item/device/scanner/gas,
						 /obj/item/taperoll/engineering,
						 /obj/item/storage/toolbox)
	matter = list(MATERIAL_STEEL = 40)

// CAPSA

/obj/item/clothing/suit/armor/vest/capsa
	name = "CAPSA plate carrier"
	desc = "A plate carrier with CAPSA stripes and a white cross on its back, denoting its wearer as medical personnel."
	icon_state = "capsa_armor"
	has_alternative_armor_icon = FALSE
	cold_protection = UPPER_TORSO|LOWER_TORSO
	min_cold_protection_temperature = T0C - 20
	armor_list = list(
		melee = 35,
		bullet = 35,
		energy = 35,
		bomb = 10,
		bio = 50,
		rad = 0
	)

/obj/item/clothing/suit/armor/vest/capsa/fullbody
	name = "full body CAPSA plate carrier"
	desc = "A plate carrier with CAPSA stripes and a white cross, denoting its wearer as medical personnel.\nThis one has additional padding on the shoulders and knees for extra coverage."
	icon_state = "capsa_armor_fullbody"
	blood_overlay_type = "armor"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	cold_protection = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	min_cold_protection_temperature = T0C - 20
	stiffness = LIGHT_STIFFNESS

/obj/item/clothing/suit/armor/vest/pirssuit/cso
	name = "Chief Surgeon Overseer's armor suit"
	desc = "A variant of the Phokorus Institute's Mark II suit, denoting a cross for medical personnel and sporting additional protection against biohazards."
	icon_state = "cso_armor"
	armor_list = list(melee = 35, bullet = 35, energy = 35, bomb = 30, bio = 75, rad = 50)
	permeability_coefficient = 0.50

/*
 * Specilized Armors
 */

//Bulletproof
/obj/item/clothing/suit/armor/bulletproof
	name = "bulletproof vest"
	desc = "A vest that excels in protecting the wearer against high-velocity solid projectiles."
	icon_state = "bulletproof"
	item_state = "armor"
	blood_overlay_type = "armor"
	slowdown = 0.5
	armor_list = list(
		melee = 25,
		bullet = 60,
		energy = 25,
		bomb = 10,
		bio = 0,
		rad = 0
	)
	price_tag = 250

/obj/item/clothing/suit/armor/bulletproof/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Baseline"] = "bulletproof"
	options["Winter"] = "bulletproof_snow"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		to_chat(M, "You adjusted your attire's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/suit/armor/bulletproof/full
	name = "bulletproof suit"
	desc = "A vest that excels in protecting the wearer against high-velocity solid projectiles with added shoulderpads and kneepads for extra coverage."
	icon_state = "bulletproof_fullbody"
	item_state = "bulletproof_fullbody"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	stiffness = LIGHT_STIFFNESS
	slowdown = 0.6 // Heavier since it now covers more of the body

/obj/item/clothing/suit/armor/bulletproof/full/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Baseline"] = "bulletproof_fullbody"
	options["Winter"] = "bulletproof_snow_fullbody"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		item_state = options[choice]
		to_chat(M, "You adjusted your attire's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

//Ablatives / Laserproof

/obj/item/clothing/suit/armor/vest/iron_lock_security
	name = "outdated ablative vest"
	desc = "An \"Iron Lock Security\" ablative vest with plates designed to absorb rather than reflect energy projectiles. Produced by Similacrum Robotics."
	icon_state = "northtech"
	has_alternative_armor_icon = FALSE
	matter = list(MATERIAL_STEEL = 10, MATERIAL_PLASTIC = 20, MATERIAL_PLATINUM = 5)
	armor_list = list(
		melee = 15,
		bullet = 15,
		energy = 50,
		bomb = 0,
		bio = 0,
		rad = 0
	)

/obj/item/clothing/suit/armor/vest/ablative
	name = "ablative vest"
	desc = "An ablative vest with plates designed to absorb rather than reflect energy projectiles."
	icon_state = "northtech"
	has_alternative_armor_icon = FALSE
	matter = list(MATERIAL_STEEL = 10, MATERIAL_PLASTIC = 20, MATERIAL_PLATINUM = 10)
	armor_list = list(
		melee = 15,
		bullet = 15,
		energy = 60,
		bomb = 0,
		bio = 0,
		rad = 0
	)

/obj/item/clothing/suit/armor/laserproof
	name = "reflective armor vest"
	desc = "A vest that excels in protecting the wearer against energy projectiles."
	icon_state = "ablative"
	item_state = "ablative"
	blood_overlay_type = "armor"
	slowdown = 0.5
	armor_list = list(
		melee = 25,
		bullet = 25,
		energy = 60,
		bomb = 0,
		bio = 0,
		rad = 0
	)
	siemens_coefficient = 0
	price_tag = 325

/obj/item/clothing/suit/armor/laserproof/handle_shield(mob/user, damage, atom/damage_source = null, mob/attacker = null, def_zone = null, attack_text = "the attack") //TODO: Refactor this all into humandefense
	if(istype(damage_source, /obj/item/projectile/energy) || istype(damage_source, /obj/item/projectile/beam))
		var/obj/item/projectile/P = damage_source

		var/reflectchance = 40 - round(damage/3)
		if(!(def_zone in list(BP_CHEST, BP_GROIN)))
			reflectchance /= 2
		if(P.starting && prob(reflectchance))
			visible_message(SPAN_DANGER("\The [user]'s [src.name] reflects [attack_text]!"))

			// Find a turf near or on the original location to bounce to
			var/new_x = P.starting.x + pick(0, 0, 0, 0, 0, -1, 1, -2, 2)
			var/new_y = P.starting.y + pick(0, 0, 0, 0, 0, -1, 1, -2, 2)
			var/turf/curloc = get_turf(user)

			// redirect the projectile
			P.redirect(new_x, new_y, curloc, user)

			return PROJECTILE_CONTINUE // complete projectile permutation

/obj/item/clothing/suit/armor/laserproof/rnd
	name = "Phokorus Institute reflective armor vest"
	desc = "A Phokorus Institute branded vest that excels in protecting the wearer against energy projectiles. While it is much better at defending against lasers compared to standard ablative armor it lacks as much protection against melee and bullets but can be modified more."
	icon_state = "ablative_ironhammer"
	matter = list(MATERIAL_STEEL = 20, MATERIAL_PLASTIC = 20, MATERIAL_PLATINUM = 15)
	armor_list = list(
		melee = 20,
		bullet = 20,
		energy = 65,
		bomb = 0,
		bio = 0,
		rad = 0
	)
	max_upgrades = 2
	siemens_coefficient = 0
	price_tag = 650

//Flak Vests
/obj/item/clothing/suit/armor/flakvest
	name = "flak vest"
	desc = "An armored, padded vest meant for heavy-duty operations. Heavy and bulky, it protects well against explosives and shrapnel."
	icon_state = "flakvest"
	item_state = "flakvest"
	blood_overlay_type = "armor"
	price_tag = 250
	slowdown = 0.5
	armor_list = list(melee = 40, bullet = 40, energy = 20, bomb = 50, bio = 0, rad = 0)

/obj/item/clothing/suit/armor/flakvest/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Baseline"] = "flakvest"
	options["Green"] = "flakvest_green"
	options["Tan"] = "flakvest_tan"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		item_state = options[choice]
		to_chat(M, "You adjusted your attire's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/suit/armor/flakvest/full // Sic.
	name = "full body flak vest"
	desc = "An armored, padded vest meant for heavy-duty operations, it protects well against explosives and shrapnel. This set has had kneepads and shoulderpads attached for more protection."
	icon_state = "flakvest_fullbody"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	stiffness = LIGHT_STIFFNESS
	slowdown = 0.6 // Bulkier due to protecting more
	armor_list = list(melee = 40, bullet = 40, energy = 20, bomb = 50, bio = 0, rad = 0) // Again, in case it doesn't inherit

/obj/item/clothing/suit/armor/flakvest/full/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Baseline"] = "flakvest_fullbody"
	options["Green"] = "flakvest_green_fullbody"
	options["Tan"] = "flakvest_tan_fullbody"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		item_state = options[choice]
		to_chat(M, "You adjusted your attire's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/*
 * Heavy Armor Types
 */
/obj/item/clothing/suit/armor/heavy
	name = "heavy armor"
	desc = "A heavily armored suit that protects against moderate damage."
	icon_state = "heavy"
	item_state = "swat_suit"
	w_class = ITEM_SIZE_BULKY
	gas_transfer_coefficient = 0.9
	permeability_coefficient = 0.9
	siemens_coefficient = 0.5
	item_flags = THICKMATERIAL|DRAG_AND_DROP_UNEQUIP|COVER_PREVENT_MANIPULATION|EQUIP_SOUNDS
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	heat_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	slowdown = 0.9
	max_upgrades = 2
	flags_inv = HIDEGLOVES|HIDESHOES|HIDEJUMPSUIT
	armor_list = list(
		melee = 40,
		bullet = 35,
		energy = 40,
		bomb = 30,
		bio = 0,
		rad = 0
	)
	equip_delay = 2 SECONDS
	price_tag = 125

/obj/item/clothing/suit/armor/heavy/red
	name = "Thunderdome suit (red)"
	desc = "Reddish armor."
	icon_state = "tdred"
	item_state = "tdred"
	siemens_coefficient = 1

/obj/item/clothing/suit/armor/heavy/green
	name = "Thunderdome suit (green)"
	desc = "Pukish armor."
	icon_state = "tdgreen"
	item_state = "tdgreen"
	siemens_coefficient = 1

// Riot suit
/obj/item/clothing/suit/armor/heavy/riot
	name = "riot suit"
	desc = "A suit of armor with heavy padding to protect against melee attacks. Looks like it might impair movement."
	icon_state = "riot"
	item_state = "swat_suit"
	flags_inv = HIDEJUMPSUIT
	armor_list = list(
		melee = 60,
		bullet = 25,
		energy = 25,
		bomb = 25,
		bio = 0,
		rad = 0
	)
	price_tag = 250

/obj/item/clothing/suit/armor/heavy/riot/ironhammer
	name = "watchmen riot suit"
	desc = "A suit of armor with heavy padding to protect against melee attacks. Looks like it might impair movement. This one is produced by Seinemetall Defense GmbH."
	icon_state = "watch_riot"


/*
 * Storage Types
 */
/obj/item/clothing/suit/storage/vest
	name = "webbed armor"
	desc = "An armored vest used for day-to-day operations. This one has various pouches and straps attached."
	icon_state = "webvest"
	price_tag = 250 //Normal vest is worth 200, this one is worth 250 because it also has storage space
	armor_list = list(
		melee = 20,
		bullet = 30,
		energy = 20,
		bomb = 25,
		bio = 0,
		rad = 0
	)

	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	item_flags = DRAG_AND_DROP_UNEQUIP|EQUIP_SOUNDS|THICKMATERIAL

	cold_protection = UPPER_TORSO|LOWER_TORSO
	min_cold_protection_temperature = ARMOR_MIN_COLD_PROTECTION_TEMPERATURE
	heat_protection = UPPER_TORSO|LOWER_TORSO
	max_heat_protection_temperature = ARMOR_MAX_HEAT_PROTECTION_TEMPERATURE
	siemens_coefficient = 0.6

/obj/item/clothing/suit/storage/vest/ironhammer
	name = "webbed operator armor"
	desc = "An armored vest that protects against some damage. This one has been done in Liberty Watch colors and has various pouches and straps attached."
	icon_state = "webvest_ironhammer"

//Provides the protection of a merc voidsuit, but only covers the chest/groin, and also takes up a suit slot. In exchange it has no slowdown and provides storage.
/obj/item/clothing/suit/storage/vest/merc
	name = "heavy armor vest"
	desc = "A high-quality armor vest in a fetching tan. It is surprisingly flexible and light, even with the added webbing and armor plating."
	icon_state = "mercwebvest"
	max_upgrades = 0 //No upgrading this one
	tool_qualities = list()
	price_tag = 300
	armor_list = list(
		melee = 55,
		bullet = 55,
		energy = 55,
		bomb = 45,
		bio = 0,
		rad = 0
	)

//Has some armor and but is a mix of the scav suit and a webbing
/obj/item/clothing/suit/storage/vest/scav
	name = "armored rig"
	desc = "A simple plate carrier modified for personal use, additional pouches have been attached to its front, \
	with matching knee and arm pads to protect limbs without hindering movement. \
	Opening the plate pouch would reveal a sheet of some Similacrum alloy, welded and forced into shape for the vest, \
	far lighter and offering more protection than it's more common ceramic counterparts. \
	Due to its jury-rigged yet robust design, it's able to take more armor plates than a standard heavy vest."
	icon_state = "forehead_armor"
	max_upgrades = 2 //Like all scav armor, this means investing into these will be better but buying gear will still be viable
	matter = list(MATERIAL_PLASTEEL = 24, MATERIAL_PLASTIC = 25, MATERIAL_SILVER = 8,  MATERIAL_STEEL = 40) //worth stealing
	price_tag = 1200
	body_parts_covered = UPPER_TORSO|LEGS|ARMS|LOWER_TORSO
	cold_protection = UPPER_TORSO|LEGS|ARMS|LOWER_TORSO
	armor_list = list(
		melee = 40,
		bullet = 35,
		energy = 40,
		bomb = 35,
		bio = 0,
		rad = 0
	)
/obj/item/clothing/suit/storage/vest/scav/New()
	..()
	pockets = new/obj/item/storage/internal(src)
	pockets.storage_slots = 2	//two slots
	pockets.max_w_class = ITEM_SIZE_NORMAL		//fits two normal size items as its big pockets
	pockets.max_storage_space = 8
	pockets.cant_hold |= list(/obj/item/tool_upgrade/armor) //Prevents a bug

/obj/item/clothing/suit/storage/vest/scav/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Standard"] = "forehead_armor"
	options["Rust"] = "forehead_rust"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		item_state = options[choice]
		to_chat(M, "You adjusted your attire's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1


/obj/item/clothing/suit/armor/platecarrier
	name = "plate carrier"
	desc = "An armored vest carrying trauma plates and light ballistic meshes."
	icon_state = "platecarrier"
	blood_overlay_type = "armor"
	armor_list = list(melee = 35, bullet = 45, energy = 20, bomb = 10, bio = 0, rad = 0)

/obj/item/clothing/suit/armor/platecarrier/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Baseline"] = "platecarrier"
	options["Winter"] = "platecarrier_snow"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		item_state = options[choice]
		to_chat(M, "You adjusted your attire's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/suit/armor/platecarrier/full
	name = "full body plate carrier"
	desc = "An armored vest carrying trauma plates and light ballistic meshes. It has been improved by adding shoulderpads and kneepads for additional coverage."
	icon_state = "platecarrier_fullbody"
	blood_overlay_type = "armor"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	stiffness = LIGHT_STIFFNESS

/obj/item/clothing/suit/armor/platecarrier/full/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Baseline"] = "platecarrier_fullbody"
	options["Winter"] = "platecarrier_snow_fullbody"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		item_state = options[choice]
		to_chat(M, "You adjusted your attire's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/suit/armor/platecarrier/hos
	name = "deputy chief plate carrier"
	desc = "An armored vest carrying military grade trauma plates and advanced ballistic meshes."
	icon_state = "watch_deputy_armor"
	blood_overlay_type = "armor"
	slowdown = 0.15
	armor_list = list(melee = 50, bullet = 50, energy = 30, bomb = 10, bio = 0, rad = 0)

/*
// Coats
*/

/obj/item/clothing/suit/armor/hos
	name = "deputy chief armored coat"
	desc = "A greatcoat enhanced with a special alloy for some protection and style."
	icon_state = "watch_deputy"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	armor_list = list(
		melee = 40,
		bullet = 40,
		energy = 30,
		bomb = 25,
		bio = 0,
		rad = 0
	)
	siemens_coefficient = 0.6

/obj/item/clothing/suit/armor/commander
	name = "commander's armored coat"
	desc = "A heavily armored combination of menacing style and cutting-edge body armor."
	icon_state = "commander"
	item_state = "commander"
	blood_overlay_type = "coat"
	permeability_coefficient = 0.50
	armor_list = list(melee = 40, bullet = 40, energy = 30, bomb = 25, bio = 0, rad = 0)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	cold_protection = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	min_cold_protection_temperature = T0C - 20
	siemens_coefficient = 0.7
	stiffness = MEDIUM_STIFFNESS

/obj/item/clothing/suit/storage/armor/marshal_coat
	name = "watchmen officers greatcoat"
	desc = "A Liberty Watch greatcoat with armor weave. Part of the formal uniform of the Watchmen."
	armor_list = list(melee = 35, bullet = 30, energy = 20, bomb = 10, bio = 0, rad = 0)
	icon_state = "marshal_coat"
	item_state = "marshal_coat"

/obj/item/clothing/suit/storage/armor/marshal_coat_ss
	name = "armorer's jacket"
	desc = "Armorer's jacket with an armored weave. For formality, protection and style."
	armor_list = list(melee = 40, bullet = 40, energy = 20, bomb = 10, bio = 0, rad = 0)
	icon_state = "marshal_coat_ss"
	item_state = "marshal_coat_ss"

/*
 * Reactive Armor
 */
//When the wearer gets hit, this armor will teleport the user a short distance away (to safety or to more danger, no one knows. That's the fun of it!)
/obj/item/clothing/suit/armor/reactive
	name = "reactive teleport armor"
	desc = "Someone separated our Research Director's head from their body!"
	var/active = FALSE
	icon_state = "reactiveoff"
	item_state = "reactiveoff"
	blood_overlay_type = "armor"
	armor_list = list(
		melee = 20,
		bullet = 20,
		energy = 20,
		bomb = 0,
		bio = 0,
		rad = 0
		)
	var/entropy_value = 2
	stiffness = MEDIUM_STIFFNESS

/obj/item/clothing/suit/armor/reactive/handle_shield(mob/user, damage, atom/damage_source = null, mob/attacker = null, def_zone = null, attack_text = "the attack")
	if(prob(50))
		user.visible_message(SPAN_DANGER("The reactive teleport system flings [user] clear of the attack!"))
		var/turf/TLoc = get_turf(user)
		var/turf/picked = get_random_secure_turf_in_range(src, 7, 1)
		if(!picked) return
		var/datum/effect/effect/system/spark_spread/spark_system = new /datum/effect/effect/system/spark_spread()
		spark_system.set_up(5, 0, user.loc)
		spark_system.start()
		go_to_bluespace(TLoc, entropy_value, TRUE, user, picked)
		return PROJECTILE_FORCE_MISS
	return FALSE

/obj/item/clothing/suit/armor/reactive/attack_self(mob/user)
	src.active = !( src.active )
	if (src.active)
		to_chat(user, "\blue The reactive armor is now active.")
		src.icon_state = "reactive"
		src.item_state = "reactive"
	else
		to_chat(user, "\blue The reactive armor is now inactive.")
		src.icon_state = "reactiveoff"
		src.item_state = "reactiveoff"
		src.add_fingerprint(user)
	return

/obj/item/clothing/suit/armor/reactive/emp_act(severity)
	active = 0
	src.icon_state = "reactiveoff"
	src.item_state = "reactiveoff"
	..()

/// Hunting Lodge Armor

/obj/item/clothing/suit/armor/hunter
	name = "hunter armor"
	desc = "A lightly armored breastplate and knee-guards supplied by the local hunting-lodge. It appears to be rather crudely self made."
	icon_state = "hunter_armor"
	item_state = "hunter_armor"
	blood_overlay_type = "armor"
	armor_list = list(
		melee = 30,
		bullet = 20,
		energy = 20,
		bomb = 10,
		bio = 0,
		rad = 0 )
	body_parts_covered = UPPER_TORSO|LEGS|ARMS|LOWER_TORSO
	cold_protection = UPPER_TORSO|LEGS|ARMS|LOWER_TORSO

/obj/item/clothing/suit/armor/hunter/bone
	name = "hunter armor"
	desc = "A lightly armored breastplate with bone-reinforcements of animal ribs and skulls accompanied by knee-guards from an unknown animal, \
	supplied by the local hunting-lodge. It appears to be rather crudely self made. \ "
	icon_state = "hunter_armor_bone"
	item_state = "hunter_armor_bone"
	blood_overlay_type = "armor"
	armor_list = list(
		melee = 45,
		bullet = 25,
		energy = 25,
		bomb = 10,
		bio = 0,
		rad = 0)

/obj/item/clothing/suit/armor/hunter/reinforced
	name = "hunter armor"
	desc = "A heavily armored breastplate and knee-guards supplied by the local hunting-lodge. It appears to be rather crudely self made with steel plating functioning as make-shift kevlar plates."
	icon_state = "hunter_armor_reinforced"
	item_state = "hunter_armor_reinforced"
	blood_overlay_type = "armor"
	armor_list = list(
		melee = 30,
		bullet = 45,
		energy = 25,
		bomb = 10,
		bio = 0,
		rad = 0)

/obj/item/clothing/suit/armor/hunter/leather
	name = "hunter armor"
	desc = "A lightly armored breastplate, leather sleeves, and knee-guards supplied by the local hunting-lodge. It appears to be rather crudely self made, yet the extra leather reinforcement is not \
	only stylish but aids greatly is dispersing laser and plasma shots."
	icon_state = "hunter_armor_leather"
	item_state = "hunter_armor_leather"
	blood_overlay_type = "armor"
	armor_list = list(
		melee = 30,
		bullet = 25,
		energy = 45,
		bomb = 10,
		bio = 0,
		rad = 0)

/obj/item/clothing/suit/armor/vest/handmadewooden
	name = "wooden armor"
	desc = "A series of planks held into a relatively torso shaped form by cloth tied around the shoulders and waist. Then further padded with more cloth along the inside."
	icon_state = "hm_woodvest"
	item_state = "hm_woodvest"
	armor_list = list(
		melee = 20,
		bullet = 10, // Justifying keeping somewhat decent values on bullet just because I changed the recipe to include steel. - Seb
		energy = 0, // It's mostly made of wood, it will char easily.
		bomb = 10,
		bio = 25,
		rad = 25
	)
	price_tag = 50
	stiffness = LIGHT_STIFFNESS

/obj/item/clothing/suit/armor/paramedic
	name = "advanced paramedic armor"
	desc = "Lightweight and moderately armored suit meant to be used to rush into danger to save lives. Has a built in Acceleration module, that when active gives a speed boost to save people faster."
	icon_state = "paramedic_armor"
	item_state = "paramedic_armor"
	matter = list(
		MATERIAL_PLASTEEL = 10,
		MATERIAL_STEEL = 5,
		MATERIAL_PLASTIC = 5,
		MATERIAL_PLATINUM = 3,
		MATERIAL_URANIUM = 4,
		MATERIAL_SILVER = 2
		)
	armor_list = list(
		melee = 40,
		bullet = 20,
		energy = 30,
		bomb = 10,
		bio = 100,
		rad = 50
	)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	action_button_name = "Toggle Acceleration"
	var/speed_boost_ready = TRUE
	var/speed_boost_active = FALSE
	var/speed_boost_power = -0.5
	var/speed_boost_length = 30 SECONDS
	var/speed_boost_cooldown = 5 MINUTES
	var/matching_helmet = /obj/item/clothing/head/helmet/faceshield/paramedic

/obj/item/clothing/suit/armor/paramedic/ui_action_click(mob/living/user, action_name)
	if(..())
		return TRUE

	trigger_speed_boost(user)

/obj/item/clothing/suit/armor/paramedic/proc/trigger_speed_boost(mob/living/carbon/human/user)
	if(!istype(user))
		return

	if(!speed_boost_ready)
		if(user.head && istype(user.head, matching_helmet))
			if(speed_boost_active)
				to_chat(usr, SPAN_WARNING("[user.head] beeps: 'Acceleration protocol active.'"))
			else
				to_chat(usr, SPAN_WARNING("[user.head] beeps: 'Acceleration protocol failture. Insufficient capacitor charge.'"))
		return

	speed_boost_ready = FALSE
	speed_boost_active = TRUE
	slowdown = speed_boost_power

	if(user.head && istype(user.head, matching_helmet))
		to_chat(usr, SPAN_WARNING("[user.head] beeps: 'Acceleration protocol initiated.'"))

	spawn(speed_boost_length)
		if(QDELETED(src))
			return
		slowdown = initial(slowdown)
		speed_boost_active = FALSE
		if(user.head && istype(user.head, matching_helmet))
			to_chat(usr, SPAN_WARNING("[user.head] beeps: 'Capacitors discharged. Acceleration protocol aborted.'"))

		spawn(speed_boost_cooldown)
			if(QDELETED(src))
				return
			speed_boost_ready = TRUE
			if(user.head && istype(user.head, matching_helmet))
				to_chat(usr, SPAN_WARNING("[user.head] beeps: 'Capacitors have been recharged.'"))
