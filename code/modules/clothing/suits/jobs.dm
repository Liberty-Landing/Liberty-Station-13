/*
 * Job related
 */

/*Assistant - Archive
/obj/item/clothing/suit/storage/rank/ass_jacket
	name = "colonist jacket"
	desc = "Practical and comfortable jacket. It seems have a little protection from physical harm."
	icon_state = "ass_jacket"
	item_state = "ass_jacket"
	blood_overlay_type = "coat"
	body_parts_covered = UPPER_TORSO|ARMS
	armor_list = list(
		melee = 5,
		bullet = 5,
		energy = 5,
		bomb = 0,
		bio = 0,
		rad = 0
	)
*/

//Liberty Assistant
/obj/item/clothing/suit/storage/toggle/liberass_jacket
	name = "liberty jacket"
	desc = "Practical and comfortable jacket. It seems have a little protection from physical harm.  Sturdy and tough, like the colony itself."
	icon_state = "liberass_jacket"
	item_state = "liberass_jacket"
	icon_open = "liberass_jacket_open"
	icon_closed = "liberass_jacket"
	blood_overlay_type = "coat"
	body_parts_covered = UPPER_TORSO|ARMS
	cold_protection = UPPER_TORSO|ARMS
	min_cold_protection_temperature = T0C - 20
	siemens_coefficient = 0.7
	armor_list = list(
		melee = 5,
		bullet = 5,
		energy = 5,
		bomb = 0,
		bio = 0,
		rad = 0
	)

// Skylight Syndicate
/obj/item/clothing/suit/storage/rank/cargo_jacket
	name = "skylight jacket"
	desc = "Stylish jacket lined with pockets. It seems have a little protection from physical harm."
	icon_state = "cargo_jacket"
	item_state = "cargo_jacket"
	blood_overlay_type = "coat"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS
	armor_list = list(
		melee = 5,
		bullet = 5,
		energy = 5,
		bomb = 0,
		bio = 0,
		rad = 0
	)

/obj/item/clothing/suit/storage/rank/cargoclerk_jacket
	name = "skylight office jacket"
	desc = "Stylish jacket lined for Skylight office workers. It seems have a little protection from physical harm."
	icon_state = "cargoclerk_jacket"
	item_state = "cargo_jacket"
	blood_overlay_type = "coat"
	body_parts_covered = UPPER_TORSO|ARMS
	armor_list = list(
		melee = 5,
		bullet = 5,
		energy = 5,
		bomb = 0,
		bio = 0,
		rad = 0
	)

/obj/item/clothing/suit/storage/cargovest
	name = "skylight hazard vest"
	desc = "A Skylight hazard vest in grey and orange to be used in work zones."
	icon_state = "cargovest"
	item_state = "hazard"
	blood_overlay_type = "armor"
	extra_allowed = list(/obj/item/tool)
	body_parts_covered = UPPER_TORSO
	armor_list = list(
		melee = 10,
		bullet = 10,
		energy = 5,
		bomb = 0,
		bio = 0,
		rad = 0
)

/obj/item/clothing/suit/storage/cargovest/verb/toggle_style()
	set name = "Adjust style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["standard"] = ""
	options["alt style"] = "_color"

	var/choice = input(M,"How would you like to wear your vest?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		var/base = initial(icon_state)
		base += options[choice]
		icon_state = base
		item_state = base
		item_state_slots = null
		to_chat(M, "You alter your [choice].")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

// Currently random loot only.
/obj/item/clothing/suit/storage/rank/qm_coat
	name = "smuggler's coat"
	desc = "An ideal choice for a smuggler. This coat seems have good impact resistance, and is made from resistant and expensive materials."
	icon_state = "qm_coat"
	item_state = "qm_coat"
	blood_overlay_type = "coat"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS
	armor_list = list(
		melee = 20,
		bullet = 10,
		energy = 5,
		bomb = 0,
		bio = 0,
		rad = 0
	)
	siemens_coefficient = 0.8

// Club Manager
/obj/item/clothing/suit/storage/toggle/club
	name = "chief executive officer's jacket"
	desc = "A well tailored and rich jacket for the Chief Executive Officer."
	icon_state = "cm_coat"
	item_state = "cm_coat"
	icon_open = "cm_coat_open"
	icon_closed = "cm_coat"
	body_parts_covered = UPPER_TORSO|ARMS
	cold_protection = UPPER_TORSO|ARMS
	min_cold_protection_temperature = T0C - 20
	siemens_coefficient = 0.7

// Botanist apron, holdover code
/obj/item/clothing/suit/rank/botanist
	name = "apron"
	desc = "A basic yellow apron."
	icon_state = "apron"
	item_state = "apron"
	blood_overlay_type = "armor"
	body_parts_covered = 0
	extra_allowed = list(
		/obj/item/seeds,
		/obj/item/reagent_containers/glass/fertilizer,
		/obj/item/weedkiller
	)

// Former Artist clothing
/obj/item/clothing/suit/artist
	name = "Complicated Vest"
	desc = "The tubes don't even do anything."
	icon_state = "artist"
	item_state = "artist_armor"
	blood_overlay_type = "armor"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	armor_list = list(
		melee = 10,
		bullet = 5,
		energy = 0,
		bomb = 0,
		bio = 0,
		rad = 0
	)

//Chaplain
/obj/item/clothing/suit/storage/chaplain
	name = "prime longcoat"
	desc = "A long, lightly armoured jacket. Dark, stylish and authoritarian."
	icon_state = "chaplain_hoodie"
	item_state = "chaplain_hoodie"
	blood_overlay_type = "coat"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	permeability_coefficient = 0.50
	siemens_coefficient = 0.7
	matter = list(MATERIAL_BIOMATTER = 20, MATERIAL_GOLD = 5)
	armor_list = list(
		melee = 20,
		bullet = 20,
		energy = 10,
		bomb = 30,
		bio = 100,
		rad = 100
	)

/obj/item/clothing/suit/storage/neotheosports
	name = "church sports jacket"
	desc = "Bonfire styled sports jacket to keep the knights always on their feet."
	icon_state = "nt_sportsjacket"
	item_state = "nt_sportsjacket"
	body_parts_covered = UPPER_TORSO|ARMS
	armor_list = list(
		melee = 15,
		bullet = 10,
		energy = 5,
		bomb = 0,
		bio = 100,
		rad = 75
	)

/obj/item/clothing/suit/storage/chaplain/holiday
	name = "holiday priest"
	desc = "A garment worn seasonally by chaplains."
	icon_state = "holidaypriest"
	item_state_slots = list(slot_r_hand_str = "labcoat", slot_l_hand_str = "labcoat")

/obj/item/clothing/suit/storage/chaplain/coat
	name = "preacher coat"
	desc = "A snugly fitting, lightly armoured brown coat."
	icon_state = "church_coat"
	item_state = "church_coat"

//Chef
/obj/item/clothing/suit/rank/chef
	name = "chef's apron"
	desc = "An apron used by a high class chef."
	icon_state = "chef"
	item_state = "chef"
	gas_transfer_coefficient = 0.9
	permeability_coefficient = 0.5
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS

/obj/item/clothing/suit/rank/chef/classic
	name = "classic chef's apron"
	desc = "A basic, dull, white chef's apron."
	icon_state = "apronchef"
	item_state = "apronchef"
	blood_overlay_type = "armor"
	body_parts_covered = 0

//Detective
/obj/item/clothing/suit/storage/rank/insp_trench
	name = "criminal investigator's armored trenchcoat"
	desc = "Brown and armored trenchcoat, designed and created by the Watchmen. The coat is externally impact resistant - perfect for your next act of autodefenestration!"
	icon_state = "rangercoat"
	item_state = "rangercoat"
	blood_overlay_type = "coat"
	body_parts_covered = UPPER_TORSO|ARMS
	armor_list = list(melee = 30, bullet = 25, energy = 25, bomb = 0, bio = 0, rad = 0)
	price_tag = 250

/obj/item/clothing/suit/storage/rank/insp_trench/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Rangercoat Default"] = "rangercoat"
	options["Brown Trenchcoat"] = "detective"
	options["Grey Trenchcoat"] = "detective_grey"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		item_state = options[choice]
		to_chat(M, "You adjusted your attire's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

//Engineering
/obj/item/clothing/suit/storage/hazardvest
	name = "hazard vest"
	desc = "A high-visibility vest used in work zones."
	icon_state = "hazard"
	item_state = "hazard"
	blood_overlay_type = "armor"
	extra_allowed = list(/obj/item/tool)
	body_parts_covered = UPPER_TORSO
	price_tag = 50

/obj/item/clothing/suit/storage/hazardvest/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Orange"] = "hazard"
	options["Black"] =  "hazard_black"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		item_state = options[choice]
		to_chat(M, "You adjusted your attire's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/suit/storage/ert_hazardvest
	name = "advanced hazard vest"
	desc = "A high-visibility full-body vest used in work zones."
	icon_state = "armor_handmade_fullbody"
	item_state = "armor_handmade_fullbody"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	armor_list = list(
		melee = 30, //if they are not waring any armor over this then we give *something*
		bullet = 30,
		energy = 45,
		bomb = 80,
		bio = 70,
		rad = 100 //Rad proof
	)

//Roboticist
/obj/item/clothing/suit/storage/rank/robotech_jacket
	name = "robotech jacket"
	desc = "Jacket for those who like to get dirty in a machine oil."
	icon_state = "robotech_jacket"
	item_state = "robotech_jacket"
	blood_overlay_type = "coat"
	body_parts_covered = UPPER_TORSO|ARMS
	price_tag = 50
	armor_list = list(
		melee = 10,
		bullet = 0,
		energy = 0,
		bomb = 0,
		bio = 0,
		rad = 0
	)

// Medical
/obj/item/clothing/suit/storage/surgical_apron
	name = "surgical apron"
	desc = "A sterile blue apron used to take the brunt of blood from surgeries."
	icon_state = "surgeon"
	item_state = "surgeon"
	permeability_coefficient = 0.10
	blood_overlay_type = "armor"
	extra_allowed = list(
		/obj/item/tool/bonesetter,
		/obj/item/tool/cautery,
		/obj/item/tool/saw/circular,
		/obj/item/tool/hemostat,
		/obj/item/tool/retractor,
		/obj/item/tool/scalpel,
		/obj/item/tool/tape_roll/bonegel,
		/obj/item/stack/medical/bruise_pack/advanced
	)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	price_tag = 50

// Afghankas, sprites by Nayu

/obj/item/clothing/suit/storage/toggle/afghanka_fontaine
	name = "Fontaine afghanka"
	desc = "A warm, comfortable military jacket in Fontaine colors."
	icon_state = "afghanka_fontaine_open"
	item_state = "afghanka_fontaine_open"
	icon_open = "afghanka_fontaine_open"
	icon_closed = "afghanka_fontaine_closed"
	armor_list = list(melee = 5, bullet = 5, energy = 5, bomb = 0, bio = 0, rad = 0)
	min_cold_protection_temperature = T0C - 20

/obj/item/clothing/suit/storage/toggle/afghanka_watch
	name = "Watch afghanka"
	desc = "A warm, comfortable military jacket in Liberty Watch colors. A white stripe adorns its right arm sleeve."
	icon_state = "afghanka_watch_open"
	item_state = "afghanka_watch_open"
	icon_open = "afghanka_watch_open"
	icon_closed = "afghanka_watch_closed"
	armor_list = list(melee = 5, bullet = 5, energy = 5, bomb = 0, bio = 0, rad = 0)
	min_cold_protection_temperature = T0C - 20

/obj/item/clothing/suit/storage/toggle/silkjackets
	name = "Dark Silk Jacket"
	desc = "Jacket produced out of custodian biopolymers with the respective softness and warmth coming from the highest quality, non-vegan silk in the market. This one is dark coloured."
	icon_state = "darksilk_jacket"
	item_state = "darksilk_jacket"
	icon_open = "darksilk_jacket_open"
	icon_closed = "darksilk_jacket"
	blood_overlay_type = "coat"
	body_parts_covered = UPPER_TORSO|ARMS
	cold_protection = UPPER_TORSO|ARMS
	siemens_coefficient = 0.7
	armor_list = list(melee = 10, bullet = 5, energy = 0, bomb = 0, bio = 0, rad = 0)
	min_cold_protection_temperature = T0C - 20

/obj/item/clothing/suit/storage/toggle/silkjackets/lightsilk
	name = "Light Silk Jacket"
	desc = "Jacket produced out of custodian biopolymers with the respective softness and warmth coming from the highest quality, non-vegan silk in the market. This one is light coloured."
	icon_state = "lightsilk_jacket"
	item_state = "lightsilk_jacket"
	icon_open = "lightsilk_jacket_open"
	icon_closed = "lightsilk_jacket"
	blood_overlay_type = "coat"
	body_parts_covered = UPPER_TORSO|ARMS
	cold_protection = UPPER_TORSO|ARMS
	siemens_coefficient = 0.7
	armor_list = list(melee = 10, bullet = 5, energy = 0, bomb = 0, bio = 0, rad = 0)
	min_cold_protection_temperature = T0C - 20

/obj/item/clothing/suit/storage/toggle/silkjackets/redsilk
	name = "Red Silk Jacket"
	desc = "Jacket produced out of custodian biopolymers with the respective softness and warmth coming from the highest quality, non-vegan silk in the market. This one is red coloured."
	icon_state = "redsilk_jacket"
	item_state = "redsilk_jacket"
	icon_open = "redsilk_jacket_open"
	icon_closed = "redsilk_jacket"
	blood_overlay_type = "coat"
	body_parts_covered = UPPER_TORSO|ARMS
	cold_protection = UPPER_TORSO|ARMS
	siemens_coefficient = 0.7
	armor_list = list(melee = 10, bullet = 5, energy = 0, bomb = 0, bio = 0, rad = 0)
	min_cold_protection_temperature = T0C - 20

/obj/item/clothing/suit/storage/anorak
	name = "Custodian Anorak"
	desc = "Sturdy, thick and warm. Not quite comfortable due to how it keeps the heat from leaving the anorak, barely letting the skin breath, but that the reason someone would wear this clothing."
	icon_state = "custodian_anorak"
	item_state = "custodian_anorak"
	body_parts_covered = UPPER_TORSO|ARMS
	cold_protection = UPPER_TORSO|ARMS
	siemens_coefficient = 0.7
	armor_list = list(melee = 5, bullet = 5, energy = 5, bomb = 0, bio = 0, rad = 0)
	min_cold_protection_temperature = T0C - 20

/obj/item/clothing/suit/storage/chokha
	name = "Order of Bonfire Chokha"
	desc = "The traditional coats of men belonging to the Custodians of Bonfire as a order itself, with silk extending from the shoulders to below the thighs, loose-fitting everywhere but on the waist, which it is worn tightly around it. This one uses the traditional colors."
	icon_state = "custodian_chokha"
	item_state = "custodian_chokha"
	body_parts_covered = UPPER_TORSO|ARMS
	cold_protection = UPPER_TORSO|ARMS
	siemens_coefficient = 0.7
	armor_list = list(melee = 5, bullet = 5, energy = 5, bomb = 0, bio = 0, rad = 0)
	min_cold_protection_temperature = T0C - 20

/obj/item/clothing/suit/storage/chokha/squire_chokha
	name = "Squire Chokha"
	desc = "The traditional coats of men belonging to the Custodians of Bonfire as a order itself, with silk extending from the shoulders to below the thighs, loose-fitting everywhere but on the waist, which it is worn tightly around it. This one uses the colours of Squires."
	icon_state = "squire_chokha"
	item_state = "squire_chokha"
	body_parts_covered = UPPER_TORSO|ARMS
	cold_protection = UPPER_TORSO|ARMS
	siemens_coefficient = 0.7
	armor_list = list(melee = 5, bullet = 5, energy = 5, bomb = 0, bio = 0, rad = 0)
	min_cold_protection_temperature = T0C - 20

/obj/item/clothing/suit/storage/squire_caftan
	name = "Brass Caftan"
	desc = "Loose, flowing garment worn like a long tunic with wide sleeves and with brass patterns on its design. Normally used by squires."
	icon_state = "squire_caftan"
	item_state = "squire_caftan"
	body_parts_covered = UPPER_TORSO|ARMS
	cold_protection = UPPER_TORSO|ARMS
	siemens_coefficient = 0.7
	armor_list = list(melee = 5, bullet = 5, energy = 5, bomb = 0, bio = 0, rad = 0)
	min_cold_protection_temperature = T0C - 20

/obj/item/clothing/suit/storage/pelisse/vintage_darkpelisse
	name = "Dark Short Pelisse"
	desc = "Outer garment typically worn by women with long sleeves and with a large length, with fashionable minor accssories. This clothing was a popular choice during the late 18th century."
	icon_state = "vintage_darkpelisse"
	item_state = "vintage_darkpelisse"
	body_parts_covered = UPPER_TORSO|ARMS
	cold_protection = UPPER_TORSO|ARMS
	siemens_coefficient = 0.7
	armor_list = list(melee = 5, bullet = 5, energy = 5, bomb = 0, bio = 0, rad = 0)
	min_cold_protection_temperature = T0C - 20

/obj/item/clothing/suit/storage/pelisse/vintage_redpelisse
	name = "Red Short Pelisse"
	desc = "Outer garment typically worn by women with long sleeves and with a large length, with fashionable minor accssories. This clothing was a popular choice during the late 18th century."
	icon_state = "vintage_redpelisse"
	item_state = "vintage_redpelisse"
	body_parts_covered = UPPER_TORSO|ARMS
	cold_protection = UPPER_TORSO|ARMS
	siemens_coefficient = 0.7
	armor_list = list(melee = 5, bullet = 5, energy = 5, bomb = 0, bio = 0, rad = 0)
	min_cold_protection_temperature = T0C - 20

/obj/item/clothing/suit/storage/polonaisedress
	name = "Polonaise Dress"
	desc = "Polonaise dress - or robe à la polonaise - is normally used for Elohopean dances based on traditional polish roots. Fashionable, flexible and decorated, these dress goes swiftly to those who dances with sabers."
	icon_state = "polonaisedress"
	item_state = "polonaisedress"
	body_parts_covered = UPPER_TORSO|ARMS
	cold_protection = UPPER_TORSO|ARMS
	siemens_coefficient = 0.7
	armor_list = list(melee = 5, bullet = 5, energy = 5, bomb = 0, bio = 0, rad = 0)
	min_cold_protection_temperature = T0C - 20

/obj/item/clothing/suit/storage/pelisse
	name = "Black Large Pelisse"
	desc = "Outer garment typically worn by women with long sleeves and with a large length, with fashionable minor accssories. This clothing was a popular choice during the late 18th century."
	icon_state = "custodian_blackpelisse"
	item_state = "custodian_blackpelisse"
	body_parts_covered = UPPER_TORSO|ARMS
	cold_protection = UPPER_TORSO|ARMS
	siemens_coefficient = 0.7
	armor_list = list(melee = 5, bullet = 5, energy = 5, bomb = 0, bio = 0, rad = 0)
	min_cold_protection_temperature = T0C - 20

/obj/item/clothing/suit/storage/pelisse/custodian_redpelisse
	name = "Red Large Pelisse"
	desc = "Outer garment typically worn by women with long sleeves and with a large length, with fashionable minor accssories. This clothing was a popular choice during the late 18th century."
	icon_state = "custodian_redpelisse"
	item_state = "custodian_redpelisse"
	body_parts_covered = UPPER_TORSO|ARMS
	cold_protection = UPPER_TORSO|ARMS
	siemens_coefficient = 0.7
	armor_list = list(melee = 5, bullet = 5, energy = 5, bomb = 0, bio = 0, rad = 0)
	min_cold_protection_temperature = T0C - 20

/obj/item/clothing/suit/storage/pelisse/custodian_bluepelisse
	name = "Blue Large Pelisse"
	desc = "Outer garment typically worn by women with long sleeves and with a large length, with fashionable minor accssories. This clothing was a popular choice during the late 18th century."
	icon_state = "custodian_bluepelisse"
	item_state = "custodian_bluepelisse"
	body_parts_covered = UPPER_TORSO|ARMS
	cold_protection = UPPER_TORSO|ARMS
	siemens_coefficient = 0.7
	armor_list = list(melee = 5, bullet = 5, energy = 5, bomb = 0, bio = 0, rad = 0)
	min_cold_protection_temperature = T0C - 20

/obj/item/clothing/suit/storage/pelisse/openskirt_pelisse
	name = "Pelisse Gown"
	desc = "Rather seductive, large pelisse with cloth that has straps covering the neck like a collar."
	icon_state = "openskirtgown"
	item_state = "openskirtgown"
	body_parts_covered = UPPER_TORSO|ARMS
	cold_protection = UPPER_TORSO|ARMS
	siemens_coefficient = 0.7
	armor_list = list(melee = 5, bullet = 5, energy = 5, bomb = 0, bio = 0, rad = 0)
	min_cold_protection_temperature = T0C - 20

/obj/item/clothing/suit/storage/training
	name = "Custodian Judogui"
	desc = "Traditional attire for custodians in training and martial artists just alike. The suit has the Uwagi, Zubon, obi and many custodian patches of obvious affiliations to the order and Judo"
	icon_state = "custodian_judogui"
	item_state = "custodian_judogui"
	body_parts_covered = UPPER_TORSO|ARMS
	cold_protection = UPPER_TORSO|ARMS
	siemens_coefficient = 0.7
	armor_list = list(melee = 5, bullet = 5, energy = 5, bomb = 0, bio = 0, rad = 0)
	min_cold_protection_temperature = T0C - 20

/obj/item/clothing/suit/storage/training/fencing_fullbody
	name = "Fencing Attire"
	desc = "Fencing gear that provides protection to fencers while allowing freedom of movement. Made of rough fabric resistant to puncture, it's ddesigned to withstand the force of a training fencing blade. Do not try it with actual swords."
	icon_state = "fencing_fullbody"
	item_state = "fencing_fullbody"
	body_parts_covered = UPPER_TORSO|ARMS
	cold_protection = UPPER_TORSO|ARMS
	siemens_coefficient = 0.7
	armor_list = list(melee = 5, bullet = 5, energy = 5, bomb = 0, bio = 0, rad = 0)
	min_cold_protection_temperature = T0C - 20
