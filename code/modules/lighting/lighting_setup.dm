/proc/create_all_lighting_overlays()
	for(var/zlevel = 1 to world.maxz)
		create_lighting_overlays_zlevel(zlevel)

/proc/create_lighting_overlays_zlevel(var/zlevel)
	ASSERT(zlevel)

	for(var/turf/T in block(locate(1, 1, zlevel), locate(world.maxx, world.maxy, zlevel)))
		if (!T.dynamic_lighting)
			continue

		var/area/A = T.loc
		if (!A.dynamic_lighting)
			continue

		new /atom/movable/lighting_overlay(T, TRUE)
		if (!T.lighting_corners_initialised)
			T.generate_missing_corners()

//LL change
/proc/set_all_areas_to_dark()
	for(var/area/A in all_areas)
		if(!A.dynamic_lighting && !A.force_full_lighting)
			//A.dynamic_lighting = TRUE
			A.set_dynamic_lighting()
