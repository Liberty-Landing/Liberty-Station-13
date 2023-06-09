
/obj/item/plantspray
	icon = 'icons/obj/hydroponics_machines.dmi'
	item_state = "spray"
	flags = NOBLUDGEON
	slot_flags = SLOT_BELT
	throwforce = 4
	w_class = ITEM_SIZE_SMALL
	throw_speed = 2
	throw_range = 10
	var/toxicity = 4
	var/pest_kill_str = 0
	var/weed_kill_str = 0

/obj/item/plantspray/water
	name = "Spring Water"
	desc = "A healthy mix of rainwater and needed E-Z-Nutrient for plant survival in enclosed spaces. Do not drink!"
	icon_state = "spring_water"
	toxicity = -5 //Heals plants that are toxic basiclly
	price_tag = 15


/obj/item/plantspray/weeds // -- Skie
	name = "weed-spray"
	desc = "It's a toxic mixture, in spray form, to kill small weeds."
	icon_state = "weedspray"
	weed_kill_str = 6
	price_tag = 5

/obj/item/plantspray/pests
	name = "pest-spray"
	desc = "It's some pest eliminator spray! <I>Do not inhale!</I>"
	icon_state = "pestspray"
	pest_kill_str = 6
	price_tag = 15

/obj/item/plantspray/pests/old
	name = "bottle of pestkiller"
	icon = 'icons/obj/chemical.dmi'
	icon_state = "bottle16"
	price_tag = 15

/obj/item/plantspray/pests/old/carbaryl
	name = "bottle of carbaryl"
	icon_state = "bottle16"
	toxicity = 4
	pest_kill_str = 2
	price_tag = 15

/obj/item/plantspray/pests/old/lindane
	name = "bottle of lindane"
	icon_state = "bottle18"
	toxicity = 6
	pest_kill_str = 4
	price_tag = 15

/obj/item/plantspray/pests/old/phosmet
	name = "bottle of phosmet"
	icon_state = "bottle15"
	toxicity = 8
	pest_kill_str = 7
	price_tag = 15

// *************************************
// Weedkiller defines for hydroponics
// *************************************

/obj/item/weedkiller
	name = "bottle of weedkiller"
	icon = 'icons/obj/chemical.dmi'
	icon_state = "bottle16"
	var/toxicity = 0
	var/weed_kill_str = 0
	price_tag = 20

/obj/item/weedkiller/triclopyr
	name = "bottle of glyphosate"
	icon = 'icons/obj/chemical.dmi'
	icon_state = "bottle16"
	toxicity = 4
	weed_kill_str = 2
	price_tag = 20

/obj/item/weedkiller/lindane
	name = "bottle of triclopyr"
	icon = 'icons/obj/chemical.dmi'
	icon_state = "bottle18"
	toxicity = 6
	weed_kill_str = 4
	price_tag = 20

/obj/item/weedkiller/D24
	name = "bottle of 2,4-D"
	icon = 'icons/obj/chemical.dmi'
	icon_state = "bottle15"
	toxicity = 8
	weed_kill_str = 7
	price_tag = 20

// *************************************
// Nutrient defines for hydroponics
// *************************************

/obj/item/reagent_containers/glass/fertilizer
	name = "fertilizer bottle"
	desc = "A small glass bottle. Can hold up to 60 units."
	icon_state = "bottle16"
	possible_transfer_amounts = list(2,4,6,8,10)
	w_class = ITEM_SIZE_SMALL
	amount_per_transfer_from_this = 2
	volume = 60

/obj/item/reagent_containers/glass/fertilizer/Initialize()
	. = ..()
	src.pixel_x = rand(-5.0, 5)
	src.pixel_y = rand(-5.0, 5)


/obj/item/reagent_containers/glass/fertilizer/ez
	name = "bottle of E-Z-Nutrient"
	icon_state = "bottle16"
	preloaded_reagents = list("eznutrient" = 60)

/obj/item/reagent_containers/glass/fertilizer/l4z
	name = "bottle of Left 4 Zed"
	icon_state = "bottle18"
	preloaded_reagents = list("left4zed" = 60)

/obj/item/reagent_containers/glass/fertilizer/rh
	name = "bottle of Robust Harvest"
	icon_state = "bottle15"
	preloaded_reagents = list("robustharvest" = 60)
