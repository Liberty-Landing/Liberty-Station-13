#define CLONING_START 	2	//Percent of total progress
#define CLONING_BONES	35
#define CLONING_MEAT 	70
#define CLONING_BODY 	90
#define CLONING_DONE	100

#define ANIM_OPEN 1
#define ANIM_NONE 0
#define ANIM_CLOSE -1

/obj/machinery/capsa/cloner
	name = "CASPA cloning pod"
	desc = "A highly revulationy design in both robotics and medical fields at the same time, allowing a crewmember to be cloned."
	icon = 'icons/obj/cloning_pod.dmi'
	icon_state = "preview"
	density = TRUE
	anchored = TRUE
	layer = 2.8
	var/obj/machinery/capsa/reader/reader
	var/reader_loc

	var/obj/machinery/capsa/biomass_container/container
	var/container_loc

	var/mob/living/carbon/human/occupant
	var/cloning = FALSE
	var/closed = FALSE

	var/progress = 0

	var/cloning_speed  = 1	//Try to avoid use of non integer values

	var/biomass_consumption = 2

	var/image/anim0 = null
	var/image/anim1 = null

	var/power_cost = 250

	var/clone_damage = 0

/obj/machinery/capsa/cloner/New()
	..()
	icon = 'icons/obj/capsa_machinery.dmi'
	update_icon()

/obj/machinery/capsa/cloner/Destroy()
	if(occupant)
		qdel(occupant)
	return ..()

/obj/machinery/capsa/cloner/attack_hand(mob/user)
	src.add_fingerprint(user)
	reader = find_reader()
	if(!reader)
		visible_message("[src]'s control panel flashes \"NO READER\" light.")
		return
	if(!reader.implant)
		visible_message("[src]'s control panel flashes \"NO IMPLANT\" light.")
		return
	if(cloning)
		visible_message("[src]'s control panel flashes \"OCCUPIED\" light.")
		return
	start()

/obj/machinery/capsa/cloner/proc/find_container()
	for(var/obj/machinery/capsa/biomass_container/BC in orange(1,src))
		return BC
	return null


/obj/machinery/capsa/cloner/proc/find_reader()
	for(var/obj/machinery/capsa/reader/CR in orange(1,src))
		return CR
	return null


/obj/machinery/capsa/cloner/proc/close_anim()
	qdel(anim0)
	anim0 = image(icon, "pod_closing0")
	anim0.layer = 5.01

	qdel(anim1)
	anim1 = image(icon, "pod_closing1")
	anim1.layer = 5.01
	anim1.pixel_z = 32

	update_icon()
	spawn(20)
		qdel(anim0)
		qdel(anim1)
		anim0 = null
		anim1 = null
		update_icon()

	return TRUE

/obj/machinery/capsa/cloner/proc/open_anim()
	qdel(anim0)
	anim0 = image(icon, "pod_opening0")
	anim0.layer = 5.01

	qdel(anim1)
	anim1 = image(icon, "pod_opening1")
	anim1.layer = 5.01
	anim1.pixel_z = 32

	update_icon()
	spawn(20)
		qdel(anim0)
		qdel(anim1)
		anim0 = null
		anim1 = null
		update_icon()

	return TRUE


/obj/machinery/capsa/cloner/proc/eject_contents()
	if(occupant)
		occupant.forceMove(loc)
		occupant = null
	else
		if(progress >= CLONING_MEAT)
			new /obj/item/reagent_containers/food/snacks/meat(loc)

	update_icon()

/obj/machinery/capsa/cloner/proc/start()
	if(cloning)
		return

	reader = find_reader()
	if(!reader)
		return

	reader_loc = reader.loc

	container = find_container()
	if(!container)
		return

	reader.reading = TRUE
	reader.update_icon()

	container_loc = container.loc

	progress = 0

	cloning = TRUE

	occupant = null

	closed = TRUE

	close_anim()

	update_icon()
	return TRUE

/obj/machinery/capsa/cloner/proc/stop()
	if(!cloning)
		return

	cloning = FALSE
	closed = FALSE
	if(reader)
		reader.reading = FALSE
		reader.update_icon()

	eject_contents()
	update_icon()
	return TRUE

/obj/machinery/capsa/cloner/proc/done()
	occupant.setCloneLoss(clone_damage)
	occupant.setBrainLoss(0)
	occupant.updatehealth()
	stop()

///////////////

/obj/machinery/capsa/cloner/Process()
	if(stat & NOPOWER)
		return

	if(cloning)
		if(!reader || reader.loc != reader_loc || !reader.implant || !container || container.loc != container_loc)
			open_anim()
			stop()
			update_icon()
			return

		progress += cloning_speed

		if(progress <= CLONING_DONE)
			if(container)
				if(!container.reagents.remove_reagent("biomatter", biomass_consumption))
					stop()
			else
				stop()

		if(occupant && ishuman(occupant))
			occupant.adjustOxyLoss(-4)
			occupant.Paralyse(4)

			occupant.updatehealth()


		if(progress >= CLONING_MEAT && !occupant)
			var/obj/item/implant/conback/R = reader.implant
			if(!R)
				open_anim()
				stop()
				update_icon()
				return

			occupant = spawn_character()
			occupant.forceMove(src)

		if(progress == CLONING_BODY*cloning_speed )
			var/datum/effect/effect/system/spark_spread/s = new
			s.set_up(3, 1, src)
			s.start()

		if(progress == CLONING_DONE*cloning_speed )
			open_anim()
			closed = FALSE

		if(progress >= CLONING_DONE*cloning_speed  + 2)
			done()

		update_icon()

	use_power(power_cost)


/obj/machinery/capsa/cloner/update_icon()
	icon_state = "pod_base0"

	cut_overlays()

	if(panel_open)
		var/image/P = image(icon, "pod_panel")
		add_overlay(P)

	var/image/I = image(icon, "pod_base1")
	I.layer = 5
	I.pixel_z = 32
	add_overlay(I)

	if(closed)
		I = image(icon, "pod_under")
		I.layer = 5
		add_overlay(I)

		I = image(icon, "pod_top_on")
		I.layer = 5.021
		I.pixel_z = 32
		add_overlay(I)


	/////////BODY
	var/P = progress
	if(cloning && P >= CLONING_START)
		var/icon/IC = icon(icon, "clone_bones")
		var/crop = 32-min(32,round(((P-CLONING_START)/(CLONING_BONES-CLONING_START))*32))
		IC.Crop(1,crop,IC.Width(),IC.Height())

		I = image(IC)
		I.layer = 5
		I.pixel_z = 11 + crop

		add_overlay(I)

		if(P >= CLONING_BONES)
			I = image(icon, "clone_meat")
			I.alpha = min(255,round(((P-CLONING_BONES)/(CLONING_MEAT-CLONING_BONES))*255))
			I.layer = 5
			I.pixel_z = 11
			add_overlay(I)

			if(P >= CLONING_MEAT && occupant)
				I = image(occupant.icon, occupant.icon_state)
				I.alpha = min(255,round(((P-CLONING_MEAT)/(CLONING_BODY-CLONING_MEAT))*255))
				I.copy_overlays(occupant.get_overlays(), TRUE)
				I.layer = 5
				I.pixel_z = 11
				add_overlay(I)

	//////////////

	if(closed)
		if(!anim0 && !anim1)
			I = image(icon, "pod_glass0")
			I.layer = 5.01
			add_overlay(I)

			I = image(icon, "pod_glass1")
			I.layer = 5.01
			I.pixel_z = 32
			add_overlay(I)

			I = image(icon, "pod_liquid0")
			I.layer = 5.01
			add_overlay(I)

			I = image(icon, "pod_liquid1")
			I.layer = 5.01
			I.pixel_z = 32
			add_overlay(I)

	if(anim0 && anim1)
		add_overlay(anim0)
		add_overlay(anim1)

	I = image(icon, "pod_top0")

	if(!cloning)
		I.layer = layer
	else
		I.layer = 5.02

	add_overlay(I)

	I = image(icon, "pod_top1")
	I.layer = 5.02
	I.pixel_z = 32
	add_overlay(I)


/////////////////////

/////////////////////
//BIOMASS CONTAINER
/////////////////////

/obj/machinery/capsa/biomass_container
	name = "Advanced biomass container"
	desc = "A large container holding biomass as well as materals."
	icon_state = "biocan"
	density = TRUE
	anchored = TRUE

	var/biomass_capacity = 600


/obj/machinery/capsa/biomass_container/New()
	..()
	create_reagents(biomass_capacity)
	if(SSticker.current_state != GAME_STATE_PLAYING)
		reagents.add_reagent("biomatter", 300)

/obj/machinery/capsa/biomass_container/examine(mob/user)
	if(!..(user, 2))
		return

	if(!reagents.has_reagent("biomatter"))
		to_chat(user, SPAN_NOTICE("It is empty."))
	else
		to_chat(user, SPAN_NOTICE("Filled to [reagents.total_volume]/[biomass_capacity]."))

/obj/machinery/capsa/biomass_container/attackby(obj/item/I, mob/user as mob)
	if (istype(I, /obj/item/stack))
		var/obj/item/stack/B = I
		if (B.biomatter_in_sheet && B.amount)
			var/sheets_amount_to_transphere = input(user, "How many sheets you want to load?", "Biomatter melting", 1) as num
			if(sheets_amount_to_transphere > B.amount || sheets_amount_to_transphere < 1) //No cheating!
				to_chat(user, SPAN_WARNING("You don't have that many [B.name]"))
				return
			if(sheets_amount_to_transphere)
				B.use(sheets_amount_to_transphere)
				reagents.add_reagent("biomatter", (B.biomatter_in_sheet * sheets_amount_to_transphere))
				user.visible_message(
									"[user.name] inserted \the [B.name]'s sheets in \the [name].",
									"You inserted \the [B.name] in  (in amount: [sheets_amount_to_transphere]) \the [name].\
									And after that you see how the counter on \the [name] is incremented by [sheets_amount_to_transphere]."
									)
				ping()
		else
			to_chat(user, SPAN_WARNING("\The [B.name] is exhausted and can't be melted to biomatter. "))

	if(istype(I, /obj/item/reagent_containers) && I.is_open_container())
		var/obj/item/reagent_containers/container = I
		if(container.reagents.get_reagent_amount("biomatter") == container.reagents.total_volume)
			container.reagents.trans_to_holder(reagents, container.amount_per_transfer_from_this)
			to_chat(user, SPAN_NOTICE("You transfer some of biomatter from \the [container] to \the [name]."))
		else
			to_chat(user, SPAN_NOTICE("You need clear biomatter to fill \the [name]."))


/obj/machinery/capsa/biomass_container/update_icon()
	cut_overlays()

	if(panel_open)
		var/image/P = image(icon, "biocan_panel")
		P.dir = dir
		add_overlay(P)

/////////////////////

/////////////////////
//CONSCIOUSNESS BACKUP IMPLANT READER
/////////////////////

/obj/machinery/capsa/reader
	name = "Conciousness Implant Reader"
	desc = "A strangely advanced machine that scans the user for any signs of existing conciousness through magnetic resonance imaging. \
			Used to check if a user's conciousness backup implant has remained intact, allowing the transfer of conciousness to a new body."
	icon_state = "reader_off"
	density = TRUE
	anchored = TRUE

	var/obj/item/implant/conback/implant
	var/reading = FALSE


/obj/machinery/capsa/reader/attackby(obj/item/I, mob/user as mob)
	if(default_deconstruction(I, user))
		return
	if(default_part_replacement(I, user))
		return

	if(istype(I, /obj/item/implant/conback))
		var/obj/item/implant/conback/C = I
		user.drop_item()
		C.forceMove(src)
		implant = C
		visible_message("[I] slides smoothly into the slot.")

	src.add_fingerprint(user)
	update_icon()

/obj/machinery/capsa/reader/attack_hand(mob/user as mob)
	if(!implant)
		return

	if(reading)
		to_chat(user, SPAN_WARNING("You try to pull the [implant], but it does not move."))
		return

	user.put_in_active_hand(implant)
	implant = null

	src.add_fingerprint(user)
	update_icon()

/obj/machinery/capsa/reader/on_deconstruction()
	if(implant)
		implant.forceMove(loc)
		implant = null
	return ..()

/obj/machinery/capsa/reader/update_icon()
	cut_overlays()

	if(panel_open)
		var/image/P = image(icon, "reader_panel")
		add_overlay(P)


	icon_state = "reader_off"

	if(reading)
		icon_state = "reader_on"

	if(implant)
		var/image/I = image(icon, "reader_c_green")
		add_overlay(I)


/////////////////////

/obj/machinery/capsa
	icon = 'icons/obj/capsa_machinery.dmi'

#undef ANIM_OPEN
#undef ANIM_NONE
#undef ANIM_CLOSE

/obj/machinery/capsa/cloner/proc/spawn_character()
	var/mob/living/carbon/human/new_character
	new_character = new(src.loc)

	if(!reader.implant)
		visible_message("[src]'s control panel flashes \"NO IMPLANT\" light.")
		return new_character


	var/obj/item/implant/conback/R = reader.implant
	var/client/player_key = R.host_ckey


	if(!R.host_ckey)
		return new_character

	if(!player_key)
		return new_character

	player_key.prefs.copy_to(new_character)
	if(new_character.dna)
		new_character.dna.ResetUIFrom(new_character)
		new_character.sync_organ_dna()


		//A redraw for good measure
		new_character.update_icons()

	return new_character


