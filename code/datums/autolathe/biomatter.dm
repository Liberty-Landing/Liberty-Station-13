/datum/design/bioprinter
	build_type = BIOPRINTER
	materials = list(MATERIAL_BIOMATTER = 6)

/datum/design/bioprinter/meat
	name = "Meat"
	build_path = /obj/item/reagent_containers/food/snacks/meat
	materials = list(MATERIAL_BIOMATTER = 5)

/datum/design/bioprinter/milk
	name = "Milk"
	build_path = /obj/item/reagent_containers/food/drinks/milk

/datum/design/bioprinter/soap
	name = "Soap"
	build_path = /obj/item/soap/bonfire

//[NUTRIMENTS]
/datum/design/bioprinter/ez
	name = "EZ-Nutrient"
	build_path = /obj/item/reagent_containers/glass/fertilizer/ez
	materials = list(MATERIAL_BIOMATTER = 3)

/datum/design/bioprinter/l4z
	name = "Left4Zed"
	build_path = /obj/item/reagent_containers/glass/fertilizer/l4z

/datum/design/bioprinter/rh
	name = "Robust Harvest"
	build_path = /obj/item/reagent_containers/glass/fertilizer/rh
	materials = list(MATERIAL_BIOMATTER = 7.5)
//[/NUTRIMENTS]

//[CLOTHES, ARMOR AND ACCESORIES]
/*  //Commented out because broke.
/datum/design/bioprinter/cardboard
	name = "Cardboard"
	build_path = /obj/item/stack/material/cardboard/random // I guess it depends on the protein content.
*/

/* Getting replaced with something else
/datum/design/bioprinter/leather/holster/saber/greatsword/churchprint
	name = "Custodian Scabbard"
	build_path = /obj/item/clothing/accessory/holster/saber/greatsword/churchprint
	materials = list(MATERIAL_BIO_SILK = 0.1, MATERIAL_CARBON_FIBER = 0.2)
*/
/datum/design/bioprinter/wallet
	name = "Wallet"
	build_path = /obj/item/storage/wallet

/datum/design/bioprinter/botanic_leather
	name = "Botanical gloves"
	build_path = /obj/item/clothing/gloves/botanic_leather
	materials = list(MATERIAL_BIOMATTER = 15)

/datum/design/bioprinter/leather
	materials = list(MATERIAL_BIOMATTER = 20, MATERIAL_BIO_SILK = 1)

/datum/design/bioprinter/leather/satchel
	name = "Leather Satchel"
	build_path = /obj/item/storage/backpack/satchel

/datum/design/bioprinter/leather/storage/backpack/satchel/custodian
	name = "Custodian Satchel"
	build_path = /obj/item/storage/backpack/satchel/custodian

/datum/design/bioprinter/leather/storage/backpack/custodian
	name = "Custodian Backpack"
	build_path = /obj/item/storage/backpack/custodian

/datum/design/bioprinter/leather/storage/backpack/sport/custodian
	name = "Custodian Sport Backpack"
	build_path = /obj/item/storage/backpack/sport/custodian

/datum/design/bioprinter/leather/holster
	name = "shoulder holster"
	build_path = /obj/item/clothing/accessory/holster

/datum/design/bioprinter/leather/holster/armpit
	name = "armpit holster"
	build_path = /obj/item/clothing/accessory/holster/armpit

/datum/design/bioprinter/leather/holster/waist
	name = "waist holster"
	build_path = /obj/item/clothing/accessory/holster/waist

/datum/design/bioprinter/leather/holster/hip
	name = "hip holster"
	build_path = /obj/item/clothing/accessory/holster/hip

/datum/design/bioprinter/leather/holster/leg
	name = "leg holster"
	build_path = /obj/item/clothing/accessory/holster/leg

/datum/design/bioprinter/belt
	materials = list(MATERIAL_BIOMATTER = 20, MATERIAL_BIO_SILK = 1)

/datum/design/bioprinter/belt/misc/champion
	name = "Champion belt"
	build_path = /obj/item/storage/belt/champion
	materials = list(MATERIAL_BIOMATTER = 50)

// All custodian disk designs //

/datum/design/bioprinter/custodian_clothes
	materials = null

/datum/design/bioprinter/custodian_clothes/oathbound
	name = "Oathbound Underarmor"
	build_path = /obj/item/clothing/under/custodian/oathbound

/datum/design/bioprinter/custodian_clothes/enkindled
	name = "Enkindled Underarmor"
	build_path = /obj/item/clothing/under/custodian/enkindled

/datum/design/bioprinter/custodian_clothes/forgemaster
	name = "Forgemaster Underarmor"
	build_path = /obj/item/clothing/under/custodian/forgemaster

/datum/design/bioprinter/custodian_clothes/oathpledge
	name = "Oathpledge Underarmor"
	build_path = /obj/item/clothing/under/custodian/oathpledge

/datum/design/bioprinter/custodian_clothes/custodian_boots
	name = "Custodian Boots"
	build_path = /obj/item/clothing/shoes/custodian

/datum/design/bioprinter/custodian_clothes/firehelmet
	name = "Flameshield Helmet"
	build_path = /obj/item/clothing/head/helmet/custodian/firesuit

/datum/design/bioprinter/custodian_clothes/firesuit
	name = "Flameshield Suit"
	build_path = /obj/item/clothing/suit/armor/custodian/firesuit

/datum/design/bioprinter/belt/utility/custodian_belt
	name = "Bonfire Knightly Belt"
	build_path = /obj/item/storage/belt/utility/custodian
	materials = null

/datum/design/bioprinter/hearth_lantern
	name = "Hearth Lantern"
	build_path = /obj/item/book/lectures/hearthlantern
	materials = null

/datum/design/bioprinter/weapon_mold
	name = "Weapon Nanomold"
	build_path = /obj/item/mold/weapon
	materials = null

/datum/design/bioprinter/armor_mold
	name = "Armor Nanomold"
	build_path = /obj/item/mold/armor
	materials = null

/datum/design/bioprinter/misc_mold
	name = "Miscellaneous Nanomold"
	build_path = /obj/item/mold/misc
	materials = null

/datum/design/bioprinter/upgrade_mold
	name = "Upgrade Nanomold"
	build_path = /obj/item/mold/upgrade
	materials = null

/datum/design/bioprinter/mold_kit
	materials = null

/datum/design/bioprinter/mold_kit/blacksmithing
	name = "Blacksmithing Tools"
	build_path = /obj/item/stack/mold_kit/blacksmithing

/datum/design/bioprinter/mold_kit/tailoring
	name = "Tailoring Tools"
	build_path = /obj/item/stack/mold_kit/tailoring

/datum/design/bioprinter/mold_kit/masonry
	name = "Masonry Tools"
	build_path = /obj/item/stack/mold_kit/masonry

/datum/design/bioprinter/mold_kit/radiance_sigil
	name = "Radiance Sigil"
	build_path = /obj/item/stack/mold_kit/radiance_sigil

// Total cost: 25 bio silk (stacks and kit itself), 5 biomatter (splints), 5 aluminium and 5 plastic (syrettes)
/datum/design/bioprinter/custodian_healthpack
	name = "Bonfire Medkit"
	build_path = /obj/item/storage/firstaid/nt

// 5 bio silk each
/datum/design/bioprinter/custodian_bruisepack
	name = "Bonfire Bruisepack"
	build_path = /obj/item/stack/medical/bruise_pack/advanced/nt

// 5 bio silk each
/datum/design/bioprinter/custodian_ointment
	name = "Bonfire Burnpack"
	build_path = /obj/item/stack/medical/ointment/advanced/nt

/datum/design/bioprinter/custodian_soap
	name = "Bonfire Soap"
	build_path = /obj/item/soap/bonfire

// end of Custodian disk designs //

//[/IMPLANTS]

/datum/design/bioprinter/bioimplant
	materials = list(MATERIAL_BIOMATTER = 50)

/datum/design/bioprinter/bioimplant/oscythe
	name = "Organic arm scythe implant"
	build_path = /obj/item/biogoop/armscythe

/datum/design/bioprinter/bioimplant/osurgical
	name = "Organic surgery omnitool implant"
	build_path = /obj/item/biogoop/surgical

/datum/design/bioprinter/bioimplant/oengineering
	name = "Organic engineering omnitool implant"
	build_path = /obj/item/biogoop/engineer

/datum/design/bioprinter/bioimplant/oarmor
	name = "Organic exoskeleton implant"
	build_path = /obj/item/biogoop/armor

/datum/design/bioprinter/bioimplant/omuscle
	name = "Organic muscle implant"
	build_path = /obj/item/biogoop/muscle

//[HEARTHCORE UPGRADES]

/datum/design/autolathe/hearthcore_upgrade
	build_path = /obj/item/hearthcore_upgrade
	materials = list(MATERIAL_CARBON_FIBER = 24)

/datum/design/autolathe/hearthcore_upgrade/blazing_aegis
	name = "Blazing Aegis"
	build_path = /obj/item/hearthcore_upgrade/blazing_aegis

/datum/design/autolathe/hearthcore_upgrade/atonement_gift
	name = "Atonement's gift"
	build_path = /obj/item/hearthcore_upgrade/atonement_gift

/datum/design/autolathe/hearthcore_upgrade/embers_of_swiftness
	name = "Speed of the chosen"
	build_path = /obj/item/hearthcore_upgrade/embers_of_swiftness

/datum/design/autolathe/hearthcore_upgrade/phoenix_edict
	name = "Phoenix Edict"
	build_path = /obj/item/hearthcore_upgrade/phoenix_edict

//[/POUCHES]
/datum/design/bioprinter/pouch
	materials = list(MATERIAL_BIO_SILK = 6)

/datum/design/bioprinter/pouch/ammo
	name = "Ammo pouch"
	build_path = /obj/item/storage/pouch/ammo

/datum/design/bioprinter/pouch/baton_holster
	name = "Baton holster"
	build_path = /obj/item/storage/pouch/baton_holster

/datum/design/bioprinter/pouch/pistol_holster
	name = "Pistol holster"
	build_path = /obj/item/storage/pouch/pistol_holster

/datum/design/bioprinter/pouch/pistol_double
	name = "Belt pistol holster"
	build_path = /obj/item/storage/pouch/pistol_holster/cowboy

/datum/design/bioprinter/pouch/kniferig
	name = "Throwing knives scabbard"
	build_path = /obj/item/storage/pouch/kniferig

/datum/design/bioprinter/pouch/quiver
	name = "arrows quiver"
	build_path = /obj/item/storage/pouch/quiver
	materials = list(MATERIAL_BIO_SILK = 8)

/datum/design/bioprinter/pouch/xbowquiver
	name = "crossbow bolts quiver"
	build_path = /obj/item/storage/pouch/bolts
	materials = list(MATERIAL_BIO_SILK = 8)

/datum/design/bioprinter/pouch/janitor_supply
	name = "Janitor supplies pouch"
	build_path = /obj/item/storage/pouch/janitor_supply

/datum/design/bioprinter/pouch/ifak
	name = "Individual First-Aid Kit"
	build_path = /obj/item/storage/firstaid/ifak/empty

/datum/design/bioprinter/pouch/medium_generic
	name = "Medium generic pouch"
	build_path = /obj/item/storage/pouch/medium_generic
	materials = list(MATERIAL_BIO_SILK = 8)

/datum/design/bioprinter/pouch/large_generic
	name = "Large generic pouch"
	build_path = /obj/item/storage/pouch/large_generic
	materials = list(MATERIAL_BIO_SILK = 16)

/datum/design/bioprinter/pouch/tubular
	name = "Tubular pouch"
	build_path = /obj/item/storage/pouch/tubular

/datum/design/bioprinter/pouch/tubular/vial
	name = "Tubular vial pouch"
	build_path = /obj/item/storage/pouch/tubular/vial

/datum/design/bioprinter/sling
	name = "Universal sling"
	build_path = /obj/item/clothing/suit/sling

/datum/design/bioprinter/vacuum_cleaner
	name = "\"Swift 200\" vacuum cleaner"
	build_path = /obj/item/vacuum_cleaner


