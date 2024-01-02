/obj/random/structures/nacre_crystal
	name = "random nacre crystal"
	icon_state = "hostilemob-purple"
	alpha = 128

/obj/random/structures/nacre_crystal/item_to_spawn()
	return pickweight(list(/obj/structure/nacre_crystal = 70,
		/obj/structure/nacre_crystal/spire/dormit = 5,
		/obj/structure/nacre_crystal/spire = 3,
		/obj/structure/nacre_crystal/spire/range_2 = 2,,
		/obj/structure/nacre_crystal/spire/range_3 = 1,
		))
