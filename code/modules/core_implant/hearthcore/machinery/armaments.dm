/datum/armament
	var/name = "Virtue of coding"
	var/desc = "God made it quite clear this should not exist, Perhaps inform those above."
	var/cost = 20
	var/min_cost = 10 //absolute minimum it should cost
	var/path = /obj/item/computer_hardware/hard_drive/portable/design/nt/textiles //path to spawn
	var/purchase_count = 0 //how many times its bought
	var/discount_increase = 5 //discount increase per purchase
	var/discount = 0 //total discount to apply to the cost
	var/max_discount = 0 //max amount of discounts
	var/rate_increase = 0 //rate increase per purchase
	var/max_rate_increase = 0 //max rate increase from buying this
	var/max_increase = 20 //increase of eotp max armament points per purchase

//modifiers in the future? maybe some rituals to reduce cost for certain subtype
/datum/armament/proc/get_cost()
	return max(min_cost, cost - discount)

/datum/armament/proc/purchase(var/mob/living/carbon/H)
	if (!eotp)
		error("No EOTP found to purchase from.")
		return FALSE
	if (get_dist(eotp.loc, H.loc) > 3)
		log_and_message_admins("[key_name(H)] tried to make a topic call out of range of the [eotp]")
		return FALSE

	if (!is_custodian_of_bonfire(H))
		to_chat(H, SPAN_DANGER("You do not understand how to use this."))
		return FALSE

	if (eotp.armaments_points < get_cost())
		to_chat(H, SPAN_DANGER("You lack the required amount of armament points."))
		return FALSE

	eotp.armaments_points -= get_cost()

	purchase_count++

	if (!max_discount)
		discount = discount + discount_increase
	else
		discount = min(max_discount, discount + discount_increase)


	if (purchase_count < 2)
		eotp.max_armaments_points += max_increase

	on_purchase(H)

	log_and_message_admins("[key_name(H)] has invoked [src.name]")
	return TRUE


//maybe buying buffs, blessings, miracles, etc instead of just items
/datum/armament/proc/on_purchase(var/mob/living/carbon/H)
	return


/obj/machinery/power/eotp/nano_ui_data(mob/user)
	var/list/data = list()
	var/list/listed_armaments = list()
	for(var/i=1 to armaments.len)
		var/datum/armament/A = armaments[i]
		listed_armaments.Add(list(list(
			"key" = i,
			"name" = strip_improper(A.name),
			"cost" = A.get_cost(),
			"desc" = A.desc)))
	data["armaments"] = listed_armaments
	return data


/obj/machinery/power/eotp/nano_ui_interact(mob/user, ui_key = "main", datum/nanoui/ui = null, force_open = NANOUI_FOCUS)
	var/list/data = nano_ui_data(user, ui_key)

	ui = SSnano.try_update_ui(user, eotp, ui_key, ui, data, force_open)
	if (!ui)
		// the ui does not exist, so we'll create a new() one
		// for a list of parameters and their descriptions see the code docs in \code\modules\nano\nanoui.dm
		ui = new(user, src, ui_key, "eopt.tmpl", "Will of the Protector", 550, 655)
		// when the ui is first opened this is the data it will use
		ui.set_initial_data(data)
		// open the new ui window
		ui.open()

/obj/machinery/power/eotp/Topic(href, href_list)
	if (href_list["chosen"])
		var/i = text2num(href_list["chosen"])
		var/datum/armament/A = eotp.armaments[i]
		A.purchase(usr)
		SSnano.update_uis(src)

//////////////////////Item summonings
/datum/armament/item
	name = "item summoning"
	desc = "item"
	path = /obj/item/book/lectures/hearthlantern

//Im really lazy, some one else can make fitting descriptions
/datum/armament/item/New()
	if (desc == initial(desc))
		var/obj/item/I = path
		var/text = initial(I.desc)
		if (text)
			desc = text

/datum/armament/item/on_purchase(mob/living/carbon/H)
	if (path)
		var/obj/_item = new path(get_turf(eotp))
		eotp.visible_message(SPAN_NOTICE("The [_item.name] appears out of bluespace near the [eotp]!"))

//TODO: Disks with custodian designs for actual NON-GUN weapons, perhaps ranged bows/crossbows?

/datum/armament/item/disk
	name = "disk"
	cost = 15
	discount_increase = 10
	min_cost = 5

/datum/armament/item/disk/New()
	if (desc == initial(desc))
		var/obj/item/computer_hardware/hard_drive/portable/design/D = path
		var/text = initial(D.disk_name)
		if (text)
			desc = text

/datum/armament/item/disk/hearthcore_upgrades
	name = "Hearthcore Upgrades Disk"
	cost = 70
	discount_increase = 5
	min_cost = 50
	path = /obj/item/computer_hardware/hard_drive/portable/design/nt/upgrades

// Personal shield. Only way to obtain, for now.
/datum/armament/item/sash
	name = "Shielding sash"
	cost = 100
	discount_increase = 5
	min_cost = 80
	path = /obj/item/shield_projector/line/custodian_aegis

/datum/armament/item/foog_armor
	name = "Foog Bloodline Armor"
	cost = 80
	min_cost = 80
	discount_increase = 0
	path = /obj/item/dog_armor

/datum/armament/item/granule_neuron
	name = "Infusive Granule Neuron"
	cost = 30
	min_cost = 20
	discount_increase = 5
	path = /obj/item/mold/granule_neuron

/datum/armament/item/renshaw_neuron
	name = "Infusive Renshaw Neuron"
	cost = 60
	min_cost = 40
	discount_increase = 5
	path = /obj/item/mold/renshaw_neuron

/datum/armament/item/cartwheel_neuron
	name = "Infusive Cartwheel Neuron"
	cost = 80
	min_cost = 60
	discount_increase = 5
	path = /obj/item/mold/cartwheel_neuron

