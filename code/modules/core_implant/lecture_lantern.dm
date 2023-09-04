/obj/item/book/lectures
	name = "Hearth Lantern"
	desc = "Used to channel radiance into lectures."
	icon = 'icons/obj/custodians_melee.dmi'
	icon_state = "hearth_lantern"
	item_state = "hearth_lantern"
	var/has_reference = FALSE
	slot_flags = SLOT_BELT
	var/expanded_group = null
	var/current_category = "Common"
	var/reference_mode = FALSE

/obj/item/book/lectures/New()
	..()
	set_light(5, 2, COLOR_LIGHTING_CUSTODIANS_BRIGHT)

/obj/item/book/lectures/attack_self(mob/living/carbon/human/H)
	playsound(src.loc, 'sound/items/hearthcorelantern.ogg', rand(40,80), 1)
	interact(H)

/obj/item/book/lectures/nano_ui_data(mob/user)
	var/obj/item/implant/core_implant/hearthcore/CI
	if(isliving(user))
		var/mob/living/L = user
		CI = L.get_core_implant(/obj/item/implant/core_implant/hearthcore)

	var/list/data = list(
		"refmode" = reference_mode,
		"hasref" = has_reference
	)

	if(!CI)
		data["noimplant"] = TRUE
		return data

	var/list/lecture_data = list()
	var/list/category_data = list()

	for(var/RT in CI.known_lectures)
		var/datum/lecture/R = GLOB.all_lectures[RT]

		if(!(R.category in category_data))
			category_data.Add(R.category)

		if(current_category != "" && current_category != R.category)
			continue

		if(R.phrase)
			var/list/L = list(
				"name" = capitalize(R.name),
				"desc" = R.desc,
				"type" = "[RT]",
				"power" = R.power,
			)

			if(istype(R, /datum/lecture/group))
				L["group"] = TRUE

				var/datum/lecture/group/GR = R
				var/list/P = list()
				for(var/i = 1; i <= GR.phrases.len; i++)
					P.Add(list(list("ind" = i, "phrase" = GR.phrases[i], "type" = "[RT]")))

				L["phrases"] = P

			else
				L["group"] = FALSE
				L["phrase"] = R.get_display_phrase()

			lecture_data.Add(list(L))

	data["lectures"] = lecture_data
	data["categories"] = category_data

	data["firstcat"] = ""
	if(category_data.len)
		data["firstcat"] = category_data[1]

	data["currcat"] = current_category
	data["currexp"] = expanded_group

	return data


/obj/item/book/lectures/nano_ui_interact(mob/user, ui_key = "main", datum/nanoui/ui = null, force_open = NANOUI_FOCUS)
	var/list/data = nano_ui_data(user, ui_key)

	ui = SSnano.try_update_ui(user, src, ui_key, ui, data, force_open)
	if (!ui)
		// the ui does not exist, so we'll create a new() one
		// for a list of parameters and their descriptions see the code docs in \code\modules\nano\nanoui.dm
		ui = new(user, src, ui_key, "bonfire_lantern.tmpl", "Lantern", 550, 655)
		// when the ui is first opened this is the data it will use
		ui.set_initial_data(data)
		// open the new ui window
		ui.open()


/obj/item/book/lectures/interact(mob/living/carbon/human/H)
	nano_ui_interact(H)


/obj/item/book/lectures/Topic(href, href_list)
	if(!ishuman(usr))
		return
	var/mob/living/carbon/human/H = usr
	if(H.stat)
		return

	var/obj/item/implant/core_implant/hearthcore/CI = H.get_core_implant(/obj/item/implant/core_implant/hearthcore)

	if(href_list["set_category"])
		current_category = href_list["set_category"]

	if(href_list["unfold"])
		expanded_group = href_list["unfold"]

	if(href_list["say"] || href_list["say_group"])
		var/incantation = ""
		if(!CI)
			return

		for(var/RT in CI.known_lectures)

			if("[RT]" == href_list["say"])
				var/datum/lecture/R = GLOB.all_lectures[RT]
				incantation = R.get_say_phrase()
				break
			if("[RT]" == href_list["say_group"])
				var/ind = text2num(href_list["say_id"])
				var/datum/lecture/group/R = GLOB.all_lectures[RT]
				incantation = R.get_group_say_phrase(ind)
				break
		if (incantation != "")
			//Speaking a long phrase takes a little time
			if (do_after(H, length(incantation)*0.25))
				H.say(incantation)
	return TRUE
