/obj/turbolift_map_obj/turbolift_map_base/liberty/ElevOne
	name = "Turbolift"
	lift_size_x = 3 // Size of the actual lift, shaft walls are extra.
	lift_size_y = 3
	icon = 'icons/modules/turbolift/turbolift_preview_3x3 - no walls.dmi'
	dir = WEST

	wall_type = null // Don't make walls
	createInnerDoors = 1

	turbolift_stops = list(
		/area/turbolift/ElevatorOne/underground,
		//area/turbolift/ElevatorOne/midlevelOne,
		/area/turbolift/ElevatorOne/midlevelTwo,
		//area/turbolift/ElevatorOne/midlevelThree,
		/area/turbolift/ElevatorOne/surface,
		)

/*
/obj/turbolift_map_obj/turbolift_map_base/Liberty/ElevTwo
	name = "Turbolift"
	lift_size_x = 3 // Size of the actual lift, shaft walls are extra.
	lift_size_y = 3
	icon = 'icons/modules/turbolift/turbolift_preview_3x3 - no walls.dmi'
	dir = WEST

	wall_type = null // Don't make walls
	createInnerDoors = 1

	turbolift_stops = list(
		/area/turbolift/ElevatorTwo/underground,
		/area/turbolift/ElevatorTwo/midlevelOne,
		/area/turbolift/ElevatorTwo/midlevelTwo,
		/area/turbolift/ElevatorTwo/midlevelThree,
		/area/turbolift/ElevatorTwo/surface,
		)
*/

//MINING ELEVATOR
/obj/turbolift_map_obj/turbolift_map_base/liberty/Mining
	name = "Turbolift"
	lift_size_x = 3 // Size of the actual lift, shaft walls are extra.
	lift_size_y = 3
	icon = 'icons/modules/turbolift/turbolift_preview_3x3 - no walls.dmi'
	dir = WEST

	wall_type = null // Don't make walls
	createInnerDoors = 1

	turbolift_stops = list(
		/area/turbolift/Mining/underground,
		//area/turbolift/Mining/midlevelOne,
		/area/turbolift/Mining/midlevelTwo,
		//area/turbolift/Mining/midlevelThree,
		/area/turbolift/Mining/colony,
		)


/area/turbolift/Mining/underground
	name = "Mining Lift - Mines"
	lift_floor_label = "Liberty Mining"
	lift_floor_name = "Mining"
	lift_announce_str = "Transition complete. Welcome to the deep mines. Please stay safe!"
	base_turf = /turf/simulated/shuttle/floor/mining

/area/turbolift/Mining/midlevelOne
	name = "Transition One"
	lift_announce_str = "Transition complete. Welcome to Base Level 1."
	base_turf = /turf/simulated/shuttle/floor/mining

/area/turbolift/Mining/midlevelTwo
	name = "Transition Two"
	lift_announce_str = "Transition complete. Welcome to Base Level 2."
	base_turf = /turf/simulated/shuttle/floor/mining

/area/turbolift/Mining/midlevelThree
	name = "Transition Three"
	lift_announce_str = "Transition complete. Welcome to Base Level 3."
	base_turf = /turf/simulated/shuttle/floor/mining

/area/turbolift/Mining/colony
	name = "Mining Lift - Colony Underground"
	lift_floor_label = "Liberty Colony"
	lift_floor_name = "Colony"
	lift_announce_str = "Transition complete. Welcome to the Liberty Colony Underground."
	base_turf = /turf/simulated/shuttle/floor/mining


//PROSPECTOR ELEVATOR
/obj/turbolift_map_obj/turbolift_map_base/liberty/prospector
	name = "Turbolift"
	lift_size_x = 3 // Size of the actual lift, shaft walls are extra.
	lift_size_y = 3
	icon = 'icons/modules/turbolift/turbolift_preview_3x3 - no walls.dmi'
	dir = WEST

	wall_type = null // Don't make walls
	createInnerDoors = 1

	turbolift_stops = list(
		/area/turbolift/prospector/underground,
		//area/turbolift/prospector/surlevelOne,
		/area/turbolift/prospector/surlevelTwo,
		//area/turbolift/prospector/surlevelThree,
		/area/turbolift/prospector/surface,
		)

/area/turbolift/prospector/surlevelOne
	name = "Transition One"
	lift_announce_str = "Transition complete. Welcome to Base Level 1."
	base_turf = /turf/simulated/shuttle/floor/mining

/area/turbolift/prospector/surlevelTwo
	name = "Transition Two"
	lift_announce_str = "Transition complete. Welcome to Base Level 2."
	base_turf = /turf/simulated/shuttle/floor/mining

/area/turbolift/prospector/surlevelThree
	name = "Transition Three"
	lift_announce_str = "Transition complete. Welcome to Base Level 3."
	base_turf = /turf/simulated/shuttle/floor/mining

/area/turbolift/prospector/underground
	name = "Skylight Underground Access"
	lift_floor_label = "Skylight Underground Access"
	lift_floor_name = "Prospector Prep"
	lift_announce_str = "Transition complete. Welcome to the Liberty Underground. Be mindful of all longarm firearm regulations."
	base_turf = /turf/simulated/shuttle/floor/mining

/area/turbolift/prospector/surface
	name = "Skylight Surface Access"
	lift_floor_label = "Skylight Surface Access"
	lift_floor_name = "Surface"
	lift_announce_str = "Transition complete. Welcome to the Liberty Surface. Be mindful of all longarm firearm regulations."
	base_turf = /turf/simulated/shuttle/floor/mining

//SOLARS ELEVATOR
/obj/turbolift_map_obj/turbolift_map_base/liberty/mountaintop
	name = "Turbolift"
	lift_size_x = 3 // Size of the actual lift, shaft walls are extra.
	lift_size_y = 3
	icon = 'icons/modules/turbolift/turbolift_preview_3x3 - no walls.dmi'
	dir = WEST

	wall_type = null // Don't make walls
	createInnerDoors = 1

	turbolift_stops = list(
		/area/turbolift/mountain/colony,
		//area/turbolift/mountain/transition1,
		/area/turbolift/mountain/transition2,
		//area/turbolift/mountain/transition3,
		/area/turbolift/mountain/solars
		)

/area/turbolift/mountain/transition1
	name = "Transition One"
	lift_announce_str = "Transition complete. Welcome to Base Level 1."
	base_turf = /turf/simulated/shuttle/floor/mining

/area/turbolift/mountain/transition2
	name = "Transition Two"
	lift_announce_str = "Transition complete. Welcome to Base Level 2."
	base_turf = /turf/simulated/shuttle/floor/mining

/area/turbolift/mountain/transition3
	name = "Transition Three"
	lift_announce_str = "Transition complete. Welcome to Base Level 3."
	base_turf = /turf/simulated/shuttle/floor/mining

/area/turbolift/mountain/colony
	name = "Union Solars Elevator - Colony"
	lift_floor_label = "Liberty Colony"
	lift_floor_name = "Engine Room"
	lift_announce_str = "Transition complete. Welcome to the Liberty Colony Underground."
	base_turf = /turf/simulated/shuttle/floor/mining

/area/turbolift/mountain/solars
	name = "Union Solars Elevator - Mountain Top"
	lift_floor_label = "Liberty Mountain Top"
	lift_floor_name = "Solars"
	lift_announce_str = "Transition complete. Welcome to the mountain top solars. Please stay safe!"
	base_turf = /turf/simulated/shuttle/floor/mining

//RESEARCH ELEVATOR
/obj/turbolift_map_obj/turbolift_map_base/liberty/Research
	name = "Turbolift"
	lift_size_x = 3 // Size of the actual lift, shaft walls are extra.
	lift_size_y = 3
	icon = 'icons/modules/turbolift/turbolift_preview_3x3 - no walls.dmi'
	dir = WEST

	wall_type = null // Don't make walls
	createInnerDoors = 1

	turbolift_stops = list(
		/area/turbolift/Research/underground,
		//area/turbolift/Research/midlevelOne,
		/area/turbolift/Research/midlevelTwo,
		//area/turbolift/Research/midlevelThree,
		/area/turbolift/Research/colony,
		)

/area/turbolift/Research/midlevelOne
	name = "Transition One"
	lift_announce_str = "Transition complete. Welcome to Base Level 1."
	base_turf = /turf/simulated/shuttle/floor/mining

/area/turbolift/Research/midlevelTwo
	name = "Transition Two"
	lift_announce_str = "Transition complete. Welcome to Base Level 2."
	base_turf = /turf/simulated/shuttle/floor/mining

/area/turbolift/Research/midlevelThree
	name = "Transition Three"
	lift_announce_str = "Transition complete. Welcome to Base Level 3."
	base_turf = /turf/simulated/shuttle/floor/mining

/area/turbolift/Research/colony
	name = "Phokorus Research Lift - Colony"
	lift_floor_label = "Liberty Colony"
	lift_floor_name = "Research Colony"
	lift_announce_str = "Transition complete. You are now on the Research Wing."
	base_turf = /turf/simulated/shuttle/floor/mining

/area/turbolift/Research/underground
	name = "Phokorus Research Lift - Underground"
	lift_floor_label = "Liberty Research"
	lift_floor_name = "Research Underground"
	lift_announce_str = "Transition complete. Welcome to the Deep Underground Research Outpost. Have a very safe day."
	base_turf = /turf/simulated/shuttle/floor/mining






//colony
/area/turbolift/ElevatorOne/underground
	name = "Elevator - Colony Underground"
	lift_floor_label = "Liberty Underground"
	lift_floor_name = "Floor Two"
	lift_announce_str = "Transition complete. Welcome to the Liberty Underground."
	base_turf = /turf/simulated/shuttle/floor/mining

/area/turbolift/ElevatorOne/midlevelOne
	name = "Transition One"
	lift_announce_str = "Transition complete. Welcome to Base Level 1."
	base_turf = /turf/simulated/shuttle/floor/mining

/area/turbolift/ElevatorOne/midlevelTwo
	name = "Transition Two"
	lift_announce_str = "Transition complete. Welcome to Base Level 2."
	base_turf = /turf/simulated/shuttle/floor/mining

/area/turbolift/ElevatorOne/midlevelThree
	name = "Transition Three"
	lift_announce_str = "Transition complete. Welcome to Base Level 3."
	base_turf = /turf/simulated/shuttle/floor/mining

/area/turbolift/ElevatorOne/surface
	name = "Elevator - Colony Surface"
	lift_floor_label = "Liberty Surface"
	lift_floor_name = "Floor One"
	lift_announce_str = "Transition complete. Welcome to the Surface."
	base_turf = /turf/simulated/shuttle/floor/mining




/area/turbolift/ElevatorTwo/underground
	name = "Elevator - Colony Underground"
	lift_floor_label = "Liberty Underground"
	lift_floor_name = "Floor Two"
	lift_announce_str = "Transition complete. Welcome to the Liberty Underground."
	base_turf = /turf/simulated/shuttle/floor/mining

/area/turbolift/ElevatorTwo/midlevelOne
	name = "Transition One"
	lift_announce_str = "Transition complete. Welcome to Base Level 1."
	base_turf = /turf/simulated/shuttle/floor/mining

/area/turbolift/ElevatorTwo/midlevelTwo
	name = "Transition Two"
	lift_announce_str = "Transition complete. Welcome to Base Level 2."
	base_turf = /turf/simulated/shuttle/floor/mining

/area/turbolift/ElevatorTwo/midlevelThree
	name = "Transition Three"
	lift_announce_str = "Transition complete. Welcome to Base Level 3."
	base_turf = /turf/simulated/shuttle/floor/mining

/area/turbolift/ElevatorTwo/surface
	name = "Elevator - Colony Surface"
	lift_floor_label = "Liberty Surface"
	lift_floor_name = "Floor One"
	lift_announce_str = "Transition complete. Welcome to the Surface."
	base_turf = /turf/simulated/shuttle/floor/mining



/datum/turbolift
	music = list('sound/music/elevatormusic.ogg')  // Woo elevator music!
