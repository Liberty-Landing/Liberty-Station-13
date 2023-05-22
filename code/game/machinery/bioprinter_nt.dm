/obj/machinery/autolathe/flarelathe
	name = "custodian flarelathe"
	desc = "A forge design created by the Custodians that makes use of Radiance to smith their equipment."
	icon_state = "flarelathe"
	unsuitable_materials = list()
	build_type = AUTOLATHE | BIOPRINTER
	storage_capacity = 480
	speed = 11
	have_recycling = TRUE
	queue_max = 16 //Might be 8 in game do to wires
	mat_efficiency = 1

/obj/machinery/autolathe/flarelathe/attackby(obj/item/I, mob/user)
	//hacky way to forbid deconstruction but use ..()
	var/tool_type = I.get_tool_type(user, list(QUALITY_SCREW_DRIVING), src)
	if(tool_type == QUALITY_SCREW_DRIVING)
		return

	//it needs to have panel open, but just in case
	if(istype(I, /obj/item/storage/part_replacer))
		return

	..(I, user)

/obj/machinery/autolathe/flarelathe/RefreshParts()
	..()
	speed = initial(speed)
	mat_efficiency = initial(mat_efficiency)

/obj/machinery/autolathe/flarelathe/upgraded
	name = "enhanced flarelathe"
	desc = "A forge design created by the Custodians that makes use of Radiance to smith their equipment. This one has been enhanced by a Forgemaster, reducing material costs."
	mat_efficiency = 0.5
