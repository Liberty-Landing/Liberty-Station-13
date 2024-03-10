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
