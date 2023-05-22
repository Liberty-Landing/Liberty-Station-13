/*
	Excelsior Stashes:
	Contain a wide variety of excelsior gear, allowing people to organically find them and join the cause
	Also useful to established excelsior for more stuff
*/
/datum/stash/excelsior
	base_type = /datum/stash/excelsior
	loot_type = "Revolutionary"
	nonmaint_reroll = 100
	contents_list_base = list(/obj/item/circuitboard/excelsiorautolathe = 1,
	 /obj/item/circuitboard/excelsior_teleporter = 1)

	contents_list_random = list(/obj/item/soap/commie = 80,
	/obj/item/clothing/suit/space/void/excelsior = 70,
	/obj/item/gun/projectile/automatic/ak47 = 3,
	/obj/item/computer_hardware/hard_drive/portable/design/guns/ex_ak = 30,
	/obj/item/gun/projectile/makarov = 5,
	/obj/item/computer_hardware/hard_drive/portable/design/guns/ex_makarov = 50,
	/obj/item/ammo_magazine/light_rifle_257 = 50,
	/obj/item/ammo_magazine/light_rifle_257 = 50,
	/obj/item/stock_parts/capacitor/excelsior = 70,
	/obj/item/stock_parts/scanning_module/excelsior = 70,
	/obj/item/stock_parts/manipulator/excelsior = 70,
	/obj/item/stock_parts/micro_laser/excelsior = 70,
	/obj/item/stock_parts/matter_bin/excelsior = 70,
	/obj/item/cell/large/excelsior = 60,
	/obj/item/cell/medium/excelsior = 60,
	/obj/item/cell/small/excelsior = 60,)
	weight = 0.5

/datum/stash/excelsior/shipyard
	lore = "Our attempts at infiltrating the colony are underway.<br>\
	Legionary, secure this cachebefore it is found by chance. Its location is %D"

/datum/stash/excelsior/legacy
	directions = DIRECTION_IMAGE
	contents_list_external = list(/obj/item/remains/human = 1)//He died near his stash
	lore = "Legionary, the equipment has been concealed aboard this colony by a prior agent.<br>\
	He was insufficiently capable to complete his tank, although loyal enough to conceal it at the cost of his life.<br>\
	Seek out our cache and hope it has not been discovered. The last visual capture received over his radio places it here.<br>\
	%D"

/datum/stash/excelsior/lastmessage
	lore = "Brothers, I have been discovered before beginning my mission.<br>\
	My misfortune is nothing in the scheme of our progress.<br>\
	The cache remains at %D with all of the required tools still there for your use.<br>\
	Send my regards to the Captain and I hope to take out a few pigs out."

/datum/stash/excelsior/lastmessage
	lore = "Some months ago a legionary was entrusted to establish a spy network aboard this colony, but she has not reported success.<br>\
	It appears the deployment made her forget her loyalities, and so she was dispatched by another agent.<br>\
	Her cache, however, remained undetected. Proceed to %D and collect it, recalling for yourself the price of disloyalty."
