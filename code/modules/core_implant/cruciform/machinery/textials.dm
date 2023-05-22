/*
/obj/machinery/textials
	name = "flarelathe"
	desc = "A gas heated fire lathe used for enfusing silk and biomatter into silk, \
	and bind carbon fibers from steel to cloth strands."
	icon = 'icons/obj/machines/autolathe.dmi'
	icon_state = "flarelathe"
	density = TRUE
	anchored = TRUE
	layer = BELOW_OBJ_LAYER
	use_power = IDLE_POWER_USE
	idle_power_usage = 10
	active_power_usage = 2000
	circuit = null

	var/is_active = FALSE
	var/metal_score = 0
	var/silk_score = 0
	var/biomatter_score = 0
	var/cloth_score = 0
	var/mode = "Biopolymer Silk"
	var/error = FALSE

/obj/machinery/textials/update_icon()
	cut_overlays()

	icon_state = initial(icon_state)

	if(stat & NOPOWER)
		icon_state = "[initial(icon_state)]_off"

	if(is_active) // if paused, work animation looks awkward.
		if(error)
			icon_state = "[icon_state]_pause"
		else
			icon_state = "[icon_state]_work"


/obj/machinery/textials/examine(mob/user)
	..()
	to_chat(user, "<span class='info'>Levels of stored biomass: [biomatter_score]</span>")
	to_chat(user, "<span class='info'>Levels of stored metal: [metal_score]</span>")
	to_chat(user, "<span class='info'>Levels of stored cloth: [cloth_score]</span>")
	to_chat(user, "<span class='info'>Levels of stored silk: [silk_score]</span>")
	to_chat(user, "<span class='info'>Currently Producing: [mode]</span>")
	if(error)
		to_chat(user, "<span class='info'>It is currently active, but stalling do to an error.</span>")
	if(!is_active)
		to_chat(user, "<span class='info'>Activation: Use a lighter or other fire-source</span>")
	else
		to_chat(user, "<span class='info'>Deactivation: Click with empty hand</span>")

/obj/machinery/textials/attack_hand(mob/living/user as mob)
	if(is_active)
		to_chat(user, "<span class='angelsay'>You silently turn off the [name].</span>")
		error = FALSE
		is_active = FALSE
		update_icon()
		flick("firelathe_finished", src)
	if(mode == "Biopolymer Silk")
		mode = "Carbon Fiber"
	else
		mode = "Biopolymer Silk"
	to_chat(user, "<span class='angelsay'>You swap the mode [mode] production.</span>")

/obj/machinery/textials/proc/turn_on(mob/living/user as mob)
	if(is_active)
		return

	to_chat(user, "<span class='angelsay'>You silently turn on the [name].</span>")
	is_active = TRUE
	start_loop_for_materals()
	update_icon()

/obj/machinery/textials/proc/start_loop_for_materals()
	if(!is_active)
		return
	if(!can_print_sheet())
		return
	//I dont know how to make this modular at this time, so it has douped code for the time
	if(mode == "Biopolymer Silk")
		if(is_active)
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

	if(mode == "Carbon Fiber")
		if(is_active)
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


	addtimer(CALLBACK(src, .proc/start_loop_for_materals), 1 SECOND, TIMER_STOPPABLE)

/obj/machinery/textials/proc/can_print_sheet()
	if(mode == "Biopolymer Silk")
		if(silk_score >= 1 && biomatter_score >= 1)
			silk_score -= 1
			biomatter_score -= 1
			return TRUE

	if(mode == "Carbon Fiber")
		if(metal_score >= 1 && cloth_score >= 1)
			metal_score -= 1
			cloth_score -= 1
			return TRUE

	error = TRUE
	update_icon()

	return FALSE

/obj/machinery/textials/attackby(obj/item/I, mob/user as mob)
	if(is_active)
		to_chat(user, "<span class='angelsay'>The [name] is on and cant be manipulated untill turned off.</span>")
		return

	if(isflamesource(I))
		turn_on(user)
		error = FALSE
		return

	if (istype(I, /obj/item/stack/material/biomatter))
		var/obj/item/stack/material/biomatter/B = I
		if (B.amount)
			var/sheets_amount_to_transphere = input(user, "How many sheets you want to load?", "Biomatter melting", 1) as num
			if (sheets_amount_to_transphere > B.amount || sheets_amount_to_transphere < 1) //No cheating!
				to_chat(user, SPAN_WARNING("You don't have that many [B.name]"))
				return
			if(sheets_amount_to_transphere)
				B.use(sheets_amount_to_transphere)
				biomatter_score += sheets_amount_to_transphere
				user.visible_message(
									"[user.name] inserted \the [B.name]'s sheets in \the [name].",
									"You inserted \the [B.name] in  (in amount: [sheets_amount_to_transphere]) \the [name].\
									And after that you see how the counter on \the [name] is incremented by [sheets_amount_to_transphere]."
									)
				ping()
			else
				to_chat(user, SPAN_WARNING("You can't insert [sheets_amount_to_transphere] in [name]"))
			return

	if (istype(I, /obj/item/stack/material/steel))
		var/obj/item/stack/material/steel/S = I
		if (S.amount)
			var/sheets_amount_to_transphere = input(user, "How many sheets you want to load?", "Steel loading", 1) as num
			if (sheets_amount_to_transphere > S.amount || sheets_amount_to_transphere < 1) //No cheating!
				to_chat(user, SPAN_WARNING("You don't have that many [S.name]"))
				return
			if(sheets_amount_to_transphere)
				S.use(sheets_amount_to_transphere)
				metal_score += sheets_amount_to_transphere
				user.visible_message(
									"[user.name] inserted \the [S.name]'s sheets in \the [name].",
									"You inserted \the [S.name] in  (in amount: [sheets_amount_to_transphere]) \the [name].\
									And after that you see how the counter on \the [name] is incremented by [sheets_amount_to_transphere]."
									)
				ping()
			else
				to_chat(user, SPAN_WARNING("You can't insert [sheets_amount_to_transphere] in [name]"))
			return

	if (istype(I, /obj/item/stack/material/cloth))
		var/obj/item/stack/material/cloth/C = I
		if (C.amount)
			var/sheets_amount_to_transphere = input(user, "How many sheets you want to load?", "Cloth loading", 1) as num
			if (sheets_amount_to_transphere > C.amount || sheets_amount_to_transphere < 1) //No cheating!
				to_chat(user, SPAN_WARNING("You don't have that many [C.name]"))
				return
			if(sheets_amount_to_transphere)
				C.use(sheets_amount_to_transphere)
				cloth_score += sheets_amount_to_transphere
				user.visible_message(
									"[user.name] inserted \the [C.name]'s sheets in \the [name].",
									"You inserted \the [C.name] in  (in amount: [sheets_amount_to_transphere]) \the [name].\
									And after that you see how the counter on \the [name] is incremented by [sheets_amount_to_transphere]."
									)
				ping()
			else
				to_chat(user, SPAN_WARNING("You can't insert [sheets_amount_to_transphere] in [name]"))
			return

	if (istype(I, /obj/item/stack/material/silk))
		var/obj/item/stack/material/silk/K = I
		if (K.amount)
			var/sheets_amount_to_transphere = input(user, "How many sheets you want to load?", "Silk loading", 1) as num
			if (sheets_amount_to_transphere > K.amount || sheets_amount_to_transphere < 1) //No cheating!
				to_chat(user, SPAN_WARNING("You don't have that many [K.name]"))
				return
			if(sheets_amount_to_transphere)
				K.use(sheets_amount_to_transphere)
				silk_score += sheets_amount_to_transphere
				user.visible_message(
									"[user.name] inserted \the [K.name]'s sheets in \the [name].",
									"You inserted \the [K.name] in  (in amount: [sheets_amount_to_transphere]) \the [name].\
									And after that you see how the counter on \the [name] is incremented by [sheets_amount_to_transphere]."
									)
				ping()
			else
				to_chat(user, SPAN_WARNING("You can't insert [sheets_amount_to_transphere] in [name]"))
			return

/obj/machinery/sewing_artificer
	name = "sewing artificer"
	desc = "A complex system of weavers and manuplation of fibers to replacate cloth into silk."
	icon = 'icons/obj/machines/autolathe.dmi'
	icon_state = "sewing_artificer"
	density = TRUE
	anchored = TRUE
	layer = BELOW_OBJ_LAYER
	use_power = IDLE_POWER_USE
	idle_power_usage = 10
	active_power_usage = 2000
	circuit = null
	var/error = FALSE
	var/is_active = FALSE
	var/cloth_score = 0

/obj/machinery/sewing_artificer/examine(mob/user)
	..()
	to_chat(user, "<span class='info'>Levels of stored cloth: [cloth_score]</span>")
	if(error)
		to_chat(user, "<span class='info'>It is currently active, but stalling do to an error.</span>")
	if(!is_active)
		to_chat(user, "<span class='info'>Activation: Use a lighter or other fire-source</span>")
	else
		to_chat(user, "<span class='info'>Deactivation: Click with empty hand</span>")

/obj/machinery/sewing_artificer/attack_hand(mob/living/user as mob)
	if(is_active)
		to_chat(user, "<span class='angelsay'>You silently turn off the [name].</span>")
		error = FALSE
		is_active = FALSE
		update_icon()

/obj/machinery/sewing_artificer/update_icon()
	cut_overlays()

	icon_state = initial(icon_state)

	if(stat & NOPOWER)
		icon_state = "[initial(icon_state)]"

	if(is_active) // if paused, work animation looks awkward.
		if(error)
			icon_state = "[icon_state]"
		else
			icon_state = "[icon_state]_on"

/obj/machinery/sewing_artificer/attackby(obj/item/I, mob/user as mob)
	if(is_active)
		to_chat(user, "<span class='angelsay'>The [name] is on and cant be manipulated untill turned off.</span>")
		return

	if(isflamesource(I))
		turn_on(user)
		error = FALSE
		return

	if (istype(I, /obj/item/stack/material/cloth))
		var/obj/item/stack/material/cloth/C = I
		if (C.amount)
			var/sheets_amount_to_transphere = input(user, "How many sheets you want to load?", "Cloth loading", 1) as num
			if (sheets_amount_to_transphere > C.amount || sheets_amount_to_transphere < 1) //No cheating!
				to_chat(user, SPAN_WARNING("You don't have that many [C.name]"))
				return
			if(sheets_amount_to_transphere)
				C.use(sheets_amount_to_transphere)
				cloth_score += sheets_amount_to_transphere
				user.visible_message(
									"[user.name] inserted \the [C.name]'s sheets in \the [name].",
									"You inserted \the [C.name] in  (in amount: [sheets_amount_to_transphere]) \the [name].\
									And after that you see how the counter on \the [name] is incremented by [sheets_amount_to_transphere]."
									)
				ping()
			else
				to_chat(user, SPAN_WARNING("You can't insert [sheets_amount_to_transphere] in [name]"))
			return

/obj/machinery/sewing_artificer/proc/turn_on(mob/living/user as mob)
	if(is_active)
		return

	to_chat(user, "<span class='angelsay'>You silently turn on the [name].</span>")
	is_active = TRUE
	start_loop_for_materals()
	update_icon()

/obj/machinery/sewing_artificer/proc/start_loop_for_materals()
	if(!is_active)
		return
	if(!can_print_sheet())
		return

	if(is_active)
		var/obj/item/stack/material/silk/current_stack
		//if there any stacks here, let's check them
		if(locate(/obj/item/stack/material/silk) in loc)
			for(var/obj/item/stack/material/silk/stack_on_my_loc in loc)
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


	addtimer(CALLBACK(src, .proc/start_loop_for_materals), 1 SECOND, TIMER_STOPPABLE)


/obj/machinery/sewing_artificer/proc/can_print_sheet()
	if(cloth_score >= 2)
		cloth_score -= 2
		return TRUE

	error = TRUE
	update_icon()

	return FALSE

/obj/machinery/composite_artificer
	name = "Composite Artificer"
	desc = "A massive shreader that turns almost all cloathing into base cloths. This prescoess also requires high amount of heat to help remove dyes, glues, and other products from cloathing."
	icon = 'icons/obj/machines/autolathe.dmi'
	icon_state = "composite_artificer"
	density = TRUE
	anchored = TRUE
	layer = BELOW_OBJ_LAYER
	use_power = IDLE_POWER_USE
	idle_power_usage = 10
	active_power_usage = 2000
	circuit = null
	var/error = FALSE
	var/is_active = FALSE
	var/cloth_score = 0

/obj/machinery/composite_artificer/examine(mob/user)
	..()
	to_chat(user, "<span class='info'>Levels of stored cloth: [cloth_score]</span>")
	if(error)
		to_chat(user, "<span class='info'>It is currently active, but stalling do to an error.</span>")
	if(!is_active)
		to_chat(user, "<span class='info'>Activation: Use a lighter or other fire-source</span>")
	else
		to_chat(user, "<span class='info'>Deactivation: Click with empty hand</span>")

/obj/machinery/composite_artificer/attack_hand(mob/living/user as mob)
	if(is_active)
		to_chat(user, "<span class='angelsay'>You silently turn off the [name].</span>")
		error = FALSE
		is_active = FALSE
		update_icon()

/obj/machinery/composite_artificer/update_icon()
	cut_overlays()

	icon_state = initial(icon_state)

	if(stat & NOPOWER)
		icon_state = "[initial(icon_state)]"

	if(is_active) // if paused, work animation looks awkward.
		if(error)
			icon_state = "[icon_state]"
		else
			icon_state = "[icon_state]_on"

/obj/machinery/composite_artificer/attackby(obj/item/I, mob/user as mob)
	if(is_active)
		to_chat(user, "<span class='angelsay'>The [name] is on and cant be manipulated untill turned off.</span>")
		return

	if(isflamesource(I))
		turn_on(user)
		error = FALSE
		return

	if (istype(I, /obj/item/clothing))
		var/obj/item/clothing/C = I
		var/cloth_in_clothing = 0
		if(!C.matter)
			to_chat(user, SPAN_WARNING("You can't insert [C] in [name], do to it having no useable matter!"))
			return
		var/matter_in_clothing = C.get_matter()
		for (var/a in matter_in_clothing)
			if(a == MATERIAL_BIOMATTER || a == MATERIAL_CLOTH || a == MATERIAL_SILK)
				cloth_in_clothing = C.matter[a]
				user.visible_message(
									"[user.name] inserted \the [C.name] in \the [name].",
									"You inserted \the [C.name] in  (in amount: [cloth_in_clothing]) \the [name].\
									And after that you see how the counter on \the [name] is incremented by [cloth_in_clothing]."
									)
				ping()
				cloth_score += cloth_in_clothing
				user.drop_from_inventory(C)
				qdel(C)
			else
				to_chat(user, SPAN_WARNING("You can't insert [C] in [name], as it has no useable cloth"))
			return

/obj/machinery/composite_artificer/proc/turn_on(mob/living/user as mob)
	if(is_active)
		return

	to_chat(user, "<span class='angelsay'>You silently turn on the [name].</span>")
	is_active = TRUE
	start_loop_for_materals()
	update_icon()

/obj/machinery/composite_artificer/proc/start_loop_for_materals()
	if(!is_active)
		return
	if(!can_print_sheet())
		return

	if(is_active)
		var/obj/item/stack/material/cloth/current_stack
		//if there any stacks here, let's check them
		if(locate(/obj/item/stack/material/cloth) in loc)
			for(var/obj/item/stack/material/cloth/stack_on_my_loc in loc)
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


	addtimer(CALLBACK(src, .proc/start_loop_for_materals), 1 SECOND, TIMER_STOPPABLE)


/obj/machinery/composite_artificer/proc/can_print_sheet()
	if(cloth_score >= 1)
		cloth_score -= 1
		return TRUE

	error = TRUE
	update_icon()

	return FALSE
*/
