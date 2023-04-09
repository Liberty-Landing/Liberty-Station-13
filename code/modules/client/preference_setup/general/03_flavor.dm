/datum/preferences
	var/flavor_text
	var/ooc_text
	var/list/flavour_texts_robot = list()

/datum/category_item/player_setup_item/physical/flavor
	name = "Flavor"
	sort_order = 3

/datum/category_item/player_setup_item/physical/flavor/load_character(var/savefile/S)
	from_file(S["flavor_text"], pref.flavor_text)
	from_file(S["ooc_text"], pref.ooc_text)

/datum/category_item/player_setup_item/physical/flavor/save_character(var/savefile/S)
	to_file(S["flavor_text"], pref.flavor_text)
	to_file(S["ooc_text"], pref.ooc_text)

/datum/category_item/player_setup_item/physical/flavor/sanitize_character()
	if(!pref.flavor_text)
		pref.flavor_text = ""
	if(!istype(pref.flavour_texts_robot))
		pref.flavour_texts_robot = list()

/datum/category_item/player_setup_item/physical/flavor/content(var/mob/user)
	. = list()
	. += "<b>Flavor:</b><br>"
	. += "<a href='?src=\ref[src];flavor_text=open'>Set Flavor Text</a><br/>"
	. += "<a href='?src=\ref[src];ooc_text=open'>Set OOC Notes</a><br/>"
	. += "<a href='?src=\ref[src];flavour_text_robot=open'>Set Robot Flavor Text</a><br/>"
	return jointext(.,null)

/datum/category_item/player_setup_item/physical/flavor/OnTopic(var/href,var/list/href_list, var/mob/user)
	if(href_list["flavor_text"] && href_list["flavor_text"] == "open")
		var/msg = sanitize(input(usr,"Give a general description of your character. This will be shown regardless of clothing.","Flavor Text", html_decode(pref.flavor_text)) as message|null, extra = 0)
		if(CanUseTopic(user))
			if(msg)
				pref.flavor_text = msg
		return TOPIC_HANDLED

	if(href_list["ooc_text"] && href_list["ooc_text"] == "open")
		var/msg = sanitize(input(usr,"Enter your OOC preferences. This will be shown regardless of clothing.","OOC Notes", html_decode(pref.ooc_text)) as message|null, extra = 0)
		if(CanUseTopic(user))
			if(msg)
				pref.ooc_text = msg
		return TOPIC_HANDLED

	return ..()
