// Disks formated as /designpath = pointcost , if no point cost is specified it defaults to 1.
// To make a design unprotect use -1

// Magazines and ammo

/obj/item/computer_hardware/hard_drive/portable/design/nonlethal_ammo //please, maintain general order (pistol>speedloaders>smg>other>shells)+(smaller/less damaging caliber>bigger/more damaging caliber)
	disk_name = "LG Nonlethal Magazines Pack"
	icon_state = "liberty"

	license = 20
	designs = list(
		//pistol mags
		/datum/design/autolathe/ammo/pistol_rubber,
		/datum/design/autolathe/ammo/magnum_rubber,
		//speed loaders
		/datum/design/autolathe/ammo/slpistol_rubber,
		/datum/design/autolathe/ammo/slmagnum_rubber,
		//smg mags
		/datum/design/autolathe/ammo/smg_rubber,
		// rifles
		/datum/design/autolathe/ammo/lrifle_short_rubber,
		/datum/design/autolathe/ammo/rifle_short_rubber,
		//shells
		/datum/design/autolathe/ammo/shotgun_blanks = 0,
		/datum/design/autolathe/ammo/shotgun_beanbag,
		/datum/design/autolathe/ammo/shotgun_illumination,
	)

/obj/item/computer_hardware/hard_drive/portable/design/lethal_ammo //please, maintain general order (pistol>speedloaders>smg>other>shells)+(smaller/less damaging caliber>bigger/more damaging caliber)
	disk_name = "LG Lethal Magazines Pack"
	icon_state = "liberty"

	license = 20
	designs = list(
		//pistol mags
		/datum/design/autolathe/ammo/pistol,
		/datum/design/autolathe/ammo/pistol_lethal,
		/datum/design/autolathe/ammo/magnum,
		/datum/design/autolathe/ammo/magnum_lethal,
		//speed loaders
		/datum/design/autolathe/ammo/slpistol,
		/datum/design/autolathe/ammo/slpistol_lethal,
		/datum/design/autolathe/ammo/slmagnum,
		/datum/design/autolathe/ammo/slmagnum_lethal,
		//smg mags
		/datum/design/autolathe/ammo/smg,
		/datum/design/autolathe/ammo/smg_lethal,
		// rifles
		/datum/design/autolathe/ammo/lrifle,
		/datum/design/autolathe/ammo/lrifle_short,
		/datum/design/autolathe/ammo/lrifle_short_lethal,
		/datum/design/autolathe/ammo/rifle,
		/datum/design/autolathe/ammo/rifle_short,
		/datum/design/autolathe/ammo/rifle_lethal,
		/datum/design/autolathe/ammo/rifle_short_lethal,
		//shells
		/datum/design/autolathe/ammo/shotgun_pellet,
		/datum/design/autolathe/ammo/shotgun,
		/datum/design/autolathe/container/ammocan_serb,
	)

/obj/item/computer_hardware/hard_drive/portable/design/ammo_boxes_smallarms
	disk_name = "LG Handgun Ammunition"
	icon_state = "liberty"

	license = 20
	designs = list(
		/datum/design/autolathe/ammo/pistol_ammobox,
		/datum/design/autolathe/ammo/pistol_ammobox/large,
		/datum/design/autolathe/ammo/pistol_ammobox_practice = 0,
		/datum/design/autolathe/ammo/pistol_ammobox_rubber,
		/datum/design/autolathe/ammo/pistol_ammobox_lethal,
		/datum/design/autolathe/ammo/magnum_ammobox,
		/datum/design/autolathe/ammo/magnum_ammobox/large,
		/datum/design/autolathe/ammo/magnum_ammobox_practice = 0,
		/datum/design/autolathe/ammo/magnum_ammobox_rubber,
		/datum/design/autolathe/ammo/magnum_ammobox_lethal,
		/datum/design/autolathe/container/ammocan_serb,
	)

/obj/item/computer_hardware/hard_drive/portable/design/ammo_boxes_rifle
	disk_name = "LG Rifle Ammunition"
	icon_state = "liberty"

	license = 20
	designs = list(
		/datum/design/autolathe/ammo/rifle_ammobox_small,
		/datum/design/autolathe/ammo/rifle_ammobox_small_practice = 0,
		/datum/design/autolathe/ammo/rifle_ammobox_small_rubber,
		/datum/design/autolathe/ammo/rifle_ammobox_small_lethal,
		/datum/design/autolathe/ammo/rifle_ammobox,
		/datum/design/autolathe/ammo/lrifle_ammobox_small,
		/datum/design/autolathe/ammo/lrifle_ammobox_small_practice = 0,
		/datum/design/autolathe/ammo/lrifle_ammobox_small_rubber,
		/datum/design/autolathe/ammo/lrifle_ammobox_small_lethal,
		/datum/design/autolathe/ammo/lrifle_ammobox,
		/datum/design/autolathe/ammo/shotgun_box = 5, //35 x 4 (140 shells while a full disk of 5 x 20 = 100)
		/datum/design/autolathe/ammo/shotgun_pellet_box = 5,
		/datum/design/autolathe/container/ammocan_serb,
	)


/obj/item/computer_hardware/hard_drive/portable/design/exotic_ammo
	disk_name = "Car-Van Exotic Ammunition Pack"
	icon_state = "carvan"
	license = 20

	designs = list(
		/datum/design/autolathe/ammo/shotgun_speedloader_empty= 0,
		/datum/design/autolathe/ammo/sbaw_empty = 0,
		/datum/design/autolathe/ammo/m12empty = 0,
		/datum/design/autolathe/ammo/rifle_pk_empty = 0,
		/datum/design/autolathe/ammo/lrifle_belt_empty = 0,
		/datum/design/autolathe/ammo/maxim_empty = 0,
		/datum/design/autolathe/ammo/cl7mm = 3,
		/datum/design/autolathe/ammo/lrifle_ammobox,
		/datum/design/autolathe/ammo/rifle_ammobox,
		/datum/design/autolathe/ammo/shotgun_box = 3, //35 x 6 (210 shells well a full disk of 5 x 20 = 100)
		/datum/design/autolathe/ammo/shotgun_pellet_box = 3,
		/datum/design/autolathe/ammo/clbox_7mm = 5,
		/datum/design/autolathe/ammo/box_antim = 5,
		/datum/design/autolathe/container/ammocan_serb = 0,
		/datum/design/autolathe/ammo/lrifle_drum = 2,
		/datum/design/autolathe/ammo/lrifle_drum_empty = 1,
		/datum/design/autolathe/ammo/rifle_drum = 2,
		/datum/design/autolathe/ammo/rifle_drum_empty = 1,
		)

// G U N S (minus excelsior and research)
// Pack is used when there is more than one gun on the disk

// 9mm PISTOLS + REVOLVERS

/obj/item/computer_hardware/hard_drive/portable/design/guns/cheap_guns
	disk_name = "LG - 9mm Economy Pack"
	icon_state = "liberty"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/liberty = 2,
		/datum/design/autolathe/gun/clarissa,
		/datum/design/autolathe/gun/detective,
		/datum/design/autolathe/ammo/pistol_practice = 0,
		/datum/design/autolathe/ammo/pistol_rubber,
		/datum/design/autolathe/ammo/slpistol_practice = 0,
		/datum/design/autolathe/ammo/slpistol_rubber,
		/datum/design/autolathe/ammo/hpistol_practice = 1,
		/datum/design/autolathe/ammo/hpistol_rubber = 2,
		/datum/design/autolathe/ammo/hpistol = 2,
		/datum/design/autolathe/ammo/hpistol_lethal = 2,
		/datum/design/autolathe/container/ammocan_serb,
		)

/obj/item/computer_hardware/hard_drive/portable/design/guns/detective
	disk_name = "Car-Van - 9mm Pocket Prince"
	icon_state = "carvan"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/detective,
		/datum/design/autolathe/ammo/slpistol_practice = 0,
		/datum/design/autolathe/ammo/slpistol_rubber,
		/datum/design/autolathe/ammo/slpistol,
		/datum/design/autolathe/ammo/slpistol_lethal = 2
	)

/obj/item/computer_hardware/hard_drive/portable/design/guns/liberty
	disk_name = "LG - 9mm Liberty pistol"
	icon_state = "liberty"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/liberty = 2,
		/datum/design/autolathe/ammo/pistol_practice = 0,
		/datum/design/autolathe/ammo/pistol_rubber,
		/datum/design/autolathe/ammo/hpistol_practice = 1,
		/datum/design/autolathe/ammo/hpistol_rubber = 2,
		/datum/design/autolathe/ammo/hpistol = 2,
		/datum/design/autolathe/ammo/hpistol_lethal = 2,
		)

/obj/item/computer_hardware/hard_drive/portable/design/guns/stinger
	disk_name = "LG - 9mm Stinger pistol"
	icon_state = "liberty"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/stinger = 2,
		/datum/design/autolathe/ammo/pistol_practice = 0,
		/datum/design/autolathe/ammo/pistol_rubber,
		/datum/design/autolathe/ammo/hpistol_practice = 1,
		/datum/design/autolathe/ammo/hpistol_rubber = 2,
		/datum/design/autolathe/ammo/hpistol = 2,
		/datum/design/autolathe/ammo/hpistol_lethal = 2,
		)

/obj/item/computer_hardware/hard_drive/portable/design/guns/makarov
	disk_name = "Car-Van - 9mm Makarov pistol"
	icon_state = "carvan"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/makarov = 2,
		/datum/design/autolathe/ammo/pistol_practice = 0,
		/datum/design/autolathe/ammo/pistol_rubber,
		/datum/design/autolathe/ammo/hpistol_practice = 1,
		/datum/design/autolathe/ammo/hpistol_rubber = 2,
		/datum/design/autolathe/ammo/hpistol = 2,
		/datum/design/autolathe/ammo/hpistol_lethal = 2,
		)

// 10mm REVOLVERS

/obj/item/computer_hardware/hard_drive/portable/design/guns/revolver
	disk_name = "Car-Van - 10mm Frontier Revolver"
	icon_state = "carvan"
	license = 8
	designs = list(
		/datum/design/autolathe/gun/frontier = 3,
		/datum/design/autolathe/ammo/slmagnum_practice = 0,
		/datum/design/autolathe/ammo/slmagnum_rubber,
		/datum/design/autolathe/ammo/slmagnum,
		/datum/design/autolathe/ammo/slmagnum_lethal = 2,
		)

/obj/item/computer_hardware/hard_drive/portable/design/guns/frontier
	disk_name = "ML - 10mm Frontier Revolver"
	icon_state = "martian"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/ranger = 3,
		/datum/design/autolathe/ammo/slmagnum_practice = 0,
		/datum/design/autolathe/ammo/slmagnum_rubber,
		/datum/design/autolathe/ammo/slmagnum,
		/datum/design/autolathe/ammo/slmagnum_lethal = 2,
		)

// 10mm pistols

/obj/item/computer_hardware/hard_drive/portable/design/guns/colt
	disk_name = "ML - 10mm M1911"
	icon_state = "martian"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/colt = 3,
		/datum/design/autolathe/ammo/magnum_practice = 0,
		/datum/design/autolathe/ammo/magnum_rubber,
		/datum/design/autolathe/ammo/magnum,
		/datum/design/autolathe/ammo/magnum_lethal = 2,
	)

/obj/item/computer_hardware/hard_drive/portable/design/guns/martian
	disk_name = "ML - 10mm Martian"
	icon_state = "martian"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/martian = 3,
		/datum/design/autolathe/ammo/magnum_practice = 0,
		/datum/design/autolathe/ammo/magnum_rubber,
		/datum/design/autolathe/ammo/magnum,
		/datum/design/autolathe/ammo/magnum_lethal = 2,
	)

/obj/item/computer_hardware/hard_drive/portable/design/guns/frontier
	disk_name = "ML - 10mm Frontier"
	icon_state = "martian"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/frontier = 3,
		/datum/design/autolathe/ammo/slmagnum_practice = 0,
		/datum/design/autolathe/ammo/slmagnum_rubber,
		/datum/design/autolathe/ammo/slmagnum,
		/datum/design/autolathe/ammo/slmagnum_lethal = 2,
	)

/obj/item/computer_hardware/hard_drive/portable/design/guns/ranger
	disk_name = "ML - 10mm Ranger"
	icon_state = "martian"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/ranger = 3,
		/datum/design/autolathe/ammo/slmagnum_practice = 0,
		/datum/design/autolathe/ammo/slmagnum_rubber,
		/datum/design/autolathe/ammo/slmagnum,
		/datum/design/autolathe/ammo/slmagnum_lethal = 2,
	)

// 10mm SMGS
/obj/item/computer_hardware/hard_drive/portable/design/guns/tactical
	disk_name = "LG - 10mm Tactical SMG"
	icon_state = "liberty"

	license = 12
	designs = list(
		/datum/design/autolathe/gun/tactical = 4, //The gun is free as this is the only way to get it
		/datum/design/autolathe/ammo/smg_magnum_40 = 3,
		/datum/design/autolathe/ammo/smg_magnum_40_rubber = 2,
		//Free as well do to being the only way to get these mags
		/datum/design/autolathe/ammo/smg_magnum_40_empty = 0,
		/datum/design/autolathe/ammo/smg_magnum_40_practice = 0,
		/datum/design/autolathe/ammo/smg_magnum_40_lethal = 4
		)

/obj/item/computer_hardware/hard_drive/portable/design/guns/thompson
	disk_name = "No-Owner - 10mm Umbani SMG"
	icon_state = "black"

	license = 12
	designs = list(
		/datum/design/autolathe/gun/umbani = 4,
		/datum/design/autolathe/ammo/smg_magnum_40 = 2,
		/datum/design/autolathe/ammo/smg_magnum_40_rubber = 1,
		/datum/design/autolathe/ammo/smg_magnum_40_lethal = 3,
		/datum/design/autolathe/ammo/smg_magnum_40_practice = 0
		)

// SHOTGUNS

/obj/item/computer_hardware/hard_drive/portable/design/guns/doublebarrel
	disk_name = "Car-Van - 12 gauge Double Barrel Shotgun"
	icon_state = "carvan"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/doublebarrel = 3,
		/datum/design/autolathe/ammo/shotgun_beanbag,
		/datum/design/autolathe/ammo/shotgun_blanks = 0,
		/datum/design/autolathe/ammo/shotgun_illumination,
		)

/obj/item/computer_hardware/hard_drive/portable/design/guns/western
	disk_name = "Car-Van - 12 gauge Trench Shotgun"
	icon_state = "carvan"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/western = 3,
		/datum/design/autolathe/ammo/shotgun_beanbag,
		/datum/design/autolathe/ammo/shotgun_blanks = 0,
		/datum/design/autolathe/ammo/shotgun_illumination,
		)

/obj/item/computer_hardware/hard_drive/portable/design/guns/trench
	disk_name = "LG - 12 gauge Trench Shotgun"
	icon_state = "liberty"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/pump_shotgun = 3,
		/datum/design/autolathe/ammo/shotgun_beanbag,
		/datum/design/autolathe/ammo/shotgun_blanks = 0,
		/datum/design/autolathe/ammo/shotgun_illumination,
		)

/obj/item/computer_hardware/hard_drive/portable/design/guns/judge
	disk_name = "ML - 12 gauge Judge Auto Shotgun"
	icon_state = "martian"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/judge = 3,
		/datum/design/autolathe/ammo/shotgun_beanbag,
		/datum/design/autolathe/ammo/shotgun_blanks = 0,
		/datum/design/autolathe/ammo/shotgun_illumination,
		)

/obj/item/computer_hardware/hard_drive/portable/design/guns/sweeper
	disk_name = "Car-Van - 20mm Street Sweeper Auto Shotgun"
	icon_state = "carvan"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/sweeper = 3,
		/datum/design/autolathe/ammo/m12beanbag, // Never add tazershells, for love of god
		/datum/design/autolathe/ammo/m12pellet,
		/datum/design/autolathe/ammo/m12slug,
		)

// SMGs

/obj/item/computer_hardware/hard_drive/portable/design/guns/broz
	disk_name = "No-Owner - 9mm Broz SMG"
	icon_state = "freeworlds"

	license = 12
	designs = list(
		/datum/design/autolathe/gun/broz = 3,
		/datum/design/autolathe/ammo/smg_practice = 0,
		/datum/design/autolathe/ammo/smg_rubber,
		/datum/design/autolathe/ammo/smg,
		/datum/design/autolathe/ammo/smg_lethal = 2,
	)

/obj/item/computer_hardware/hard_drive/portable/design/guns/specialist
	disk_name = "ML - 9mm Specialist SMG"
	icon_state = "martian"

	license = 12
	designs = list(
		/datum/design/autolathe/gun/specialist = 3,
		/datum/design/autolathe/ammo/smg_practice = 0,
		/datum/design/autolathe/ammo/smg_rubber,
		/datum/design/autolathe/ammo/smg,
		/datum/design/autolathe/ammo/smg_lethal = 2,
	)

/obj/item/computer_hardware/hard_drive/portable/design/guns/umbani
	disk_name = "No-Owner - 10mm Umbani SMG"
	icon_state = "freeworlds"

	license = 12
	designs = list(
		/datum/design/autolathe/gun/umbani = 3,
		/datum/design/autolathe/ammo/smg_practice = 0,
		/datum/design/autolathe/ammo/smg_rubber,
		/datum/design/autolathe/ammo/smg,
		/datum/design/autolathe/ammo/smg_lethal = 2,
	)

// 6.5mm carbines

/obj/item/computer_hardware/hard_drive/portable/design/guns/federalist
	disk_name = "ML - 6.5mm \"Federalist\" Carbine"
	icon_state = "martian"

	license = 18
	designs = list(
		/datum/design/autolathe/gun/federalist = 6,
		/datum/design/autolathe/ammo/lrifle_short_practice = 0,
		/datum/design/autolathe/ammo/lrifle_short_rubber,
		/datum/design/autolathe/ammo/lrifle_short,
		/datum/design/autolathe/ammo/lrifle_short_lethal = 2,
		/datum/design/autolathe/ammo/lrifle_practice = 1,
		/datum/design/autolathe/ammo/lrifle_rubber = 2,
		/datum/design/autolathe/ammo/lrifle = 2,
		/datum/design/autolathe/ammo/lrifle_lethal = 4,
		)

/obj/item/computer_hardware/hard_drive/portable/design/guns/ak47carbine
	disk_name = "LG - 6.5mm Ugil Carbine"
	icon_state = "liberty"

	license = 16
	designs = list(
		/datum/design/autolathe/gun/akcarbine = 6,
		/datum/design/autolathe/ammo/lrifle_short_practice = 0,
		/datum/design/autolathe/ammo/lrifle_short_rubber,
		/datum/design/autolathe/ammo/lrifle_short,
		/datum/design/autolathe/ammo/lrifle_short_lethal = 2,
		/datum/design/autolathe/ammo/lrifle_practice = 1,
		/datum/design/autolathe/ammo/lrifle_rubber = 2,
		/datum/design/autolathe/ammo/lrifle = 2,
		/datum/design/autolathe/ammo/lrifle_lethal = 4,
	)

/obj/item/computer_hardware/hard_drive/portable/design/guns/duty
	disk_name = "Car-Van - 6.5mm Duty Marksman Carbine"
	icon_state = "carvan"

	license = 16
	designs = list(
		/datum/design/autolathe/gun/duty = 6,
		/datum/design/autolathe/ammo/lrifle_short_practice = 0,
		/datum/design/autolathe/ammo/lrifle_short_rubber,
		/datum/design/autolathe/ammo/lrifle_short,
		/datum/design/autolathe/ammo/lrifle_short_lethal = 2,
		/datum/design/autolathe/ammo/lrifle_practice = 1,
		/datum/design/autolathe/ammo/lrifle_rubber = 2,
		/datum/design/autolathe/ammo/lrifle = 2,
		/datum/design/autolathe/ammo/lrifle_lethal = 4,
	)

// 6.5mm Revolver

/obj/item/computer_hardware/hard_drive/portable/design/guns/wristbreaker
	disk_name = "ML - 6.5mm Wristbreaker Revolver"
	icon_state = "martian"

	license = 6	//Stops a lot of wristbreakers going all around.
	designs = list(
		/datum/design/autolathe/gun/wristbreaker = 3,
		/datum/design/autolathe/ammo/lrifle_ammobox = 2,
		/datum/design/autolathe/ammo/lrifle_ammobox_small_practice = 0,
		/datum/design/autolathe/ammo/lrifle_ammobox_rubber,
	)

// 6.5mm LMG

/obj/item/computer_hardware/hard_drive/portable/design/guns/buzzsaw
	disk_name = "ML - 6.5mm Buzzsaw LMG"
	icon_state = "martian"

	license = 8 //So we can print 2 and some ammo
	designs = list(
		/datum/design/autolathe/gun/buzzsaw = 3,
		/datum/design/autolathe/ammo/lrifle_ammobox = 2,
		/datum/design/autolathe/ammo/lrifle_belt, //This is its linked ammo
		/datum/design/autolathe/ammo/lrifle_belt_empty = 0,
		/datum/design/autolathe/ammo/lrifle_ammobox_small_practice = 0,
		/datum/design/autolathe/ammo/lrifle_ammobox_rubber,
	)

/obj/item/computer_hardware/hard_drive/portable/design/guns/hog
	disk_name = "LG - 6.5mm Hog LMG"
	icon_state = "liberty"

	license = 8 //So we can print 2 and some ammo
	designs = list(
		/datum/design/autolathe/gun/hog = 3,
		/datum/design/autolathe/ammo/lrifle_ammobox = 2,
		/datum/design/autolathe/ammo/lrifle_belt, //This is its linked ammo
		/datum/design/autolathe/ammo/lrifle_belt_empty = 0,
		/datum/design/autolathe/ammo/lrifle_ammobox_small_practice = 0,
		/datum/design/autolathe/ammo/lrifle_ammobox_rubber,
	)

//6.5mm Bolt Action Rifle

/obj/item/computer_hardware/hard_drive/portable/design/guns/rosefield
	disk_name = "Car-Van - 6.5mm Rosefield Rifle"
	icon_state = "carvan"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/rosefield =  3,
		/datum/design/autolathe/ammo/lrifle_speed_loader,
		/datum/design/autolathe/ammo/lrifle_ammobox_small_practice = 0,
		/datum/design/autolathe/ammo/lrifle_ammobox_small_rubber,
		/datum/design/autolathe/ammo/lrifle_ammobox_small,
		/datum/design/autolathe/ammo/lrifle_ammobox_small_lethal = 2,
	)

// 7.62mm Rifles

/obj/item/computer_hardware/hard_drive/portable/design/guns/ak47
	disk_name = "LG - 7.62mm Kalashnikov Rifle"
	icon_state = "liberty"

	license = 16
	designs = list(
		/datum/design/autolathe/gun/ak47 = 6,
		/datum/design/autolathe/ammo/rifle_short_practice = 0,
		/datum/design/autolathe/ammo/rifle_short_rubber,
		/datum/design/autolathe/ammo/rifle_short,
		/datum/design/autolathe/ammo/rifle_short_lethal = 2,
		/datum/design/autolathe/ammo/rifle_practice = 1,
		/datum/design/autolathe/ammo/rifle_rubber = 2,
		/datum/design/autolathe/ammo/rifle = 2,
		/datum/design/autolathe/ammo/rifle_lethal = 4,
	)

/obj/item/computer_hardware/hard_drive/portable/design/guns/nationale
	disk_name = "Car-Van - 7.62mm Nationale Rifle"
	icon_state = "carvan"

	license = 16
	designs = list(
		/datum/design/autolathe/gun/nationale = 6,
		/datum/design/autolathe/ammo/rifle_short_practice = 0,
		/datum/design/autolathe/ammo/rifle_short_rubber,
		/datum/design/autolathe/ammo/rifle_short,
		/datum/design/autolathe/ammo/rifle_short_lethal = 2,
		/datum/design/autolathe/ammo/rifle_practice = 1,
		/datum/design/autolathe/ammo/rifle_rubber = 2,
		/datum/design/autolathe/ammo/rifle = 2,
		/datum/design/autolathe/ammo/rifle_lethal = 4,
	)

// 7.62mm Boltaction Rifles

/obj/item/computer_hardware/hard_drive/portable/design/guns/boltgun
	disk_name = "No-Owner - 7.62mm Novakovic Rifle"
	icon_state = "black"

	license = 12
	designs = list(
		/datum/design/autolathe/gun/boltgun = 3,
		/datum/design/autolathe/ammo/rifle_ammobox_small_practice = 0,
		/datum/design/autolathe/ammo/rifle_ammobox_small_rubber,
		/datum/design/autolathe/ammo/rifle_ammobox,
		/datum/design/autolathe/ammo/rifle_ammobox_small_lethal = 2,
		/datum/design/autolathe/ammo/sl_rifle,
	)

/obj/item/computer_hardware/hard_drive/portable/design/guns/gamer
	disk_name = "Car-Van - 7.62mm Big Game Rifle"
	icon_state = "carvan"

	license = 12
	designs = list(
		/datum/design/autolathe/gun/biggame = 3,
		/datum/design/autolathe/ammo/rifle_ammobox_small_practice = 0,
		/datum/design/autolathe/ammo/rifle_ammobox_small_rubber,
		/datum/design/autolathe/ammo/rifle_ammobox,
		/datum/design/autolathe/ammo/rifle_ammobox_small_lethal = 2,
		/datum/design/autolathe/ammo/sl_rifle,
	)

//7mm Guns

/obj/item/computer_hardware/hard_drive/portable/design/guns/kraut
	disk_name = "ML - 7mm Caseless Kraut Rifle"
	icon_state = "martian"

	license = 10 //2 guns 2 mags and 1 box
	designs = list(
		/datum/design/autolathe/gun/kraut = 3,
		/datum/design/autolathe/ammo/cl7mm,
		/datum/design/autolathe/ammo/clbox_7mm = 2,
	)

/obj/item/computer_hardware/hard_drive/portable/design/guns/operator_rifle
	disk_name = "ML - 7mm Caseless Operator Rifle"
	icon_state = "martian"

	license = 10 //2 guns 2 mags and 1 box
	designs = list(
		/datum/design/autolathe/gun/operator_rifle = 3,
		/datum/design/autolathe/ammo/cl7mm,
		/datum/design/autolathe/ammo/clbox_7mm = 2,
	)

/obj/item/computer_hardware/hard_drive/portable/design/guns/contractor
	disk_name = "ML - 7mm Caseless Contractor Rifle"
	icon_state = "martian"

	license = 10 //2 guns 2 mags and 1 box
	designs = list(
		/datum/design/autolathe/gun/contractor = 3,
		/datum/design/autolathe/ammo/clbox_7mm = 2,
	)

// Heavy

/obj/item/computer_hardware/hard_drive/portable/design/guns/heavysniper
	disk_name = "ML - 14.5×114mm Penetrator AMR"
	icon_state = "martian"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/heavysniper = 3,
		/datum/design/autolathe/ammo/antim,
		/datum/design/autolathe/ammo/box_antim = 2,
	)


/obj/item/computer_hardware/hard_drive/portable/design/guns/sa_pk
	disk_name = "Car-Van - 7.62mm Pulemyot Kalashnikova MG"
	icon_state = "carvan"

	license = 12
	designs = list(
		/datum/design/autolathe/gun/mg_pk = 3,
		/datum/design/autolathe/ammo/rifle_pk,
		/datum/design/autolathe/ammo/rifle_pk_empty = 0,
	)

// Grenade Launchers

/obj/item/computer_hardware/hard_drive/portable/design/guns/lenar
	disk_name = "ML - Lenar Grenade Launcher"
	icon_state = "martian"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/grenade_launcher_lenar = 3, // "FS GL \"Lenar\""
		/datum/design/autolathe/ammo/grenade,
		/datum/design/autolathe/ammo/grenade/frag = 2,
		/datum/design/autolathe/ammo/grenade/emp = 2,
		/datum/design/autolathe/ammo/grenade/blast = 2,
		/datum/design/autolathe/ammo/grenade/flash = 2
		)

/obj/item/computer_hardware/hard_drive/portable/design/guns/china
	disk_name = "LG GL - \"China Lake\""
	icon_state = "liberty"

	license = 12
	designs = list(
		/datum/design/autolathe/gun/grenade_launcher_china_lake = 3,
		/datum/design/autolathe/ammo/grenade = 1,
		/datum/design/autolathe/ammo/grenade/frag = 2,
		/datum/design/autolathe/ammo/grenade/emp = 2,
		/datum/design/autolathe/ammo/grenade/blast = 3,
		/datum/design/autolathe/ammo/grenade/flash = 2
		)

/obj/item/computer_hardware/hard_drive/portable/design/guns/protector
	disk_name = "Car-Van GL - Grenade Launcher"
	icon_state = "carvan"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/grenade_launcher = 3,
		/datum/design/autolathe/ammo/grenade,
		/datum/design/autolathe/ammo/grenade/frag = 2,
		/datum/design/autolathe/ammo/grenade/emp = 2,
		/datum/design/autolathe/ammo/grenade/blast = 2,
		/datum/design/autolathe/ammo/grenade/flash = 2
	)

// ENERGY ARMS

/obj/item/computer_hardware/hard_drive/portable/design/guns/counselor
	disk_name = "HEC - PDW E \"Tesla\""
	icon_state = "hellion"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/taser,
		/datum/design/autolathe/cell/medium/high,
	)

/obj/item/computer_hardware/hard_drive/portable/design/guns/nt_counselor
	disk_name = "Astrakhan - LP \"Odesk\""
	icon_state = "astrakhan"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/ntpistol = 2,
		/datum/design/autolathe/cell/small/high,
	)

/obj/item/computer_hardware/hard_drive/portable/design/guns/sunrise
	disk_name = "No-Owner - \"Sunrise\" Laser SMG"
	icon_state = "freeworlds"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/sunrise = 3,
		/datum/design/autolathe/cell/medium/high,
	)

/obj/item/computer_hardware/hard_drive/portable/design/guns/spiderrose
	disk_name = "HEC - PDW E \"Edison\""
	icon_state = "hellion"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/energygun = 3,
		/datum/design/autolathe/cell/medium/high,
	)

/obj/item/computer_hardware/hard_drive/portable/design/guns/firestorm
	disk_name = "HEC - ESMG \"Firestorm\""
	icon_state = "hellion"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/firestorm = 2,
		/datum/design/autolathe/cell/small/high,
	)

/obj/item/computer_hardware/hard_drive/portable/design/guns/lasercannon
	disk_name = "HEC - \"Titanica\" Laser Cannon"
	icon_state = "hellion"

	license = 8 //2 gun 2 cell,
	designs = list(
		/datum/design/autolathe/gun/titanica = 3,
		/datum/design/autolathe/cell/small/high,
	)

/obj/item/computer_hardware/hard_drive/portable/design/guns/auretian
	disk_name = "PI - \"Auretian\" E Pistol"
	icon_state = "pirs"

	license = 4 //1 gun 1 cell, or 4 good cells that are bette then normal
	designs = list(
		/datum/design/research/item/weapon/auretian = 3,
		/datum/design/research/item/powercell/small/basic,
	)

/obj/item/computer_hardware/hard_drive/portable/design/guns/stun_revolver_sci
	disk_name = "PI - \"Hera\" Stun Revolver"
	icon_state = "pirs"

	license = 8 //2 gun 2 cell, or 8 good cells that are bette then normal
	designs = list(
		/datum/design/research/item/weapon/stunrevolver = 3,
		/datum/design/research/item/powercell/small/basic,
	)

/obj/item/computer_hardware/hard_drive/portable/design/guns/stun_revolver
	disk_name = "Astrakhan - \"Zeus\" Stun Revolver"
	icon_state = "astrakhan"

	license = 8//2 guns 2 cells
	designs = list(
		/datum/design/autolathe/gun/revolver_taser = 2,
		/datum/design/autolathe/cell/small/high,
	)

/obj/item/computer_hardware/hard_drive/portable/design/guns/lasercannon
	disk_name = "PI - \"Solaris\" Laser Cannon"
	icon_state = "pirs"

	license = 8 //1 gun 1 cell, or 4 good cells that are bette then normal
	designs = list(
		/datum/design/research/item/weapon/lasercannon = 6,
		/datum/design/research/item/powercell/medium/basic = 2,
	)

/obj/item/computer_hardware/hard_drive/portable/design/guns/nemesis
	disk_name = "Unknown - \"Syndicate\" Energy Crossbow"
	icon_state = "black"

	license = 2
	designs = list(
		/datum/design/autolathe/gun/energy_crossbow,
	)

/obj/item/computer_hardware/hard_drive/portable/design/guns/lightfall
	disk_name = "Astrakhan - \"Kalmyk\" Laser Gun"
	icon_state = "astrakhan"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/laser = 2,
		/datum/design/autolathe/cell/medium/high,
	)

/obj/item/computer_hardware/hard_drive/portable/design/guns/valkirye
	disk_name = "HEC - \"Valkyrie\" Energy Rifle"
	icon_state = "hellion"

	license = 12
	designs = list(
		/datum/design/autolathe/gun/sniperrifle = 3,
		/datum/design/autolathe/cell/medium/high,
	)

/obj/item/computer_hardware/hard_drive/portable/design/guns/halicon
	disk_name = "Astrakhan - \"Halcyon\" Ion Rifle"
	icon_state = "astrakhan"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/ionrifle = 2,
		/datum/design/autolathe/cell/medium/high,
	)

// PLASMA ARMS

/obj/item/computer_hardware/hard_drive/portable/design/guns/cassad
	disk_name = "HEC - \"Cassad\" Plasma Rifle"
	icon_state = "hellion"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/pulse_cassad = 4,
		/datum/design/autolathe/cell/medium/high,
	)

/obj/item/computer_hardware/hard_drive/portable/design/guns/centurio
	disk_name = "PI - \"Centurio\" Plasma Pistol"
	icon_state = "pirs"

	license = 8 //1 gun 1 cell, or 4 good cells that are bette then normal
	designs = list(
		/datum/design/research/item/weapon/centurio = 6,
		/datum/design/research/item/powercell/medium/basic = 2,
	)

/obj/item/computer_hardware/hard_drive/portable/design/guns/dominion
	disk_name = "Astrakhan - Shenyang Plasma Rifle"
	icon_state = "astrakhan"

	license = 12
	designs = list(
		/datum/design/autolathe/gun/pulse = 3,
		/datum/design/autolathe/cell/medium/high,
	)

/obj/item/computer_hardware/hard_drive/portable/design/guns/purger
	disk_name = "Astrakhan - Hunan Plasma Rifle"
	icon_state = "astrakhan"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/pulse_destroyer = 3,
		/datum/design/autolathe/cell/medium/high,
	)
