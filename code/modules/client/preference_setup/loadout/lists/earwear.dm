// Stuff worn on the ears. Items here go in the "ears" sort_category but they must not use
// the slot_r_ear or slot_l_ear as the slot, or else players will spawn with no headset.
/datum/gear/ears
	display_name = "earmuffs"
	path = /obj/item/clothing/ears/earmuffs
	sort_category = "Earwear"
	cost = 0

/datum/gear/ears/pin
	display_name = "ear accesories"
	path = /obj/item/clothing/head/pin/ear_pin
	flags = GEAR_HAS_TYPE_SELECTION | GEAR_HAS_COLOR_SELECTION
