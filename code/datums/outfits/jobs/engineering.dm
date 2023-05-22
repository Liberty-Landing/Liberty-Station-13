/decl/hierarchy/outfit/job/engineering
	hierarchy_type = /decl/hierarchy/outfit/job/engineering
	belt = /obj/item/storage/belt/utility/full/union
	l_ear = /obj/item/device/radio/headset/headset_eng
	r_ear = /obj/item/tool/screwdriver
	shoes = /obj/item/clothing/shoes/workboots
	suit = /obj/item/clothing/suit/storage/hazardvest
	pda_slot = slot_l_store
	l_pocket = /obj/item/clothing/glasses/powered/meson/unionscouter
	r_pocket = /obj/item/device/t_scanner
	flags = OUTFIT_HAS_BACKPACK|OUTFIT_EXTENDED_SURVIVAL
	suit_store = /obj/item/gun/matter/launcher/breaker

/decl/hierarchy/outfit/job/engineering/New()
	..()
	BACKPACK_OVERRIDE_ENGINEERING

/decl/hierarchy/outfit/job/engineering/chief
	name = OUTFIT_JOB_NAME("Terra-Therma - Union Chief")
	uniform = /obj/item/clothing/under/union_chief_jumpsuit
	suit = /obj/item/clothing/suit/storage/toggle/union_chief_jacket
	gloves = /obj/item/clothing/gloves/insulated/union
	head = /obj/item/clothing/head/hardhatunion/union_chief_helmet
	l_ear = /obj/item/device/radio/headset/heads/ce
	id_type = /obj/item/card/id/ce
	pda_type = /obj/item/modular_computer/pda/heads/ce

/decl/hierarchy/outfit/job/engineering/engineer
	name = OUTFIT_JOB_NAME("Terra-Therma - Engineer")
	head = /obj/item/clothing/head/hardhatunion/union_engi_helmet
	uniform = /obj/item/clothing/under/union_engi_jumpsuit
	suit = /obj/item/clothing/suit/storage/toggle/union_engi_jacket
	gloves = /obj/item/clothing/gloves/insulated/union
	id_type = /obj/item/card/id/engie
	pda_type = /obj/item/modular_computer/pda/engineering

/decl/hierarchy/outfit/job/engineering/engineer/void
	name = OUTFIT_JOB_NAME("Terra-Therma - Engineer Voidsuit")
	mask = /obj/item/clothing/mask/breath
	suit = /obj/item/clothing/suit/space/void/engineering

/decl/hierarchy/outfit/job/engineering/mining
	name = OUTFIT_JOB_NAME("Terra-Therma - Miner")
	uniform = /obj/item/clothing/under/union_miner_jumpsuit
	suit = /obj/item/clothing/suit/storage/toggle/union_miner_jacket
	gloves = /obj/item/clothing/gloves/insulated/union
	head = /obj/item/clothing/head/hardhatunion/union_miner_helmet
	pda_type = /obj/item/modular_computer/pda/science/science
	suit_store = null
	backpack_contents = list(/obj/item/storage/bag/ore = 1)
	flags = OUTFIT_HAS_BACKPACK|OUTFIT_EXTENDED_SURVIVAL

/decl/hierarchy/outfit/job/engineering/mining/void
	name = OUTFIT_JOB_NAME("Terra-Therma - Miner Voidsuit")
	mask = /obj/item/clothing/mask/breath
	suit = /obj/item/clothing/suit/space/void/mining
