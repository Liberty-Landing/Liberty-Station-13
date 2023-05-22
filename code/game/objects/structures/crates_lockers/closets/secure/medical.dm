/obj/structure/closet/secure_closet/medicine
	name = "medicine closet"
	desc = "Filled with medical junk."
	icon_state = "med"
	req_access = list(access_medical_equip)

/obj/structure/closet/secure_closet/medicine/populate_contents()
	new /obj/item/storage/box/autoinjectors(src)
	new /obj/item/storage/box/syringes(src)
	new /obj/item/reagent_containers/dropper(src)
	new /obj/item/reagent_containers/dropper(src)
	new /obj/item/reagent_containers/glass/beaker(src)
	new /obj/item/reagent_containers/glass/beaker(src)
	new /obj/item/reagent_containers/glass/bottle/inaprovaline(src)
	new /obj/item/reagent_containers/glass/bottle/inaprovaline(src)
	new /obj/item/reagent_containers/glass/bottle/antitoxin(src)
	new /obj/item/reagent_containers/glass/bottle/antitoxin(src)
	new /obj/item/storage/hcases/med(src)
	new /obj/item/bodybag/cryobag(src)
	new /obj/item/bodybag/cryobag(src)

/obj/structure/closet/secure_closet/anesthetics
	name = "anesthetics closet"
	desc = "Used to knock people out."
	icon_state = "med"
	req_access = list(access_moebius)

/obj/structure/closet/secure_closet/anesthetics/populate_contents()
	new /obj/item/tank/anesthetic(src)
	new /obj/item/tank/anesthetic(src)
	new /obj/item/tank/anesthetic(src)
	new /obj/item/clothing/mask/breath/medical(src)
	new /obj/item/clothing/mask/breath/medical(src)
	new /obj/item/clothing/mask/breath/medical(src)
	new /obj/item/tool/wrench(src)
	new /obj/item/bodybag/cryobag(src)

/obj/structure/closet/secure_closet/personal/doctor
	name = "CAPSA Doctor's locker"
	req_access = list(access_cso)
	access_occupy = list(access_medical_equip)
	icon_state = "med"

/obj/structure/closet/secure_closet/personal/doctor/populate_contents()
	if(prob(50))
		new /obj/item/storage/backpack/medical(src)
	else
		new /obj/item/storage/backpack/satchel/medical(src)
	switch(pick("blue", "green"))
		if ("blue")
			new /obj/item/clothing/under/scrubs(src)
			new /obj/item/clothing/head/surgery(src)
		if ("green")
			new /obj/item/clothing/under/scrubs/green(src)
			new /obj/item/clothing/head/surgery/green(src)
	switch(pick("blue", "green"))
		if ("blue")
			new /obj/item/clothing/under/scrubs(src)
			new /obj/item/clothing/head/surgery(src)
		if ("green")
			new /obj/item/clothing/under/scrubs/green(src)
			new /obj/item/clothing/head/surgery/green(src)
	new /obj/item/clothing/under/rank/medical(src)
	new /obj/item/clothing/gloves/latex/nitrile(src)
	new /obj/item/clothing/shoes/reinforced/medical(src)
	new /obj/item/clothing/head/rank/medical/beret(src)
	new /obj/item/clothing/suit/storage/toggle/labcoat(src)
	new /obj/item/clothing/mask/gas/capsa(src)
	new /obj/item/device/radio/headset/headset_med(src)
	new /obj/item/taperoll/medical(src)
	new /obj/item/clothing/head/ushanka/medical(src)
	new /obj/item/storage/belt/medical/(src)
	new /obj/item/clothing/suit/storage/surgical_apron(src)
	new /obj/item/clothing/glasses/hud/health(src)
	new /obj/item/clothing/accessory/stethoscope(src)
	new /obj/item/clothing/suit/armor/vest/capsa(src)
	new /obj/item/bodybag/cryobag(src)
	new /obj/item/bodybag/cryobag(src)

/obj/structure/closet/secure_closet/personal/paramedic
	name = "CAPSA Field Doctor's locker"
	req_access = list(access_cso)
	access_occupy = list(access_medical_equip)
	icon_state = "med"

/obj/structure/closet/secure_closet/personal/paramedic/populate_contents()
	if(prob(50))
		new /obj/item/storage/backpack/medical(src)
	else
		new /obj/item/storage/backpack/satchel/medical(src)
	switch(pick("blue", "green"))
		if ("blue")
			new /obj/item/clothing/under/scrubs(src)
			new /obj/item/clothing/head/surgery(src)
		if ("green")
			new /obj/item/clothing/under/scrubs/green(src)
			new /obj/item/clothing/head/surgery/green(src)
	new /obj/item/clothing/shoes/jackboots/medical(src)
	new /obj/item/clothing/head/rank/medical/beret(src)
	new /obj/item/device/flash(src)
	new /obj/item/clothing/gloves/latex/nitrile(src)
	new /obj/item/device/lighting/toggleable/flashlight(src)
	new /obj/item/device/radio(src)
	new /obj/item/tool/crowbar(src)
	new /obj/item/extinguisher/mini(src)
	new /obj/item/clothing/mask/gas/capsa(src)
	new /obj/item/device/radio/headset/headset_med(src)
	new /obj/item/taperoll/medical(src)
	new /obj/item/storage/belt/medical/capsa(src)
	new /obj/item/clothing/head/ushanka/medical(src)
	new /obj/item/clothing/gloves/thick/swat/capsa(src)
	new /obj/item/storage/pouch/medical_supply(src)
	new /obj/item/bodybag/cryobag(src)
	new /obj/item/bodybag/cryobag(src)
	new /obj/item/bodybag/cryobag(src)
	new /obj/item/clothing/accessory/stethoscope(src)
	new /obj/item/clothing/glasses/hud/health(src)
	new /obj/item/clothing/suit/armor/vest/capsa(src)

/obj/structure/closet/secure_closet/personal/orderly
	name = "CAPSA Paramedic locker"
	req_access = list(access_cso)
	access_occupy = list(access_orderly)
	icon_state = "traumateam"
	var/bag_gacha

/obj/structure/closet/secure_closet/personal/orderly/proc/gain_rng()
	bag_gacha = pickweight(list("BACKPACK" = 30, "MOLLE" = 18))

/obj/structure/closet/secure_closet/personal/orderly/populate_contents()
	gain_rng()

	switch(bag_gacha)
		if("BACKPACK")
			new /obj/item/storage/backpack/medical(src)
		if("MOLLE")
			new /obj/item/storage/backpack/military/medical(src)

	new /obj/item/clothing/under/rank/paramedic(src) // Not a surgery-oriented job, they don't need scrubs.
	new /obj/item/device/lighting/toggleable/flashlight(src)
	new /obj/item/device/radio(src)
	new /obj/item/tool/crowbar(src)
	new /obj/item/extinguisher/mini(src)
	new /obj/item/clothing/shoes/reinforced/medical(src)
	new /obj/item/device/radio/headset/headset_med/bowman(src)
	new /obj/item/taperoll/medical(src)
	new /obj/item/storage/belt/medical/capsa(src)
	new /obj/item/clothing/head/ushanka/medical(src)
	new /obj/item/clothing/gloves/thick/swat/capsa(src)
	new /obj/item/tool/baton(src)
	new /obj/item/storage/pouch/baton_holster(src)
	new /obj/item/storage/pouch/medical_supply(src)
	new /obj/item/storage/hcases/med(src)
	new /obj/item/clothing/glasses/hud/health(src)
	new /obj/item/clothing/mask/gas/capsa(src)
	new /obj/item/clothing/suit/armor/vest/capsa(src) // In case of hiring an intern, or requiring an armor suit
	new /obj/item/bodybag/cryobag(src)
	new /obj/item/bodybag/cryobag(src)

/obj/structure/closet/secure_closet/reinforced/cso
	name = "CAPSA Surgeon Overseer's locker"
	req_access = list(access_cso)
	icon_state = "cmo"
	var/bag_gacha

/obj/structure/closet/secure_closet/reinforced/cso/proc/gain_rng()
	bag_gacha = pickweight(list("BACKPACK" = 30, "MOLLE" = 18))

/obj/structure/closet/secure_closet/reinforced/cso/populate_contents()
	gain_rng()

	switch(bag_gacha)
		if("BACKPACK")
			new /obj/item/storage/backpack/medical(src)
		if("MOLLE")
			new /obj/item/storage/backpack/military/medical(src)

	new /obj/item/clothing/suit/bio_suit/cmo(src)
	new /obj/item/clothing/head/bio_hood/cmo(src)
	new /obj/item/clothing/shoes/color(src)
	switch(pick("blue", "green"))
		if ("blue")
			new /obj/item/clothing/under/scrubs(src)
			new /obj/item/clothing/head/surgery(src)
		if ("green")
			new /obj/item/clothing/under/scrubs/green(src)
			new /obj/item/clothing/head/surgery/green(src)
	new /obj/item/clothing/under/rank/cso(src)
	new /obj/item/clothing/suit/storage/toggle/labcoat/cso(src)
	new /obj/item/clothing/accessory/halfcape/cso(src)
	new /obj/item/clothing/accessory/job/cape/cso(src) // Both versions of capes for consistency - Seb
	new /obj/item/storage/belt/medical/capsa(src)
	new /obj/item/clothing/shoes/jackboots/medical(src)
	new /obj/item/device/radio/headset/heads/cso(src)
	new /obj/item/clothing/head/rank/medical/beret(src)
	new /obj/item/clothing/head/ushanka/medical(src)
	new /obj/item/clothing/gloves/thick/swat/capsa(src)
	new /obj/item/device/flash(src)
	new /obj/item/reagent_containers/hypospray(src)
	new /obj/item/clothing/suit/armor/vest/pirssuit/cso(src)
	new /obj/item/clothing/head/helmet/pirssuit/cso(src)
	new /obj/item/clothing/mask/gas/capsa(src)
	new /obj/item/clothing/gloves/latex/nitrile(src)
	new /obj/item/computer_hardware/hard_drive/portable/design/medical/cso(src)
	new /obj/item/computer_hardware/hard_drive/portable/design/medical/advanced/cso(src)
	new /obj/item/device/defib_kit/compact/combat/adv/loaded/cbo(src)
	new /obj/item/gun/matter/staff_of_asclepius(src) // TODO: Map this instead of having it inside the locker, maybe?
	new /obj/item/circuitboard/sleeper/hyper(src)
	new /obj/item/oddity/chem_book(src)
	new /obj/item/storage/hcases/med(src)
	new /obj/item/bodybag/cryobag(src)
	new /obj/item/bodybag/cryobag(src)
	new /obj/item/bodybag/cryobag(src)

/obj/structure/closet/secure_closet/animal
	name = "animal control closet"
	req_access = list(access_surgery)
	icon_state = "sec"

/obj/structure/closet/secure_closet/animal/populate_contents()
	new /obj/item/device/assembly/signaler(src)
	new /obj/item/device/radio/electropack(src)
	new /obj/item/device/radio/electropack(src)
	new /obj/item/device/radio/electropack(src)

/obj/structure/closet/secure_closet/chemical
	name = "chemical closet"
	desc = "Store dangerous chemicals in here."
	icon_state = "med"
	icon_door = "chemical"
	req_access = list(access_chemistry)

/obj/structure/closet/secure_closet/chemical/populate_contents()
	new /obj/item/storage/box/pillbottles(src)
	new /obj/item/storage/box/pillbottles(src)
	new /obj/item/storage/pouch/tubular/vial(src)
	new /obj/item/storage/bag/capsa(src)
	new /obj/item/storage/bag/capsa(src)
	new /obj/item/bodybag/cryobag(src)
	new /obj/item/bodybag/cryobag(src)
