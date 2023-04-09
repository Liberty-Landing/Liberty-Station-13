
//todo
/datum/artifact_effect/celldrain
	effecttype = "celldrain"
	effect_type = 3
	var/last_message

/datum/artifact_effect/celldrain/DoEffectTouch(var/mob/user)
	if(user)
		return 1

/datum/artifact_effect/celldrain/DoEffectAura()
	if(holder)
		var/turf/T = get_turf(holder)
		for (var/obj/machinery/power/apc/C in range(200, T))
			for (var/obj/item/cell/large/B in C.contents)
				B.charge = max(B.charge - 50,0)
		for (var/obj/machinery/power/smes/S in range (src.effectrange,src))
			S.charge = max(S.charge - 100,0)
	return 1

/datum/artifact_effect/celldrain/DoEffectPulse()
	if(holder)
		var/turf/T = get_turf(holder)
		for (var/obj/machinery/power/apc/C in range(200, T))
			for (var/obj/item/cell/large/B in C.contents)
				B.charge = max(B.charge - rand() * 150,0)
		for (var/obj/machinery/power/smes/S in range (src.effectrange,src))
			S.charge = max(S.charge - 250,0)
	return 1
