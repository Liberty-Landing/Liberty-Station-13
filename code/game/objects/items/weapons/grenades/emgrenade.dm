/obj/item/grenade/empgrenade
	name = "MT Ion Grenade \"Ionstorm\""
	desc = "Ion grenade, designed to disable electronics, augmentations and energy weapons."
	icon_state = "emp"
	item_state = "empgrenade"
	origin_tech = list(TECH_MATERIAL = 2, TECH_MAGNET = 3)

/obj/item/grenade/empgrenade/prime()
	..()
	if(empulse(src, 4, 10))
		icon_state = "emp_off"
		desc = "[initial(desc)] It has already been used."
	return

/obj/item/grenade/empgrenade/low_yield
	name = "MT EMP Grenade \"Power Zapper\""
	desc = "A weaker variant of the \"Ionstorm\" ion grenade, with lesser radius."
	icon_state = "lyemp"
	item_state = "empgrenade"
	origin_tech = list(TECH_MATERIAL = 2, TECH_MAGNET = 3)

/obj/item/grenade/empgrenade/low_yield/prime() // Inheritance is a fuck . this made low yields as effective as normal.
	var/turf/T = get_turf(src)
	if(T)
		T.hotspot_expose(700,125)
	if(empulse(src, 4, 1))
		icon_state = "emp_off"
		desc = "[initial(desc)] It has already been used."
	return
