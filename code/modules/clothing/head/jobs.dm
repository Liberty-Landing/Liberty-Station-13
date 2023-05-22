//Bartender
/obj/item/clothing/head/rank/chef
	name = "chef's hat"
	desc = "It's a hat used by chefs to keep hair out of your food. Judging by the food in the mess, they don't work."
	icon_state = "chefhat"
	item_state = "chefhat"

//Cargo Tech
/obj/item/clothing/head/rank/cargosoft
	name = "skylight cap"
	desc = "A grey cap with the Skylight logo on it."
	icon_state = "cargosoft"

//Captain

/obj/item/clothing/head/rank/captain
	name = "secretary's hat"
	icon_state = "captain"
	desc = "It's good being the king."
	item_state_slots = list(
		slot_l_hand_str = "caphat",
		slot_r_hand_str = "caphat",
		)
	body_parts_covered = 0

/obj/item/clothing/head/rank/captain/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Secretary's Hat"] = "captain"
	options["Secretary's Cap"] = "capcap"
	options["Parade Hat"] = "officercap"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		to_chat(M, "You adjusted your attire's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

//Chaplain
/obj/item/clothing/head/rank/chaplain
	name = "chaplain's hood"
	desc = "It's hood that covers the head. It keeps you warm during the space winters."
	icon_state = "chaplain_hood"
	flags_inv = BLOCKHAIR
	body_parts_covered = HEAD

/obj/item/clothing/head/preacher
	name = "preacher hat"
	desc = "Useful for hiding disdainful eyes from the godless masses."
	icon_state = "church_hat"

//Mime
/obj/item/clothing/head/beret
	name = "red beret"
	desc = "A formidable red beret."
	icon_state = "beret"
	body_parts_covered = 0

/obj/item/clothing/head/beret/artist
	name = "Feathered Beret"
	desc = "Fit for artists, frenchmen, and eccentric military officers across the cosmos."
	icon_state = "beret_artist"
	item_state = "beret_artist"

/obj/item/clothing/head/beret/custom
	name = "Customized beret"
	desc = "An easily colored, plain beret. Classy!"
	icon_state = "beret_whiterim"

//Sprites by Michiyamenotehifunana and Occulist
/obj/item/clothing/head/beret/fashion
	name = "tan beret"
	desc = "A fashionable and colorful beret."
	icon_state = "beret-tan"

/obj/item/clothing/head/beret/fashion/grey
	name = "grey beret"
	icon_state = "beret-grey"

/obj/item/clothing/head/beret/fashion/pink
	name = "pink beret"
	icon_state = "beret-pink"

/obj/item/clothing/head/beret/fashion/red
	name = "red beret"
	icon_state = "beret-red"

/obj/item/clothing/head/beret/fashion/brown
	name = "brown beret"
	icon_state = "beret-brown"

/obj/item/clothing/head/beret/fashion/copper
	name = "copper beret"
	icon_state = "beret-copper"

/obj/item/clothing/head/beret/fashion/orange
	name = "orange beret"
	icon_state = "beret-orange"

/obj/item/clothing/head/beret/fashion/yellow
	name = "yellow beret"
	icon_state = "beret-yellow"

/obj/item/clothing/head/beret/fashion/lime
	name = "lime beret"
	icon_state = "beret-lime"

/obj/item/clothing/head/beret/fashion/cyan
	name = "cyan beret"
	icon_state = "beret-cyan"

/obj/item/clothing/head/beret/fashion/ice
	name = "ice beret"
	icon_state = "beret-ice"

/obj/item/clothing/head/beret/fashion/blue
	name = "blue beret"
	icon_state = "beret-blue"

/obj/item/clothing/head/beret/fashion/purple
	name = "purple beret"
	icon_state = "beret-purple"
//End of sprites by Michiyamenotehifunana and Occulist
//Security
/obj/item/clothing/head/rank/ironhammer
	name = "watchmen beret"
	desc = "A navy blue watchmen beret."
	icon_state = "policeberet"

/obj/item/clothing/head/rank/commander
	name = "deputy chief beret"
	desc = "A grey deputy chief beret signifying a command position."
	icon_state = "beret_navy_hos"

/obj/item/clothing/head/rank/commander/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["CD Beret"] = "beret_navy_hos"
	options["CD Cap"] = "watch_deputy"
	options["CD Default"] = "hoshat"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		item_state = options[choice]
		to_chat(M, "You adjusted your attire's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/head/rank/warden/beret
	name = "armorer beret"
	desc = "A red watchmen beret signifying a armoer position."
	icon_state = "beret_navy_warden"

/obj/item/clothing/head/rank/engineering
	name = "engineering beret"
	desc = "A yellow beret signifying a union mechanical technician position."
	icon_state = "beret_engineering"

/obj/item/clothing/head/beret/purple
	name = "purple beret"
	desc = "A rather stylish purple beret."
	icon_state = "beret_purple"

/obj/item/clothing/head/beret/black
	name = "black beret"
	desc = "A dark and imposing black beret."
	icon_state = "beretblack"

/obj/item/clothing/head/beret/german
	name = "brown beret"
	desc = "A light brown beret."
	icon_state = "germanberet"

/obj/item/clothing/head/seccap
	name = "blue patrol cap"
	desc = "A blue patrol cap worn by security personnel."
	icon_state = "sec2soft"

/obj/item/clothing/head/seccorp
	name = "black patrol cap"
	desc = "A black patrol cap worn by security personnel."
	icon_state = "corpsoft"

//Medical
/obj/item/clothing/head/surgery
	name = "blue surgical cap"
	desc = "A sterile blue surgical cap for medical operations."
	icon_state = "surgcap_blue"
	flags_inv = BLOCKHEADHAIR|HIDEEARS
	permeability_coefficient = 0.50

/obj/item/clothing/head/surgery/green
	name = "green surgical cap"
	desc = "A sterile green surgical cap for medical operations."
	icon_state = "surgcap_green"

/obj/item/clothing/head/rank/medical/beret
	name = "CAPSA beret"
	desc = "A beret in CAPSA colors, for ease of identification of medical personnel during crisis situations."
	icon_state = "beret_med"

/obj/item/clothing/head/rank/medical/beret/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Green Standard"] = "beret_med"
	options["White with cross"] = "beret_whitemed"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		item_state = options[choice]
		to_chat(M, "You adjusted your beret's style into [choice] color.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/head/ushanka/medical
	name = "CAPSA Medical Ushanka"
	desc = "A warm fur cap with a medical cross, in CAPSA colors. For the paramedics that perform triage in inclement weather conditions."
	icon_state = "ushanka_med"

/obj/item/clothing/head/rank/fatigue/green
	name = "green utility cover"
	desc = "A green camo cover, fit for a soldier. The markings of a removed patch linger."
	icon_state = "greenutility"
	item_state = "greenutility"

/obj/item/clothing/head/rank/fatigue
	name = "grey utility cover"
	desc = "A grey camo cover, fit for a soldier. The markings of a removed patch linger."
	icon_state = "greyutility"
	item_state = "greyutility"

/obj/item/clothing/head/rank/fatigue/navy
	name = "navy utility cover"
	desc = "A navy camo cover, fit for a soldier. The markings of a removed patch linger."
	icon_state = "navyutility"
	item_state = "navyutility"

/obj/item/clothing/head/rank/divisor
	name = "divisor cap"
	desc = "A styled black divisor cap for showing everyone you are so steadfast in the name of god you don't need a helmet."
	icon_state = "divisor_cap"
	item_state = "divisor_cap"

//Fontaine Logistics
/obj/item/clothing/head/helmet/shepherd
	name = "Field Shepherd helmet"
	desc = "A study, handcrafted helmet reinforced with lightweight material and an added line down its center, depicting that of a Shepherd; herding his employees."
	icon_state = "shepherd_visor"
	item_state = "shepherd_visor"
	matter = list(MATERIAL_PLASTEEL = 12, MATERIAL_PLASTIC = 10, MATERIAL_STEEL = 30, MATERIAL_SILVER = 12) //worth stealing
	price_tag = 1200
	armor_list = list(
		melee = 40,
		bullet = 30,
		energy = 30,
		bomb = 65,
		bio = 100,
		rad = 0
	)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|BLOCKHAIR
	body_parts_covered = HEAD|FACE|EARS
	action_button_name = "Toggle Headlamp"
	light_overlay = "technohelmet_light"
	brightness_on = 5 //Slightly better do to the sear costs
	obscuration = LIGHT_OBSCURATION

/obj/item/clothing/head/helmet/handmade/scavengerhelmet
	name = "Scavenged Helmet"
	desc = "A combat helmet with improved inner lining and protection against hazards, including a visor and additional alloy plates. \
			The drapes surrounding the neck area offer moderate protection against the cold as well."
	icon_state = "scav_helm"
	item_state = "scav_helm"
	armor_list = list(melee = 35, bullet = 20, energy = 25, bomb = 25, bio = 10, rad = 0)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|BLOCKHAIR
	body_parts_covered = HEAD|FACE|EARS
	cold_protection = HEAD|FACE|EARS
	min_cold_protection_temperature = T0C - 20
	price_tag = 200
	max_upgrades = 1
	action_button_name = "Toggle Headlamp"
	light_overlay = "technohelmet_light"
	brightness_on = 5
	obscuration = LIGHT_OBSCURATION

/obj/item/clothing/head/helmet/handmade/scavengerhelmet/fontaine
	name = "Shipbreaker helmet"
	desc = "A sleek and sturdy helmet in Fontaine colors. It's well balanced and sits low on your head, with padding on the inside."
	icon_state = "fontaine_visor"
	item_state = "fontaine_visor"

/obj/item/clothing/head/trapper
	name = "Trapper brimmed hat"
	desc = "A brimmed old-fashioned hat made out of animal skin, fleece lining, and furs. It doesn't offer much in the way of protection, but at least it's warm."
	icon_state = "trapper_hat"
	item_state = "trapper_hat"
	flags = THICKMATERIAL
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	siemens_coefficient = 0.9
	armor_list = list(melee = 20, bullet = 20, energy = 20, bomb = 35, bio = 75, rad = 35)

//Custodians

/obj/item/clothing/head/custodian
	name = "custodian hat base item"
	desc = "Not supposed to be seen in-game"
	icon_state = "oathbound_scarredhat"
	item_state = "oathbound_scarredhat"
	armor_list = list(melee = 20, bullet = 15, energy = 15, bomb = 15, bio = 100, rad = 0)
	matter = list(MATERIAL_BIO_SILK = 3)

/obj/item/clothing/head/custodian/oathbound
	name = "oathbound scarred hat"
	desc = "A scarred hat given to the Oathbound."
	icon_state = "oathbound_scarredhat"
	item_state = "oathbound_scarredhat"

/obj/item/clothing/head/custodian/enkindled
	name = "enkindled tophat"
	desc = "A soft but durable top hat given to Enkindled."
	icon_state = "enkindled_tophat"
	item_state = "enkindled_tophat"

/obj/item/clothing/head/custodian/forgemaster
	name = "forgemaster tricorn"
	desc = "A comfortable tricorn hat given to Forgemasters."
	icon_state = "forgemaster_tricorn"
	item_state = "forgemaster_tricorn"

/obj/item/clothing/head/custodian/oathpledge
	name = "oathpledge hat"
	desc = "A wide-brim hat given to the Oathpledge."
	icon_state = "oathpledge_hat"
	item_state = "oathpledge_hat"
