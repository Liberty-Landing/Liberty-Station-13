
//todo
/datum/artifact_effect/cellcharge
	effecttype = "cellcharge"
	effect_type = 3
	var/last_message

/datum/artifact_effect/cellcharge/DoEffectAura()
	if(holder)
		var/turf/T = get_turf(holder)
		for (var/obj/machinery/power/apc/C in range(200, T))
			for (var/obj/item/cell/large/B in C.contents)
				B.charge += 25
		for (var/obj/machinery/power/smes/S in range (src.effectrange,src))
			S.charge += 25
		return 1

/datum/artifact_effect/cellcharge/DoEffectPulse()
	if(holder)
		var/turf/T = get_turf(holder)
		for (var/obj/machinery/power/apc/C in range(200, T))
			for (var/obj/item/cell/large/B in C.contents)
				B.charge += rand() * 100
		for (var/obj/machinery/power/smes/S in range (src.effectrange,src))
			S.charge += 250
		return 1
