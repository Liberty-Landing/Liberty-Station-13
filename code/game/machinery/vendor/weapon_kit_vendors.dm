//For Security Kits
/obj/machinery/vending/marshal_kit
	name = "\improper Liberty Watch Kit Vendor"
	desc = "A vendor that can dispense specialized equipment kits for Marshal Officers."
	icon_state = "trashvend"
	products = list(
		/obj/item/storage/box/m_kit/stinger = 5,
		/obj/item/storage/box/m_kit/trench = 5,
		/obj/item/storage/box/m_kit/kalash = 5,
		/obj/item/storage/box/m_kit/cog = 5,
		/obj/item/storage/box/m_kit/taser = 5,
		/obj/item/storage/box/m_kit/specialist = 5,
		/obj/item/storage/box/m_kit/standard_armor = 5,
		/obj/item/storage/box/m_kit/bullet_proof = 5,
		/obj/item/storage/box/m_kit/laser_armor = 5,
		/obj/item/storage/box/m_kit/riot = 5
		)
	prices = list( // 500$ for default marshal stuff, 750 for the rest
		/obj/item/storage/box/m_kit/stinger = 500,
		/obj/item/storage/box/m_kit/trench = 750,
		/obj/item/storage/box/m_kit/kalash = 750,
		/obj/item/storage/box/m_kit/cog = 650,
		/obj/item/storage/box/m_kit/taser = 500,
		/obj/item/storage/box/m_kit/specialist = 750,
		/obj/item/storage/box/m_kit/standard_armor = 500,
		/obj/item/storage/box/m_kit/bullet_proof = 850,
		/obj/item/storage/box/m_kit/riot = 750,
		/obj/item/storage/box/m_kit/laser_armor = 1250
		)
	auto_price = FALSE

/obj/machinery/vending/marshal_kit/attackby(obj/item/I, mob/user)
	if(istype(I, /obj/item/voucher/marshal))
		var/obj/item/voucher/marshal/Voucher = I
		if(Voucher.stamped)
			return
		else
			Voucher.stamped = TRUE
		switch(Voucher.voucher_type)
			if("Primary")
				RedeemPrimary(I, user)
			if("Secondary")
				RedeemSecondary(I, user)
			if("SpecPrimary")
				RedeemSpecPrimary(I, user)
			if("RangerPrimary")
				RedeemRangerPrimary(I, user)
			if("Armor")
				RedeemArmor(I, user)
		return
	return ..()

/obj/machinery/vending/marshal_kit/proc/RedeemPrimary(obj/item/voucher/voucher, mob/redeemer)
	var/items = list(
					"Specialist Kit" = /obj/item/storage/box/m_kit/specialist,
					"Trench Kit" = /obj/item/storage/box/m_kit/trench,
					"Cog Laser Carbine Kit" = /obj/item/storage/box/m_kit/cog)
	var/selection = items[input(redeemer, "Pick your primary weapon", "Marshal Voucher Redemption") as null|anything in items]
	if(selection)
		new selection(loc)
		qdel(voucher)
		return TRUE
	else
		voucher.stamped = FALSE

/obj/machinery/vending/marshal_kit/proc/RedeemSpecPrimary(obj/item/voucher/voucher, mob/redeemer)
	var/items = list(
					"Judge Kit" = /obj/item/storage/box/m_kit/judge,
					"Kalashnikov Kit" = /obj/item/storage/box/m_kit/kalash,
					"Sunrise Las-SMG Kit" = /obj/item/storage/box/m_kit/typewriter)
	var/selection = items[input(redeemer, "Pick your primary weapon", "Marshal Voucher Redemption") as null|anything in items]
	if(selection)
		new selection(loc)
		qdel(voucher)
		return TRUE
	else
		voucher.stamped = FALSE

/obj/machinery/vending/marshal_kit/proc/RedeemRangerPrimary(obj/item/voucher/voucher, mob/redeemer)
	var/items = list(
					"Oeprator Kit" = /obj/item/storage/box/m_kit/operator_rifle,
					"Street Sweeper Kit" = /obj/item/storage/box/m_kit/sweeper,
					"Wrist Breaker Kit" = /obj/item/storage/box/m_kit/wristbreaker)
	var/selection = items[input(redeemer, "Pick your primary weapon", "Marshal Voucher Redemption") as null|anything in items]
	if(selection)
		new selection(loc)
		qdel(voucher)
		return TRUE
	else
		voucher.stamped = FALSE

/obj/machinery/vending/marshal_kit/proc/RedeemSecondary(obj/item/voucher/voucher, mob/redeemer)
	var/items = list(
					"Counselor Kit" = /obj/item/storage/box/m_kit/taser,
					"Stinger Kit" = /obj/item/storage/box/m_kit/stinger)
	var/selection = items[input(redeemer, "Pick your side-arm", "Marshal Voucher Redemption") as null|anything in items]
	if(selection)
		new selection(loc)
		qdel(voucher)
		return TRUE
	else
		voucher.stamped = FALSE

/obj/machinery/vending/marshal_kit/proc/RedeemArmor(obj/item/voucher/voucher, mob/redeemer)
	var/items = list(
					"Standard Plate" = /obj/item/storage/box/m_kit/standard_armor,
					"Riot Armor Kit" = /obj/item/storage/box/m_kit/riot,
					"Bullet-Proof Armor Kit" = /obj/item/storage/box/m_kit/bullet_proof,
					"Ablative Armor Kit" = /obj/item/storage/box/m_kit/laser_armor
					)
	var/selection = items[input(redeemer, "Pick your armor", "Marshal Voucher Redemption") as null|anything in items]
	if(selection)
		new selection(loc)
		qdel(voucher)
		return TRUE
	else
		voucher.stamped = FALSE
