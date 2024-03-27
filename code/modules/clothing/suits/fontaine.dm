
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
		bomb = 25,//5% armor less because is a bit unfair compared to printed vests, watch out with the landmines
		bio = 0,
		rad = 0
	)
	matter = list(MATERIAL_INDSTEEL = 5, MATERIAL_GLASS = 10, MATERIAL_ALUMINIUM = 10)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	heat_protection = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	cold_protection = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	min_cold_protection_temperature = T0C - 25
	siemens_coefficient = 0.7

// TODO: Maybe flakification of scavenger armor (see Fontaine fullbody plate carrier)//gets rebalanced to be more fair in a stat upgrade with a reduction of melee armor and a bonus in bullets for PVE/PVP

// Black Bolt Armors
/obj/item/clothing/suit/storage/scavengerarmor/blackbolt
	name = "Scrapper Coat"
	desc = "A Heavy Robust Leather Coat Made By Black Bolt Logistics For his Scrappers, it has an Improved Plate carrier on the front, durable enough to deflect Bullets and Laser shots of low power, it also has some big pouches to carry supplies or extra ammunitions, with this totally trusty protection you can loot the world Scrapper! "
	icon_state = "black_bolt_scrapper_coat"
	item_state = "black_bolt_scrapper_coat"
	matter = list(MATERIAL_INDSTEEL = 5, MATERIAL_GLASS = 10, MATERIAL_ALUMINIUM = 10, MATERIAL_COPPER = 2)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS//is a leather coat that covers the whole body
	cold_protection = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	heat_protection = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	min_cold_protection_temperature = T0C - 20

/obj/item/clothing/suit/storage/scavengerarmor/blackbolt/fullbody
	name = "Scraplate Armored Coat"
	desc = "An Improvised Upgrade For The Scrapper Coat, This version has more Metals over it and can be considered a proper armor, with this on you show sign of Wealth and experience besides be extra Intimidant to thieves and more resistant to gunshots or beasts trying to devour you, Go to loot in even dangerous areas Scrapper!"
	icon_state = "black_bolt_scraplate_coat"
	item_state = "black_bolt_scraplate_coat"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	cold_protection = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	heat_protection = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	max_upgrades = 1
	armor_list = list(
		melee = 35, //nerfing it a bit more because this isn't hunter armor or something like that to have a ridiculous 50% melee
		bullet = 35,//standard protection
		energy = 30,//has to have decent protection because is an upgraded armor, while with an upgrade it can't become extremely powerful
		bomb = 30,//funny enough this is barely enough to survive a explosion
		bio = 0,
		rad = 0
	)//no slowdown in the armor requested by nayu, they are scouts in light armor

/obj/item/clothing/suit/greatcoat/trapper
	name = "trapper furcoat"
	desc = "A warm woolen coat."
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
	icon_state = "furcoat_nacre"
	item_state = "furcoat_nacre"
	armor_list = list(
		melee = 55,
		bullet = 25,
		energy = 25,
		bomb = 10,
		bio = 100,
		rad = 50
	)
*/
/obj/item/clothing/suit/armor/leader
	name = "Black Bolt Leader Scraplate Armor"
	desc = "This is a Robust Suit made out of More Resistant Materials For The most Important Black Bolt Operator, has Free movement while it also provides some High Protection to Deal with almost Anything on the planet, Lead these Scrappers to the Fortune using this Intimidant armor! "
	icon_state = "black_bolt_scraplate"
	item_state = "black_bolt_scraplate"
	max_upgrades = 1
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	cold_protection = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	min_cold_protection_temperature = T0C - 25
	armor_list = list(
		melee = 45,
		bullet = 35,
		energy = 35,
		bomb = 35,//adding more armor here, an scrap armor had better stats?
		bio = 0,
		rad = 0
	)
	siemens_coefficient = 0.6
