/datum/antag_faction/excelsior
	id = FACTION_EXCELSIOR
	name = "Excelsior"
	antag = "infiltrator"
	antag_plural = "infiltrators"
	welcome_text = "You are Excelsior, Ever Upward. You have infiltrated this colony to further the revolution.\n\
	The People's strength lies in securing our position, gathering the oppressed, spreading propaganda and producing arms and armor for the final revolution. A slow and methodical approach is recommended. \n\n\
	Our first phase is to retrieve the cache of manufacturing materials and circuit boards. Without a means of production our revolution is in peril.\n\n\
	Our second phase is to establish a fortified position in secret. The People will send additional resources through the teleporter once it is established. This and our autolathe can be protected further with turrets and shield generators, in addition to loyal comrades.\n\n\
	Our third phase is expansion. Complete mandates for power. Aquire implants, prosthetics or robotic parts and convert them into new implants. These can be injected into the oppressed to formally induct them to the Revolution. Use their labor to produce the weapons of their liberation.\n\n\
	When the People are ready, break the chains of the oppressor and seize control of the ship"

	hud_indicator = "excelsior"

	possible_antags = list(ROLE_EXCELSIOR_REV)
	verbs = list(/datum/antag_faction/excelsior/proc/communicate_verb)

	var/stash_holder = null

/datum/antag_faction/excelsior/print_success_extra()
	var/extra_text = ""
	var/list/mandates = list()
	for(var/m in GLOB.excel_antag_contracts)
		var/datum/antag_contract/mandate = m
		if(mandate.completed)
			mandates += mandate

	if(length(mandates))
		var/total_power = 0
		var/num = 0

		extra_text += "<br><b>Mandates fulfilled:</b>"
		for(var/m in mandates)
			var/datum/antag_contract/mandate = m
			total_power += mandate.reward
			num++

			extra_text += "<br><b>Mandate [num]:</b> [mandate.desc] <font color='green'>(+[mandate.reward] power)</font>"

		extra_text += "<br><b>Total: [num] mandates, <font color='green'>[total_power] power from mandates</font></b><br>"
	return extra_text
/datum/antag_faction/excelsior/create_objectives()
	objectives.Cut()
	new /datum/objective/timed/excelsior(src)
	for (var/datum/antagonist/A in members)
		to_chat(A.owner.current, SPAN_NOTICE("You may summon your required materials using the \"summon stash\" command."))

	.=..()

/datum/antag_faction/excelsior/proc/communicate_verb()

	set name = "Excelsior comms"
	set category = "Cybernetics"

	if(!ishuman(usr))
		return

	var/datum/antag_faction/F = get_faction_by_id(FACTION_EXCELSIOR)

	if(!F)
		return

	F.communicate(usr)
