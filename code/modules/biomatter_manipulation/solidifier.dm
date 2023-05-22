//Scorch processing machines
//These machines convert scorch into biosilk and carbon fiber
//Heat protection clothing recommended for working with these

#define SCORCH_PER_SILK 		1
#define SCORCH_PER_FIBER		4
#define CONTAINER_PIXEL_OFFSET 		6

/obj/machinery/sewing_artificer
	name = "sewing artificer"
	desc = "A unique Custodian design that stabilizes, solidifies, and weaves together Scorch to form durable sheets of bio-silk."
	icon = 'icons/obj/machines/simple_nt_machines.dmi'
	icon_state = "sewing_artificer"
	density = TRUE
	anchored = TRUE
	use_power = IDLE_POWER_USE
	idle_power_usage = 5
	active_power_usage = 300
	var/active = FALSE
	var/port_dir = NORTH
	var/obj/structure/reagent_dispensers/scorch/container
	var/last_time_used = 0

/obj/machinery/sewing_artificer/New()
	. = ..()
	add_overlay(image(icon = src.icon, icon_state = "tube", layer = LOW_OBJ_LAYER, dir = port_dir))

/obj/machinery/sewing_artificer/update_icon()
	if(active)
		icon_state = initial(icon_state) + "_on"
	else
		icon_state = initial(icon_state)
	cut_overlays()
	add_overlay(image(icon = src.icon, icon_state = "tube", layer = LOW_OBJ_LAYER, dir = port_dir))


/obj/machinery/sewing_artificer/Process()
	if(active)
		if(!container)
			abort("Container of liquid scorch required.")
		else
			if(!container.reagents.has_reagent("liquidscorch", SCORCH_PER_SILK))
				abort("Insufficient amount of scorch.")
			else
				container.reagents.remove_reagent("liquidscorch", SCORCH_PER_SILK)
				var/obj/item/stack/material/biopolymer_silk/current_stack
				//if there any stacks here, let's check them
				if(locate(/obj/item/stack/material/biopolymer_silk) in loc)
					for(var/obj/item/stack/material/biopolymer_silk/stack_on_my_loc in loc)
						//if this isn't full, we use that stack(current)
						if(stack_on_my_loc.amount < stack_on_my_loc.max_amount)
							current_stack = stack_on_my_loc
							break

				if(current_stack)
					current_stack.add(1)
					if(current_stack.amount == current_stack.max_amount)
						state("Stack is ready.")
						ping()
				else
					current_stack = new(loc)


/obj/machinery/sewing_artificer/MouseDrop_T(obj/structure/reagent_dispensers/scorch/tank, mob/user)
	if(get_dir(loc, tank.loc) != port_dir)
		to_chat(user, SPAN_WARNING("Doesn't connect. Port direction located at [dir2text(port_dir)] side of [src]"))
		return

	if(!container)
		container = tank
		container.anchored = TRUE
		switch(port_dir)
			if(SOUTH)
				container.pixel_y += CONTAINER_PIXEL_OFFSET
			if(NORTH)
				container.pixel_y -= CONTAINER_PIXEL_OFFSET
			if(WEST)
				container.pixel_x += CONTAINER_PIXEL_OFFSET
			if(EAST)
				container.pixel_x -= CONTAINER_PIXEL_OFFSET
		playsound(src, 'sound/machines/airlock_ext_close.ogg', 60, 1)
		to_chat(user, SPAN_NOTICE("You attached [tank] to [src]."))
		scorch_attack(user)
	else
		if(container == tank)
			container.pixel_y = initial(container.pixel_y)
			container.pixel_x = initial(container.pixel_x)
			container.anchored = FALSE
			playsound(src, 'sound/machines/airlock_ext_open.ogg', 60, 1)
			to_chat(user, SPAN_NOTICE("You detached [tank] from [src]."))
			container = null
			scorch_attack(user)
		else
			to_chat(user, SPAN_WARNING("There is already a connected container."))
	update_icon()

/obj/machinery/sewing_artificer/attack_hand(mob/user)
	if(world.time >= last_time_used + 2 SECONDS)
		last_time_used = world.time
		active = !active
		to_chat(user, SPAN_NOTICE("You [active ? "turn [src] on" : "turn [src] off"]."))
		playsound(src, 'sound/machines/click.ogg', 80, 1)
		update_icon()


/obj/machinery/sewing_artificer/proc/abort(var/msg)
	state(msg)
	active = !active
	ping()
	update_icon()

/obj/machinery/sewing_artificer/composite_artificer
	name = "composite artificer"
	desc = "A unique Custodian design that stabilizes, solidifies, and forges Scorch into Carbon Fiber."
	icon = 'icons/obj/machines/simple_nt_machines.dmi'
	icon_state = "composite_artificer"

/obj/machinery/sewing_artificer/composite_artificer/Process()
	if(active)
		if(!container)
			abort("Container of liquid scorch required.")
		else
			if(!container.reagents.has_reagent("liquidscorch", SCORCH_PER_FIBER))
				abort("Insufficient amount of scorch.")
			else
				container.reagents.remove_reagent("liquidscorch", SCORCH_PER_FIBER)
				var/obj/item/stack/material/carbon_fiber/current_stack
				//if there any stacks here, let's check them
				if(locate(/obj/item/stack/material/carbon_fiber) in loc)
					for(var/obj/item/stack/material/carbon_fiber/stack_on_my_loc in loc)
						//if this isn't full, we use that stack(current)
						if(stack_on_my_loc.amount < stack_on_my_loc.max_amount)
							current_stack = stack_on_my_loc
							break

				if(current_stack)
					current_stack.add(1)
					if(current_stack.amount == current_stack.max_amount)
						state("Stack is ready.")
						ping()
				else
					current_stack = new(loc)

/////////////////////

/obj/machinery/neotheology
	icon = 'icons/obj/neotheology_machinery.dmi'

#undef CONTAINER_PIXEL_OFFSET
#undef SCORCH_PER_SILK
#undef SCORCH_PER_FIBER
