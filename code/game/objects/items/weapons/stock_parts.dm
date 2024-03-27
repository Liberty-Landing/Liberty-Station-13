/obj/item/stock_parts
	name = "stock part"
	desc = "What?"
	gender = PLURAL
	icon = 'icons/obj/stock_parts.dmi'
	w_class = ITEM_SIZE_SMALL
	price_tag = 100
	var/rating = 1

/obj/item/stock_parts/New()
	src.pixel_x = rand(-5.0, 5)
	src.pixel_y = rand(-5.0, 5)
	..()

/obj/item/stock_parts/get_item_cost(export)
	. = ..() * rating

//Rank 1

/obj/item/stock_parts/console_screen
	name = "console screen"
	desc = "Used in the construction of computers and other devices with a interactive console."
	icon_state = "screen"
	origin_tech = list(TECH_MATERIAL = 1)
	matter = list(MATERIAL_GLASS = 3)
	price_tag = 30

/obj/item/stock_parts/capacitor
	name = "capacitor"
	desc = "A basic capacitor used in the construction of a variety of devices."
	icon_state = "capacitor"
	origin_tech = list(TECH_POWER = 1)
	matter = list(MATERIAL_ALUMINIUM = 1, MATERIAL_PLASTIC = 1, MATERIAL_GLASS = 1)
	price_tag = 30

/obj/item/stock_parts/scanning_module
	name = "scanning module"
	desc = "A compact, high resolution scanning module used in the construction of certain devices."
	icon_state = "scan_module"
	origin_tech = list(TECH_MAGNET = 1)
	matter = list(MATERIAL_ALUMINIUM = 1, MATERIAL_PLASTIC = 1, MATERIAL_GLASS = 1)
	price_tag = 30

/obj/item/stock_parts/manipulator
	name = "micro-manipulator"
	desc = "A tiny little manipulator used in the construction of certain devices."
	icon_state = "micro_mani"
	origin_tech = list(TECH_MATERIAL = 1, TECH_DATA = 1)
	matter = list(MATERIAL_ALUMINIUM = 1, MATERIAL_PLASTIC = 1)
	price_tag = 30

/obj/item/stock_parts/micro_laser
	name = "micro-laser"
	desc = "A tiny laser used in certain devices."
	icon_state = "micro_laser"
	origin_tech = list(TECH_MAGNET = 1)
	matter = list(MATERIAL_ALUMINIUM = 2, MATERIAL_PLASTIC = 2, MATERIAL_GLASS = 1)
	price_tag = 30

/obj/item/stock_parts/matter_bin
	name = "matter bin"
	desc = "A container for hold compressed matter awaiting re-construction."
	icon_state = "matter_bin"
	origin_tech = list(TECH_MATERIAL = 1)
	matter = list(MATERIAL_PLASTIC = 2, MATERIAL_GLASS = 1)
	price_tag = 30

//Rank 2

/obj/item/stock_parts/capacitor/adv
	name = "advanced capacitor"
	desc = "An advanced capacitor used in the construction of a variety of devices."
	icon_state = "adv_capacitor"
	origin_tech = list(TECH_POWER = 3)
	rating = 2
	matter = list(MATERIAL_ALUMINIUM = 1, MATERIAL_PLASTIC = 1, MATERIAL_GLASS = 1)
	price_tag = 30

/obj/item/stock_parts/scanning_module/adv
	name = "advanced scanning module"
	desc = "A compact, high resolution scanning module used in the construction of certain devices."
	icon_state = "adv_scan_module"
	origin_tech = list(TECH_MAGNET = 3)
	rating = 2
	matter = list(MATERIAL_ALUMINIUM = 1, MATERIAL_PLASTIC = 1, MATERIAL_GLASS = 1)
	price_tag = 30

/obj/item/stock_parts/manipulator/nano
	name = "nano-manipulator"
	desc = "A tiny little manipulator used in the construction of certain devices."
	icon_state = "nano_mani"
	origin_tech = list(TECH_MATERIAL = 3, TECH_DATA = 2)
	rating = 2
	matter = list(MATERIAL_ALUMINIUM = 1, MATERIAL_PLASTIC = 1)
	price_tag = 30

/obj/item/stock_parts/micro_laser/high
	name = "high-power micro-laser"
	desc = "A tiny laser used in certain devices."
	icon_state = "high_micro_laser"
	origin_tech = list(TECH_MAGNET = 3)
	rating = 2
	matter = list(MATERIAL_ALUMINIUM = 1, MATERIAL_PLASTIC = 1, MATERIAL_GLASS = 1)
	price_tag = 30

/obj/item/stock_parts/matter_bin/adv
	name = "advanced matter bin"
	desc = "A container for hold compressed matter awaiting re-construction."
	icon_state = "advanced_matter_bin"
	origin_tech = list(TECH_MATERIAL = 3)
	rating = 2
	matter = list(MATERIAL_PLASTIC = 2, MATERIAL_GLASS = 1)
	price_tag = 30

//Rating 3

/obj/item/stock_parts/capacitor/super
	name = "super capacitor"
	desc = "A super-high capacity capacitor used in the construction of a variety of devices."
	icon_state = "super_capacitor"
	origin_tech = list(TECH_POWER = 5, TECH_MATERIAL = 4)
	rating = 3
	matter = list(MATERIAL_ALUMINIUM = 2, MATERIAL_PLASTIC = 2, MATERIAL_GLASS = 1)
	price_tag = 35

/obj/item/stock_parts/scanning_module/phasic
	name = "phasic scanning module"
	desc = "A compact, high resolution phasic scanning module used in the construction of certain devices."
	icon_state = "super_scan_module"
	origin_tech = list(TECH_MAGNET = 5)
	rating = 3
	matter = list(MATERIAL_ALUMINIUM = 2, MATERIAL_PLASTIC = 2, MATERIAL_GLASS = 1)
	price_tag = 35

/obj/item/stock_parts/manipulator/pico
	name = "pico-manipulator"
	desc = "A tiny little manipulator used in the construction of certain devices."
	icon_state = "pico_mani"
	origin_tech = list(TECH_MATERIAL = 5, TECH_DATA = 2)
	rating = 3
	matter = list(MATERIAL_ALUMINIUM = 2, MATERIAL_PLASTIC = 2)
	price_tag = 35

/obj/item/stock_parts/micro_laser/ultra
	name = "ultra-high-power micro-laser"
	icon_state = "ultra_high_micro_laser"
	desc = "A tiny laser used in certain devices."
	origin_tech = list(TECH_MAGNET = 5)
	rating = 3
	matter = list(MATERIAL_ALUMINIUM = 2, MATERIAL_PLASTIC = 2, MATERIAL_GLASS = 1)
	price_tag = 35

/obj/item/stock_parts/matter_bin/super
	name = "super matter bin"
	desc = "A container for hold compressed matter awaiting re-construction."
	icon_state = "super_matter_bin"
	origin_tech = list(TECH_MATERIAL = 5)
	rating = 3
	matter = list(MATERIAL_PLASTIC = 3, MATERIAL_GLASS = 1)
	price_tag = 35

//Simulacrum positronic stock parts (rating 4)

/obj/item/stock_parts/capacitor/one_star
	name = "Simulacrum Robotics capacitor"
	desc = "A super-high capacity capacitor used in the construction of a variety of devices."
	icon_state = "one_capacitor"
	origin_tech = list(TECH_POWER = 7, TECH_MATERIAL = 7)
	rating = 4
	matter = list(MATERIAL_ALUMINIUM = 2, MATERIAL_PLASTIC = 2, MATERIAL_GLASS = 1, MATERIAL_TITANIUMRTC = 2)
	price_tag = 40

/obj/item/stock_parts/scanning_module/one_star
	name = "Simulacrum Robotics scanning module"
	desc = "A compact, high resolution phasic scanning module used in the construction of certain devices."
	icon_state = "one_scan_module"
	origin_tech = list(TECH_MAGNET = 7)
	rating = 4
	matter = list(MATERIAL_ALUMINIUM = 2, MATERIAL_PLASTIC = 2, MATERIAL_GLASS = 1, MATERIAL_TITANIUMRTC = 2)
	price_tag = 40

/obj/item/stock_parts/manipulator/one_star
	name = "Simulacrum Robotics manipulator"
	desc = "A tiny little manipulator used in the construction of certain devices."
	icon_state = "one_mani"
	origin_tech = list(TECH_MATERIAL = 7, TECH_DATA = 6)
	rating = 4
	matter = list(MATERIAL_ALUMINIUM = 2, MATERIAL_PLASTIC = 2, MATERIAL_TITANIUMRTC = 2)
	price_tag = 40

/obj/item/stock_parts/micro_laser/one_star
	name = "Simulacrum Robotics micro-laser"
	icon_state = "one_laser"
	desc = "A tiny laser used in certain devices."
	origin_tech = list(TECH_MAGNET = 7)
	rating = 4
	matter = list(MATERIAL_ALUMINIUM = 2, MATERIAL_PLASTIC = 2, MATERIAL_GLASS = 1, MATERIAL_TITANIUMRTC = 2)
	price_tag = 40

/obj/item/stock_parts/matter_bin/one_star
	name = "Simulacrum Robotics matter bin"
	desc = "A container for hold compressed matter awaiting re-construction."
	icon_state = "one_matter"
	origin_tech = list(TECH_MATERIAL = 7)
	rating = 4
	matter = list(MATERIAL_PLASTIC = 3, MATERIAL_GLASS = 1, MATERIAL_TITANIUMRTC = 2)
	price_tag = 40

//PIRS stock parts (rating 4) - DO NOT USE THESE. MAKE THEM CRAFT THEM.
/obj/item/stock_parts/capacitor/guild
	name = "ultra capacitor"
	desc = "A PIRS tinkered super-high capacity capacitor used in the construction of a variety of devices."
	icon_state = "guild_capacitor"
	origin_tech = list(TECH_POWER = 5, TECH_MATERIAL = 4)
	rating = 4
	matter = list(MATERIAL_ALUMINIUM = 2, MATERIAL_PLASTIC = 2, MATERIAL_GLASS = 1, MATERIAL_GOLD  = 2, MATERIAL_SILVER = 2)
	price_tag = 75

/obj/item/stock_parts/scanning_module/guild
	name = "over-tuned scanning module"
	desc = "An over engineered and expensive yet compact, high resolution phasic scanning module used in the construction of certain devices."
	icon_state = "guild_scan_module"
	origin_tech = list(TECH_MAGNET = 5)
	rating = 4
	matter = list(MATERIAL_ALUMINIUM = 3, MATERIAL_PLASTIC = 2, MATERIAL_LGLASS  = 1, MATERIAL_GOLD  = 2, MATERIAL_SILVER = 2)
	price_tag = 75

/obj/item/stock_parts/manipulator/guild
	name = "forged manipulator"
	desc = "A buffed up pico manipulator with a added case to increase manipulation used in the construction of certain devices."
	icon_state = "guild_mani"
	origin_tech = list(TECH_MATERIAL = 5, TECH_DATA = 2)
	rating = 4
	matter = list(MATERIAL_INDSTEEL = 3, MATERIAL_PLASTIC = 5)
	price_tag = 75

/obj/item/stock_parts/micro_laser/guild
	name = "perfected micro-laser"
	icon_state = "guild_micro_laser"
	desc = "An ultra-high micro laser with a perfected lens to increase productivity."
	origin_tech = list(TECH_MAGNET = 5)
	rating = 4
	matter = list(MATERIAL_ALUMINIUM = 2, MATERIAL_PLASTIC = 2, MATERIAL_GLASS = 1, MATERIAL_LGLASS = 1, MATERIAL_SILVER = 1)
	price_tag = 75

/obj/item/stock_parts/matter_bin/guild
	name = "cast matter bin"
	desc = "A super matter bin with added compression cast onto the base itself for more effective storage."
	icon_state = "guild_matter_bin"
	origin_tech = list(TECH_MATERIAL = 5)
	rating = 4
	matter = list(MATERIAL_INDSTEEL = 3, MATERIAL_GLASS = 1, MATERIAL_LBGLASS = 1)
	price_tag = 75

//PIRS stock parts (rating 5)
/obj/item/stock_parts/capacitor/handmade
	name = "experimental capacitor"
	desc = "A PIRS tinkered super-high capacity capacitor used in the construction of a variety of devices. Being hand-tuned and impedence tested; along with extra-conductive wiring replacing the original connectors - these easily outperform their lathe-printed counterparts."
	icon_state = "guild_capacitor"
	origin_tech = list(TECH_POWER = 5, TECH_MATERIAL = 4)
	rating = 5
	matter = list(MATERIAL_ALUMINIUM = 1, MATERIAL_PLASTIC = 1, MATERIAL_GLASS = 1, MATERIAL_GOLD  = 1, MATERIAL_SILVER = 1) //Sorry, you want me to use 2 sheets of gold and silver for ONE capacitor? Fat chance.
	price_tag = 800 //Why were these so cheap? ORIGINAL: 200

/obj/item/stock_parts/scanning_module/handmade
	name = "over-tuned scanning module"
	desc = "An over engineered and high resolution, yet compact phasic scanning module used in the construction of certain devices. Being tuned by hand to run at the optimum frequency for their scanning efforts; these easily blow lathe-fabricated ones out of the water.."
	icon_state = "guild_scan_module"
	origin_tech = list(TECH_MAGNET = 5)
	rating = 5
	matter = list(MATERIAL_ALUMINIUM = 2, MATERIAL_PLASTIC = 2, MATERIAL_LGLASS  = 1, MATERIAL_GOLD  = 1, MATERIAL_SILVER = 1)
	price_tag = 800 //Why were these so cheap? ORIGINAL: 200

/obj/item/stock_parts/manipulator/handmade
	name = "flexi-pico manipulator"
	desc = "A beefed up picomanipulator - many un-neccessary parts that slowed previous fabrication efforts having been removed, slimmed down and redesigned from the ground-up. Such modifications make it many times better than a lathe-printed counterpart; and faster, too!"
	icon_state = "guild_mani"
	origin_tech = list(TECH_MATERIAL = 5, TECH_DATA = 2)
	rating = 5
	matter = list(MATERIAL_INDSTEEL = 2, MATERIAL_PLASTIC = 1) //Point and case.
	price_tag = 800 //Why were these so cheap? ORIGINAL: 200

/obj/item/stock_parts/micro_laser/handmade
	name = "perfected ultra-high-power micro-laser"
	icon_state = "guild_micro_laser"
	desc = "An ultra-high micro laser with a compound lense to decrease beam divergence and increase peak power output. Being made by skilled tinkerers; this also features a better driver circuit, extra thermal coupling - and a more powerful diode, easily outperforming lathe counterparts."
	origin_tech = list(TECH_MAGNET = 5)
	rating = 5
	matter = list(MATERIAL_ALUMINIUM = 2, MATERIAL_PLASTIC = 2, MATERIAL_GLASS = 1, MATERIAL_LGLASS = 1, MATERIAL_SILVER = 1)
	price_tag = 800 //Why were these so cheap? ORIGINAL: 200

/obj/item/stock_parts/matter_bin/handmade
	name = "giga matter bin"
	desc = "A super matter bin combined with extra compression storage, faster cyclic speeds; and generally higher capacity per second. Such modifications increase the bulk by a decent bit - but they clearly blow their lathe-fabricated counterparts out of the water!"
	icon_state = "guild_matter_bin"
	origin_tech = list(TECH_MATERIAL = 5)
	rating = 5
	matter = list(MATERIAL_INDSTEEL = 2, MATERIAL_GLASS = 1, MATERIAL_ALUMINIUM = 1)
	price_tag = 800 //Why were these so cheap? ORIGINAL: 200

//excelsior stock parts (rating 5)
/obj/item/stock_parts/capacitor/excelsior
	name = "astrakhan capacitor"
	desc = "A super-high capacity capacitor used in the construction of a variety of devices."
	icon_state = "excel_capacitor"
	origin_tech = list(TECH_POWER = 5, TECH_MATERIAL = 4)
	rating = 5
	matter = list(MATERIAL_ALUMINIUM = 2, MATERIAL_PLASTIC = 2, MATERIAL_GLASS = 1)
	price_tag = 100

/obj/item/stock_parts/scanning_module/excelsior
	name = "astrakhan scanning module"
	desc = "A compact, high resolution phasic scanning module used in the construction of certain devices."
	icon_state = "excel_scan_module"
	origin_tech = list(TECH_MAGNET = 5)
	rating = 5
	matter = list(MATERIAL_ALUMINIUM = 2, MATERIAL_PLASTIC = 2, MATERIAL_GLASS = 1)
	price_tag = 100

/obj/item/stock_parts/manipulator/excelsior
	name = "astrakhan manipulator"
	desc = "A tiny little manipulator used in the construction of certain devices."
	icon_state = "excel_mani"
	origin_tech = list(TECH_MATERIAL = 5, TECH_DATA = 2)
	rating = 5
	matter = list(MATERIAL_ALUMINIUM = 2, MATERIAL_PLASTIC = 2)
	price_tag = 100

/obj/item/stock_parts/micro_laser/excelsior
	name = "astrakhan micro-laser"
	icon_state = "excel_laser"
	desc = "A tiny laser used in certain devices."
	origin_tech = list(TECH_MAGNET = 5)
	rating = 5
	matter = list(MATERIAL_ALUMINIUM = 2, MATERIAL_PLASTIC = 2, MATERIAL_GLASS = 1)
	price_tag = 100

/obj/item/stock_parts/matter_bin/excelsior
	name = "astrakhan matter bin"
	desc = "A container for holding compressed matter awaiting re-construction."
	icon_state = "excel_matter"
	origin_tech = list(TECH_MATERIAL = 5)
	rating = 5
	matter = list(MATERIAL_PLASTIC = 3, MATERIAL_GLASS = 1)
	price_tag = 100

//alien stock parts (rating 6)

/obj/item/stock_parts/capacitor/alien_capacitor
	name = "Exothermic Seal"
	desc = "A can-shaped brass component, covered in scratch marks and weathered by time. A faint humming can be heard coming from its inner workings. Seems like it can be used in construction of certain devices."
	icon_state = "alien_capacitor"
	origin_tech = list(TECH_POWER = 5, TECH_MATERIAL = 5)
	rating = 6
	matter = list(MATERIAL_ALUMINIUM = 2, MATERIAL_PLASTIC = 1, MATERIAL_GLASS = 3)
	price_tag = 700

/obj/item/stock_parts/scanning_module/alien
	name = "Optical receptor"
	desc = "A device, closely resembling a human eye. The pupil dilates and contracts when exposed to different materials. Seems like it can be used in construction of certain devices."
	icon_state = "alien_scan_module"
	origin_tech = list(TECH_MAGNET = 5)
	rating = 6
	matter = list(MATERIAL_ALUMINIUM = 2, MATERIAL_PLASTIC = 2, MATERIAL_GLASS = 1)
	price_tag = 700

/obj/item/stock_parts/manipulator/alien
	name = "Gripper"
	desc = "This strange chunk of metal opens and closes its claws, as if it was a freshly cut crab arm. Seems like it can be used in construction of certain devices."
	icon_state = "alien_mani"
	origin_tech = list(TECH_MATERIAL = 5, TECH_DATA = 2)
	rating = 6
	matter = list(MATERIAL_ALUMINIUM = 2, MATERIAL_PLASTIC = 2)
	price_tag = 700

/obj/item/stock_parts/micro_laser/alien
	name = "Pico-emitter"
	icon_state = "alien_laser"
	desc = "A bright glass orb with a port on its back. It glows faint blue from time to time. Seems like it can be used in construction of certain devices."
	origin_tech = list(TECH_MAGNET = 5)
	rating = 6
	matter = list(MATERIAL_ALUMINIUM = 2, MATERIAL_PLASTIC = 2, MATERIAL_GLASS = 1)
	price_tag = 700

/obj/item/stock_parts/matter_bin/alien
	name = "Receptacle"
	desc = "A twisted and time-weathered metal contraption, that's slightly warm to the touch. Seems like it can be used in construction of certain devices."
	icon_state = "alien_matter"
	origin_tech = list(TECH_MATERIAL = 5)
	rating = 6
	matter = list(MATERIAL_PLASTIC = 3, MATERIAL_GLASS = 1)
	price_tag = 700


// Subspace stock parts

/obj/item/stock_parts/subspace/ansible
	name = "subspace ansible"
	icon_state = "subspace_ansible"
	desc = "A compact module capable of sensing extradimensional activity."
	origin_tech = list(TECH_DATA = 3, TECH_MAGNET = 5 ,TECH_MATERIAL = 4, TECH_BLUESPACE = 2)
	matter = list(MATERIAL_ALUMINIUM = 2, MATERIAL_GLASS = 1, MATERIAL_SILVER = 2)
	price_tag = 150

/obj/item/stock_parts/subspace/filter
	name = "hyperwave filter"
	icon_state = "hyperwave_filter"
	desc = "A tiny device capable of filtering and converting super-intense radiowaves."
	origin_tech = list(TECH_DATA = 4, TECH_MAGNET = 2)
	matter = list(MATERIAL_ALUMINIUM = 2, MATERIAL_GLASS = 1, MATERIAL_SILVER = 1)
	price_tag = 100

/obj/item/stock_parts/subspace/amplifier
	name = "subspace amplifier"
	icon_state = "subspace_amplifier"
	desc = "A compact micro-machine capable of amplifying weak subspace transmissions."
	origin_tech = list(TECH_DATA = 3, TECH_MAGNET = 4, TECH_MATERIAL = 4, TECH_BLUESPACE = 2)
	matter = list(MATERIAL_ALUMINIUM = 2, MATERIAL_GLASS = 1, MATERIAL_SILVER = 1)
	price_tag = 100

/obj/item/stock_parts/subspace/treatment
	name = "subspace treatment disk"
	icon_state = "treatment_disk"
	desc = "A compact micro-machine capable of stretching out hyper-compressed radio waves."
	origin_tech = list(TECH_DATA = 3, TECH_MAGNET = 2, TECH_MATERIAL = 5, TECH_BLUESPACE = 2)
	matter = list(MATERIAL_ALUMINIUM = 2, MATERIAL_GLASS = 1, MATERIAL_SILVER = 1)
	price_tag = 100

/obj/item/stock_parts/subspace/analyzer
	name = "subspace wavelength analyzer"
	icon_state = "wavelength_analyzer"
	desc = "A sophisticated analyzer capable of analyzing cryptic subspace wavelengths."
	origin_tech = list(TECH_DATA = 3, TECH_MAGNET = 4, TECH_MATERIAL = 4, TECH_BLUESPACE = 2)
	matter = list(MATERIAL_ALUMINIUM = 2, MATERIAL_GLASS = 1, MATERIAL_SILVER = 1)
	price_tag = 100

/obj/item/stock_parts/subspace/crystal
	name = "ansible crystal"
	icon_state = "ansible_crystal"
	desc = "A crystal made from pure glass used to transmit laser data bursts to subspace."
	origin_tech = list(TECH_MAGNET = 4, TECH_MATERIAL = 4, TECH_BLUESPACE = 2)
	matter = list(MATERIAL_ALUMINIUM = 2, MATERIAL_GLASS = 1, MATERIAL_SILVER = 2)
	price_tag = 150

/obj/item/stock_parts/subspace/transmitter
	name = "subspace transmitter"
	icon_state = "subspace_transmitter"
	desc = "A large piece of equipment used to open a window into the subspace dimension."
	origin_tech = list(TECH_MAGNET = 5, TECH_MATERIAL = 5, TECH_BLUESPACE = 3)
	matter = list(MATERIAL_ALUMINIUM = 2, MATERIAL_GLASS = 1, MATERIAL_SILVER = 1)
	price_tag = 100
