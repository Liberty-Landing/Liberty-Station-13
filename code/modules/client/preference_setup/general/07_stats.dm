//Many thanks to Jamini/Occulus-Eris for coding and bug testing/improving this stat via cilent system

/datum/preferences
	var/BIOMOD = 0
	var/COGMOD = 0
	var/MECMOD = 0
	var/ROBMOD = 0
	var/TGHMOD = 0
	var/VIGMOD = 0
	var/WILMOD = 0
	var/ENDMOD = 0

/datum/category_item/player_setup_item/background/education
	name = "Skills"
	sort_order = 7

/datum/category_item/player_setup_item/background/education/load_character(var/savefile/S)
	from_file(S["BIOMOD"],pref.BIOMOD)
	from_file(S["COGMOD"],pref.COGMOD)
	from_file(S["MECMOD"],pref.MECMOD)
	from_file(S["ROBMOD"],pref.ROBMOD)
	from_file(S["TGHMOD"],pref.TGHMOD)
	from_file(S["VIGMOD"],pref.VIGMOD)
	from_file(S["WILMOD"],pref.WILMOD)
	from_file(S["ENDMOD"],pref.ENDMOD)

/datum/category_item/player_setup_item/background/education/save_character(var/savefile/S)
	to_file(S["BIOMOD"],pref.BIOMOD)
	to_file(S["COGMOD"],pref.COGMOD)
	to_file(S["MECMOD"],pref.MECMOD)
	to_file(S["ROBMOD"],pref.ROBMOD)
	to_file(S["TGHMOD"],pref.TGHMOD)
	to_file(S["VIGMOD"],pref.VIGMOD)
	to_file(S["WILMOD"],pref.WILMOD)
	to_file(S["ENDMOD"],pref.ENDMOD)

/datum/category_item/player_setup_item/background/education/sanitize_character()
	pref.BIOMOD             = sanitize_integer(pref.BIOMOD, -10, 10, initial(pref.BIOMOD))
	pref.COGMOD             = sanitize_integer(pref.COGMOD, -10, 10, initial(pref.COGMOD))
	pref.MECMOD             = sanitize_integer(pref.MECMOD, -10, 10, initial(pref.MECMOD))
	pref.ROBMOD             = sanitize_integer(pref.ROBMOD, -10, 10, initial(pref.ROBMOD))
	pref.TGHMOD             = sanitize_integer(pref.TGHMOD, -10, 10, initial(pref.TGHMOD))
	pref.VIGMOD             = sanitize_integer(pref.VIGMOD, -10, 10, initial(pref.VIGMOD))
	pref.WILMOD             = sanitize_integer(pref.WILMOD, -10, 10, initial(pref.WILMOD))
	pref.ENDMOD				= sanitize_integer(pref.ENDMOD, -10, 10, initial(pref.ENDMOD))
	if(calculatetotalpoints() > 10)
		pref.BIOMOD = 0
		pref.COGMOD = 0
		pref.MECMOD = 0
		pref.ROBMOD = 0
		pref.TGHMOD = 0
		pref.VIGMOD = 0
		pref.WILMOD = 0
		pref.ENDMOD = 0

/datum/category_item/player_setup_item/background/education/content(var/mob/user)
	. = list()
	. += "<br/><b>Skills</b>:<br/>"
	. += "Willpower:  <a href='?src=\ref[src];wilmod=1'>[pref.WILMOD]</a><br>"
	. += "Cognition: <a href='?src=\ref[src];cogmod=1'>[pref.COGMOD]</a><br>"
	. += "Biology: <a href='?src=\ref[src];biomod=1'>[pref.BIOMOD]</a><br>"
	. += "Mechanical: <a href='?src=\ref[src];mecmod=1'>[pref.MECMOD]</a><br>"
	. += "Robustness:  <a href='?src=\ref[src];robmod=1'>[pref.ROBMOD]</a><br>"
	. += "Toughness:  <a href='?src=\ref[src];tghmod=1'>[pref.TGHMOD]</a><br>"
	. += "Endurance:  <a href='?src=\ref[src];endmod=1'>[pref.ENDMOD]</a><br>"
	. += "Vigilance:  <a href='?src=\ref[src];vigmod=1'>[pref.VIGMOD]</a><br>"
	. += "<br/>"
	. += "You have used [pref.WILMOD + pref.BIOMOD + pref.COGMOD + pref.MECMOD + pref.ROBMOD + pref.TGHMOD + pref.VIGMOD + round(pref.ENDMOD*5)] / 10 skill points"
	. = jointext(.,null)

/datum/category_item/player_setup_item/background/education/proc/calculatetotalpoints()
	return (pref.BIOMOD + pref.COGMOD + pref.MECMOD + pref.ROBMOD + pref.TGHMOD + pref.VIGMOD + pref.WILMOD + round(pref.ENDMOD*5))

/datum/category_item/player_setup_item/background/education/OnTopic(var/href,var/list/href_list, var/mob/user)
	if(href_list["biomod"])
		var/new_bio = 0
		new_bio = input(user, "Enter a value between -10 and 10 for your biology", CHARACTER_PREFERENCE_INPUT_TITLE, pref.BIOMOD) as num
		if(CanUseTopic(user))
			var/old_bio = pref.BIOMOD
			pref.BIOMOD = max(min(round(new_bio), 10), -10)
			if(calculatetotalpoints() > 10)
				pref.BIOMOD = old_bio
			return TOPIC_REFRESH

	else if(href_list["cogmod"])
		var/new_cog = 0
		new_cog = input(user, "Enter a value between -10 and 10 for your cognition.", CHARACTER_PREFERENCE_INPUT_TITLE, pref.COGMOD) as num
		if(CanUseTopic(user))
			var/old_cog = pref.COGMOD
			pref.COGMOD = max(min(round(new_cog),10),-10)
			if(calculatetotalpoints() > 10)
				pref.COGMOD = old_cog
			return TOPIC_REFRESH

	else if(href_list["mecmod"])
		var/new_mec = 0
		new_mec = input(user, "Enter a value between -10 and 10 for your mechanical.", CHARACTER_PREFERENCE_INPUT_TITLE, pref.MECMOD) as num
		if(CanUseTopic(user))
			var/old_mec = pref.MECMOD
			pref.MECMOD = max(min(round(new_mec), 10), -10)
			if(calculatetotalpoints() > 10)
				pref.MECMOD = old_mec
			return TOPIC_REFRESH

	else if(href_list["robmod"])
		var/new_rob = 0
		new_rob = input(user, "Enter a value between -10 and 10 for your robustness.", CHARACTER_PREFERENCE_INPUT_TITLE, pref.ROBMOD) as num
		if(CanUseTopic(user))
			var/old_rob = pref.ROBMOD
			pref.ROBMOD = max(min(round(new_rob), 10), -10)
			if(calculatetotalpoints() > 10)
				pref.ROBMOD = old_rob
			return TOPIC_REFRESH

	else if(href_list["tghmod"])
		var/new_tgh = 0
		new_tgh = input(user, "Enter a value between -10 and 10 for your toughness.", CHARACTER_PREFERENCE_INPUT_TITLE, pref.TGHMOD) as num
		if(CanUseTopic(user))
			var/old_tgh = pref.TGHMOD
			pref.TGHMOD = max(min(round(new_tgh), 100), -10)
			if(calculatetotalpoints() > 15)
				pref.TGHMOD = old_tgh
			return TOPIC_REFRESH

	else if(href_list["vigmod"])
		var/new_vig = 0
		new_vig = input(user, "Enter a value between -10 and 10 for your vigilance.", CHARACTER_PREFERENCE_INPUT_TITLE, pref.VIGMOD) as num
		if(CanUseTopic(user))
			var/old_vig = pref.VIGMOD
			pref.VIGMOD = max(min(round(new_vig), 10), -10)
			if(calculatetotalpoints() > 10)
				pref.VIGMOD = old_vig
			return TOPIC_REFRESH

	else if(href_list["wilmod"])
		var/new_wil = 0
		new_wil = input(user, "Enter a value between -10 and 10 for your willpower.", CHARACTER_PREFERENCE_INPUT_TITLE, pref.WILMOD) as num
		if(CanUseTopic(user))
			var/old_viv = pref.WILMOD
			pref.WILMOD = max(min(round(new_wil), 10), -10)
			if(calculatetotalpoints() > 10)
				pref.WILMOD = old_viv
			return TOPIC_REFRESH

	else if(href_list["endmod"])
		var/new_end = 0
		new_end = input(user, "Enter a value between -3 and 5 for your endurance  (Endurance 500% the cost of other stats).", CHARACTER_PREFERENCE_INPUT_TITLE, pref.ENDMOD) as num
		if(CanUseTopic(user))
			var/old_end = pref.ENDMOD
			pref.ENDMOD = max(min(round(new_end), 5), -3)
			if(calculatetotalpoints() > 10)
				pref.ENDMOD = old_end
			return TOPIC_REFRESH

	return ..()
