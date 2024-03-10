/decl/hierarchy/outfit/job/security
	hierarchy_type = /decl/hierarchy/outfit/job/security
	l_ear = /obj/item/device/radio/headset/headset_sec/bowman
	gloves = /obj/item/clothing/gloves/thick
	shoes = /obj/item/clothing/shoes/jackboots
	id_type = /obj/item/card/id/sec
	pda_type = /obj/item/modular_computer/pda/security
	backpack_contents = list(/obj/item/handcuffs = 1)

/decl/hierarchy/outfit/job/security/New()
	..()
	BACKPACK_OVERRIDE_SECURITY

/decl/hierarchy/outfit/job/security/dc
	name = OUTFIT_JOB_NAME("Liberty Watch - Deputy Chief")
	l_ear = /obj/item/device/radio/headset/heads/bscom
	uniform = /obj/item/clothing/under/rank/warden
	belt = /obj/item/gun/energy/taser
	l_pocket = /obj/item/device/flash
	gloves = /obj/item/clothing/gloves/stungloves
	glasses = /obj/item/clothing/glasses/ballistic
	id_type = /obj/item/card/id/hos
	pda_type = /obj/item/modular_computer/pda/heads/hos
	backpack_contents = list(/obj/item/storage/hcases/ammo/ih/wo = 1, /obj/item/gun/projectile/stinger = 1, /obj/item/ammo_magazine/pistol_35= 3)

/decl/hierarchy/outfit/job/security/armorer
	name = OUTFIT_JOB_NAME("Liberty Watch - Armorer")
	uniform = /obj/item/clothing/under/rank/warden
	suit = /obj/item/clothing/suit/armor/vest/ironhammer
	head = /obj/item/clothing/head/rank/warden/beret
	belt = /obj/item/gun/energy/taser
	glasses = /obj/item/clothing/glasses/hud/security
	l_pocket = /obj/item/device/flash
	gloves = /obj/item/clothing/gloves/stungloves
	backpack_contents = list(/obj/item/storage/hcases/ammo/ih/spec_officer = 1, /obj/item/gun/projectile/stinger = 1, /obj/item/ammo_magazine/pistol_35= 3)

/decl/hierarchy/outfit/job/security/investigator
	name = OUTFIT_JOB_NAME("Liberty Watch - Criminal Investigator")
	head = /obj/item/clothing/head/rank/inspector
	uniform = /obj/item/clothing/under/rank/inspector
	suit = /obj/item/clothing/suit/storage/rank/insp_trench
	head = /obj/item/clothing/head/investigator
	belt = /obj/item/gun/energy/taser
	gloves = /obj/item/clothing/gloves/stungloves
	l_pocket = /obj/item/device/flash
	shoes = /obj/item/clothing/shoes/reinforced
	r_hand = /obj/item/storage/briefcase/crimekit
	id_type = /obj/item/card/id/det
	pda_type = /obj/item/modular_computer/pda/forensics
	backpack_contents = list(/obj/item/storage/hcases/ammo/ih/ranger_officer = 1, /obj/item/gun/projectile/stinger = 1, /obj/item/ammo_magazine/pistol_35= 3)

/decl/hierarchy/outfit/job/security/detective/New()
	..()
	backpack_overrides.Cut()

/decl/hierarchy/outfit/job/security/watchmen
	name = OUTFIT_JOB_NAME("Liberty Watch - Watchmen")
	l_pocket = /obj/item/device/flash
	belt = /obj/item/gun/energy/taser
	uniform = /obj/item/clothing/under/rank/security
	suit = /obj/item/clothing/suit/armor/vest/ironhammer/detective
	mask = /obj/item/clothing/mask/balaclava/tactical
	glasses = /obj/item/clothing/glasses/sechud/tactical
	head = /obj/item/clothing/head/seccap
	gloves = /obj/item/clothing/gloves/stungloves
	backpack_contents = list(/obj/item/storage/hcases/ammo/ih/marshal_officer = 1, /obj/item/gun/projectile/stinger = 1, /obj/item/ammo_magazine/pistol_35= 3)
