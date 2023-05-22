//Reworked version of deepmaints generation file thats feed into the JP generator to make dungeons.
//Meant to be able to be run over again to generate additional dungeons.

var/global/list/precursor_normal_room_templates = list()
var/global/list/precursor_end_room_templates = list()
var/global/list/precursor_large_room_templates = list()
var/global/list/starter_precursor_room_templates = list()
var/precursor_test = FALSE

/proc/populatePrecursorMapLists()
	if(starter_precursor_room_templates.len || precursor_normal_room_templates.len || precursor_end_room_templates.len || precursor_large_room_templates.len)
		return
	for(var/item in subtypesof(/datum/map_template/precursor_template/normal))
		var/datum/map_template/precursor_template/submap = item
		var/datum/map_template/precursor_template/S = new submap()
		precursor_normal_room_templates += S

	for(var/item in subtypesof(/datum/map_template/precursor_template/starter))
		var/datum/map_template/precursor_template/submap = item
		var/datum/map_template/precursor_template/S = new submap()
		starter_precursor_room_templates += S

	for(var/item in subtypesof(/datum/map_template/precursor_template/large))
		var/datum/map_template/precursor_template/submap = item
		var/datum/map_template/precursor_template/S = new submap()
		precursor_large_room_templates += S

	for(var/item in subtypesof(/datum/map_template/precursor_template/end))
		var/datum/map_template/precursor_template/submap = item
		var/datum/map_template/precursor_template/S = new submap()
		precursor_end_room_templates += S

/obj/procedural/jp_DungeonRoom/preexist/square/submap/precursor/normal
	name = "precursor room"

/obj/procedural/jp_DungeonRoom/preexist/square/submap/precursor/normal/New()
	..()
	my_map = pick(precursor_normal_room_templates)

/obj/procedural/jp_DungeonRoom/preexist/square/submap/precursor/large
	name = "large precursor room"

/obj/procedural/jp_DungeonRoom/preexist/square/submap/precursor/large/New()
	..()
	my_map = pick(precursor_large_room_templates)

/obj/procedural/jp_DungeonRoom/preexist/square/submap/precursor/end
	name = "precursor end room"

/obj/procedural/jp_DungeonRoom/preexist/square/submap/precursor/end/New()
	..()
	my_map = pick(precursor_end_room_templates)

/obj/procedural/jp_DungeonRoom/preexist/square/submap/precursor/starter
	name = "precursor starter room"

/obj/procedural/jp_DungeonRoom/preexist/square/submap/precursor/starter/New()
	..()
	my_map = pick(starter_precursor_room_templates)


/obj/procedural/jp_DungeonGenerator/precursor/proc/beam_me_up_trilby() //finds and assigns the starter room jump pad.
	var/obj/procedural/jp_DungeonRoom/picked_room = pick(out_rooms)
	for(var/obj/machinery/artifact_scanpad/precursor/padmay in range (roomMinSize, picked_room.centre))
		if (get_turf(padmay)) //anti wacky check
			starter_portal_turf = get_turf(padmay)
			padmay.starter_room = TRUE
			if(precursor_test)
				message_admins("/blue Starter room portal pad found.")
	if (starter_portal_turf == null)
		if(precursor_test)
			message_admins("\blue Failed to find a suitable jump pad for precursor starting room.")
		return


/obj/procedural/jp_DungeonGenerator/precursor/proc/open_up_inside()
	//link to the scanpads by the precursor dungeon generator, create portals if they arn't made.
	if(!prep_portal)
		for(var/obj/machinery/artifact_scanpad/precursor/anikan in world)
			if (starter_portal_turf && !anikan.starter_room)
				prep_portal = new /obj/effect/portal/jtb/precursor(get_turf(anikan))
				if(precursor_test)
					message_admins("\blue Created new prep room portal.")
		if(precursor_test && !prep_portal)
			message_admins("\blue Failed to find suitable precursor warp pad for prep portal.")

	if (!starter_portal && starter_portal_turf)
		starter_portal = new /obj/effect/portal/jtb/precursor(starter_portal_turf)

	//link the portals and set their names.
	if(prep_portal && starter_portal)
		prep_portal.set_target(get_turf(starter_portal))
		starter_portal.set_target(get_turf(prep_portal))

/obj/procedural/jp_DungeonGenerator/precursor/proc/unlink()
	//qdel and disconnect various things to prep for reset
	qdel(prep_portal)
	qdel(starter_portal)
	qdel(starter_portal_turf)

/obj/procedural/jp_DungeonGenerator/precursor
	name = "Precursor Procedural Generator"
	regen_specific = TRUE
	regen_light = /obj/machinery/light/small/autoattach
	var/obj/effect/portal/jtb/precursor/prep_portal
	var/obj/effect/portal/jtb/precursor/starter_portal
	var/turf/starter_portal_turf = null

/obj/machinery/artifact_scanpad/precursor
	name = "precursor jump pad"
	desc = "A pad warped in thru bluespace to ensure a more stable portal."
	var/starter_room = FALSE

/obj/machinery/precursor_dungeon_device
	name = "precursor systems device"
	desc = "A advanced machine capable of finding ruins by vibrations in the ice sheets."
	icon = 'icons/obj/virology.dmi'
	icon_state = "isolator"

	var/uses = 1
	var/obj/procedural/dungenerator/precursor/precursor_controller = null
	var/last_use = 0
	var/generated = FALSE

/obj/machinery/precursor_dungeon_device/New()
	 last_use = world.time

	//attackhand (person using it) checks for uses and if we are currently generating or resetting before generating a new dungeon. consumes uses.
/obj/machinery/precursor_dungeon_device/attack_hand(mob/user)
	//need a check sense last time the device was used so people can't lag us thru checks by spam clicking it.
	if(!precursor_controller)
		if(precursor_test)
			message_admins("\blue new precursor generator created.")
		precursor_controller = new /obj/procedural/dungenerator/precursor(src.loc)
	if(world.time < last_use + 5)
		to_chat(user, SPAN_NOTICE("The [src] is resetting its interface."))
		return
	last_use = world.time
	if(precursor_controller.resetting || precursor_controller.generating)
		to_chat(user, SPAN_NOTICE("The [src] is still locating ruins!"))
		return
	if(!generated && uses > 0)
		to_chat(user, SPAN_NOTICE("The machine starts to search for a new set of ruins in the ice."))
		uses -= 1
		precursor_controller.make_me_dungeon()
		generated = TRUE
		return
	if(generated)
		for(var/mob/M in GLOB.player_list)
			if(M.lastarea == /area/precursor)
				to_chat(user, SPAN_NOTICE("You can't end the expidition right now, Someone is still out there!"))
				return
		to_chat(user, SPAN_NOTICE("The machine disconnects its links."))
		precursor_controller.Pgenerate.unlink()
		precursor_controller.reset()

/obj/machinery/precursor_dungeon_device/attackby(obj/item/I, mob/user)
	if(istype(I,/obj/item/device/psionic_catalyst/dull))
		if(uses > 0)
			to_chat(user, SPAN_NOTICE("The machine is already loaded and ready to go."))
			return
		else
			to_chat(user, SPAN_NOTICE("You load the device into the [src]."))
			uses += 1
			return

/obj/effect/portal/jtb/precursor
	name = "ancient portal"
	desc = "A portal to somewhere ancient."

/obj/procedural/dungenerator/precursor
	name = "Precursor Gen"
	var/resetting = FALSE
	var/generating = FALSE
	var/generated = FALSE
	var/obj/procedural/jp_DungeonGenerator/precursor/Pgenerate = null

/obj/procedural/dungenerator/precursor/proc/make_me_dungeon()
	set background = 1
	spawn()
		//testing_variable(start, REALTIMEOFDAY)
		if(!Pgenerate)
			Pgenerate = new /obj/procedural/jp_DungeonGenerator/precursor(src)
		if(precursor_test)
			message_admins("\blue precursor starter room generating now.")
		Pgenerate.name = name
		Pgenerate.setArea(locate(145, 27, z), locate(171, 45, z)) //bottom right corner
		Pgenerate.setWallType(/turf/simulated/wall/ice)
		Pgenerate.setFloorType(/turf/simulated/floor/rock/manmade/ruin2)
		Pgenerate.setAllowedRooms(list(/obj/procedural/jp_DungeonRoom/preexist/square/submap/precursor/starter))
		Pgenerate.setNumRooms(1) //creates the single starter room they enter other rooms from.
		Pgenerate.setRoomMinSize(5)
		Pgenerate.setRoomMaxSize(5)
		Pgenerate.setExtraPaths(1)
		Pgenerate.setMinPathLength(1)
		Pgenerate.setMaxPathLength(1)
		Pgenerate.setMinLongPathLength(1)
		Pgenerate.setLongPathChance(1)
		Pgenerate.setPathEndChance(80)
		Pgenerate.setPathWidth(1)
		Pgenerate.setDoAccurateRoomPlacementCheck(TRUE)
		Pgenerate.generate()
		Pgenerate.beam_me_up_trilby()

		sleep(90)

		if(precursor_test)
			message_admins("\blue precursor end room generating now.")
		Pgenerate.setArea(locate(05, 140, z), locate(30, 170, z)) //upper left for the final room. 21 by 21 space for it. just short of the impassible.
		Pgenerate.setAllowedRooms(list(/obj/procedural/jp_DungeonRoom/preexist/square/submap/precursor/end))
		Pgenerate.setNumRooms(1) // just the one
		Pgenerate.setRoomMinSize(10)
		Pgenerate.setRoomMaxSize(10)
		Pgenerate.setExtraPaths(0)
		Pgenerate.setMinPathLength(0)
		Pgenerate.setMaxPathLength(0)
		Pgenerate.setMinLongPathLength(0)
		Pgenerate.setLongPathChance(0)
		Pgenerate.setPathEndChance(0)
		Pgenerate.setPathWidth(0)
		Pgenerate.setUsePreexistingRegions(TRUE)
		Pgenerate.setDoAccurateRoomPlacementCheck(TRUE)
		Pgenerate.generate()

		sleep(90)

		if(precursor_test)
			message_admins("\blue precursor large rooms generating now.")
		Pgenerate.setArea(locate(05, 27, z), locate(140, 171, z)) //actual dungeon area but not near the east wall (stops connection to the starter room)
		Pgenerate.setAllowedRooms(list(/obj/procedural/jp_DungeonRoom/preexist/square/submap/precursor/large))
		Pgenerate.setNumRooms(6) // 6 main rooms that we don't duplicate.
		Pgenerate.setRoomMinSize(10)
		Pgenerate.setRoomMaxSize(10)
		Pgenerate.setExtraPaths(0)
		Pgenerate.setMinPathLength(0)
		Pgenerate.setMaxPathLength(0)
		Pgenerate.setMinLongPathLength(0)
		Pgenerate.setLongPathChance(0)
		Pgenerate.setPathEndChance(0)
		Pgenerate.setPathWidth(0)
		Pgenerate.setUsePreexistingRegions(TRUE)
		Pgenerate.setDoAccurateRoomPlacementCheck(TRUE)
		Pgenerate.generate()

		sleep(90)

		if(precursor_test)
			message_admins("\blue precursor small rooms generating now.")
		Pgenerate.setArea(locate(05, 27, z), locate(171, 171, z)) //actual dungeon area.
		Pgenerate.setAllowedRooms(list(/obj/procedural/jp_DungeonRoom/preexist/square/submap/precursor/normal))
		Pgenerate.setNumRooms(30) // whole buncha rooms!
		Pgenerate.setRoomMinSize(5)
		Pgenerate.setRoomMaxSize(5)
		Pgenerate.setExtraPaths(3)
		Pgenerate.setMinPathLength(1)
		Pgenerate.setMaxPathLength(65)
		Pgenerate.setMinLongPathLength(1)
		Pgenerate.setLongPathChance(10)
		Pgenerate.setPathEndChance(80)
		Pgenerate.setPathWidth(2)
		Pgenerate.setUsePreexistingRegions(TRUE)
		Pgenerate.setDoAccurateRoomPlacementCheck(TRUE)
		Pgenerate.generate()
		if(precursor_test)
			message_admins("\blue precursor portal creation and linking starting now.")
		Pgenerate.open_up_inside() //done last so we don't open a portal in a still generating dungeon.
		if(precursor_test)
			message_admins("\blue Precursor generation finished.")


/obj/procedural/dungenerator/precursor/proc/reset() //replaces the dungeon with ice walls.
	set background = 1
	var/datum/map_template/frozone = new /datum/map_template/precursor_icewall_reset //set frozone to the mapclear we need. Its 8x7.
	var/turf/targetspot = locate(4, 26, src.z)
	var/verticalstepcounter = 0 //so we can do the 7 iterations it takes each time before stepping right and doing it again.
	var/horizontalstepcounter = 0 //so we can do the 7 other step cycles

	if(precursor_test)
		message_admins("\blue precursor dungeon is resetting into ice walls now.")
	resetting = TRUE
	while(horizontalstepcounter < 7 || targetspot.x < 172)
		while(verticalstepcounter < 7 || targetspot.y < 172)
			spawn()
			frozone.load(targetspot, centered = FALSE, orientation = NORTH, post_init = 1)
			targetspot = locate(targetspot.x, targetspot.y + 7, targetspot.z)
			verticalstepcounter += 1
			//message_admins("\red reset proc built ice walls at [targetspot.x], [targetspot.y], [targetspot.z].", 1)
			sleep(10) //if it shoots thru too fast it dosn't generate them all. Pain.
		targetspot = locate(targetspot.x + 8, 26, targetspot.z)
		horizontalstepcounter += 1
	if(precursor_test)
		message_admins("\blue Precursor reset proc has finished regenerating the ice walls.")
	resetting = FALSE


/obj/procedural/dungenerator/precursor/New() //just a object placed on the map to generate it the first time.
	while(1) //the most horrifying loop type MAKE SURE THERE IS A FUCKING BREAK SOMEWHERE BELOW OR ELSE IT WONT STOP.
		if(Master.current_runlevel)
			populatePrecursorMapLists() //It's not a hook because mapping subsystem has to intialize first
			break
		else
			sleep(150)
