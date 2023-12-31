//BIG CELLS - for APC, borgs and machinery.

//Generic Big
/obj/item/cell/large
	name = "Hellion \"Robustcell 1000L\""
	desc = "Hellion Electronics Concern branded rechargeable L-standardized power cell. This one is the cheapest you can find."
	icon_state = "b_st"
	maxcharge = 1000
	matter = list(MATERIAL_ALUMINIUM = 3, MATERIAL_PLASTIC = 3, MATERIAL_SILVER = 3)
	preloaded_reagents = list("lithium" = 25)
	price_tag = 200

/obj/item/cell/large/high
	name = "Hellion \"Robustcell 5000L\""
	desc = "Hellion Electronics Concern branded rechargeable L-standardized power cell. Popular and reliable version."
	icon_state = "b_hi"
	origin_tech = list(TECH_POWER = 2)
	maxcharge = 5000

/obj/item/cell/large/super
	name = "Hellion \"Robustcell 15000L\""
	desc = "Hellion Electronics Concern branded rechargeable L-standardized power cell. This industrial version can store even more energy."
	icon_state = "b_sup"
	origin_tech = list(TECH_POWER = 5)
	maxcharge = 15000

/obj/item/cell/large/hyper
	name = "Hellion \"Robustcell-X 20000L\""
	desc = "Hellion Electronics Concern branded rechargeable L-standardized power cell. This is the top of the class most advanced version of cell on the market."
	icon_state = "b_hy"
	origin_tech = list(TECH_POWER = 6)
	maxcharge = 20000

//Morbius (Science) Big
/obj/item/cell/large/moebius
	name = "Phokorus Institute \"Power-Geyser 2000L\""
	desc = "Phokorus Institute-brand rechargeable L-standardized power cell. This one is as cheap as Skylight models, yet improved in all senses."
	icon_state = "meb_b_st"
	max_chargerate = 0.1
	maxcharge = 2000

/obj/item/cell/large/moebius/high
	name = "Phokorus Institute \"Power-Geyser 7000L\""
	desc = "Phokorus Institute Laboratories branded rechargeable L-standardized power cell. Popular and reliable version."
	icon_state = "meb_b_hi"
	origin_tech = list(TECH_POWER = 2)
	maxcharge = 7000

/obj/item/cell/large/moebius/super
	name = "Phokorus Institute \"Power-Geyser 13000L\""
	desc = "Phokorus Institute-brand rechargeable L-standardized power cell. This industrial version can store even more energy."
	icon_state = "meb_b_sup"
	origin_tech = list(TECH_POWER = 5)
	maxcharge = 13000

/obj/item/cell/large/moebius/hyper
	name = "Phokorus Institute \"Power-Geyser 18000L\""
	desc = "Phokorus Institute-brand rechargeable L-standardized power cell. Regarded as the second most powerful cell on the market."
	icon_state = "meb_b_hy"
	origin_tech = list(TECH_POWER = 6)
	maxcharge = 18000

/obj/item/cell/large/moebius/omega
	name = "Phokorus Institute \"Omega-Geyser 20000L\""
	desc = "Phokorus Institute-brand rechargeable L-standardized power cell. This one being part of the Omega line, making it the be-all-end-all power cell of its type, yet to hit the open market."
	icon_state = "meb_b_omega"
	matter = list(MATERIAL_ALUMINIUM = 3, MATERIAL_PLASTIC = 3, MATERIAL_SILVER = 3, MATERIAL_GOLD = 6)
	preloaded_reagents = list("lithium" = 15, "radium" = 10)
	origin_tech = list(TECH_POWER = 7)
	maxcharge = 20000
	max_chargerate = 0.24

/obj/item/cell/large/moebius/nuclear
	name = "Phokorus Institute \"Atomcell 13000L\""
	desc = "Phokorus Institute branded rechargeable L-standardized power cell. This version able to recharge itself over time."
	icon_state = "meb_b_nu"
	autorecharging = TRUE
	origin_tech = list(TECH_POWER = 6)
	matter = list(MATERIAL_ALUMINIUM = 3, MATERIAL_PLASTIC = 3, MATERIAL_SILVER = 3, MATERIAL_URANIUM = 6)
	preloaded_reagents = list("radium" = 10, "lithium" = 10, "phosphorus" = 5)
	maxcharge = 13000
	price_tag = 400

//Positronic Big
/obj/item/cell/large/simulacrum
	name = "SR-PI \"Posi-cell 13000L\""
	desc = "SR-PI branded rechargeable L-standardized power cell that recharges itself over time. This type has yet to hit the market!"
	icon_state = "similacrum_b_omega"
	icon_state = "similacrum_b_omega"
	maxcharge = 13000
	autorecharging = TRUE
	autorecharge_rate = 0.05
	matter = list(MATERIAL_ALUMINIUM = 3, MATERIAL_PLASTIC = 3, MATERIAL_PLATINUM = 3, MATERIAL_URANIUM = 6)
	preloaded_reagents = list("radium" = 10, "lithium" = 10, "phosphorus" = 5)
	price_tag = 600

//Astrakhan - Large
/obj/item/cell/large/excelsior
	name = "Astrakhan \"Zarya 18000L\""
	desc = "Astrakhan Tankograd rechargeable L-standardized power cell. Power to the people!"
	icon_state = "exs_l"
	origin_tech = list(TECH_POWER = 3)
	matter = list(MATERIAL_ALUMINIUM = 4, MATERIAL_PLASTIC = 2)
	maxcharge = 18000

//Meme cells - for fun

/obj/item/cell/large/potato
	name = "potato battery"
	desc = "A rechargeable starch based power cell."
	origin_tech = list(TECH_POWER = 1)
	icon = 'icons/obj/power.dmi'
	icon_state = "potato_cell"
	charge = 100
	maxcharge = 300
	minor_fault = 1
	price_tag = 50
	matter = null

//MEDIUM CELLS - for energy weapons and large devices

//Generic Medium
/obj/item/cell/medium
	name = "Hellion \"Robustcell 600M\""
	desc = "Hellion Electronics Concern branded rechargeable M-standardized power cell. This one is the cheapest you can find."
	icon_state = "m_st"
	w_class = ITEM_SIZE_SMALL
	force = WEAPON_FORCE_HARMLESS
	throw_speed = 5
	throw_range = 7
	maxcharge = 600
	matter = list(MATERIAL_ALUMINIUM = 2, MATERIAL_PLASTIC = 2, MATERIAL_SILVER = 2)
	preloaded_reagents = list("lithium" = 15)
	price_tag = 100

/obj/item/cell/medium/depleted
	charge = 0
	starts_max_charge = FALSE

/obj/item/cell/medium/high
	name = "Hellion \"Robustcell 800M\""
	desc = "Hellion Electronics Concern branded rechargeable M-standardized power cell. Popular and reliable version."
	icon_state = "m_hi"
	origin_tech = list(TECH_POWER = 2)
	maxcharge = 800

/obj/item/cell/medium/high/depleted
	charge = 0
	starts_max_charge = FALSE

/obj/item/cell/medium/super
	name = "Hellion \"Robustcell 1000M\""
	desc = "Hellion Electronics Concern branded rechargeable M-standardized power cell. This industrial version can store even more energy."
	icon_state = "m_sup"
	origin_tech = list(TECH_POWER = 5)
	maxcharge = 1000

/obj/item/cell/medium/hyper
	name = "Hellion \"Robustcell-X 1500M\""
	desc = "Hellion Electronics Concern branded rechargeable M-standardized power cell. This is the top of the class most advanced version of cell on the market."
	icon_state = "m_hy"
	origin_tech = list(TECH_POWER = 6)
	maxcharge = 1500

/obj/item/cell/medium/hyper/depleted
	charge = 0
	starts_max_charge = FALSE

//Morbius (Science) Medium
/obj/item/cell/medium/moebius
	name = "Phokorus Institute \"Power-Geyser 700M\""
	desc = "Phokorus Institute branded rechargeable M-standardized power cell. This one is as cheap as Skylight models come."
	icon_state = "meb_m_st"
	max_chargerate = 0.1
	maxcharge = 700

/obj/item/cell/medium/moebius/high
	name = "Phokorus Institute \"Power-Geyser 900M\""
	desc = "Phokorus Institute branded rechargeable M-standardized power cell. Popular and reliable version."
	icon_state = "meb_m_hi"
	origin_tech = list(TECH_POWER = 2)
	maxcharge = 900

/obj/item/cell/medium/moebius/super
	name = "Phokorus Institute \"Power-Geyser 1100M\""
	desc = "Phokorus Institute branded rechargeable M-standardized power cell. This industrial version can store even more energy."
	icon_state = "meb_m_sup"
	origin_tech = list(TECH_POWER = 5)
	maxcharge = 1100

/obj/item/cell/medium/moebius/hyper
	name = "Phokorus Institute \"Power-Geyser 1300M\""
	desc = "Phokorus Institute branded rechargeable M-standardized power cell. Regarded as the second most powerful cell on the market."
	icon_state = "meb_m_hy"
	origin_tech = list(TECH_POWER = 6)
	maxcharge = 1300

/obj/item/cell/medium/moebius/omega
	name = "Phokorus Institute \"Omega-Geyser 1600M\""
	desc = "Phokorus Institute branded rechargeable M-standardized power cell. This one being part of the Omega line, making it the be-all-end-all power cell of its type, yet to hit the open market."
	icon_state = "meb_m_omega"
	matter = list(MATERIAL_ALUMINIUM = 2, MATERIAL_PLASTIC = 2, MATERIAL_SILVER = 2, MATERIAL_GOLD = 4)
	preloaded_reagents = list("lithium" = 10, "radium" = 5)
	origin_tech = list(TECH_POWER = 7)
	maxcharge = 1600
	max_chargerate = 0.24

/obj/item/cell/medium/moebius/nuclear
	name = "Phokorus Institute \"Atomcell 1000M\""
	desc = "Phokorus Institute branded rechargeable M-standardized power cell. This version able to recharge itself over time."
	icon_state = "meb_m_nu"
	autorecharging = TRUE
	matter = list(MATERIAL_ALUMINIUM = 2, MATERIAL_PLASTIC = 2, MATERIAL_SILVER = 2, MATERIAL_URANIUM = 4)
	preloaded_reagents = list("lithium" = 5, "radium" = 5, "phosphorus" = 5)
	origin_tech = list(TECH_POWER = 6)
	maxcharge = 1000
	price_tag = 200

//Positronic Medium
/obj/item/cell/medium/simulacrum
	name = "SR-PI \"Posi-cell 1000M\""
	desc = "SR-PI branded rechargeable M-standardized power cell that recharges itself over time. This type has yet to hit the market!"
	icon_state = "similacrum_m_omega"
	icon_state = "similacrum_m_omega"
	maxcharge = 1000
	autorecharging = TRUE
	autorecharge_rate = 0.06
	matter = list(MATERIAL_ALUMINIUM = 2, MATERIAL_PLASTIC = 2, MATERIAL_PLATINUM = 2, MATERIAL_URANIUM = 4)
	preloaded_reagents = list("lithium" = 5, "radium" = 5, "phosphorus" = 5)
	price_tag = 300

//Astrakhan - Medium
/obj/item/cell/medium/excelsior
	name = "Astrakhan \"Zarya 1100M\""
	desc = "Astrakhan Tankograd rechargeable M-standardized power cell. Power to the people!"
	icon_state = "exs_m"
	origin_tech = list(TECH_POWER = 3)
	matter = list(MATERIAL_ALUMINIUM = 3, MATERIAL_PLASTIC = 1)
	maxcharge = 1100

//SMALL CELLS - for small devices, such as flashlights, analyzers and HUDs.

//Generic Small
/obj/item/cell/small
	name = "Hellion \"Robustcell 100S\""
	desc = "Hellion Electronics Concern branded rechargeable S-standardized power cell. This one is the cheapest you can find."
	icon_state = "s_st"
	w_class = ITEM_SIZE_TINY
	force = WEAPON_FORCE_HARMLESS
	throw_speed = 5
	throw_range = 7
	maxcharge = 100
	matter = list(MATERIAL_ALUMINIUM = 1, MATERIAL_PLASTIC = 1, MATERIAL_SILVER = 1)
	preloaded_reagents = list("lithium" = 5)
	price_tag = 50

/obj/item/cell/small/depleted
	charge = 0
	starts_max_charge = FALSE

/obj/item/cell/small/high
	name = "Hellion \"Robustcell 200S\""
	desc = "Hellion Electronics Concern branded rechargeable S-standardized power cell. Popular and reliable version."
	icon_state = "s_hi"
	origin_tech = list(TECH_POWER = 2)
	maxcharge = 200

/obj/item/cell/small/high/depleted
	charge = 0
	starts_max_charge = FALSE

/obj/item/cell/small/super
	name = "Hellion \"Robustcell 300S\""
	desc = "Hellion Electronics Concern branded rechargeable S-standardized power cell. This industrial version can store even more energy."
	icon_state = "s_sup"
	origin_tech = list(TECH_POWER = 5)
	maxcharge = 300

/obj/item/cell/small/hyper
	name = "Hellion \"Robustcell-X 400S\""
	desc = "Hellion Electronics Concern branded rechargeable S-standardized power cell. This is the top of the class most advanced version of cell on the market."
	icon_state = "s_hy"
	origin_tech = list(TECH_POWER = 6)
	maxcharge = 400

//Morbius (Science) Small
/obj/item/cell/small/moebius
	name = "Phokorus Institute \"Power-Geyser 150S\""
	desc = "Phokorus Institute branded rechargeable S-standardized power cell. This one is cheap, yet better than Hellion Electronics Concern models for same price."
	icon_state = "meb_s_st"
	max_chargerate = 0.095
	maxcharge = 150

/obj/item/cell/small/moebius/high
	name = "Phokorus Institute \"Power-Geyser 250S\""
	desc = "Phokorus Institute branded rechargeable S-standardized power cell. Popular and reliable version."
	icon_state = "meb_s_hi"
	origin_tech = list(TECH_POWER = 2)
	maxcharge = 250

/obj/item/cell/small/moebius/super
	name = "Phokorus Institute \"Power-Geyser 350S\""
	desc = "Phokorus Institute branded rechargeable S-standardized power cell. This industrial version can store even more energy."
	icon_state = "meb_s_sup"
	origin_tech = list(TECH_POWER = 5)
	maxcharge = 350

/obj/item/cell/small/moebius/hyper
	name = "Phokorus Institute \"Power-Geyser 450S\""
	desc = "Phokorus Institute branded rechargeable S-standardized power cell. Regarded as the second most powerful cell on the market."
	icon_state = "meb_s_hy"
	origin_tech = list(TECH_POWER = 6)
	maxcharge = 450

/obj/item/cell/small/moebius/omega
	name = "Phokorus Institute \"Omega-Geyser 550S\""
	desc = "Phokorus Institute branded rechargeable S-standardized power cell. This one being part of the Omega line making it the be-all-end-all power cell of its type, yet to hit the open market."
	icon_state = "meb_s_omega"
	matter = list(MATERIAL_ALUMINIUM = 1, MATERIAL_PLASTIC = 1, MATERIAL_SILVER = 1, MATERIAL_GOLD = 2)
	preloaded_reagents = list("radium" = 5)
	origin_tech = list(TECH_POWER = 7)
	maxcharge = 550

/obj/item/cell/small/moebius/nuclear
	name = "Phokorus Institute \"Atomcell 300S\""
	desc = "Phokorus Institute branded rechargeable S-standardized microreactor cell. Recharges itself over time."
	icon_state = "meb_s_nu"
	autorecharging = TRUE
	origin_tech = list(TECH_POWER = 6)
	matter = list(MATERIAL_ALUMINIUM = 1, MATERIAL_PLASTIC = 1, MATERIAL_SILVER = 1, MATERIAL_URANIUM = 2)
	preloaded_reagents = list("radium" = 5)
	maxcharge = 300
	price_tag = 100

/obj/item/cell/small/moebius/pda
	name = "Phokorus Institute \"Atomcell 50S\""
	desc = "Phokorus Institute branded S-standardized microreactor cell. Recharges itself over time."
	icon_state = "meb_pda"
	origin_tech = list(TECH_POWER = 4)
	matter = list(MATERIAL_ALUMINIUM = 1, MATERIAL_PLASTIC = 1, MATERIAL_URANIUM = 1)
	preloaded_reagents = list("radium" = 5)
	maxcharge = 50
	// Autorecharge rate is buffed compared to eris, to compensate for the cell's cooldown.
	autorecharging = TRUE
	autorecharge_rate = 0.007
	recharge_time = 1
	price_tag = 65

//Positronic Small
/obj/item/cell/small/simulacrum
	name = "SR-PI \"Posi-cell 300S\""
	desc = "SR-PI branded rechargeable S-standardized power cell that recharges itself over time. This type has yet to hit the market!"
	icon_state = "similacrum_s_omega"
	icon_state = "similacrum_s_omega"
	maxcharge = 300
	autorecharging = TRUE
	autorecharge_rate = 0.025
	matter = list(MATERIAL_ALUMINIUM = 1, MATERIAL_PLASTIC = 1, MATERIAL_PLATINUM = 1, MATERIAL_URANIUM = 2)
	preloaded_reagents = list("radium" = 5)
	price_tag = 150

//Astrakhan - Small
/obj/item/cell/small/excelsior
	name = "Astrakhan \"Zarya 400S\""
	desc = "Astrakhan Tankograd rechargeable S-standardized power cell. Power to the people!"
	icon_state = "exs_s"
	origin_tech = list(TECH_POWER = 3)
	matter = list(MATERIAL_ALUMINIUM = 1, MATERIAL_PLASTIC = 1)
	maxcharge = 400

// Hand crank
/obj/item/device/manual_charger
	name = "manual recharger"
	desc = "A basic hand crank recharger utilizing a manual mechanism."
	icon = 'icons/obj/machines/chemistry.dmi'
	icon_state = "centrifuge_makeshift"
	matter = list(MATERIAL_ALUMINIUM = 30)
	cell = null
	suitable_cell = /obj/item/cell
	var/charge_per_cycle = 30
	var/inuse = FALSE

/obj/item/device/manual_charger/attackby(obj/item/I, mob/user)
	if(istype(I, suitable_cell) && insert_item(I, user) && !cell)
		cell = I
		return
	..()

/obj/item/device/manual_charger/MouseDrop(over_object)
	if((src.loc == usr) && istype(over_object, /obj/screen/inventory/hand) && eject_item(cell, usr))
		cell = null

/obj/item/device/manual_charger/attack_self(mob/user)
	if(!cell)
		to_chat(user, SPAN_WARNING("Their is no cell currently loaded in the spool."))
		return
	if(0 >= cell.max_chargerate)
		to_chat(user, SPAN_WARNING("This type of cell can't be recharged."))
		return
	if(inuse)
		to_chat(user, SPAN_WARNING("You are already charging the cell!"))
		return
	inuse = TRUE
	user.visible_message(SPAN_NOTICE("[user] starts turning the handle on [src]."), SPAN_NOTICE("You start to turn the handle on [src]."))
	if(do_after(user, 12 + (30 * user.stats.getMult(STAT_TGH, STAT_LEVEL_ADEPT))))
		if(!cell)
			return
		if(cell.charge >= cell.maxcharge)
			user.visible_message(SPAN_NOTICE("The cell can not be charged any more!"))
			return
		else
			cell.charge += min(charge_per_cycle, cell.maxcharge - cell.charge)
	inuse = FALSE

/obj/item/device/manual_charger/dropped(mob/user)
	inuse = FALSE

// Improv crank
/obj/item/device/manual_charger/improv
	name = "handmade manual recharger"
	desc = "A handmade manual crank charger. Barely capable of charging cells."
	charge_per_cycle = 10
