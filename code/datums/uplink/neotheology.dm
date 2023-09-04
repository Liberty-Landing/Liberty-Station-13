/*******************************
* NeoTheology: Religious items *
*******************************/
/*
Intended for inquisitors and maybe future crusaders
A small pool of thematically appropriate religious items that are generally cheaper than conventional equivilants
*/


//Lets make sure only appropriately ranked NT Church members can see this category
//We do this by setting canview conditions on the individual items like this.
//These are checked by the category, and also in other places
/datum/uplink_item/item/neotheology/can_view(obj/item/device/uplink/U)
	if (!U || !U.uplink_owner || !U.uplink_owner.current)
		return FALSE

	//Get the mob and their hearthcore implant
	var/mob/living/L = U.uplink_owner.current
	var/obj/item/implant/core_implant/hearthcore/C = L.get_core_implant(/obj/item/implant/core_implant/hearthcore)

	if (!C)
		return FALSE

	return FALSE



/datum/uplink_item/item/neotheology
	category = /datum/uplink_category/neotheology

//A single blank hearthcore implant, nothing special about it. Useful for field baptism
/datum/uplink_item/item/neotheology/cruciform
	name = "Hearthcore Implant"
	item_cost = 1
	path = /obj/item/implant/core_implant/hearthcore


//A lantern for lectures, for if you lose your own. Note that all books are the same, the lectures are stored in the hearthcore implant
/datum/uplink_item/item/neotheology/bible
	name = "Hearthcore Lantern"
	item_cost = 1
	path = /obj/item/book/lectures/hearthlantern


/datum/uplink_item/item/neotheology/coat
	name = "Preacher Coat"
	item_cost = 3
	path = /obj/item/clothing/suit/storage/chaplain
