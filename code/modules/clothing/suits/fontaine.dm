
// Parent "makeshift" armor for anyone to do as a mid-tier, craftable, non-faction tied armor
/obj/item/clothing/suit/storage/scavengerarmor
	name = "Scavenger armor"
	desc = "A set of comfy plates of multiple alloys haphazardly welded together that allow for moderate protection against cold and damage. \
			It has two chest pockets for easy access."
	icon_state = "scav_armor"
	item_state = "scav_armor"
	tool_qualities = list(QUALITY_ARMOR = 100)
	max_upgrades = 2
	stiffness = MEDIUM_STIFFNESS
	equip_delay = 2 SECONDS
	armor_list = list(
		melee = 30, //Not the best armor, but easily crafted and adds some utility with decent protection all round.
		bullet = 20,
		energy = 25,
		bomb = 30,
		bio = 0,
		rad = 0
	)
	matter = list(MATERIAL_INDSTEEL = 5, MATERIAL_GLASS = 10, MATERIAL_ALUMINIUM = 10)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	heat_protection = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	cold_protection = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	min_cold_protection_temperature = T0C - 25
	siemens_coefficient = 0.7

// TODO: Maybe flakification of scavenger armor (see Fontaine fullbody plate carrier)

// Fontaine versions below.
/obj/item/clothing/suit/storage/scavengerarmor/fontaine
	name = "Fontaine plate carrier"
	desc = "A rigged yet sturdy Fontaine branded armor. Strong and protective as most vests, it is made entirely from reclaimed materials. It even has pockets as well as room for additional plates of armor to be added."
	icon_state = "fontaine_platecarrier"
	item_state = "fontaine_platecarrier"
	matter = list(MATERIAL_INDSTEEL = 5, MATERIAL_GLASS = 10, MATERIAL_ALUMINIUM = 10, MATERIAL_PLATINUM = 2)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	cold_protection = UPPER_TORSO|LOWER_TORSO
	heat_protection = UPPER_TORSO|LOWER_TORSO
	min_cold_protection_temperature = T0C - 20

/obj/item/clothing/suit/storage/scavengerarmor/fontaine/fullbody
	name = "Fontaine full-body plate carrier"
	desc = "A set of Fontaine brand armor with additional armour plating installed. Though the haphazardly-made plates are heavy and don't exactly excel against projectiles, they shrug off melee attacks nicely."
	icon_state = "fontaine_fullbody_platecarrier"
	item_state = "fontaine_fullbody_platecarrier"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	cold_protection = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	heat_protection = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	max_upgrades = 1
	armor_list = list(
		melee = 50, //A bit worse than riot armour
		bullet = 25,
		energy = 25,
		bomb = 30,
		bio = 0,
		rad = 0
	)
	slowdown = 0.9

/obj/item/clothing/suit/greatcoat/trapper
	name = "trapper furcoat"
	desc = "A warm woolen coat, adorned with the band of Fontaine, fleece, hide, and wool sourced from what is likely to be a hunted animal. Boiled leather is integrated between its layers for protection. This coat has been designed to withstand the harsh cold of the planet."
	icon_state = "furcoat_trapper"
	item_state = "furcoat_trapper"
	blood_overlay_type = "coat"
	permeability_coefficient = 0.50
	max_upgrades = 2
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS
	cold_protection = UPPER_TORSO|LOWER_TORSO|ARMS
	min_cold_protection_temperature = T0C - 25
	siemens_coefficient = 0.7
	armor_list = list(
		melee = 20,
		bullet = 20,
		energy = 20,
		bomb = 20,
		bio = 70,
		rad = 30
	)

/obj/item/clothing/suit/greatcoat/trapper/bone
	name = "Boneplated Furred Coat"
	desc = "A warm, dark bone-reinforced woolen coat adorned with the emblem of Fontaine. The silicon carbide-rich bones provide the user with handmade protection against bullets, almost rivaling proper industrial ceramic armor."
	icon_state = "furcoat_bones"
	item_state = "furcoat_bones"
	armor_list = list(
		melee = 25,
		bullet = 55,
		energy = 25,
		bomb = 10,
		bio = 100,
		rad = 50
	)

/obj/item/clothing/suit/greatcoat/trapper/shell
	name = "Shellclad Furred Coat"
	desc = "A warm, chitin-reinforced woolen coat adorned with the emblem of Fontaine. Reinforced with the unique fibrous material coming from the exoskeleton of this planets fauna that has suffered mysterious effects of carcinization."
	icon_state = "furcoat_chitin"
	item_state = "furcoat_chitin"
	armor_list = list(
		melee = 55,
		bullet = 25,
		energy = 25,
		bomb = 10,
		bio = 100,
		rad = 50
	)
/*		Todo - Sprite in works; enable when it's done.
/obj/item/clothing/suit/greatcoat/trapper/prismatic
	name = "Prismatic Furred Coat"
	desc = "A warm, crystal-embellished woolen coat adorned with the emblem of Fontaine. The crystals ability to bend/disperse light and absorb plasma beams is far too great to not be used even if the armor itself looks horrible to wear. This amerydian armor has been properly sterilized to avoid spreading. Do not hug people while using this if you want to avoid getting people free acupuncture."
	icon_state = "furcoat_ameridian"
	item_state = "furcoat_ameridian"
	armor_list = list(
		melee = 55,
		bullet = 25,
		energy = 25,
		bomb = 10,
		bio = 100,
		rad = 50
	)
*/
/obj/item/clothing/suit/armor/shepherd
	name = "Fontaine shepherd armored coat"
	desc = "A Fontaine branded armored coat made of fleece, synthetic material and lined with light-weight armored fabric. It sports some advanced plating ."
	icon_state = "shepherd_coat"
	item_state = "shepherd_coat"
	max_upgrades = 1
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	cold_protection = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	min_cold_protection_temperature = T0C - 25
	armor_list = list(
		melee = 45,
		bullet = 35,
		energy = 30,
		bomb = 25,
		bio = 0,
		rad = 0
	)
	siemens_coefficient = 0.6
