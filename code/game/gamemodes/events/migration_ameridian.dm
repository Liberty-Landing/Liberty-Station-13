/*
	A vast number of ameridian spawn around the colony. Will heavily stress the shields
	They eventually go away
*/
/datum/storyevent/ameridian_migration
	id = "ameridian_migration"
	name = "ameridian growth"

	event_type =/datum/event/ameridian_migration
	event_pools = list(EVENT_LEVEL_MAJOR = POOL_THRESHOLD_MAJOR)
	tags = list(TAG_COMMUNAL, TAG_COMBAT, TAG_DESTRUCTIVE, TAG_SCARY, TAG_EXTERNAL)

//////////////////////////////////////////////////////////

/datum/event/ameridian_migration
	announceWhen	= 50
	endWhen 		= 60
	var/list/viable_turfs = list()
	var/list/spawned_ameridian = list()


/datum/event/ameridian_migration/setup()
	var/area/forest = locate(/area/liberty/outside/forest) in world //pick tiles outside colony walls in that same z-level
	for (var/turf/T in forest)
		if (locate(/obj/effect/shield) in T)
			continue

		//Snow around each located tile is logged onto a list of viable turfs
		var/numsnow
		for (var/turf/simulated/floor/snow/W in view(4, T))
			numsnow++

		//And the square of it is entered into the list as a weight
		if (numsnow)
			viable_turfs[T] = numsnow*numsnow

	//We will then use pickweight and this will be more likely to choose tiles with many windows, for maximum exposure

	announceWhen = rand(40, 60)
	endWhen = rand(600,1200)

/datum/event/ameridian_migration/announce()
	var/announcement = ""
	if(severity == EVENT_LEVEL_MAJOR)
		announcement = "Massive growth of Ameridian has been detected outside colony walls, please stand-by."
	else
		announcement = "Ameridian [spawned_ameridian.len == 1 ? "growth has" : "growths have"] been detected outside the colony."

	command_announcement.Announce(announcement, "Lifesign Alert")

/datum/event/ameridian_migration/start()
	if(severity == EVENT_LEVEL_MAJOR)
		spawn_ameridian(70)
	else if(severity == EVENT_LEVEL_MODERATE)
		spawn_ameridian(35)

/datum/event/ameridian_migration/proc/spawn_ameridian(var/number)
	var/list/spawn_locations = pickweight_mult(viable_turfs, number)

	for(var/turf/T in spawn_locations)
		if(prob(70))
			spawned_ameridian.Add(new /obj/random/structures/ameridian_crystal(T))

/datum/event/ameridian_migration/end()
	for(var/obj/structure/ameridian_crystal/a in spawned_ameridian)
		if(prob(85)) //20% chance to stay
			if(!a.stat)
				var/turf/T = get_turf(a)
				if(istype(T, /turf/space)) //If they end up outside the map then we remove them on end
					spawned_ameridian.Remove(a)
					qdel(a)
				if(istype(T, /turf/unsimulated/wall/jungle))
					spawned_ameridian.Remove(a)
					qdel(a)
