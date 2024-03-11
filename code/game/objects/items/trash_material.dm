/obj/item/trash/material
	icon = 'icons/obj/material_trash.dmi'
	matter = list()
	var/matter_chances = list()	//List of lists: list(material_name, chance, amount)


/obj/item/trash/material/Initialize()
	. = ..()
	if(!matter)
		matter = list()

	for(var/list/L in matter_chances)
		if(prob(L[2]))
			matter |= L[1]
			matter[L[1]] += max(0, L[3] + rand(-2,2))




/obj/item/trash/material/metal
	name = "scrap metal"
	desc = "A piece of commonly found metal that has been scrapped and damaged beyond conventional use. It can be recycled easily by any autolathe."
	icon_state = "metal0"
	matter_chances = list(
		list(MATERIAL_ALUMINIUM, 100, 15),
		list(MATERIAL_ALUMINIUM, 50, 10),
		list(MATERIAL_ALUMINIUM, 10, 20),
		list(MATERIAL_INDSTEEL, 10, 5),
		list(MATERIAL_INDSTEEL, 5, 10),
		list(MATERIAL_IRON, 4, 2),
	)

/obj/item/trash/material/metal/Initialize()
	. = ..()
	icon_state = "metal[rand(4)]"


/obj/item/trash/material/circuit
	name = "burnt circuit"
	desc = "A circuit that has been burnt from overuse or radiation. It can be recycled by any autolathe, mostly for glass and rare metals."
	w_class = ITEM_SIZE_SMALL
	icon_state = "circuit0"
	matter_chances = list(
		list(MATERIAL_GLASS, 100, 4),
		list(MATERIAL_GLASS, 50, 3),
		list(MATERIAL_PLASTIC, 40, 3),
		list(MATERIAL_SILVER, 18, 3),
		list(MATERIAL_GOLD, 17, 3),
		list(MATERIAL_DIAMOND, 4, 2),
	)

/obj/item/trash/material/circuit/Initialize()
	. = ..()
	icon_state = "circuit[rand(3)]"


/obj/item/trash/material/device
	name = "broken device"
	desc = "A broken device that you barely can understand what it was used for, but it is surprisingly in a state that it is easy to recycle."
	w_class = ITEM_SIZE_SMALL
	icon_state = "device0"
	matter_chances = list(
		list(MATERIAL_ALUMINIUM, 100, 10),
		list(MATERIAL_GLASS, 90, 7),
		list(MATERIAL_PLASTIC, 100, 10),
		list(MATERIAL_SILVER, 16, 7),
		list(MATERIAL_GOLD, 15, 5),
		list(MATERIAL_DIAMOND, 5, 2),
	)

/obj/item/trash/material/device/Initialize()
	. = ..()
	icon_state = "device[rand(3)]"

/obj/item/trash/material/trinkets
	name = "lost trinkets"
	desc = "A bundle of cheap wearable trickets with surprisingly low amount of rare metals and stones. Surely useful when recycled - if you don't mind how most of it is just glass."
	w_class = ITEM_SIZE_SMALL
	icon_state = "trinkets0"
	matter_chances = list(
		list(MATERIAL_COPPER, 100, 10),
		list(MATERIAL_GLASS, 90, 7),
		list(MATERIAL_BIO_SILK, 100, 10),
		list(MATERIAL_SILVER, 16, 7),
		list(MATERIAL_GOLD, 15, 5),
		list(MATERIAL_DIAMOND, 5, 2),
	)

/obj/item/trash/material/trinkets/Initialize()
	. = ..()
	icon_state = "trinkets[rand(3)]"

/obj/item/trash/material/e_sword_cutlass
	name = "broken energy cutlass"
	desc = "A broken device that can be recycled in an autolathe."
	w_class = ITEM_SIZE_SMALL
	icon_state = "cutlass0"
	matter_chances = list(
		list(MATERIAL_ALUMINIUM, 100, 3),
		list(MATERIAL_GLASS, 90, 1),
		list(MATERIAL_PLASTIC, 100, 4),
		list(MATERIAL_SILVER, 70, 2),
		list(MATERIAL_GOLD, 40, 1),
	)

/obj/item/trash/material/e_sword_cutlass/Initialize()
	. = ..()
	icon_state = "cutlass[rand(3)]"

/obj/item/trash/material/brokenarmorIE //scrap metal but with new sprite and lore
	name = "Remains of Iron Eagle"
	desc = "A few deformated, unusable and broken pieces of armor, they seem to be from an Iron Eagle Trooper who died holding his position"
	icon_state = "armor_scrap_IE0"
	matter = list(MATERIAL_ALUMINIUM = 4)
	icon_state = "armor_scrap_IE0"

/obj/item/trash/material/brokenhelmetIE //scrap metal but with new sprite and lore
	name = "Remains of Iron Eagle Helmet"
	desc = "A few deformated, unusable and broken pieces of an helmet, they seem to be from an Iron Eagle Trooper who died holding his position"
	icon_state = "helmet_scrap_IE0"
	matter = list(MATERIAL_ALUMINIUM = 4)
	icon_state = "helmet_scrap_IE0"

/obj/item/trash/material/brokenarmorIE1 //scrap metal but with new sprite and lore
	name = "Remains of Iron Eagle"
	desc = "A few deformated, unusable and broken pieces of armor, they seem to be from an Iron Eagle Trooper who died holding his position"
	icon_state = "armor_scrap_IE1"
	matter = list(MATERIAL_ALUMINIUM = 4)

/obj/item/trash/material/brokenhelmetIE1 //scrap metal but with new sprite and lore
	name = "Remains of Iron Eagle Helmet"
	desc = "A few deformated, unusable and broken pieces of an helmet, they seem to be from an Iron Eagle Trooper who died holding his position"
	icon_state = "helmet_scrap_IE1"
	matter = list(MATERIAL_ALUMINIUM = 4)

/obj/item/trash/material/brokenarmorIE2 //scrap metal but with new sprite and lore
	name = "Remains of Iron Eagle"
	desc = "A few deformated, unusable and broken pieces of armor, they seem to be from an Iron Eagle Trooper who died holding his position"
	icon_state = "armor_scrap_IE2"
	matter = list(MATERIAL_ALUMINIUM = 4)

/obj/item/trash/material/brokenhelmetIE2 //scrap metal but with new sprite and lore
	name = "Remains of Iron Eagle Helmet"
	desc = "A few deformated, unusable and broken pieces of an helmet, they seem to be from an Iron Eagle Trooper who died holding his position"
	icon_state = "helmet_scrap_IE2"
	matter = list(MATERIAL_ALUMINIUM = 4)

/obj/item/trash/material/brokenarmorIE3 //scrap metal but with new sprite and lore
	name = "Remains of Iron Eagle"
	desc = "A few deformated, unusable and broken pieces of armor, they seem to be from an Iron Eagle Trooper who died holding his position"
	icon_state = "armor_scrap_IE3"
	matter = list(MATERIAL_ALUMINIUM = 4)

/obj/item/trash/material/brokenhelmetIE3 //scrap metal but with new sprite and lore
	name = "Remains of Iron Eagle Helmet"
	desc = "A few deformated, unusable and broken pieces of an helmet, they seem to be from an Iron Eagle Trooper who died holding his position"
	icon_state = "helmet_scrap_IE3"
	matter = list(MATERIAL_ALUMINIUM = 4)

/obj/item/trash/material/brokenarmorIE4 //scrap metal but with new sprite and lore
	name = "Remains of Iron Eagle"
	desc = "A few deformated, unusable and broken pieces of armor, they seem to be from an Iron Eagle Trooper who died holding his position"
	icon_state = "armor_scrap_IE4"
	matter = list(MATERIAL_ALUMINIUM = 4)

/obj/item/trash/material/brokenhelmetIE4 //scrap metal but with new sprite and lore
	name = "Remains of Iron Eagle Helmet"
	desc = "A few deformated, unusable and broken pieces of an helmet, they seem to be from an Iron Eagle Trooper who died holding his position"
	icon_state = "helmet_scrap_IE4"
	matter = list(MATERIAL_ALUMINIUM = 4)

//voidsuits scrap
/obj/item/trash/material/brokenarmorIE5 //scrap metal but with new sprite and lore
	name = "Remains of Iron Eagle Special Operative"
	desc = "A few deformated, unusable and broken pieces of an Iron Eagle Specialist, looks like the bugs had trouble opening the armor, is clearly unusable but might have good materials in the remnants."
	icon_state = "armor_scrap_IE5"
	matter = list(MATERIAL_ALUMINIUM = 5, MATERIAL_INDSTEEL = 4)

	//custodian squire helmet scraps
/obj/item/trash/material/brokenhelmetsquire0 //scrap metal but with new sprite and lore
	name = "Remains of Custodian Squire Helmet"
	desc = "A few deformated, unusable and broken pieces of an Custodian Squire helmet, they seem to be extremely damaged to be used as anything, the metals seem to be reusable..."
	icon_state = "helmet_scrap_squire_0"
	matter = list(MATERIAL_ALUMINIUM = 4,MATERIAL_SILK = 2)

/obj/item/trash/material/brokenhelmetsquire1 //scrap metal but with new sprite and lore
	name = "Remains of Custodian Squire Helmet"
	desc = "A few deformated, unusable and broken pieces of an Custodian Squire helmet, they seem to be extremely damaged to be used as anything, the metals seem to be reusable..."
	icon_state = "helmet_scrap_squire_1"
	matter = list(MATERIAL_ALUMINIUM = 4,MATERIAL_SILK = 2)

/obj/item/trash/material/brokenhelmetsquire2 //scrap metal but with new sprite and lore
	name = "Remains of Custodian Squire Helmet"
	desc = "A few deformated, unusable and broken pieces of an Custodian Squire helmet, they seem to be extremely damaged to be used as anything, the metals seem to be reusable..."
	icon_state = "helmet_scrap_squire_2"
	matter = list(MATERIAL_ALUMINIUM = 4,MATERIAL_SILK = 2)

/obj/item/trash/material/brokenhelmetsquire3 //scrap metal but with new sprite and lore
	name = "Remains of Custodian Squire Helmet"
	desc = "A few deformated, unusable and broken pieces of an Custodian Squire helmet, they seem to be extremely damaged to be used as anything, the metals seem to be reusable..."
	icon_state = "helmet_scrap_squire_3"
	matter = list(MATERIAL_ALUMINIUM = 4,MATERIAL_SILK = 2)

/obj/item/trash/material/brokenhelmetsquire4 //scrap metal but with new sprite and lore
	name = "Remains of Custodian Squire Helmet"
	desc = "A few deformated, unusable and broken pieces of an Custodian Squire helmet, they seem to be extremely damaged to be used as anything, the metals seem to be reusable..."
	icon_state = "helmet_scrap_squire_4"
	matter = list(MATERIAL_ALUMINIUM = 4,MATERIAL_SILK = 2)

	//custodian squire armor scraps
obj/item/trash/material/brokenarmorsquire0 //scrap metal but with new sprite and lore
	name = "Remains of Custodian Squire Armor"
	desc = "A few deformated, unusable and broken pieces of Custodian Squire armor, they seem to be far away from be fixed and re used, they still having some remains of material..."
	icon_state = "armor_scrap_squire_0"
	matter = list(MATERIAL_ALUMINIUM = 4,MATERIAL_SILK = 2, MATERIAL_CARBON_FIBER = 1)

obj/item/trash/material/brokenarmorsquire1 //scrap metal but with new sprite and lore
	name = "Remains of Custodian Squire Armor"
	desc = "A few deformated, unusable and broken pieces of Custodian Squire armor, they seem to be far away from be fixed and re used, they still having some remains of material..."
	icon_state = "armor_scrap_squire_1"
	matter = list(MATERIAL_ALUMINIUM = 4,MATERIAL_SILK = 2, MATERIAL_CARBON_FIBER = 1)

obj/item/trash/material/brokenarmorsquire2 //scrap metal but with new sprite and lore
	name = "Remains of Custodian Squire Armor"
	desc = "A few deformated, unusable and broken pieces of Custodian Squire armor, they seem to be far away from be fixed and re used, they still having some remains of material..."
	icon_state = "armor_scrap_squire_2"
	matter = list(MATERIAL_ALUMINIUM = 4,MATERIAL_SILK = 2, MATERIAL_CARBON_FIBER = 1)

obj/item/trash/material/brokenarmorsquire3 //scrap metal but with new sprite and lore
	name = "Remains of Custodian Squire Armor"
	desc = "A few deformated, unusable and broken pieces of Custodian Squire armor, they seem to be far away from be fixed and re used, they still having some remains of material..."
	icon_state = "armor_scrap_squire_3"
	matter = list(MATERIAL_ALUMINIUM = 4,MATERIAL_SILK = 2, MATERIAL_CARBON_FIBER = 1)

obj/item/trash/material/brokenarmorsquire4 //scrap metal but with new sprite and lore
	name = "Remains of Custodian Squire Armor"
	desc = "A few deformated, unusable and broken pieces of Custodian Squire armor, they seem to be far away from be fixed and re used, they still having some remains of material..."
	icon_state = "armor_scrap_squire_4"
	matter = list(MATERIAL_ALUMINIUM = 4,MATERIAL_SILK = 2, MATERIAL_CARBON_FIBER = 1)

obj/item/trash/material/brokenarmorsquire5 //scrap metal but with new sprite and lore
	name = "Remains of Custodian Squire Armor"
	desc = "A few deformated, unusable and broken pieces of Custodian Squire armor, they seem to be far away from be fixed and re used, they still having some remains of material..."
	icon_state = "armor_scrap_squire_5"
	matter = list(MATERIAL_ALUMINIUM = 4,MATERIAL_SILK = 2, MATERIAL_CARBON_FIBER = 1)

obj/item/trash/material/brokenarmorsquire6 //scrap metal but with new sprite and lore
	name = "Remains of Custodian Squire Armor"
	desc = "A few deformated, unusable and broken pieces of Custodian Squire armor, they seem to be far away from be fixed and re used, they still having some remains of material..."
	icon_state = "armor_scrap_squire_6"
	matter = list(MATERIAL_ALUMINIUM = 4,MATERIAL_SILK = 2, MATERIAL_CARBON_FIBER = 1)

//Khambataar Rebels Remains

//armors
obj/item/trash/material/brokenarmorrebel0 //scrap metal but with new sprite and lore
	name = "Remains of Populist Fighter"
	desc = "A few deformated, unusable and broken pieces of the well known Populist Fighters, they seem to be far away from be fixed and re used, they still having some remains of materials and some leather..."
	icon_state = "armor_scrap_rebel_0"
	matter = list(MATERIAL_ALUMINIUM = 4, MATERIAL_LEATHER = 1)

obj/item/trash/material/brokenarmorrebel1 //scrap metal but with new sprite and lore
	name = "Remains of Populist Fighter"
	desc = "A few deformated, unusable and broken pieces of the well known Populist Fighters, they seem to be far away from be fixed and re used, they still having some remains of materials and some leather..."
	icon_state = "armor_scrap_rebel_1"
	matter = list(MATERIAL_ALUMINIUM = 4, MATERIAL_LEATHER = 1)

obj/item/trash/material/brokenarmorrebel2 //scrap metal but with new sprite and lore
	name = "Remains of Populist Fighter"
	desc = "A few deformated, unusable and broken pieces of the well known Populist Fighters, they seem to be far away from be fixed and re used, they still having some remains of materials and some leather..."
	icon_state = "armor_scrap_rebel_2"
	matter = list(MATERIAL_ALUMINIUM = 4, MATERIAL_LEATHER = 1)

obj/item/trash/material/brokenarmorrebel3 //scrap metal but with new sprite and lore
	name = "Remains of Populist Fighter"
	desc = "A few deformated, unusable and broken pieces of the well known Populist Fighters, they seem to be far away from be fixed and re used, they still having some remains of materials and some leather..."
	icon_state = "armor_scrap_rebel_3"
	matter = list(MATERIAL_ALUMINIUM = 4, MATERIAL_LEATHER = 1)

obj/item/trash/material/brokenarmorrebel4 //scrap metal but with new sprite and lore
	name = "Remains of Populist Fighter"
	desc = "A few deformated, unusable and broken pieces of the well known Populist Fighters, they seem to be far away from be fixed and re used, they still having some remains of materials and some leather..."
	icon_state = "armor_scrap_rebel_4"
	matter = list(MATERIAL_ALUMINIUM = 4, MATERIAL_LEATHER = 1)

obj/item/trash/material/brokenarmorrebel5 //scrap metal but with new sprite and lore
	name = "Remains of Populist Fighter"
	desc = "A few deformated, unusable and broken pieces of the well known Populist Fighters, they seem to be far away from be fixed and re used, they still having some remains of materials and some leather..."
	icon_state = "armor_scrap_rebel_5"
	matter = list(MATERIAL_ALUMINIUM = 4, MATERIAL_LEATHER = 1)

obj/item/trash/material/brokenarmorrebel6 //scrap metal but with new sprite and lore
	name = "Remains of Populist Fighter"
	desc = "A few deformated, unusable and broken pieces of the well known Populist Fighters, they seem to be far away from be fixed and re used, they still having some remains of materials and some leather..."
	icon_state = "armor_scrap_rebel_6"
	matter = list(MATERIAL_ALUMINIUM = 4, MATERIAL_LEATHER = 1)

obj/item/trash/material/brokenarmorrebel7 //scrap metal but with new sprite and lore
	name = "Remains of Populist Fighter"
	desc = "A few deformated, unusable and broken pieces of the well known Populist Fighters, they seem to be far away from be fixed and re used, they still having some remains of materials and some leather..."
	icon_state = "armor_scrap_rebel_7"
	matter = list(MATERIAL_ALUMINIUM = 4, MATERIAL_LEATHER = 1)

//Helmets

/obj/item/trash/material/brokenhelmetrebel0 //scrap metal but with new sprite and lore
	name = "Remains of an Improvised Helmet"
	desc = "A few deformated, unusable and broken pieces of an improvised helmet, they seem to be from an rebel"
	icon_state = "helmet_scrap_rebel_0"
	matter = list(MATERIAL_ALUMINIUM = 4)

/obj/item/trash/material/brokenhelmetrebel1//scrap metal but with new sprite and lore
	name = "Remains of an Improvised Helmet"
	desc = "A few deformated, unusable and broken pieces of an improvised helmet, they seem to be from an rebel"
	icon_state = "helmet_scrap_rebel_1"
	matter = list(MATERIAL_ALUMINIUM = 4)

/obj/item/trash/material/brokenhelmetrebel2 //scrap metal but with new sprite and lore
	name = "Remains of an Improvised Helmet"
	desc = "A few deformated, unusable and broken pieces of an improvised helmet, they seem to be from an rebel"
	icon_state = "helmet_scrap_rebel_2"
	matter = list(MATERIAL_ALUMINIUM = 4)

/obj/item/trash/material/brokenhelmetrebel3 //scrap metal but with new sprite and lore
	name = "Remains of an Improvised Helmet"
	desc = "A few deformated, unusable and broken pieces of an improvised helmet, they seem to be from an rebel"
	icon_state = "helmet_scrap_rebel_3"
	matter = list(MATERIAL_ALUMINIUM = 4)

/obj/item/trash/material/brokenhelmetrebel4 //scrap metal but with new sprite and lore
	name = "Remains of an Improvised Helmet"
	desc = "A few deformated, unusable and broken pieces of an improvised helmet, they seem to be from an rebel"
	icon_state = "helmet_scrap_rebel_4"
	matter = list(MATERIAL_ALUMINIUM = 4)
/obj/item/trash/material/brokenhelmetrebel5 //scrap metal but with new sprite and lore
	name = "Remains of an Improvised Helmet"
	desc = "A few deformated, unusable and broken pieces of an improvised helmet, they seem to be from an rebel"
	icon_state = "helmet_scrap_rebel_5"
	matter = list(MATERIAL_ALUMINIUM = 4)

/obj/item/trash/material/brokenhelmetrebel6 //scrap metal but with new sprite and lore
	name = "Remains of an Improvised Helmet"
	desc = "A few deformated, unusable and broken pieces of an improvised helmet, they seem to be from an rebel"
	icon_state = "helmet_scrap_rebel_6"
	matter = list(MATERIAL_ALUMINIUM = 4)

/obj/item/trash/material/brokenhelmetrebel7 //scrap metal but with new sprite and lore
	name = "Remains of an Improvised Helmet"
	desc = "A few deformated, unusable and broken pieces of an improvised helmet, they seem to be from an rebel"
	icon_state = "helmet_scrap_rebel_7"
	matter = list(MATERIAL_ALUMINIUM = 4)
