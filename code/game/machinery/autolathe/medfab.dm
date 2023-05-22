/obj/machinery/autolathe/medfab
	name = "medical fabricator"
	desc = "A specilized fabricator for producing medical equipment more efficiently."
	icon_state = "bioprinter_med"
	build_type = AUTOLATHE | BIOPRINTER
	density = 1
	anchored = 1
	layer = BELOW_OBJ_LAYER
	use_power = IDLE_POWER_USE
	idle_power_usage = 10
	active_power_usage = 1000
	circuit = /obj/item/circuitboard/autolathe_medfab

	storage_capacity = 240
	speed = 3
	mat_efficiency = 1

	selectively_recycled_types = list(/obj/item/reagent_containers/food, /obj/item/clothing, /obj/item/organ,/obj/item/modification/organ)
	//Should only contain things required to produce medical equipment
	unsuitable_materials = list()
	suitable_materials = list(MATERIAL_CLOTH, MATERIAL_WOOD, MATERIAL_STEEL, MATERIAL_GLASS, MATERIAL_PLASTIC, MATERIAL_PLASTEEL, MATERIAL_SILVER, MATERIAL_BIOMATTER)


/obj/machinery/autolathe/medfab/attackby(obj/item/I, mob/user)

	if(istype(I, /obj/item/stack/material/cyborg))
		return //Prevents borgs throwing their stuff into it

	if(default_deconstruction(I, user))
		wires?.Interact(user)
		return

	if(default_part_replacement(I, user))
		return

	if(istype(I, /obj/item/computer_hardware/hard_drive/portable/design/medical)) //IS this jank, yes, does it matter, no - Lamasmaster
		insert_disk(user, I)

	if(istype(I, /obj/item/computer_hardware/hard_drive/portable))
		to_chat(user, SPAN_DANGER("[src] is only capable of replicating medical designs!"))
		return

	// We devour medical equipment because the design is very human and very easy to use
	if(istype(I, /obj/item/stack/medical) || istype(I, /obj/item/reagent_containers/syringe) || istype(I, /obj/item/storage/pill_bottle))
		eat(user, I)
		return

	if(istype(I, /obj/item/reagent_containers/glass))
		insert_beaker(user, I)
		return

	user.set_machine(src)
	nano_ui_interact(user)

/obj/machinery/autolathe/medfab/loaded
	default_disk = /obj/item/computer_hardware/hard_drive/portable/design/medical/medfab //We start loaded

/obj/machinery/autolathe/medfab/loaded/Initialize()
	. = ..()
	container = new /obj/item/reagent_containers/glass/beaker(src)
