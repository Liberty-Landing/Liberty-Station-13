// Stuff that are
// Should spawn in bag or in hand

/datum/gear/armament
	display_name = "Unloaded \"Clarissa\" 9mm compact pistol"
	path = /obj/item/gun/projectile/clarissa
	sort_category = "Armament"
	slot = slot_in_backpack
	cost = 2

/datum/gear/armament/ammo
	display_name = "Rubber 9mm pistol magazine"
	path = /obj/item/ammo_magazine/pistol_35/rubber
	cost = 1

/datum/gear/armament/detective
	display_name = "Unloaded \"Pocket Prince\" 9mm revolver"
	path = /obj/item/gun/projectile/revolver/detective
	cost = 2

/datum/gear/armament/ammo_speed
	display_name = "Rubber 9mm speed loader"
	path = /obj/item/ammo_magazine/speed_loader_pistol_35/rubber
	cost = 1

/datum/gear/armament/guncase
	display_name = "Gun Case"
	path = /obj/item/storage/backpack/guncase
	cost = 1

/datum/gear/armament/flash
	display_name = "flash"
	path = /obj/item/device/flash
	cost = 2

/datum/gear/armament/baton
	display_name = "telescopic baton"
	path = /obj/item/melee/telebaton
	cost = 3

/datum/gear/armament/tacboot_knife
	display_name = "tactical knife"
	path = /obj/item/tool/knife/tacknife
	cost = 2

/datum/gear/armament/ritual_knife
	display_name = "ritual knife"
	path = /obj/item/tool/knife/ritual
	cost = 2

/datum/gear/armament/holster
	display_name = "armpit holster"
	path = /obj/item/clothing/accessory/holster/armpit
	cost = 1

/datum/gear/armament/holster/waist
	display_name = "waist holster"
	path = /obj/item/clothing/accessory/holster/waist

/datum/gear/armament/holster/hip
	display_name = "hip holster"
	path = /obj/item/clothing/accessory/holster/hip

/datum/gear/armament/holster/leg
	display_name = "leg holster"
	path = /obj/item/clothing/accessory/holster/leg

/datum/gear/armament/holster/baton
	display_name = "baton holster"
	path = /obj/item/storage/pouch/baton_holster

/datum/gear/armament/holster/saber
	display_name = "machete sheath"
	path = /obj/item/clothing/accessory/holster/saber/machete
	cost = 2

/datum/gear/armament/holster/saber/cheap
	display_name = "generic scabbard"
	path = /obj/item/clothing/accessory/holster/saber/machete/cheap

/datum/gear/armament/holster/saber/cutlass
	display_name = "cutlass sheath"
	path = /obj/item/clothing/accessory/holster/saber/cutlass

/datum/gear/armament/holster/saber/katana
	display_name = "katana \"Saya\" sheath"
	path = /obj/item/clothing/accessory/holster/saber/saya

/datum/gear/armament/cheap_melee
	display_name = "cheap melee selection"
	path = /obj/item/tool/cheap
	cost = 3
	flags = GEAR_HAS_TYPE_SELECTION
