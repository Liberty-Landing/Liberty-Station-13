/decl/hierarchy/outfit/escapedprisoner
	name = "Escaped Prisoner"
	uniform = /obj/item/clothing/under/orange
	mask = /obj/item/clothing/mask/breath
	shoes = /obj/item/clothing/shoes/orange
	r_pocket = /obj/item/tank/emergency_oxygen
	back = /obj/item/storage/backpack/sport/orange

/decl/hierarchy/outfit/escapedprisoner/hobo
	belt = /obj/item/gun/projectile/revolver/handmade
	l_pocket = /obj/item/ammo_casing/magnum_40/scrap/prespawned

/obj/effect/mob_spawn/human/prisoner_transport/hobo
	outfit = /decl/hierarchy/outfit/escapedprisoner/hobo

/decl/hierarchy/outfit/scavenger
	name = "Scavenger"
	uniform = /obj/item/clothing/under/genericb
	head = /obj/item/clothing/head/helmet/steelpot
	shoes = /obj/item/clothing/shoes/color/black
	suit = /obj/item/clothing/suit/armor/flakvest
	suit_store = /obj/item/gun/projectile/boltgun
	back = /obj/item/storage/backpack
	r_pocket = /obj/item/ammo_magazine/speed_loader_rifle_75
	id_slot = slot_wear_id
	id_type = /obj/item/card/id

/decl/hierarchy/outfit/medical_ert
	name = "Medical Emergency Personnel"
	l_ear = /obj/item/device/radio/headset/ert
	head = /obj/item/clothing/head/helmet/faceshield/paramedic
	uniform = /obj/item/clothing/under/rank/cso
	suit = /obj/item/clothing/suit/armor/paramedic
	uniform = /obj/item/clothing/under/rank/paramedic
	r_pocket = /obj/item/device/lighting/toggleable/flashlight/pen
	pda_type = /obj/item/modular_computer/pda/heads/cso
	r_ear  = /obj/item/reagent_containers/syringe/large
	belt = /obj/item/storage/belt/medical
	glasses = /obj/item/clothing/glasses/hud/health
	shoes = /obj/item/clothing/shoes/reinforced/medical
	gloves = /obj/item/clothing/gloves/latex
	back = /obj/item/storage/backpack
	backpack_contents = list(/obj/item/storage/firstaid/capsa = 1, /obj/item/modular_computer/tablet/moebius/preset = 1, /obj/item/gun/projectile/stinger/pepperball/sopo = 1, \
							/obj/item/gun_upgrade/trigger/dnalock = 1, /obj/item/ammo_magazine/pistol_35/rubber = 2, /obj/item/bodybag/cryobag = 2, \
							/obj/item/storage/firstaid/capsa/large = 1, /obj/item/storage/firstaid/surgery/si = 1, /obj/item/roller/compact  = 1, /obj/item/device/defib_kit/compact/combat/adv/loaded = 1)
	l_pocket = /obj/item/card/id/emergency_response

/decl/hierarchy/outfit/engi_ert
	name = "Engineering Emergency Personnel"
	l_ear = /obj/item/device/radio/headset/ert
	head = /obj/item/clothing/head/firefighter/engineer_emergency
	suit = /obj/item/clothing/suit/storage/ert_hazardvest
	uniform = /obj/item/clothing/under/rank/engineer/ert_engineer
	r_pocket = /obj/item/device/t_scanner/advanced
	pda_type = /obj/item/modular_computer/pda/heads/ce
	belt = /obj/item/storage/belt/webbing/union/ert
	glasses = /obj/item/clothing/glasses/powered/meson
	shoes = /obj/item/clothing/shoes/workboots
	gloves = /obj/item/clothing/gloves/insulated
	back = /obj/item/storage/backpack
	backpack_contents = list(/obj/item/rcd/industrial = 1, \
							/obj/item/stack/material/compressed_matter/full = 1, \
							/obj/item/stack/material/mendsilicate/reinforced/full = 1, \
							/obj/item/stack/material/indsteel/full = 1, \
							/obj/item/stack/material/aluminium/full = 1, \
							/obj/item/stack/material/plastic/full = 1, \
							/obj/item/stack/cable_coil/random = 2, \
							/obj/item/rpd = 1, \
							/obj/item/modular_computer/tablet/lease/preset/command = 1,\
							/obj/item/extinguisher/mini = 1)
	l_pocket = /obj/item/card/id/emergency_response

/decl/hierarchy/outfit/doggo
	name = "Kriosan trooper"
	l_ear  =/obj/item/device/radio/headset
	head = /obj/item/clothing/head/helmet/generic_full
	uniform = /obj/item/clothing/under/kriosansuit
	suit = /obj/item/clothing/suit/armor/flakvest/full
	r_pocket = /obj/item/storage/firstaid/ifak
	belt = /obj/item/storage/belt/webbing
	gloves = /obj/item/clothing/gloves/thick/brown
	shoes = /obj/item/clothing/shoes/jackboots
	back = /obj/item/storage/backpack/satchel/security
	backpack_contents = list(/obj/item/ammo_magazine/ammobox/rifle_75_small = 2, /obj/item/ammo_magazine/ammobox/rifle_75 = 2, /obj/item/device/binoculars = 1, \
	/obj/item/device/radio = 1, /obj/item/tool_upgrade/productivity/ergonomic_grip = 1, /obj/item/tool_upgrade/refinement/laserguide = 1, /obj/item/clothing/accessory/holster/leg = 1, \
	/obj/item/tool/knife/boot = 1, /obj/item/reagent_containers/food/snacks/openable/mre = 1, /obj/item/clothing/mask/gas = 1)
	l_pocket = /obj/item/storage/pouch/ammo
