
////////////
//Liberty//
////////////

/area/colony
	base_turf = /turf/simulated/floor/asteroid

/area/colony/exposedsun
	ship_area = FALSE
	icon_state = "asteroid"
	area_light_color = COLOR_LIGHTING_DEFAULT_BRIGHT
	dynamic_lighting = FALSE
	base_turf = /turf/simulated/floor/asteroid/dirt

/area/colony/exposedsun/pastgate
	ship_area = FALSE
	icon_state = "erisblue"
	area_light_color = COLOR_LIGHTING_DEFAULT_BRIGHT
	ambience = list('sound/ambience/ambigen9.ogg', 'sound/ambience/ambigen10.ogg', 'sound/ambience/ambigen11.ogg', 'sound/ambience/ambigen12.ogg')

/area/colony/exposedsun/crashed_shop
	name = "Scrap Haven"
	ship_area = FALSE
	icon_state = "erisblue"
	area_light_color = COLOR_LIGHTING_DEFAULT_BRIGHT
	ambience = list('sound/ambience/ambigen9.ogg', 'sound/ambience/ambigen10.ogg', 'sound/ambience/ambigen11.ogg', 'sound/ambience/ambigen12.ogg')
	dynamic_lighting = TRUE

/area/colony/exposedsun/crashed_shop/bottom_floor
	dynamic_lighting = FALSE
	icon_state = "erisgreen"

/area/colony/exposedsun/crashed_shop/workshop
	icon_state = "erisyellow"

/area/colony/exposedsun/crashed_shop/outsider
	icon_state = "erisyellow"

/area/liberty
	ship_area = TRUE
	icon_state = "erisyellow"
	base_turf = /turf/simulated/floor/plating/under
	flags = AREA_FLAG_RAD_SHIELDED

//Maintenance

/area/liberty/maintenance
	is_maintenance = TRUE
	ship_area = TRUE
	flags = AREA_FLAG_RAD_SHIELDED
	sound_env = TUNNEL_ENCLOSED
	turf_initializer = new /datum/turf_initializer/maintenance()
	forced_ambience = list('sound/ambience/maintambience.ogg')
	area_light_color = COLOR_LIGHTING_MAINT_DARK

/area/liberty/maintenance/guild
	name = "Terra-Therma Union Maintence"

/area/liberty/maintenance/junk
	name = "Junk Beacon"
	icon_state = "disposal"
	dynamic_lighting = FALSE

/area/liberty/maintenance/surface_disposal
	name = "Surface Disposal"
	icon_state = "disposal"

/area/liberty/maintenance/arcade
	name = "Junk Arcade"
	icon_state = "disposal"

/area/liberty/maintenance/northcave
	name = "Underground Floor 2 North Caves"
	icon_state = "erisblue"

/area/liberty/maintenance/disposal
	name = "Waste Disposal"
	icon_state = "disposal"

/area/liberty/maintenance/fueltankstorage
	name = "Fueltank Storage"
	icon_state = "erisblue"

/area/liberty/maintenance/undergroundfloor1north
	name = "Surface North Maintenance"
	icon_state = "erisblue"

/area/liberty/maintenance/undergroundfloor1west
	name = "Surface West Maintenance"
	icon_state = "erisyellow"

/area/liberty/maintenance/undergroundfloor1east
	name = "Surface East Maintenance"
	icon_state = "erisgreen"

/area/liberty/maintenance/undergroundfloor2plague
	name = "Plagued Colony"
	icon_state = "erisgreen"

/area/liberty/maintenance/undergroundfloor1central
	name = "Surface Central Maintenance"
	icon_state = "erisblue"

/area/liberty/maintenance/undergroundfloor1oldgarden
	name = "Underground Floor 1 Old Garden"
	icon_state = "erisyellow"

/area/liberty/maintenance/oldlibrary
	name = "Abandoned Library"
	icon_state = "erisgreen"
	requires_power = FALSE // Eerie power surrounding the rituals powers the place

// Required for the turrets to work
/area/liberty/maintenance/oldarmory
	name = "Derelict Armory Shop"
	icon_state = "Warden"
	requires_power = FALSE

/area/liberty/maintenance/undergroundfloor1south
	name = "Surface South Maintenance"
	icon_state = "erisblue"

/area/liberty/maintenance/undergroundfloor2north
	name = "Underground Floor 1 North Maintenance"
	icon_state = "erisyellow"

/area/liberty/maintenance/undergroundfloor2west
	name = "Underground Floor 1 West Maintenance"
	icon_state = "erisblue"

/area/liberty/maintenance/undergroundfloor2east
	name = "Underground Floor 1 East Maintenance"
	icon_state = "erisyellow"

/area/liberty/maintenance/undergroundfloor2south
	name = "Underground Floor 1 South Maintenance"
	icon_state = "erisgreen"

/area/liberty/maintenance/surface_maints_1
	name = "Surface North Maintenance"
	icon_state = "erisyellow"

/area/liberty/maintenance/cavehideout
	name = "Abandoned Cave Shed"
	icon_state = "section2deck2starboard"

/area/liberty/maintenance/sunkenclub
	name = "Abandoned Club"
	icon_state = "cafeteria"

/area/liberty/maintenance/constructionarea
	name = "Construction Area"
	icon_state = "section2deck3starboard"

/area/liberty/maintenance/hideout
	name = "Abandoned Maintenance Shed"
	icon_state = "section2deck3starboard"
	requires_power = FALSE

/area/liberty/maintenance/oldmining
	name = "Abandoned Mine Shaft East"
	icon_state = "section2deck2starboard"
	requires_power = FALSE

/area/liberty/maintenance/oldminingwest
	name = "Abandoned Mine Shaft West"
	icon_state = "section2deck2starboard"

/area/liberty/maintenance/oldpool
	name = "Abandoned Pool"
	icon_state = "erisblue"

/area/liberty/maintenance/caveameridian
	name = "Underground Floor 2 North Anomalous Cave"
	icon_state = "erisblue"

/area/liberty/maintenance/cavenightmare
	name = "Underground Floor 2 East Caves"
	icon_state = "erisyellow"

/area/liberty/maintenance/caveagape
	name = "Underground Floor 2 South Caves"
	icon_state = "erisyellow"

/area/liberty/maintenance/undergroundfloor3south
	name = "Underground Floor 2 South Maintenance"
	icon_state = "erisblue"

/area/liberty/maintenance/undergroundfloor3north
	name = "Underground Floor 2 North Maintenance"
	icon_state = "erisyellow"

/area/liberty/maintenance/undergroundfloor3east
	name = "Underground Floor 2 East Maintenance"
	icon_state = "erisyellow"

/area/liberty/maintenance/undergroundfloor3west
	name = "Underground Floor 2 West Maintenance"
	icon_state = "erisblue"

/area/liberty/maintenance/oldkitchen
	name = "Abandoned Kitchen"
	icon_state = "hammerblue"

/area/liberty/maintenance/bank
	name = "Abandoned Bank"
	icon_state = "hammerred"

/area/liberty/maintenance/maint_merc
	name = "Derelict Mercenary Base"
	icon_state = "syndie-elite"

/area/liberty/maintenance/saloon
	name = "Abandoned Hairdresser Saloon"
	icon_state = "erisblue"

//Outside abandoned structures

/area/liberty/dungeon/outside
	is_maintenance = FALSE
	flags = AREA_FLAG_RAD_SHIELDED
	sound_env = TUNNEL_ENCLOSED
	turf_initializer = new /datum/turf_initializer/maintenance()
	ambience = list('sound/ambience/maintambience.ogg')
	area_light_color = COLOR_LIGHTING_MAINT_DARK
	dynamic_lighting = FALSE
	is_dungeon_lootable = TRUE

/area/liberty/dungeon/outside/frozen_forest
	name = "Frozen Forest"
	icon_state = "green"
	allows_weather_of_snow = TRUE
	turf_initializer = null

/area/liberty/dungeon/outside/frozen_forest_lake
	name = "Frozen Forest Lake"
	allows_weather_of_snow = TRUE
	icon_state = "erisblue"
	ambience = list('sound/ambience/frozenlake.ogg')

/area/liberty/dungeon/outside/frozen_forest_caves
	name = "Frozen Forest Cave system"
	dynamic_lighting = TRUE
	allows_weather_of_snow = FALSE
	is_dungeon_lootable = TRUE
	ambience = list('sound/ambience/maintambience.ogg', 'sound/ambience/arctic_cave.ogg')

/area/liberty/dungeon/outside/frozen_forest_house
	name = "Frozen Forest Ruined House"
	dynamic_lighting = TRUE
	allows_weather_of_snow = FALSE
	is_dungeon_lootable = TRUE

/area/liberty/dungeon/outside/frozen_forest_simil_base
	name = "Simulacrum Robotics Mining Offices"
	allows_weather_of_snow = FALSE
	requires_power = FALSE
	icon_state = "erisred"
	turf_initializer = null

/area/liberty/dungeon/outside/frozen_forest/crashsite
	name = "Frozen Forest - Crashsite"
	allows_weather_of_snow = TRUE
	icon_state = "green"
	ambience = list('sound/ambience/winterwind.ogg')

/area/liberty/dungeon/outside/frozen_forest/crashsite_lakes
	name = "Crashsite lakes"
	allows_weather_of_snow = TRUE
	icon_state = "erisblue"
	ambience = list('sound/ambience/frozenlake.ogg')

/area/liberty/dungeon/outside/frozen_forest/crashsite_cave
	name = "Crashsite Caves"
	icon_state = "erisyellow"
	dynamic_lighting = TRUE
	ambience = list('sound/ambience/arctic_cave.ogg')

/area/liberty/dungeon/outside/frozen_forest/crashsite_cave_under
	name = "Crashsite Caves - Underground"
	dynamic_lighting = TRUE
	icon_state = "erisyellow"
	ambience = list('sound/ambience/maintambience.ogg')

/area/liberty/dungeon/outside/trashcave
	name = "Trash Cave"
	icon_state = "libertygreen"
	ambience = list('sound/ambience/maintambience.ogg', 'sound/ambience/arctic_cave.ogg')
	dynamic_lighting = TRUE

/area/liberty/dungeon/outside/abandoned_solars
	name = "CAPSA Solar Outpost"
	icon_state = "erisgreen"
//	forced_ambience = list('sound/ambience/forestamb1.ogg', 'sound/ambience/forestamb2.ogg', 'sound/ambience/forestamb3.ogg', 'sound/ambience/forestamb5.ogg', 'sound/ambience/forestamb6.ogg')

/area/liberty/dungeon/outside/abandoned_solars/powered
	requires_power = FALSE

/area/liberty/dungeon/outside/burned_outpost
	name = "Burned Outpost"
	icon_state = "erisgreen"
	ambience = list('sound/ambience/arctic_cave.ogg')

/area/liberty/dungeon/outside/hunter_cabin
	name = "Abandoned Hunter Cabin"
	icon_state = "erisgreen"
	dynamic_lighting = TRUE
	requires_power = FALSE

/area/liberty/dungeon/outside/campground
	name = "Campground"
	icon_state = "erisgreen"
	ambience = list('sound/ambience/ambigen9.ogg', 'sound/ambience/ambigen10.ogg', 'sound/ambience/ambigen11.ogg', 'sound/ambience/ambigen12.ogg')

/area/liberty/dungeon/outside/farm
	name = "Lost Farm"
	icon_state = "erisgreen"
	ambience = list('sound/ambience/ambigen9.ogg', 'sound/ambience/ambigen10.ogg', 'sound/ambience/ambigen11.ogg', 'sound/ambience/ambigen12.ogg')
	dynamic_lighting = TRUE

/area/liberty/dungeon/outside/shuttle_crash
	name = "Crashed Emergency Shuttle"
	icon_state = "erisgreen"
	dynamic_lighting = TRUE

/area/liberty/dungeon/outside/abandoned_outpost
	name = "%!#ERR0R$?&" // Cultist interference with GPS.
	icon_state = "erisgreen"
	dynamic_lighting = TRUE
	forced_ambience = list('sound/ambience/occ_scaryambie.ogg') // Deep maint entrance spoilers.

/area/liberty/dungeon/outside/zoo
	name = "Abandoned Research Lab"
	icon_state = "erisgreen"
	dynamic_lighting = TRUE

/area/liberty/dungeon/outside/prison_exterior
	name = "Occupied Prison Complex"
	icon_state = "erisgreen"
	ambience = list('sound/ambience/sovietcheer.ogg') // If this and the warning signs ain't enough of a warning then I don't know.
	dynamic_lighting = TRUE
	allows_weather_of_snow = TRUE // It's the surrounding exterior areas.

/area/liberty/dungeon/outside/prison_interior
	name = "Occupied Prison Complex Interior"
	icon_state = "erisred"
	dynamic_lighting = TRUE
	requires_power = 0

/area/liberty/dungeon/outside/mercenary_base
	name = "Mercenaries Bunker"
	icon_state = "erisblue"
	dynamic_lighting = TRUE
	requires_power = 0

/area/liberty/dungeon/outside/safehouse
	name = "Abandoned Safehouse"
	icon_state = "libertygreen"
	dynamic_lighting = TRUE
	is_dungeon_lootable = FALSE
	ambience = list('sound/ambience/ambigen1.ogg','sound/ambience/ambigen3.ogg','sound/ambience/ambigen4.ogg','sound/ambience/ambigen5.ogg','sound/ambience/ambigen6.ogg','sound/ambience/ambigen7.ogg','sound/ambience/ambigen8.ogg','sound/ambience/ambigen9.ogg','sound/ambience/ambigen10.ogg','sound/ambience/ambigen11.ogg','sound/ambience/ambigen12.ogg','sound/ambience/ambigen14.ogg')
	area_light_color = COLOR_LIGHTING_CREW_SOFT

//This is put here because the floors are seperated by power needs, the reason being if not powering 1 floor lags the server to hell and back. -Kaz
/area/liberty/dungeon/outside/mercenary_base/floor1
	name = "Underground Mercenaries Bunker - Workshop"

/area/liberty/dungeon/outside/mercenary_base/floor2
	name = "Mercenaries Bunker - Kitchen"

/area/liberty/dungeon/outside/mercenary_base/floor3
	name = "Underground Mercenaries Bunker"

/area/liberty/dungeon/outside/mercenary_base/floor4
	name = "Mercenaries Bunker - Vault"

/area/liberty/dungeon/outside/mercenary_base/floor5
	name = "Underground Mercenaries Bunker - Medical"

/area/liberty/dungeon/outside/mercenary_base/entryway
	name = "Mercenary Bunker - Entrance"
	ambience = list('sound/ambience/sovietcheer.ogg') // Foreshadowing.

/area/liberty/dungeon/outside/monster_cave
	name = "Monster Cave"
	icon_state = "erisgreen"
	forced_ambience = list('sound/ambience/ambisin1.ogg', 'sound/ambience/ambisin2.ogg', 'sound/ambience/ambisin3.ogg', 'sound/ambience/ambisin4.ogg')
	dynamic_lighting = TRUE

/area/liberty/dungeon/outside/smuggler_zone
	name = "Smuggler Base"
	icon_state = "erisgreen"
	ambience = list('sound/ambience/ambimo1.ogg', 'sound/ambience/ambimo2.ogg')
	dynamic_lighting = TRUE
	requires_power = 0

/area/liberty/dungeon/outside/smuggler_zone_u
	name = "Smuggler Base Underground"
	icon_state = "erisgreen"
	dynamic_lighting = TRUE
	requires_power = 0

//Outside natural areas

/area/liberty/outside
	area_light_color = COLOR_LIGHTING_DEFAULT_BRIGHT
	ambience = list('sound/ambience/ambigen9.ogg', 'sound/ambience/ambigen10.ogg', 'sound/ambience/ambigen11.ogg', 'sound/ambience/ambigen12.ogg')
	dynamic_lighting = FALSE
	flags = null
	is_dungeon_lootable = TRUE
	ship_area = FALSE

/area/liberty/outside/one_star
	name = "Simulacrum Robotics Base"
	icon_state = "erisgreen"
	ambience = list('sound/ambience/ambigen13.ogg', 'sound/ambience/ambigen14.ogg', 'sound/ambience/ambimalf.ogg')
	dynamic_lighting = TRUE
	requires_power = FALSE
	flags = AREA_FLAG_RAD_SHIELDED

/area/liberty/outside/one_star/fo_outside
	name = "Simulacrum Grounds"
	icon_state = "erisgreen"
	dynamic_lighting = FALSE

/area/liberty/outside/one_star/fo_internal
	name = "Simulacrum Field Offices"
	icon_state = "erisblue"
	requires_power = FALSE

/area/liberty/outside/dcave
	name = "Tengolo Cave East"
	icon_state = "erisgreen"
	dynamic_lighting = TRUE
	ambience = list('sound/ambience/arctic_cave.ogg')

/area/liberty/outside/fnest
	name = "Fennec Nest"
	icon_state = "erisgreen"

/area/liberty/outside/pond
	name = "Pond"
	icon_state = "erisgreen"
	forced_ambience = list('sound/ambience/frozenlake.ogg')
	icon_state = "erisblue"
	allows_weather_of_snow = TRUE

/area/liberty/outside/bcave
	name = "Tengolo Cave West"
	icon_state = "erisgreen"
	dynamic_lighting = TRUE
	ambience = list('sound/ambience/arctic_cave.ogg')

/area/liberty/outside/scave
	name = "Spider Cave"
	icon_state = "erisgreen"

/area/liberty/outside/forest
	name = "Forest"
	icon_state = "forest"
	sound_env = FOREST
	allows_weather_of_snow = TRUE
	ambience = list('sound/ambience/winterwind.ogg')

/area/liberty/outside/forest/beast_cave_light
	name = "Swamp Caves"
	icon_state = "forest"

/area/liberty/outside/forest/beast_cave_dark
	name = "Swamp Caves"
	icon_state = "erisblue"
	dynamic_lighting = TRUE

/area/liberty/outside/forest/swamp_hut
	name = "Swamp Hut"
	icon_state = "erisblue"
	dynamic_lighting = TRUE
	requires_power = FALSE

/area/liberty/outside/forest/plains_farm
	name = "Desolate Farmstead"
	icon_state = "erisblue"
	requires_power = FALSE

/area/liberty/outside/forest/river_forest_light
	name = "Hunting Plains"
	icon_state = "forest"

/area/liberty/outside/forest/river_forest_lake
	name = "Hunting Plains River"
	icon_state = "hammerblue"

/area/liberty/outside/forest/river_forest_cabin
	name = "Hunting Plains Cabin"
	icon_state = "erisgreen"
	requires_power = FALSE
	dynamic_lighting = TRUE

/area/liberty/outside/forest/river_forest_dark
	name = "Hunting Plains Caves"
	icon_state = "erisblue"
	dynamic_lighting = TRUE

/area/liberty/outside/forest/river_forest_underground
	name = "Hunting plains underground caves"
	icon_state = "erisblue"
	dynamic_lighting = TRUE

/area/liberty/outside/forest/hunting_lodge
	name = "Hunting Lodge"
	icon_state = "forest"
	is_dungeon_lootable = FALSE

/area/liberty/outside/forest/hunting_lodge_dark
	name = "Hunting Lodge"
	icon_state = "erisblue"
	dynamic_lighting = TRUE
	is_dungeon_lootable = FALSE

/area/liberty/outside/forest/hunting_lodge_shed_dark
	name = "Lodge Barn"
	icon_state = "erisblue"
	dynamic_lighting = TRUE
	is_dungeon_lootable = FALSE

/area/liberty/outside/lakeside
	name = "Lakeside"
	icon_state = "erisblue"
	sound_env = MOUNTAINS
	forced_ambience = list('sound/ambience/frozenlake.ogg')
	allows_weather_of_snow = TRUE

/area/liberty/outside/meadow
	name = "Deep Forest"
	icon_state = "meadow"
	sound_env = MOUNTAINS
	forced_ambience = list('sound/ambience/winterwind.ogg')
	allows_weather_of_snow = TRUE

/area/liberty/outside/inside_colony
	name = "Colony Meadow"
	icon_state = "meadow"
	sound_env = MOUNTAINS
//	forced_ambience = list('sound/ambience/meadowamb1.ogg', 'sound/ambience/meadowamb2.ogg', 'sound/ambience/meadowamb3.ogg', 'sound/ambience/meadowamb4.ogg')
	allows_weather_of_snow = TRUE

/area/liberty/outside/holes_in_mountain
	name = "Mountain Pits"
	icon_state = "meadow"
	allows_weather_of_snow = TRUE

/area/liberty/outside/mountainsolars
	name = "Mountain Solars"
	icon_state = "meadow"
	sound_env = MOUNTAINS
//	forced_ambience = list('sound/ambience/meadowamb1.ogg', 'sound/ambience/meadowamb2.ogg', 'sound/ambience/meadowamb3.ogg', 'sound/ambience/meadowamb4.ogg')
	is_dungeon_lootable = FALSE

/area/liberty/outside/range
	name = "Public Firing Range"
	icon_state = "firingrange"
	allows_weather_of_snow = TRUE
	is_dungeon_lootable = FALSE
	requires_power = FALSE

// SUBSTATIONS (Subtype of maint, that should let them serve as shielded area during radstorm)

/area/liberty/maintenance/substation
	name = "Substation"
	icon_state = "substation"
	sound_env = SMALL_ENCLOSED
	forced_ambience = list('sound/ambience/maintambience.ogg')

/area/liberty/maintenance/substation/engineering
	name = "Engineering Substation"

/area/liberty/maintenance/substation/medical
	name = "Medial Substation"

/area/liberty/maintenance/substation/science
	name = "Science Substation"

/area/liberty/maintenance/substation/sec
	name = "Marshal Substation"

/area/liberty/maintenance/substation/cargo
	name = "Cargo Substation"

/area/liberty/maintenance/substation/servist
	name = "Servist Substation"

/area/liberty/maintenance/substation/misc1
	name = "MISC Substation 1"

/area/liberty/maintenance/substation/misc2
	name = "MISC Substation 2"

/area/liberty/maintenance/substation/misc3
	name = "MISC Substation 3"

/area/liberty/maintenance/substation/bridge
	name = "Bridge Substation"

//Hallway

/area/liberty/hallway
	sound_env = LARGE_ENCLOSED
	icon_state = "erisgreen"
	flags = AREA_FLAG_RAD_SHIELDED

/area/liberty/hallway/main/f1section1
	name = "Floor One Hallway One"
	icon_state = "hallway1"

/area/liberty/hallway/main/f1section2
	name = "Floor One Hallway Two"
	icon_state = "hallway2"

/area/liberty/hallway/main/f1section3
	name = "Floor One Hallway Three"
	icon_state = "hallway3"

/area/liberty/hallway/main/f1section4
	name = "Floor One Hallway Four"
	icon_state = "hallway4"

/area/liberty/hallway/side/cavernhallway
	name = "Floor Two Cavern Hallway"
	icon_state = "hallway3side"

/area/liberty/hallway/side/f2section1
	name = "Floor Two Hallway One"
	icon_state = "hallway3side"

/area/liberty/hallway/side/f2section2
	name = "Floor Two Hallway Two"
	icon_state = "hallway3side"

/area/liberty/hallway/side/f2section3
	name = "Floor Two Hallway Three"
	icon_state = "erisayellow"

/area/liberty/hallway/side/f2section4
	name = "Floor Two Hallway Four"
	icon_state = "erisyellow"

/area/liberty/hallway/surface/section1
	name = "Colony Surface Interior"
	icon_state = "hallway3side"

/area/liberty/hallway/surface/section2
	name = "Surface Hallway Two"
	icon_state = "hallway3side"

/area/liberty/hallway/surface/section3
	name = "Surface Hallway Three"
	icon_state = "erisyellow"

/area/liberty/hallway/surface/section4
	name = "Surface Hallway Four"
	icon_state = "erisyellow"

/area/liberty/hallway/surface/section5
	name = "Surface Hallway Five"
	icon_state = "erisyellow"

/area/liberty/hallway/side/morguehallway
	name = "Morgue Hallway"

/area/liberty/hallway/side/atmosphericshallway
	name = "Atmospherics Hallway"

/area/liberty/hallway/side/cryo
	name = "Cryo Hallway"

/area/liberty/hallway/side/bridgehallway
	name = "Bridge Hallway"
	icon_state = "erisblue"

/area/liberty/hallway/side/eschangara
	name = "Escape Hangar A"
	icon_state = "erisred"

/area/liberty/hallway/side/eschangarb
	name = "Escape Hangar B"
	icon_state = "erisred"

/area/liberty/hallway/main/stairwell
	name = "Stairwell"
	icon_state = "hallway4"

//Command

/area/liberty/command
	name = "\improper Command"
	area_light_color = COLOR_LIGHTING_SCI_BRIGHT

/area/liberty/command/bridge
	name = "\improper Control Room"
	icon_state = "bridge"

/area/liberty/command/meeting_room
	name = "\improper Heads of Staff Meeting Room"
	icon_state = "bridge"
	ambience = list()
	sound_env = MEDIUM_SOFTFLOOR

/area/liberty/command/armory
	name = "\improper Command Center Armory"
	icon_state = "bridge"
	sound_env = SMALL_ENCLOSED

/area/liberty/command/panic_room
	name = "\improper Panic Room"
	icon_state = "bridge"
	flags = AREA_FLAG_CRITICAL | AREA_FLAG_RAD_SHIELDED
	sound_env = SMALL_ENCLOSED

/area/liberty/command/bridgebar
	name = "V.I.P. Bar"
	icon_state = "bar"
	area_light_color = COLOR_LIGHTING_CREW_SOFT

/area/liberty/command/captain
	name = "\improper Command - Secretary's Office"
	icon_state = "captain"
	sound_env = SMALL_SOFTFLOOR
	flags = AREA_FLAG_CRITICAL
	area_light_color = COLOR_LIGHTING_CREW_SOFT

/area/liberty/command/captain/quarters
	name = "\improper Command - Secretary's Quarters"

/area/liberty/command/RP
	name = "\improper Research - RP's Office"
	icon_state = "head_quarters"
	flags = AREA_FLAG_CRITICAL
	sound_env = SMALL_SOFTFLOOR

/area/liberty/command/RP/quarters
	name = "\improper Research - RP's Quarters"
	icon_state = "head_quarters"
	sound_env = SMALL_SOFTFLOOR
	area_light_color = COLOR_LIGHTING_CREW_SOFT

/area/liberty/command/gmaster
	name = "\improper Engineering - Union Chief's Office"
	icon_state = "head_quarters"
	flags = AREA_FLAG_CRITICAL
	sound_env = SMALL_SOFTFLOOR

/area/liberty/command/gmaster/quarters
	name = "\improper Engineering - Union Chief's Quarters"
	icon_state = "head_quarters"
	sound_env = SMALL_SOFTFLOOR
	area_light_color = COLOR_LIGHTING_CREW_SOFT

/area/liberty/command/cso
	name = "\improper Medbay - CSO's Office"
	icon_state = "head_quarters"
	flags = AREA_FLAG_CRITICAL
	sound_env = SMALL_SOFTFLOOR

/area/liberty/command/cso/quarters
	name = "\improper Medbay - CSO's Quarters"
	icon_state = "head_quarters"
	sound_env = SMALL_SOFTFLOOR
	area_light_color = COLOR_LIGHTING_CREW_SOFT

/area/liberty/command/swo
	name = "Deputy Chief's Office"
	icon_state = "hammerred"
	flags = AREA_FLAG_CRITICAL
	sound_env = SMALL_SOFTFLOOR
	area_light_color = COLOR_LIGHTING_CREW_SOFT

/area/liberty/command/swo/quarters
	name = "Deputy Chief's Quarters"
	icon_state = "hammerred"
	sound_env = SMALL_SOFTFLOOR
	area_light_color = COLOR_LIGHTING_CREW_SOFT

/area/liberty/command/smc
	name = "Blackshield Commander's Office"
	icon_state = "hammerred"
	flags = AREA_FLAG_CRITICAL
	sound_env = SMALL_SOFTFLOOR
	area_light_color = COLOR_LIGHTING_CREW_SOFT

/area/liberty/command/smc/quarters
	name = "Blackshield Commander's Quarters"
	icon_state = "hammerred"
	sound_env = SMALL_SOFTFLOOR
	area_light_color = COLOR_LIGHTING_CREW_SOFT

/area/liberty/command/prime
	name = "Oathpledge's Office"
	icon_state = "head_quarters"
	flags = AREA_FLAG_CRITICAL
	sound_env = SMALL_SOFTFLOOR
	area_light_color = COLOR_LIGHTING_CREW_SOFT

/area/liberty/command/prime/quarters
	name = "Oathpledge's Quarters"
	icon_state = "head_quarters"
	sound_env = SMALL_SOFTFLOOR
	area_light_color = COLOR_LIGHTING_CREW_SOFT

/area/liberty/command/merchant
	name = "\improper Skylight - CEO's Office"
	icon_state = "quart"
	flags = AREA_FLAG_CRITICAL
	sound_env = SMALL_SOFTFLOOR

/area/liberty/command/teleporter
	name = "\improper Teleporter"
	icon_state = "teleporter"

/area/liberty/command/tcommsat
	ambience = list('sound/ambience/ambisin2.ogg', 'sound/ambience/signal.ogg', 'sound/ambience/signal.ogg', 'sound/ambience/ambigen10.ogg')
	flags = AREA_FLAG_CRITICAL

/area/liberty/command/tcommsat/chamber
	name = "\improper Telecoms Central Compartment"
	icon_state = "tcomsatcham"

/area/liberty/command/tcommsat/computer
	name = "\improper Telecoms Control Room"
	icon_state = "tcomsatcomp"

/area/liberty/command/courtroom
	name = "\improper Courtroom"
	icon_state = "courtroom"

/area/liberty/command/crematorium
	name = "\improper Crematorium"
	icon_state = "erisyellow"

//Crew Quarters

/area/liberty/crew_quarters
	name = "\improper Dormitories"
	icon_state = "Sleep"
	area_light_color = COLOR_LIGHTING_CREW_SOFT

/area/liberty/crew_quarters/toilet
	name = "Surface Public Toilets"
	icon_state = "toilet"
	sound_env = SMALL_ENCLOSED

/area/liberty/crew_quarters/toilet/public
	name = "Floor 2 Public Toilet"

/area/liberty/crew_quarters/toilet/medbay
	name = "Medbay Toilet"
	icon_state = "libertyyellow"

/area/liberty/crew_quarters/dorm1
	name = "\improper Dormitory Bedroom One"
	icon_state = "restrooms"

/area/liberty/crew_quarters/dorm2
	name = "\improper Dormitory Bedroom Two"
	icon_state = "restrooms"

/area/liberty/crew_quarters/dorm3
	name = "\improper Dormitory Bedroom Three"
	icon_state = "restrooms"

/area/liberty/crew_quarters/dorm4
	name = "\improper Dormitory Bedroom Four"
	icon_state = "restrooms"

/area/liberty/crew_quarters/dorm5
	name = "\improper Dormitory Bedroom Five"
	icon_state = "restrooms"

/area/liberty/crew_quarters/podrooms
	name = "\improper Upper Pod Dormitories"

/area/liberty/crew_quarters/podrooms2
	name = "\improper Lower Pod Dormitories"

/area/liberty/crew_quarters/hotsprings
	name = "\improper Indoors Hot Spring"
	icon_state = "purple"

/area/liberty/crew_quarters/sleep
	name = "\improper Dormitories"

/area/liberty/crew_quarters/sleep/engi_wash
	name = "\improper Engineering Washroom"
	icon_state = "toilet"
	sound_env = SMALL_ENCLOSED

/area/liberty/crew_quarters/sleep/bedrooms
	name = "\improper Dormitory Bedroom One"
	icon_state = "Sleep"
	sound_env = SMALL_SOFTFLOOR

/area/liberty/crew_quarters/sleep/cryo
	name = "\improper Upper Cryogenic Storage"
	icon_state = "Sleep"
	area_light_color = COLOR_LIGHTING_SCI_BRIGHT
	flags = AREA_FLAG_CRITICAL | AREA_FLAG_RAD_SHIELDED

/area/liberty/crew_quarters/sleep/cryo2
	name = "\improper Lower Cryogenic Storage"
	icon_state = "Sleep"
	area_light_color = COLOR_LIGHTING_SCI_BRIGHT
	flags = AREA_FLAG_CRITICAL | AREA_FLAG_RAD_SHIELDED

/area/liberty/crew_quarters/sleep_male
	name = "\improper Male Dorm"
	icon_state = "Sleep"

/area/liberty/crew_quarters/sleep_male/toilet_male
	name = "\improper Male Toilets"
	icon_state = "toilet"
	sound_env = SMALL_ENCLOSED

/area/liberty/crew_quarters/sleep_female
	name = "\improper Female Dorm"
	icon_state = "Sleep"

/area/liberty/crew_quarters/sleep_female/toilet_female
	name = "\improper Female Toilets"
	icon_state = "toilet"
	sound_env = SMALL_ENCLOSED

/area/liberty/crew_quarters/locker
	name = "\improper Locker Room"
	icon_state = "locker"

/area/liberty/crew_quarters/locker/locker_toilet
	name = "\improper Locker Toilets"
	icon_state = "toilet"
	sound_env = SMALL_ENCLOSED

/area/liberty/crew_quarters/fitness
	name = "\improper Fitness Room"
	icon_state = "fitness"

/area/liberty/crew_quarters/pool
	name = "\improper Public Pool"
	icon_state = "fitness"

/area/liberty/crew_quarters/cafeteria
	name = "\improper Cafeteria"
	icon_state = "cafeteria"

/area/liberty/crew_quarters/kitchen
	name = "\improper Kitchen"
	icon_state = "kitchen"

/area/liberty/crew_quarters/bar
	name = "\improper Bar"
	icon_state = "bar"
	sound_env = LARGE_SOFTFLOOR

/area/liberty/crew_quarters/bar/vip
	name = "\improper Bar VIP Room"
	icon_state = "cafeteria"

/area/liberty/crew_quarters/outerspess
	name = "\improper Shuttle Room"
	icon_state = "Sleep"

/area/liberty/crew_quarters/barbackroom
	name = "Bar Backroom"
	icon_state = "maint_bar"

/area/liberty/crew_quarters/theatre
	name = "\improper Theatre"
	icon_state = "Theatre"
	sound_env = LARGE_SOFTFLOOR

/area/liberty/crew_quarters/clownoffice
	name = "Entertainment Studio"
	icon_state = "erisblue"

/area/liberty/crew_quarters/library
 	name = "\improper Library"
 	icon_state = "library"
 	sound_env = LARGE_SOFTFLOOR

/area/liberty/crew_quarters/librarybackroom
	name = "Library Backroom"
	icon_state = "erisgreen"

/area/liberty/crew_quarters/janitor/
	name = "\improper Custodial Closet"
	icon_state = "janitor"

/area/liberty/crew_quarters/hydroponics
	name = "\improper Hydroponics"
	icon_state = "hydro"

/area/liberty/crew_quarters/botanist
	name = "\improper Gardener's room"
	icon_state = "hydro"

/area/liberty/crew_quarters/hydroponics/garden
	name = "\improper Garden"
	icon_state = "garden"
	dynamic_lighting = FALSE
//	forced_ambience = list('sound/ambience/meadowamb1.ogg', 'sound/ambience/meadowamb2.ogg', 'sound/ambience/meadowamb3.ogg', 'sound/ambience/meadowamb4.ogg')

/area/liberty/crew_quarters/clothingstorage
	name = "Clothing Storage"
	icon_state = "erisyellow"

/area/liberty/crew_quarters/pubeva
	name = "Public E.V.A. Storage"
	icon_state = "erisblue"

/area/liberty/crew_quarters/publichydro
	name = "Public Hydroponics"
	icon_state = "erisblue"

/area/liberty/crew_quarters/techshop
	name =  "Vacant Tech shops"
	icon_state = "construction"

/area/liberty/crew_quarters/skyyard
	name = "\improper Junk Sky Field Teleporter"
	icon_state = "erisyellow"
	area_light_color = COLOR_LIGHTING_CUSTODIANS_BRIGHT

// Custodians of Bonfire

/area/liberty/bonfire
	icon_state = "erisgreen"
	area_light_color = COLOR_LIGHTING_CUSTODIANS_BRIGHT

/area/liberty/bonfire/stronghold
	name = "\improper Stronghold"
	icon_state = "hammerblue"
	ambience = list('sound/ambience/honorguard.ogg') // Under Sebs allowance, the soundtrack for the Custodians has been changed. This song is COPYRIGHT FREE and has been only slightly modified. Music by <a href="https://pixabay.com/users/dstechnician-26430546/?utm_source=link-attribution&utm_medium=referral&utm_campaign=music&utm_content=115551">DSTechnician</a> from <a href="https://pixabay.com/music//?utm_source=link-attribution&utm_medium=referral&utm_campaign=music&utm_content=115551">Pixabay</a>
	sound_env = LARGE_ENCLOSED

// /area/liberty/bonfire/stronghold
//		name = "\improper Stronghold"
//		icon_state = "hammerblue"
//		ambience = list('sound/ambience/stronghold.ogg') // Less church, more knight-y. Marching soldiers, fire and chants. Courtesy of me. - Seb
//		sound_env = LARGE_ENCLOSED

/area/liberty/bonfire/storage
	name = "\improper Stronghold Storage Wing"
	icon_state = "erisyellow"
	area_light_color = COLOR_LIGHTING_CUSTODIANS_BRIGHT

/area/liberty/bonfire/bioreactor
	name = "\improper Stronghold Workshop"
	icon_state = "erisblue"
	ambience = list('sound/ambience/honorguard.ogg')
	area_light_color = COLOR_LIGHTING_CUSTODIANS_BRIGHT

/area/liberty/bonfire/vectorrooms
	name = "\improper Stronghold Living Quarters"
	icon_state = "erisblue"
	area_light_color = COLOR_LIGHTING_CUSTODIANS_BRIGHT

/area/liberty/bonfire/office
	name = "\improper Stronghold Barracks"
	icon_state = "hammerred"
	ambience = list('sound/ambience/honorguard.ogg')
	area_light_color = COLOR_LIGHTING_CUSTODIANS_DARK

/area/liberty/bonfire/forge
	name = "Stronghold Forge"
	ambience = list('sound/ambience/honorguard.ogg')
	icon_state = "erisgreen"

/area/liberty/bonfire/alchemist
	name = "Stronghold Brewing Room"
	ambience = list('sound/ambience/honorguard.ogg')
	icon_state = "hammerblue"

//Engineering

/area/liberty/engineering
	name = "\improper Engineering"
	icon_state = "engineering"
	area_light_color = COLOR_LIGHTING_SCI_BRIGHT

/area/liberty/engineering/gravity_generator
	name = "Gravity Generator Room"
	icon_state = "blue"
	flags = AREA_FLAG_CRITICAL

/area/liberty/engineering/shield_generator
	name = "Shield Generator Room"
	icon_state = "blueold"

/area/liberty/engineering/atmos
 	name = "\improper Atmospherics"
 	icon_state = "atmos"
 	sound_env = LARGE_ENCLOSED

/area/liberty/engineering/workshop
 	name = "\improper Workshop"
 	icon_state = "blueold"
 	sound_env = LARGE_ENCLOSED

/area/liberty/engineering/atmos/monitoring
	name = "\improper Atmospherics Monitoring Room"
	icon_state = "atmos_monitoring"
	sound_env = STANDARD_STATION

/area/liberty/engineering/atmos/storage
	name = "\improper Atmospherics Storage"
	icon_state = "atmos_storage"
	sound_env = SMALL_ENCLOSED

/area/liberty/engineering/atmos/surface
	name = "\improper Atmospherics Surface"
	icon_state = "atmos_storage"
	sound_env = SMALL_ENCLOSED

/area/liberty/engineering/drone_fabrication
	name = "\improper Engineering Drone Fabrication"
	icon_state = "drone_fab"
	sound_env = SMALL_ENCLOSED

/area/liberty/engineering/engine_smes
	name = "\improper Engineering SMES"
	icon_state = "engine_smes"
	sound_env = SMALL_ENCLOSED

/area/liberty/engineering/engine_room
	name = "\improper Engine Room"
	icon_state = "engine"
	sound_env = LARGE_ENCLOSED
	flags = AREA_FLAG_CRITICAL

/area/liberty/engineering/engine_airlock
	name = "\improper Engine Room Airlock"
	icon_state = "engine"

/area/liberty/engineering/enginehallway
	name = "\improper Engine Room Hallway"
	icon_state = "engine"

/area/liberty/engineering/engine_monitoring
	name = "\improper Engine Monitoring Room"
	icon_state = "engine_monitoring"
	flags = AREA_FLAG_CRITICAL

/area/liberty/engineering/engine_waste
	name = "\improper Engine Waste Handling"
	icon_state = "engine_waste"
	flags = AREA_FLAG_CRITICAL

/area/liberty/engineering/engineering_monitoring
	name = "\improper Engineering Monitoring Room"
	icon_state = "engine_monitoring"

/area/liberty/engineering/foyer
	name = "\improper Engineering Foyer"
	icon_state = "engineering_foyer"

/area/liberty/engineering/storage
	name = "\improper Engineering Storage"
	icon_state = "engineering_storage"
	area_light_color = COLOR_LIGHTING_SCI_DARK

/area/liberty/engineering/break_room
	name = "\improper Engineering Break Room"
	icon_state = "engineering_break"
	sound_env = MEDIUM_SOFTFLOOR

/area/liberty/engineering/dorm
	name = "\improper Solar Panels Control Room"
	icon_state = "engineering_break"
	sound_env = MEDIUM_SOFTFLOOR

/area/liberty/engineering/dorm/one
	name = "\improper Guild Dorm One"

/area/liberty/engineering/dorm/two
	name = "\improper Guild Dorm Two"

/area/liberty/engineering/dorm/three
	name = "\improper Guild Dorm Three"

/area/liberty/engineering/dorm/four
	name = "\improper Guild Dorm Four"

/area/liberty/engineering/engine_eva
	name = "\improper Engine EVA"
	icon_state = "engine_eva"
	area_light_color = COLOR_LIGHTING_SCI_DARK

/area/liberty/engineering/locker_room
	name = "\improper Engineering Locker Room"
	icon_state = "engineering_locker"

/area/liberty/engineering/workshop
	name = "\improper Engineering Workshop"
	icon_state = "engineering_workshop"

/area/liberty/engineering/starboardhallway
	name = "Engineering Starboard Hallway"
	icon_state = "libertygreen"

/area/liberty/engineering/wastingroom
	name = "Wasting Room"
	icon_state = "libertyred"
	area_light_color = COLOR_LIGHTING_SCI_DARK

/area/liberty/engineering/post
	name = "Engineering Post"
	icon_state = "libertyred"
	area_light_color = COLOR_LIGHTING_SCI_DARK

/area/liberty/engineering/wastingroom
	name = "Wasting Room"
	icon_state = "libertyred"

/area/liberty/engineering/techstorage
	name = "Tools Storage"
	icon_state = "libertyred"

/area/liberty/engineering/telecommonitor
	name = "Telecommunications Monitor Room"
	icon_state = "libertyred"

/area/liberty/engineering/breakroom
	name = "Engineering Break Room"
	icon_state = "libertyred"

/area/liberty/engineering/freezercontrol
	name = "Freezer Control"
	icon_state = "libertyred"

/area/liberty/engineering/atmoscontrol
	name = "Atmospherics Control"
	icon_state = "libertyred"

/area/liberty/engineering/engeva
	name = "Engineering E.V.A. Storage"
	icon_state = "libertyblue"
	area_light_color = COLOR_LIGHTING_SCI_DARK

/area/liberty/engineering/construction
	name = "\improper Engineering Construction Area"
	is_maintenance = TRUE
	icon_state = "yellow"

/area/liberty/engineering/propulsion
	name = "Propulsion Hangar"
	icon_state = "propulsion"

/area/liberty/engineering/propulsion/left
	name = "Left Propulsion Hangar"

/area/liberty/engineering/propulsion/right
	name = "Right Propulsion Hangar"

//MedBay

/area/liberty/medical/medbay
	name = "\improper Medical"
	icon_state = "libertygreen"
	area_light_color = COLOR_LIGHTING_SCI_BRIGHT

/area/liberty/medical/medbay
	name = "\improper Medbay"
	icon_state = "medbay"
	ambience = list('sound/ambience/signal.ogg')

area/liberty/medical/medbayshowers
	name = "\improper Medbay Showers"
	icon_state = "medbay"
	ambience = list('sound/ambience/signal.ogg')

area/liberty/medical/medbaymeeting
	name = "\improper Medbay Meeting Room"
	icon_state = "medbay"
	ambience = list('sound/ambience/signal.ogg')

//Medbay is a large area, these additional areas help level out APC load.
/area/liberty/medical/medbay2
	name = "\improper Medbay Hallway Floor 2"
	icon_state = "medbay2"
	ambience = list('sound/ambience/signal.ogg')

/area/liberty/medical/medbay3
	name = "\improper Medbay Hallway Floor 1 Section 1"
	icon_state = "medbay3"
	ambience = list('sound/ambience/signal.ogg')

/area/liberty/medical/medbay4
	name = "\improper Medbay Hallway Floor 1 Section 2"
	icon_state = "medbay4"
	ambience = list('sound/ambience/signal.ogg')

/area/liberty/medical/biostorage
	name = "\improper Secondary Storage"
	icon_state = "medbay2"
	ambience = list('sound/ambience/signal.ogg')

/area/liberty/medical/bathroom
	name = "\improper Medical Bathroom"
	icon_state = "medbay2"

/area/liberty/medical/reception
	name = "\improper Medbay Reception"
	icon_state = "medbay2"
	ambience = list('sound/ambience/signal.ogg')

/area/liberty/medical/psych
	name = "\improper Psych Room"
	icon_state = "medbay3"
	ambience = list('sound/ambience/signal.ogg')
	area_light_color = COLOR_LIGHTING_CREW_SOFT

/area/liberty/medical/medbreak
	name = "\improper Break Room"
	icon_state = "medbay3"
	ambience = list('sound/ambience/signal.ogg')

/area/liberty/medical/medsleep
	name = "\improper Medbay Sleeping Room"
	icon_state = "medbay3"
	ambience = list('sound/ambience/signal.ogg')

/area/liberty/medical/patients_rooms
	name = "\improper Patient's Rooms"
	icon_state = "patients"

/area/liberty/medical/ward
	name = "\improper Recovery Ward"
	icon_state = "patients"

/area/liberty/medical/patient_a
	name = "\improper Isolation A"
	icon_state = "patients"

/area/liberty/medical/patient_b
	name = "\improper Isolation B"
	icon_state = "patients"

/area/liberty/medical/patient_c
	name = "\improper Isolation C"
	icon_state = "patients"

/area/liberty/medical/patient_wing
	name = "\improper Patient Wing"
	icon_state = "patients"

/area/liberty/medical/cmostore
	name = "\improper Secure Storage"
	icon_state = "CMO"

/area/liberty/medical/virology
	name = "\improper Virology"
	icon_state = "virology"

/area/liberty/medical/virologyaccess
	name = "\improper Virology Access"
	icon_state = "virology"

/area/liberty/medical/morgue
	name = "\improper Morgue"
	icon_state = "morgue"

/area/liberty/medical/chemistry
	name = "\improper Chemistry"
	icon_state = "chem"

/area/liberty/medical/surgery
	name = "\improper Operating Theatre"
	icon_state = "surgery"

/area/liberty/medical/surgery2
	name = "\improper Operating Theatre 2"
	icon_state = "surgery"

/area/liberty/medical/surgeryobs
	name = "\improper Operation Observation Room"
	icon_state = "surgery"

/area/liberty/medical/surgeryprep
	name = "\improper Pre-Op Prep Room"
	icon_state = "surgery"

/area/liberty/medical/cryo
	name = "\improper Cryogenics"
	icon_state = "cryo"

/area/liberty/medical/exam_room
	name = "\improper Exam Room"
	icon_state = "exam_room"

/area/liberty/medical/genetics
	name = "\improper Genetics Lab"
	icon_state = "genetics"

/area/liberty/medical/genetics_cloning
	name = "\improper Cloning Lab"
	icon_state = "cloning"

/area/liberty/medical/sleeper
	name = "\improper Emergency Treatment Centre"
	icon_state = "medbay"

/area/liberty/medical/chemstor
	name = "Chemical Storage"
	icon_state = "erisblue"
	area_light_color = COLOR_LIGHTING_SCI_DARK

/area/liberty/medical/medeva
	name = "Medical E.V.A. Storage"
	icon_state = "erisblue"
	area_light_color = COLOR_LIGHTING_SCI_DARK

/area/liberty/medical/paramedic
	name = "\improper Medical Locker room"
	icon_state = "medbay3"
	area_light_color = COLOR_LIGHTING_SCI_DARK

/area/liberty/medical/medbay/iso
	name = "Isolation Wing"
	icon_state = "erisgreen"

/area/liberty/medical/medbay/uppercor
	name = "Medbay Coridors"
	icon_state = "medbay2"

/area/liberty/medical/organ_lab
	name = "Organ Laboratory"
	icon_state = "medbay4"

//Security

/area/liberty/security
	name = "Security"
	icon_state = "security"
	area_light_color = COLOR_LIGHTING_SCI_BRIGHT

/area/liberty/security/main
	name = "\improper Security Office"
	icon_state = "security"

/area/liberty/security/sechall
	name = "Liberty Watch Security Wing"
	icon_state = "security"

// So that prisoners can escape the whole security wing
/area/liberty/security/sechall/prison_break()
	..()

/area/liberty/security/brig
	name = "\improper Security - Brig"
	icon_state = "brig"

/area/liberty/security/brig/prison_break()
	for(var/obj/structure/closet/secure_closet/brig/temp_closet in src)
		temp_closet.set_locked(FALSE)
	for(var/obj/machinery/door_timer/temp_timer in src)
		temp_timer.releasetime = 1
	..()

/area/liberty/security/prison
	name = "\improper Security - Prison Wing"
	icon_state = "sec_prison"

/area/liberty/security/prison/prison_break()
	..()

/area/liberty/security/warden
	name = "\improper Security - Command Center"
	icon_state = "Warden"

/area/liberty/security/armory
	name = "\improper Security - Armory"
	icon_state = "Warden"

/area/liberty/security/armoryshop
	name = "\improper Security - Armory Shop"
	icon_state = "Warden"

/area/liberty/security/detectives_office
	name = "\improper Security - Forensic Office"
	icon_state = "detective"
	sound_env = MEDIUM_SOFTFLOOR

/area/liberty/security/range
	name = "\improper Security - Firing Range"
	icon_state = "firingrange"

/area/liberty/security/tactical
	name = "\improper Security - Tactical Equipment"
	icon_state = "Tactical"

/area/liberty/security/maingate
	name = "\improper Security - Main Gate"
	icon_state = "security"
	dynamic_lighting = FALSE
//	forced_ambience = list('sound/ambience/meadowamb1.ogg', 'sound/ambience/meadowamb2.ogg', 'sound/ambience/meadowamb3.ogg', 'sound/ambience/meadowamb4.ogg')

/area/liberty/security/maingate_outside
	name = "\improper Security - Fence Line "
	icon_state = "security"
	dynamic_lighting = FALSE
	allows_weather_of_snow = TRUE
//	forced_ambience = list('sound/ambience/meadowamb1.ogg', 'sound/ambience/meadowamb2.ogg', 'sound/ambience/meadowamb3.ogg', 'sound/ambience/meadowamb4.ogg')

/area/liberty/security/vacantoffice2
	name = "\improper Vacant Office"
	icon_state = "security"

/area/liberty/security/prisoncells
	name = "Prison Cells"
	icon_state = "hammerblue"

/area/liberty/security/prisoncells/prison_break()
	for(var/obj/structure/closet/secure_closet/brig/temp_closet in src)
		temp_closet.set_locked(FALSE)
	for(var/obj/machinery/door_timer/temp_timer in src)
		temp_timer.releasetime = 1
	..()

/area/liberty/security/hut_cell1
	name = "Permanent Holding"
	icon_state = "hammerblue"

/area/liberty/security/hut_cell1/prison_break()
	for(var/obj/structure/closet/secure_closet/brig/temp_closet in src)
		temp_closet.set_locked(FALSE)
	..()

/area/liberty/security/hut_cell2
	name = "Solitary Confinement"
	icon_state = "hammerblue"

/area/liberty/security/hut_cell2/prison_break()
	..()

/area/liberty/security/evidencestorage
	name = "Security - Evidence Storage"
	icon_state = "hammerred"
	area_light_color = COLOR_LIGHTING_SCI_DARK

/area/liberty/security/eva_sec
	name = "Security - E.V.A. Storage"
	icon_state = "hammerred"

/area/liberty/security/landing_pad
	name = "Security - Landing Pad"
	icon_state = "hammerred"

/area/liberty/security/mess_hall
	name = "Security - Mess Hall"
	icon_state = "hammerblue"

/area/liberty/security/eye_pod
	name = "Security - E.Y.E. Pod"
	icon_state = "hammerblue"

/area/liberty/security/interrogation
	name = "Security - Interrogation Room"
	icon_state = "hammerblue"

/area/liberty/security/showers
	name = "Security - Showers"
	icon_state = "hammerblue"

//Cargo

/area/liberty/quartermaster
	name = "\improper Merchants"
	icon_state = "quart"
	area_light_color = COLOR_LIGHTING_SCI_BRIGHT

/area/liberty/quartermaster/office
	name = "\improper Cargo Office"
	icon_state = "quartoffice"

/area/liberty/quartermaster/pods
	name = "\improper Skylight Pod Dorms"
	icon_state = "quartoffice"

/area/liberty/quartermaster/storage
	name = "\improper Cargo Bay"
	icon_state = "quartstorage"
	sound_env = LARGE_ENCLOSED

/area/liberty/quartermaster/miningdock
	name = "\improper Cargo Mining Dock"
	icon_state = "mining"

/area/liberty/quartermaster/mining_outside_doc
	name = "Union Mining Outpost Exterior"
	icon_state = "mining"

/area/liberty/quartermaster/disposaldrop
	name = "Disposal and Delivery"
	icon_state = "erisred"

/area/liberty/quartermaster/underground_to_surface_disposal
	name = "Disposal surface access"
	icon_state = "erisblue"
	requires_power = FALSE

/area/liberty/quartermaster/hangarsupply
	name = "Supply Shuttle Hangar"
	icon_state = "erisblue"

/area/liberty/quartermaster/hangarsupply_nolight
	name = "Supply Shuttle Dock"
	icon_state = "erisgreen"

/area/liberty/quartermaster/fightclub
	name = "\proper The Rage Cage"
	icon_state = "erisblue"

/area/liberty/quartermaster/supplydock
	name = "\improper Cargo Delivery Dock"
	icon_state = "erisgreen"
	base_turf = /turf/simulated/floor/tiled/dark/cargo

/area/liberty/quartermaster/vault
	name = "Skylight Vault"
	icon_state = "hammerred"

//Research and Development

/area/liberty/rnd
	area_light_color = COLOR_LIGHTING_SCI_BRIGHT

/area/liberty/rnd/research
	name = "\improper Research and Development"
	icon_state = "research"
	flags = AREA_FLAG_CRITICAL

/area/liberty/rnd/researchbathroom
	name = "\improper Research Bathroom"
	icon_state = "research"

/area/liberty/rnd/circuitlab
	name = "\improper Research Circuit Lab"
	icon_state = "research"

/area/liberty/rnd/rbreakroom
	name = "\improper Research Breakroom"
	icon_state = "research"

/area/liberty/rnd/scient
	name = "Science Department Entrance"
	icon_state = "erisblue"

/area/liberty/rnd/docking
	name = "\improper Research Elevator"
	icon_state = "research_dock"

/area/liberty/rnd/lab
	name = "\improper Research Lab"
	icon_state = "toxlab"

/area/liberty/rnd/chargebay
	name = "\improper Mech Bay"
	icon_state = "mechbay"

/area/liberty/rnd/robotics
	name = "\improper Robotics Lab"
	icon_state = "robotics"
	flags = AREA_FLAG_CRITICAL

/area/liberty/rnd/rdoffice
	name = "\improper CAPSA Expedition Overseer's Office"
	icon_state = "head_quarters"

/area/liberty/rnd/supermatter
	name = "\improper Supermatter Lab"
	icon_state = "toxlab"

/area/liberty/rnd/xenobiology
	name = "\improper Xenobiology Lab"
	icon_state = "xeno_lab"

/area/liberty/rnd/xenoflora_storage
	name = "\improper Xenoflora Storage"
	icon_state = "xeno_f_store"

/area/liberty/rnd/xenoflora
	name = "\improper Xenoflora Lab"
	icon_state = "xeno_f_lab"

/area/liberty/rnd/xenobiology/ameridian
	name = "\improper Ameridian Lab"
	icon_state = "xeno_lab"

/area/liberty/rnd/storage
	name = "\improper Toxins Storage"
	icon_state = "toxstorage"
	area_light_color = COLOR_LIGHTING_SCI_DARK

/area/liberty/rnd/mixing
	name = "\improper Toxins Mixing Room"
	icon_state = "toxmix"

/area/liberty/rnd/misc_lab
	name = "\improper Miscellaneous Research"
	icon_state = "toxmisc"
	area_light_color = COLOR_LIGHTING_SCI_DARK

/area/liberty/rnd/server
	name = "\improper Server Room"
	icon_state = "server"

/area/liberty/rnd/podbay
	name = "Pod Bay"
	icon_state = "libertyblue"

/area/liberty/rnd/anomal
	name = "Anomalous Research Laboratory"
	icon_state = "libertyblue"

/area/liberty/rnd/anomalisolone
	name = "Anomalous Research Isolation One"
	flags = AREA_FLAG_RAD_SHIELDED
	icon_state = "libertygreen"

/area/liberty/rnd/anomalisoltwo
	name = "Anomalous Research Isolation Two"
	flags = AREA_FLAG_RAD_SHIELDED
	icon_state = "libertygreen"

/area/liberty/rnd/anomalisolthree
	name = "Anomalous Research Isolation Three"
	flags = AREA_FLAG_RAD_SHIELDED
	icon_state = "libertygreen"

/area/liberty/rnd/anomalisolfour
	name = "Anomalous Research Isolation Four"
	flags = AREA_FLAG_RAD_SHIELDED
	icon_state = "libertygreen"

/area/liberty/rnd/anomalisolfive
	name = "Anomalous Research Isolation Five"
	flags = AREA_FLAG_RAD_SHIELDED
	icon_state = "libertygreen"

/area/liberty/rnd/outpostgeneral
	name = "Anomalous Research Outpost General"
	flags = AREA_FLAG_RAD_SHIELDED
	icon_state = "erisgreen"

/area/liberty/rnd/outpostbotany
	name = "Anomalous Research Outpost Botany"
	flags = AREA_FLAG_RAD_SHIELDED
	icon_state = "erisblue"

/area/liberty/rnd/outpostmachineroom
	name = "Anomalous Research Outpost Machine Rooms"
	flags = AREA_FLAG_RAD_SHIELDED
	icon_state = "erisblue"

/area/liberty/rnd/outpostbreakroom
	name = "Anomalous Research Outpost Break Room"
	flags = AREA_FLAG_RAD_SHIELDED
	icon_state = "erisblue"

/area/liberty/rnd/outpostmedical
	name = "Anomalous Research Outpost Medstation"
	flags = AREA_FLAG_RAD_SHIELDED
	icon_state = "erisblue"

/area/liberty/rnd/outpoststorage
	name = "Anomalous Research Outpost Storage"
	flags = AREA_FLAG_RAD_SHIELDED
	icon_state = "erisgreen"


/area/liberty/rnd/server
	name = "\improper Research Server Room"
	flags = AREA_FLAG_RAD_SHIELDED
	icon_state = "server"


//Fontaine//Black Bolt

/area/liberty/pros/dorm
	name = "\improper Black Bolt Dorms"
	icon_state = "erisgreen"

/area/liberty/pros/prep
	name = "\improper Black Bolt Prep"
	icon_state = "erisgreen"

/area/liberty/pros/foreman
	name = "\improper Expeditionary Leader Office"
	icon_state = "erisgreen"

/area/liberty/pros/shuttle
	name = "\improper Shuttle Hangar"
	icon_state = "erisgreen"
	dynamic_lighting = FALSE

/area/liberty/pros/proelav
	name = "\improper Skylight Surface Elevator"
	icon_state = "erisgreen"

/area/liberty/pros/prostorage
	name = "\improper Black Bolt Storage"
	icon_state = "erisgreen"

//Storage


/area/liberty/storage/primary
	name = "Primary Tool Storage"
	icon_state = "primarystorage"

/area/liberty/storage/tech
	name = "Technical Storage"
	icon_state = "auxstorage"
