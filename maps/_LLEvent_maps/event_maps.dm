//#include "map/_event_map_engi.dmm"


/obj/map_data/event_map_engi
	name = "rebuildable outpost map_data"
	is_player_level = TRUE
	is_contact_level = TRUE
	is_accessable_level = TRUE
	height = 2

/obj/effect/shuttle_landmark/engi_outpost
	name = "Project Landing zone"
	icon_state = "shuttle-green"
	landmark_tag = "nav_engi_outpost"
	base_area = /area/event_engi
	base_turf = /turf/simulated/floor/asteroid

/area/event_engi
	dynamic_lighting = FALSE
	name = "Outpost Outdoors"
	icon_state = "hammerblue"

/area/event_engi/building_main
	dynamic_lighting = TRUE
	name = "Outpost Main"
	icon_state = "hammerblue"

/area/event_engi/building_upper
	dynamic_lighting = TRUE
	name = "Outpost Upper Area"
	icon_state = "hammerblue"

/area/event_engi/building_medical
	dynamic_lighting = TRUE
	name = "Outpost Upper Medical"
	icon_state = "hammerblue"

/area/event_engi/rooms
	dynamic_lighting = TRUE
	name = "Outpost Dormitory"
	icon_state = "hammerblue"

/area/event_engi/fud
	dynamic_lighting = TRUE
	name = "Outpost Kitchen"
	icon_state = "hammerblue"

/area/event_engi/bathroom
	dynamic_lighting = TRUE
	name = "Outpost Restrooms"
	icon_state = "hammerblue"

/area/event_engi/supply
	name = "Outpost Supply"
	icon_state = "hammerblue"
	requires_power = FALSE

/area/event_engi/trash
	name = "Outpost Trash Area"
	icon_state = "hammerblue"
	requires_power = FALSE

//////////////////////////////////////////////////////////

//#include "map/_event_map_bridge.dmm"


/obj/map_data/event_map_bridge
	name = "event bridge map"
	is_player_level = TRUE
	is_contact_level = TRUE
	is_accessable_level = TRUE
	height = 1

/obj/effect/shuttle_landmark/event_map_bridge
	name = "Project Landing zone"
	icon_state = "shuttle-green"
	landmark_tag = "nav_brige_outpost"
	base_area = /area/event_bridge
	base_turf = /turf/simulated/floor/asteroid

/area/event_bridge
	dynamic_lighting = FALSE
	name = "Roadblocked Bridge"
	icon_state = "hammerblue"

/area/event_bridge/merc_outpost
	name = "Hostile Outpost"
	icon_state = "hammerblue"

/area/event_bridge/misc
	name = "Hostile Wildlands"
	icon_state = "hammerblue"

//////////////////////////////////////////////////////////

#include "map/_event_map_gascaves.dmm"


/obj/map_data/event_map_gascaves
	name = "event gascave map"
	is_player_level = TRUE
	is_contact_level = TRUE
	is_accessable_level = TRUE
	height = 1

/obj/effect/shuttle_landmark/event_map_gascaves
	name = "Cave Entrence Landing zone"
	icon_state = "shuttle-green"
	landmark_tag = "nav_gas_caves"
	base_area = /area/event_gascaves/outside
	base_turf = /turf/simulated/floor/asteroid

/area/event_gascaves
	dynamic_lighting = TRUE
	name = "Cave Main"
	icon_state = "hammerblue"

/area/event_gascaves/outside
	dynamic_lighting = FALSE
	name = "Wilderness"
	icon_state = "hammerblue"

/area/event_gascaves/misc
	name = "Cave Shoots"
	icon_state = "hammerblue"

/obj/structure/fake_mining_drill
	name = "Gas Sonar"
	desc = "A highly advanced gas scanning sonar, silent to the ears for you, but not them..."
	icon = 'maps/_LLEvent_maps/event_stuff.dmi'
	icon_state = "mining_drill" //sprite by CeUvi
	density = TRUE
	anchored = TRUE
	var/is_active = FALSE
	var/drill_timer = 5 MINUTES
	var/is_drill = TRUE

/obj/structure/fake_mining_drill/long_timer
	drill_timer = 15 MINUTES

/obj/structure/fake_mining_drill/medium_timer
	drill_timer = 10 MINUTES

/obj/structure/fake_mining_drill/console
	name = "Gas Sonar Activation Console"
	desc = "A Simple console that when intracted with at all turns on the gas sonar, but cant stop it."
	icon_state = "account_computer" //sprite by CeUvi
	density = TRUE
	anchored = TRUE
	is_drill = FALSE

/obj/structure/fake_mining_drill/console/attack_hand(user as mob)
	..()
	var/user_is_choosing = TRUE
	while(user_is_choosing)
		var/action = alert(user, "Turn On the Drill?", "Turn On the Drill?", "No", "Yes", "Cancel")
		switch(action)
			if("Yes")
				for(var/obj/structure/fake_mining_drill/FMD in oview(7))
					FMD.start()
				return
			else
				return

/obj/structure/fake_mining_drill/Initialize(mapload)
	. = ..()
	set_light(7, 5, "#999999")

/obj/structure/fake_mining_drill/proc/start()
	if(!is_active && is_drill)
		icon_state = "mining_drill_error"
		addtimer(CALLBACK(src, .proc/stop), drill_timer, TIMER_STOPPABLE)

/obj/structure/fake_mining_drill/proc/stop()
	new /obj/item/oddity/drilldocs(src.loc)
	icon_state = "mining_drill"

/obj/item/oddity/drilldocs
	name = "gas reading research"
	desc = "A folder containing some papers with important sonar data."
	icon = 'icons/obj/oddities.dmi'
	price_tag = 2500
	prob_perk = 0 //no need
	oddity_stats = list(
		STAT_MEC = 7,
		STAT_COG = 7,
		STAT_BIO = 7,
	)

/obj/item/oddity/drilldocs/Initialize()
	icon_state = "reports[rand(1,5)]"