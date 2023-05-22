/decl/hierarchy/outfit/job/church
	l_ear = /obj/item/device/radio/headset/church
	id_type = /obj/item/card/id/church
	pda_type = /obj/item/modular_computer/pda/church
	hierarchy_type = /decl/hierarchy/outfit/job/church
	backpack_contents = list(/obj/item/book/ritual/cruciform = 1)
	shoes = /obj/item/clothing/shoes/custodian
	gloves = /obj/item/clothing/gloves/thick

/decl/hierarchy/outfit/job/church/New()
	..()
	BACKPACK_OVERRIDE_NEOTHEOLOGY

/decl/hierarchy/outfit/job/church/oathpledge
	name = OUTFIT_JOB_NAME("Custodians of Bonfires - Oathpledge")
	l_ear = /obj/item/device/radio/headset/heads/preacher
	id_type = /obj/item/card/id/chaplain
	uniform = /obj/item/clothing/under/custodian/oathpledge
	suit = /obj/item/clothing/suit/storage/custodian/oathpledge
	head = /obj/item/clothing/head/custodian/oathpledge
	backpack_contents = list(/obj/item/book/ritual/cruciform/priest = 1, /obj/item/forgesigil = 1, /obj/item/mold/oathpledge_neuron = 1)

/decl/hierarchy/outfit/job/church/forgemaster
	name = OUTFIT_JOB_NAME("Custodians of Bonfires - Forgemaster")
	uniform = /obj/item/clothing/under/custodian/forgemaster
	suit = /obj/item/clothing/suit/storage/custodian/forgemaster
	head = /obj/item/clothing/head/custodian/forgemaster
	backpack_contents = list(/obj/item/book/ritual/cruciform = 1, /obj/item/clothing/glasses/welding = 1)

/decl/hierarchy/outfit/job/church/enkindled
	name = OUTFIT_JOB_NAME("Custodians of Bonfires - Enkindled")
	uniform = /obj/item/clothing/under/custodian/enkindled
	suit = /obj/item/clothing/suit/storage/custodian/enkindled
	head = /obj/item/clothing/head/custodian/enkindled

/decl/hierarchy/outfit/job/church/oathbound
	name = OUTFIT_JOB_NAME("Custodians of Bonfires - Oathbound")
	uniform = /obj/item/clothing/under/custodian/oathbound
	suit = /obj/item/clothing/suit/storage/custodian/oathbound
	head = /obj/item/clothing/head/custodian/oathbound
