/datum/storyevent/roleset/blitz
	id = "blitz"
	name = "blitzshell infiltration"
	role_id = ROLE_BLITZ
	weight = 1

	base_quantity = 1
	scaling_threshold = 15

/datum/storyevent/roleset/contractor
	id = "contractor"
	name = "contractor"
	role_id = ROLE_CONTRACTOR
	weight = 1.2
	scaling_threshold = 10


/datum/storyevent/roleset/malf
	id = "malf"
	name = "malfunctioning AI"
	role_id = ROLE_MALFUNCTION
	req_crew = 15


/datum/storyevent/roleset/marshal
	id = "marshal"
	name = "marshal"
	role_id = ROLE_MARSHAL
	weight = 0.2
	req_crew = 10
	event_pools = list(EVENT_LEVEL_ROLESET = -30) //This is an antitag, it has a negative cost to allow more antags to exist

/datum/storyevent/roleset/marshal/can_trigger(var/severity, var/report)
	var/a_count = 0
	for(var/datum/antagonist/A in GLOB.current_antags)
		if(!A.isdead())
			a_count++
			break

	if (a_count == 0)
		if (report) to_chat(report, SPAN_NOTICE("Failure: No antags which can serve as target"))
		return FALSE //Can't spawn without at least one antag

	return ..()

/datum/storyevent/roleset/marshal/get_special_weight(var/new_weight)
	var/a_count = 0
	for(var/datum/antagonist/A in GLOB.current_antags)
		if(A.owner && A.is_active() && !A.isdead())
			a_count++

	if (a_count == 0)
		return 0 //Can't spawn without at least one antag

	return new_weight * max(a_count, 1)


/datum/storyevent/roleset/carrion
	id = "carrion"
	name = "carrion"
	role_id = ROLE_CARRION

	base_quantity = 2
	scaling_threshold = 15
