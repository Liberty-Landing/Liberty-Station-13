/obj/item/book/lectures/hearthlantern
	name = "Knight hearth lantern"
	desc = "A lantern bestowed to all knights who have embraced the accolade. The radiance-infused fire within the lantern serves as both a teacher and purifier, as long as the knight reflects upon it."
	icon_state = "hearth_lantern"
	item_state = "hearth_lantern"
	w_class = ITEM_SIZE_SMALL
	slot_flags = SLOT_BELT
	price_tag = 150
	tool_qualities = list(QUALITY_PURIFY = 25)
	matter = list(MATERIAL_SILVER = 2, MATERIAL_ALUMINIUM = 5)

/obj/item/book/lectures/hearthlantern/nano_ui_interact(mob/user, ui_key = "main", datum/nanoui/ui = null, force_open = NANOUI_FOCUS)
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


/obj/item/book/lectures/hearthlantern/oathpledge
	name = "Oathpledge hearth lantern"
	desc = "The lantern of custodian veterans, just as efficient as teaching as any other hearth lantern - but storing way more radiance, allowing best outcomes from purification expeditions."
	icon_state = "hearth_lantern_oathpledge"
	item_state = "hearth_lantern_oathpledge"
	price_tag = 250
	slot_flags = SLOT_BELT
	tool_qualities = list(QUALITY_PURIFY = 40)
	matter = list(MATERIAL_SILVER = 5, MATERIAL_ALUMINIUM = 5)

