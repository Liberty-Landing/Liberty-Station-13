#include "area/_Liberty_areas.dm"
#include "data/_Liberty_factions.dm"
#include "data/_Liberty_Turbolifts.dm"
#include "data/shuttles-liberty.dm"
#include "data/overmap-eris.dm"
#include "data/shuttles-eris.dm"
#include "data/reports.dm"

//Currently used in testing stuff
#include "map/_Liberty_Colony.dmm"
//#include "_Liberty_Colony_Underground.dmm"
//#include "_Liberty_Colony_Transition.dmm"
//#include "_Liberty_Colony_Surface.dmm"
#include "map/_Liberty_Solar_Area.dmm"


/obj/map_data/eris
	name = "Eris"
	is_sealed = TRUE
	height = 1


/obj/map_data/liberty_ues //Omnie level has all three surface underground and stairs
	name = "Liberty Omni Map"
	is_station_level = TRUE
	is_player_level = TRUE
	is_contact_level = TRUE
	is_accessable_level = FALSE
	is_sealed = TRUE
	generate_asteroid = TRUE
	height = 3
	digsites = "HOUSE"

/obj/map_data/liberty_new //Omnie level has all three surface underground and stairs
	name = "Liberty New Map"
	is_station_level = TRUE
	is_player_level = TRUE
	is_contact_level = TRUE
	is_accessable_level = FALSE
	is_sealed = TRUE
	generate_asteroid = TRUE
	height = 3
	digsites = "HOUSE"


/obj/map_data/liberty_s
	name = "Liberty Surface"
	is_station_level = TRUE
	is_player_level = TRUE
	is_contact_level = TRUE
	is_accessable_level = FALSE
	is_sealed = TRUE
	generate_asteroid = TRUE
	height = 1

/obj/map_data/liberty_u
	name = "Liberty Underground"
	is_station_level = TRUE
	is_player_level = TRUE
	is_contact_level = TRUE
	is_accessable_level = FALSE
	is_sealed = TRUE
	height = 1

/obj/map_data/liberty_e
	name = "Liberty Elevator and Stairs"
	is_station_level = TRUE
	is_player_level = TRUE
	is_contact_level = TRUE
	is_accessable_level = FALSE
	is_sealed = TRUE
	height = 1

/obj/map_data/admin
	name = "Admin Level"
	is_admin_level = TRUE
	is_accessable_level = FALSE
	height = 1

/obj/map_data/liberty_solars
	name = "Liberty Mountain Solars"
	is_station_level = TRUE
	is_player_level = TRUE
	is_contact_level = TRUE
	is_accessable_level = FALSE
	is_sealed = TRUE
	height = 1

/obj/map_data/liberty_labor
	name = "Liberty Labor Camp"
	is_station_level = TRUE
	is_player_level = TRUE
	is_contact_level = TRUE
	is_accessable_level = FALSE
	is_sealed = TRUE
	generate_asteroid = TRUE
	height = 1

/obj/map_data/hunting_lodge
	name = "Hunting Lodge"
	is_station_level = FALSE
	is_player_level = TRUE
	is_contact_level = FALSE
	is_accessable_level = FALSE
	is_sealed = TRUE
	height = 2


