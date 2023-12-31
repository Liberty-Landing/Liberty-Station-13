// Disks formated as /designpath = pointcost , if no point cost is specified it defaults to 1.
// To make a design unprotect use -1

/*
This is the master-file for all gun parts crafting disks. All gun parts in autolathe printing form can be found inside datums/autolathe/parts.dm.

Parts disks should be kept VERY RARE to encourage players to trade and go to specific departments to buy bulk-parts, or encourage them to go and find parts themselves.
However, bootleg parts - i.e aluminium parts - should be easily printed and easier to find as they, currently (as of the making of the gun parts PR), can only be used in bootleg hamdemades.

Avoid any disks here being found or used commonly beyond an intended purpose, otherwise you will flood the economy full of parts.
*/

// Master-disk for example, full of 'lower-end' regular parts. Unused currently. Maybe consider putting on beacon or RARE loot rotation if gun parts are an issue.
/obj/item/computer_hardware/hard_drive/portable/design/gun_parts/resale
	disk_name = "LG - \"Do it yourself!\" firearm parts"
	icon_state = "liberty"

	license = 20
	designs = list(
		/datum/design/autolathe/part/grip/wood = 0,
		/datum/design/autolathe/part/grip/plastic,
		/datum/design/autolathe/part/grip/serb = 2,
		/datum/design/autolathe/part/mechanism/pistol,
		/datum/design/autolathe/part/mechanism/revolver,
		/datum/design/autolathe/part/mechanism/boltgun,
		/datum/design/autolathe/part/mechanism/shotgun = 2,
		/datum/design/autolathe/part/mechanism/autorifle = 3,
		/datum/design/autolathe/part/barrel/pistol,
		/datum/design/autolathe/part/barrel/magnum,
		/datum/design/autolathe/part/barrel/carbine = 2,
		/datum/design/autolathe/part/barrel/rifle = 2,
	)

// Watchmen-specific disk, used by Watchmen for high-end gun crafting. MOST gun parts should be here, but thankfully licenses keep it at limited-use.
// For mass-production, Guild should be used. Only thing this disk has that Guild does not is heavy rifle barrles, AMR barrels, rubber grips, and machinegun mechanisms.
/obj/item/computer_hardware/hard_drive/portable/design/gun_parts/marshal
	disk_name = "LG - \"Gunsmiths United\" firearm parts"
	icon_state = "liberty"

	license = 20
	designs = list(
		/datum/design/autolathe/part/grip/wood = 0,
		/datum/design/autolathe/part/grip/plastic,
		/datum/design/autolathe/part/grip/serb,
		/datum/design/autolathe/part/grip/rubber,
		/datum/design/autolathe/part/mechanism/pistol,
		/datum/design/autolathe/part/mechanism/revolver,
		/datum/design/autolathe/part/mechanism/shotgun,
		/datum/design/autolathe/part/mechanism/autorifle = 1,
		/datum/design/autolathe/part/mechanism/smg,
		/datum/design/autolathe/part/mechanism/machinegun = 1,
		/datum/design/autolathe/part/barrel/pistol,
		/datum/design/autolathe/part/barrel/magnum,
		/datum/design/autolathe/part/barrel/carbine = 1,
		/datum/design/autolathe/part/barrel/rifle = 1,
		/datum/design/autolathe/part/barrel/shotgun,
		/datum/design/autolathe/part/barrel/amr = 5,
	)

// Bootleg-gun production stuff. Found in loot-piles, can be bought by Skylight for a slightly inflated price.
// Relatively useless, but might be useful for Outsiders, Scavs, and anyone wanting really cheap guns instead of paying inflated prices just for a single normal gun.
/obj/item/computer_hardware/hard_drive/portable/design/gun_parts/bootleg
	disk_name = "No Owner - \"Partizaner's Paradise\" gun parts"
	icon_state = "freeworlds"

	license = -1	// No point to limit prints, aluminium parts can only be used in homemade guns.
	designs = list(
		/datum/design/autolathe/part/grip/wood,
		/datum/design/autolathe/part/mechanism/pistol/aluminium,
		/datum/design/autolathe/part/mechanism/revolver/aluminium,
		/datum/design/autolathe/part/mechanism/shotgun/aluminium,
		/datum/design/autolathe/part/mechanism/autorifle/aluminium,
		/datum/design/autolathe/part/mechanism/smg/aluminium,
		/datum/design/autolathe/part/mechanism/boltgun,
		/datum/design/autolathe/part/barrel/pistol/aluminium,
		/datum/design/autolathe/part/barrel/magnum/aluminium,
		/datum/design/autolathe/part/barrel/carbine/aluminium,
		/datum/design/autolathe/part/barrel/rifle/aluminium,
		/datum/design/autolathe/part/barrel/shotgun/aluminium,
	)


/////////////////////
// Gun frame disks //
/////////////////////

// This section contains gun frame disks, including Liberty Watch gun frame disks used to make Liberty Watch standard issue guns.
// Guns here should keep in mind that you can produce these for retail and resale at Skylight, as some are going to be orderable by them. Return for investment and time, really.

// Resale disk for Skylight to make and sell guns. Maybe put into piles.
/obj/item/computer_hardware/hard_drive/portable/design/gun_frames/resale
	disk_name = "Blackmarket - \"Make-Your-Own-Gun! For ages 9+!\" gun frames"
	icon_state = "black"

	license = 14
	designs = list(
		/datum/design/autolathe/gun_frame/colt,
		/datum/design/autolathe/gun_frame/havelock,
		/datum/design/autolathe/gun_frame/widowmaker,
		/datum/design/autolathe/gun_frame/boltaction,
		/datum/design/autolathe/gun_frame/doublebarrel,
		/datum/design/autolathe/gun_frame/trench,
	)

// Resale disk for Skylight to make and sell guns. Higher-end frames, still have to get the parts themselves. Do NOT put this into piles.
/obj/item/computer_hardware/hard_drive/portable/design/gun_frames/resale/high
	disk_name = "LG - \"Resale Distributors Pack\" gun frames"
	icon_state = "liberty"

	license = 8
	designs = list(
		/datum/design/autolathe/gun_frame/ak47 = 2,
		/datum/design/autolathe/gun_frame/broz,
		/datum/design/autolathe/gun_frame/sweeper = 2,
		/datum/design/autolathe/gun_frame/duty,
	)

// Liberty Watch gun-frame print disk, allows the printing of what used to be on the Negotiator disk to the Spec and WO. Do NOT put this into piles.
/obj/item/computer_hardware/hard_drive/portable/design/gun_frames/marshal
	disk_name = "LG - \"Framework of Dreams\" gun frames"
	icon_state = "liberty"

	license = -1	// No point to limit prints, the gun parts themselves will be the limit.
	designs = list(
		/datum/design/autolathe/gun_frame/stinger,
		/datum/design/autolathe/gun_frame/colt,
		/datum/design/autolathe/gun_frame/frontier,
		/datum/design/autolathe/gun_frame/specialist,
		/datum/design/autolathe/gun_frame/judge,
		/datum/design/autolathe/gun_frame/tactical,
		/datum/design/autolathe/gun_frame/buzzsaw,
		/datum/design/autolathe/gun_frame/operator_rifle,
		/datum/design/autolathe/gun_frame/duty,
		/datum/design/autolathe/gun_frame/ak
	)
