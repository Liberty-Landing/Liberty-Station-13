/obj/random/material
	name = "random building material"
	icon_state = "material-grey"
	spawn_nothing_percentage = 20

//This stuff can't be easily converted to pickweight because of these amount fields
/obj/random/material/item_to_spawn()
	return pick(/obj/item/stack/material/aluminium/random,\
				/obj/item/stack/material/glass/random,\
				/obj/item/stack/material/plastic/random,\
				/obj/item/stack/material/wood/random,\
				/obj/item/stack/material/cardboard/random,\
				/obj/item/stack/rods/random,\
				/obj/item/stack/material/indsteel/random)

/obj/random/material/low_chance
	name = "low chance random building material"
	icon_state = "material-grey-low"
	spawn_nothing_percentage = 60

/obj/random/material_resources
	name = "random resource material"
	icon_state = "material-green"
	spawn_nothing_percentage = 20

/obj/random/material_resources/item_to_spawn()
	return pickweight(list(/obj/item/stack/material/aluminium/random = 5,\
				/obj/item/stack/material/glass/random = 4,\
				/obj/item/stack/material/glass/mendsilicate/random = 3,\
				/obj/item/stack/material/iron/random = 2,\
				/obj/item/stack/material/niobium/random = 2,\
				/obj/item/stack/material/titanium/random = 2,\
				/obj/item/stack/material/copper/random = 1,\
				/obj/item/stack/material/briquette/random = 4,\
				/obj/item/stack/material/duralumin/random = 2,\
				/obj/item/stack/material/diamond/random = 0.5,\
				/obj/item/stack/material/hydrogenc/random = 3,\
				/obj/item/stack/material/gold/random = 2,\
				/obj/item/stack/material/uranium/random = 1,\
				/obj/item/stack/material/silver/random = 2))

/obj/random/material_resources/low_chance
	name = "low chance random resource material"
	icon_state = "material-green-low"
	spawn_nothing_percentage = 60

/obj/random/material_rare
	name = "random rare material"
	icon_state = "material-orange"
	spawn_nothing_percentage = 20

/obj/random/material_rare/item_to_spawn()
	return pickweight(list(/obj/item/stack/material/diamond/random = 1,\
				/obj/item/stack/material/gold/random = 2,\
				/obj/item/stack/material/uranium/random = 1,\
				/obj/item/stack/material/silver/random = 2,\
				/obj/item/stack/material/glass/mendsilicate/random = 2))

/obj/random/material_rare/always_spawn
	name = "random always spawn rare material"
	icon_state = "material-orange"
	spawn_nothing_percentage = 0

/obj/random/material_rare/low_chance
	name = "low chance random rare material"
	icon_state = "material-orange-low"
	spawn_nothing_percentage = 60

/obj/random/material_ore
	name = "random ore"
	icon_state = "material-black"
	spawn_nothing_percentage = 20

/obj/random/material_handyman
	spawn_nothing_percentage = 0

/obj/random/material_handyman/item_to_spawn()
	return pickweight(list(/obj/item/stack/material/diamond/random = 1,\
				/obj/item/stack/material/gold/random = 2,\
				/obj/item/stack/material/uranium/random = 1,\
				/obj/item/stack/material/copper/random = 3,\
				/obj/item/stack/material/silver/random = 2,\
				/obj/item/stack/material/titanium/random = 2,\
				/obj/item/stack/material/indsteel/random = 2))

/obj/random/material_ore/item_to_spawn()
	return pickweight(list(/obj/item/stack/ore/lignite = 4,\
				/obj/item/stack/ore/glass = 5,\
				/obj/item/stack/ore/gold = 3,\
				/obj/item/stack/ore/titanium = 1,\
				/obj/item/stack/ore/iron = 4,\
				/obj/item/stack/ore/copper = 4,\
				/obj/item/stack/ore/niobium = 1,\
				/obj/item/stack/ore/hydrogenc = 2,\
				/obj/item/stack/ore/silver = 3,\
				/obj/item/stack/ore/uranium = 1,\
				/obj/item/stack/ore/lignite = 4,\
				/obj/item/stack/ore/diamond = 0.1))


/obj/random/material_ore/low_chance
	name = "low chance random ore"
	icon_state = "material-black-low"
	spawn_nothing_percentage = 60

/obj/random/material_ore_small
	name = "random small ore"
	icon_state = "material-black"
	spawn_nothing_percentage = 0

/obj/random/material_ore_small/item_to_spawn()
	return pickweight(list(/obj/item/stack/ore/lignite/small = 2,\
				/obj/item/stack/ore/glass = 12,\
				/obj/item/stack/ore/gold/small = 2,\
				/obj/item/stack/ore/iron/small = 2,\
				/obj/item/stack/ore/niobium/small = 2,\
				/obj/item/stack/ore/hydrogenc/small = 1,\
				/obj/item/stack/ore/silver/small = 2,\
				/obj/item/stack/ore/uranium/small = 1,\
				/obj/item/stack/ore/diamond/small = 1))
