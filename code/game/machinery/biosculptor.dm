
/obj/machinery/biosculptor
	name = "biosculptor" //biomatter sheet generation machine due to church being nuked
	desc = "A machine that takes in slabs of meat and grinds them into a paste to melt together. After an intensely odorous chemical process, the raw flesh is melded into thick sheets of bio-material for use in machinery and fabrication."
	description_info = "Leave slabs of meat on the north turf and activate the machine to use. Component upgrades have no effect."
	icon = 'icons/obj/machines/biosculptor.dmi'
	icon_state = "biosculptor"
	density = 1
	anchored = 1
	circuit = /obj/item/circuitboard/biosculptor
	use_power = IDLE_POWER_USE
	idle_power_usage = 15
	active_power_usage = 100
	var/input_side = NORTH //inputs come from the turf directly north
	var/progress = 0 //how far along we are when eating meat
	var/eating = FALSE //are we eating meat
	var/active = FALSE //are we running
	var/eating_speed = 25 //how many Process() ticks until one meat is processed
	var/output_amount = 0 //how many sheets per meat?
	var/last_time_used = 0 //used to not let the user toggle the machine super fast
	var/list/accepted_materials = list(MATERIAL_BIOMATTER)

/obj/machinery/biosculptor/Process()
	if(stat & BROKEN || stat & NOPOWER)
		progress = 0
		return
	if(active)
		if(eating)
			use_power(ACTIVE_POWER_USE)
			progress += eating_speed
			if(progress >= 100)
				output_sheets()
				grab_item()
		else
			grab_item()

/obj/machinery/biosculptor/attack_hand(mob/user)
	if(world.time >= last_time_used + 2 SECONDS)
		last_time_used = world.time
		active = !active
		to_chat(user, SPAN_NOTICE("You [active ? "turn [src] on" : "turn [src] off"]."))
		playsound(src, 'sound/machines/click.ogg', 80, 1)


/obj/machinery/biosculptor/proc/grab_item()
	var/found_biomatter = FALSE
	for(var/obj/target_item in get_step(src, input_side)) //find any item
		if(has_biomatter(target_item)) //has biomattter? start eating, set the expected output
			if(istype(target_item,/obj/item/stack/material/biomatter)) //did we just find some biomatter sheets?
				var/obj/item/stack/found_sheets = target_item //get a /stack var, set it to the sheets we found
				output_amount = found_sheets.amount //set the output to be the amount var of the sheets we found
			found_biomatter = TRUE //used to determine whether to flash the DENIED alarm or not
			qdel(target_item)
			eating = TRUE
			return

	if(!found_biomatter) //all items were scanned, no item was grabbed? show denial
		state("No suitable material identified on input side.")
		ping()
		active = FALSE
		eating = FALSE
		return

/obj/machinery/biosculptor/proc/has_biomatter(var/obj/target)
	var/list/target_materials = target.get_matter() //get the list of materials
	for(var/material in target_materials)
		if(material in accepted_materials)
			output_amount = target_materials[material] //set the output to be the scanned item's biomatter amount
			return TRUE //grab_item() will know we found biomatter if true
		else
			output_amount = 0
			return FALSE

/obj/machinery/biosculptor/proc/output_sheets()
	var/obj/item/stack/material/biomatter/current_stack
	var/excess
	//if there any stacks here, let's check them
	if(locate(/obj/item/stack/material/biomatter) in loc)
		for(var/obj/item/stack/material/biomatter/stack_on_my_loc in loc)
			//if this isn't full, we use that stack(current)
			if(stack_on_my_loc.amount < stack_on_my_loc.max_amount)
				current_stack = stack_on_my_loc
				break

	if(current_stack)
		if((current_stack.amount + output_amount) <= current_stack.max_amount) //can we just cleanly add this and not go over the max amount?
			current_stack.add(output_amount) //awesome, add it
			if(current_stack.amount == current_stack.max_amount)
				state("Stack is ready.")
				ping()
		else //no we cant
			excess  = ((current_stack.amount + output_amount) - current_stack.max_amount) //calculate the excess
			current_stack.add((output_amount - excess)) //only add until the max amount
			state("Stack is ready.")
			ping()

			current_stack = new(loc,excess) //make a stack with the excess

	else //we didnt find ANY stack
		current_stack = new(loc,output_amount) //make a new one

