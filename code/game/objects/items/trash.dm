//Items labled as 'trash' for the trash bag.
//TODO: Make this an item var or something...

/obj/item/trash
	name = "trash"
	desc = "This is rubbish."
	icon = 'icons/obj/trash.dmi'
	w_class = ITEM_SIZE_SMALL
	matter = list(MATERIAL_PLASTIC = 1)
	preloaded_reagents = list("plasticide" = 4)

/obj/item/trash/attack(mob/M, mob/living/user)
	return

/obj/item/trash/raisins
	name = "empty raisins packet"
	desc = "An empty packet of raisins. Trash."
	icon_state= "4no_raisins"

/obj/item/trash/candy
	name = "candy bar wrapper"
	desc = "An empty candy bar wrapper. Trash."
	icon_state= "candy"

/obj/item/trash/spacetwinkie
	name = "twinkie wrapper"
	desc = "An empty candy bar wrapper not even a bit of filling stuck inside. Trash."
	icon_state= "space_twinkie" //Sprite by Michiyamenotehifunana

/obj/item/trash/candy/proteinbar
	name = "protein bar wrapper"
	desc = "An empty protein bar wrapper. Trash."
	icon_state = "proteinbar"

/obj/item/trash/cheesie
	name = "empty cheesie honkers packet"
	desc = "An empty packet of chips. Trash."
	icon_state = "cheesie_honkers"

/obj/item/trash/chips
	name = "empty chips packet"
	desc = "An empty packet of chips. Trash."
	icon_state = "chips"

/obj/item/trash/chips_green
	name = "empty chips packet"
	desc = "An empty packet of chips. Trash."
	icon_state = "lays_green"

/obj/item/trash/chips
	name = "empty chips packet"
	desc = "An empty packet of chips. Trash."
	icon_state = "lays"

/obj/item/trash/gamerchips
	name = "empty crips packet"
	desc = "An empty packet of boritos crips. Trash."
	icon_state = "boritos"

/obj/item/trash/popcorn
	name = "empty popcorn packet"
	desc = "An empty packet of popcorn. Trash."
	icon_state = "popcorn"

/obj/item/trash/sosjerky
	name = "empty jerky packet"
	desc = "An empty packet of jerky. Trash."
	icon_state = "sosjerky"

/obj/item/trash/syndi_cakes
	name = "empty cakes packet"
	desc = "An empty box of syndi cakes.Trash."
	icon_state = "syndi_cakes" //Sprite by Michiyamenotehifunana

/obj/item/trash/waffles
	name = "dirty tray"
	desc = "An empty, dirty tray. Trash."
	icon_state = "waffles"

/obj/item/trash/grease
	name = "greasy tray"
	desc = "An empty tray, with stains of something greasy on it. Trash."
	icon_state = "grease"

/obj/item/trash/pistachios
	name = "empty pistachios pack"
	desc = "An empty packet of pistachios. Trash."
	icon_state = "pistachios_pack"

/obj/item/trash/semki
	name = "empty semki pack"
	desc = "An empty packet of semki. Trash."
	icon_state = "semki_pack"

/obj/item/trash/plate
	name = "plate"
	desc = "An empty plate."
	icon_state = "plate"
	matter = list(MATERIAL_GLASS = 1)

/obj/item/trash/snack_bowl
	name = "snack bowl"
	desc = "An empty snack bowl."
	icon_state	= "snack_bowl"
	matter = list(MATERIAL_GLASS = 1)

/obj/item/trash/tray
	name = "tray"
	desc = "An empty tray."
	icon_state = "tray"
	matter = list(MATERIAL_STEEL = 1)

/obj/item/trash/candle
	name = "candle"
	desc = "The burnt out remnants of a candle. Trash."
	icon = 'icons/obj/candle.dmi'
	icon_state = "candle4"

/obj/item/trash/liquidfood
	name = "empty liquid food ration"
	desc = "An empty ration packet. Trash."
	icon_state = "liquidfood" //Sprite by Michiyamenotehifunana

/obj/item/trash/tastybread
	name = "empty bread tube"
	desc = "An empty bread tube. Trash."
	icon_state = "tastybread" //Sprite by Michiyamenotehifunana

/obj/item/trash/mre
	name = "empty mre"
	icon_state = "mre_trash"

/obj/item/trash/mre/alt
	name = "empty mre"
	icon_state = "wok"
	matter = list(MATERIAL_CARDBOARD = 1)

/obj/item/trash/mre_paste
	name = "empty nutrient paste"
	icon_state = "paste_trash"

/obj/item/trash/mre_candy
	name = "empty candy"
	icon_state = "mre_candy_trash"

/obj/item/trash/mre_shokoladka
	name = "empty shokoladka candy"
	icon_state = "shokoladka"

/obj/item/trash/mre_dalococh
	name = "empty dalococh candy"
	icon_state = "dalococh"

/obj/item/trash/mre_can
	name = "empty ration can"
	icon_state = "ration_can_trash"

/obj/item/trash/energybar
	name = "empty energy candy packet"
	desc = "An empty packet of energy candy. Trash."
	icon_state= "energybar"

/obj/item/trash/peachcan
	name = "empty peach can"
	desc = "An empty can of peaches. Trash."
	icon_state= "peachcan"

/obj/item/trash/icecreambowl
	name = "empty icecream bowl"
	desc = "This used to hold icecream on it, it has even been licked clean!"
	icon_state = "icecreambowl"
	matter = list(MATERIAL_GLASS = 1) // It is, after all, made of glass

/obj/item/trash/selfheat_coffee
	name = "empty self-heating coffee"
	desc = "A crushed up can whose self-heating mechanism is spent. The faint smell of coffee still lingers inside."
	icon_state = "selfheat_coffee"

/obj/item/trash/mre/os
	name = "gray cardboard takeout container"
	desc = "A generic takeout container made of cardboard. Trash."
	icon_state= "os_wok"
	matter = list(MATERIAL_CARDBOARD = 1)

/obj/item/trash/os_wrapper
	name = "plastic wrapper"
	desc = "A thick plastic wrapper from something. Trash."
	icon_state= "os_wrapper"

/obj/item/trash/os_soypack
	name = "used liquid pack"
	desc = "A gray plastic liquid pack without any contents. Trash."
	icon_state= "os_soy"

/obj/item/trash/os_coco_wrapper
	name = "candy wrapper"
	desc = "A plastic wrapper for candy. Trash."
	icon_state= "os_coco_wrapper"

/obj/item/trash/os_paste_empty
	name = "empty plastic tube"
	desc = "A plastic tube devoid of contents. Trash."
	icon_state= "os_paste_empty"
