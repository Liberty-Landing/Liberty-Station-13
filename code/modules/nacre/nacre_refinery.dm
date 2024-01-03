// This machine turn nacre crystals into liquid nacre and put it in a bidon connected to it.
/obj/machinery/nacre_refinery
	name = "nacre refinery"
	desc = "Refine raw nacre crystals into liquid nacre for further processing."
	icon = 'icons/obj/machines/nacre_refinery.dmi'
	icon_state = "refinery_base"
	density = TRUE
	anchored = TRUE
	layer = ABOVE_ALL_MOB_LAYER
	use_power = IDLE_POWER_USE
	anchor_type = /obj/structure/reagent_dispensers/bidon
	anchor_direction = WEST
	circuit = /obj/item/circuitboard/nacre_refinery
	frame_type = FRAME_VERTICAL
	var/obj/structure/reagent_dispensers/bidon/Container
	var/crystal_worth = 8 // How much liquid nacre is each solid crystal worth.

/obj/machinery/nacre_refinery/New()
	..()
	create_reagents(6000)
	update_icon()

/obj/machinery/nacre_refinery/update_icon()
	cut_overlays()
	overlays += "liquid_overlay"
	overlays += "refinery_top"
	overlays += "glass_overlay"

/obj/machinery/nacre_refinery/examine(mob/user)
	..()
	if(isghost(user))
		interact(user)

/obj/machinery/nacre_refinery/attackby(obj/item/I, mob/user)

	if(default_deconstruction(I, user))
		return

	if(default_part_replacement(I, user))
		return

	if(istype(I, /obj/item/stack/material/nacre))
		insert_item(I, user)

	updateDialog()

/obj/machinery/nacre_refinery/on_deconstruction()
	var/obj/structure/reagent_dispensers/bidon/Bidon = locate() in component_parts
	if(Bidon && reagents.total_volume)
		reagents.trans_to_holder(Bidon.reagents, reagents.total_volume)
		Bidon.update_icon()
	remove_crystals(get_solid_nacre()) // Eject all the crystals left in the refinery

/obj/machinery/nacre_refinery/RefreshParts()
	var/obj/structure/reagent_dispensers/bidon/Bidon = locate() in component_parts
	if(Bidon && Bidon.reagents.total_volume)
		Bidon.reagents.trans_to_holder(src.reagents, Bidon.reagents.total_volume)
		reagents.maximum_volume = Bidon.reagents.maximum_volume
		Bidon.update_icon()

	var/man_rating = 0
	for(var/obj/item/stock_parts/manipulator/M in component_parts)
		man_rating += M.rating

	crystal_worth = man_rating + 8

/obj/machinery/nacre_refinery/attack_hand(mob/user as mob)
	interact(user)
	return

// Those procs return the stuff inside the refinery and the bidon connected to it.
/obj/machinery/nacre_refinery/proc/get_solid_nacre()
	var/count = 0
	for(var/obj/item/stack/material/nacre/AC in contents)
		count += AC.amount
	return count

// Return the amount of liquid nacre we currently have
/obj/machinery/nacre_refinery/proc/get_liquid_nacre()
	return reagents.get_reagent_amount(MATERIAL_NACRE)

// Return the amount of nacre the bidon has.
/obj/machinery/nacre_refinery/proc/get_bidon_nacre()
	return Container?.reagents.get_reagent_amount(MATERIAL_NACRE)

// This proc turn solid nacre into its liquid counterpart.
/obj/machinery/nacre_refinery/proc/process_crystals()
	for(var/obj/item/stack/material/nacre/AC in contents)
		while(AC.amount >= 1)
			if(reagents.maximum_volume - reagents.total_volume < crystal_worth)
				return
			reagents.add_reagent(MATERIAL_NACRE, crystal_worth) // Create liquid nacre
			AC.use(1) // Use one crystal

// Transfer all of the liquid nacre that we can
/obj/machinery/nacre_refinery/proc/transfer_to_bidon()
	if(Container)
		var/free_space = Container.reagents.get_free_space()
		reagents.trans_to_holder(Container.reagents, free_space > reagents.total_volume ? reagents.total_volume : free_space)
		Container.update_icon()
	return

// This proc search for nearby anchored BIDONS
/obj/machinery/nacre_refinery/proc/search_bidons()
	for(var/obj/structure/reagent_dispensers/bidon/B in range(1, src))
		if(B.anchored_machine == src)
			Container = B
			return
	Container = null // This should only happen if there was no anchored BIDONs nearby

// Eject a given number of Nacre Shards.
/obj/machinery/nacre_refinery/proc/remove_crystals(var/amount = 0)
	if(amount < 1)
		return

	var/amount_to_eject = (amount > get_solid_nacre() ? get_solid_nacre() : amount)
	var/obj/item/stack/material/nacre/Current_Sheet = new(get_turf(src))
	var/use_extra_sheet = TRUE // We need to use an extra sheet to compensate for the one that come with the object we spawned
	while(amount_to_eject)
		if(Current_Sheet?.get_amount() >= Current_Sheet?.get_max_amount())
			Current_Sheet = null
		if(!Current_Sheet)
			Current_Sheet = new(get_turf(src))
			use_extra_sheet = TRUE
		for(var/obj/item/stack/material/nacre/AC in contents)
			if(use_extra_sheet)
				AC.use(1) // We're using and not transfering because the destination has one sheet extra
				amount_to_eject--
				use_extra_sheet = FALSE
				break

			AC.transfer_to(Current_Sheet, 1)
			amount_to_eject--
			break


/obj/machinery/nacre_refinery/interact(mob/user as mob)
	if((get_dist(src, user) > 1) || (stat & (BROKEN|NOPOWER)))
		if(!isAI(user) && !isghost(user))
			user.unset_machine()
			user << browse(null, "window=AMcontrol")
			return

	search_bidons()

	user.set_machine(src)

	var/dat = ""
	dat += "<head><title>Nacre Refinery</title></head>"
	dat += "Nacre Refinery<BR>"
	dat += "<A href='?src=\ref[src];close=1'>Close</A><BR>"
	dat += "<A href='?src=\ref[src];refresh=1'>Refresh</A><BR><BR>"
	dat += "Current quantity of solid nacre : [get_solid_nacre()].<BR>"
	if(get_solid_nacre())
		dat += "<A href='?src=\ref[src];process=1'>Process Crystals</A><BR>"
		dat += "<A href='?src=\ref[src];eject=1'>Eject Crystals</A><BR>"
	else
		dat += "<BR><BR>"
	dat += "Current quantity of liquid nacre : [get_liquid_nacre()]/[reagents.maximum_volume].<BR>"

	if(Container)
		if(get_liquid_nacre())
			dat += "<A href='?src=\ref[src];transfer=1'>Transfer to connected Bidon</A><BR>"
		else
			dat += "<BR>"
		dat += "Current Bidon Capacity : [Container.reagents.total_volume]/[Container.reagents.maximum_volume].<BR>"
	else
		dat += "No Bidon connected. Please connect a Bidon to start the transfer.<BR>"

	user << browse(dat, "window=NacreRefinery")
	onclose(user, "NacreRefinery")
	return

/obj/machinery/nacre_refinery/Topic(href, href_list)
	if(isghost(usr)) // Ghosts can't do shit
		return

	//Ignore input if we are broken or guy is not touching us, AI can control from a ways away
	if(stat & (BROKEN|NOPOWER) || (get_dist(src, usr) > 1 && !isAI(usr)))
		usr.unset_machine()
		usr << browse(null, "window=NacreRefinery")
		return

	..()

	if(href_list["close"])
		usr << browse(null, "window=NacreRefinery")
		usr.unset_machine()
		return

	if(href_list["process"])
		process_crystals()

	if(href_list["transfer"])
		transfer_to_bidon()

	if(href_list["eject"])
		remove_crystals(input(usr, "How many crystals do you want to remove?", "Remove crystals", 0) as null|num)

	updateDialog()
	return
