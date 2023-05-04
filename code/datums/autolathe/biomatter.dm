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
	build_path = /obj/item/soap/church

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
/datum/design/bioprinter/leather/holster/saber/greatsword/churchprint
	name = "Custodian Scabbard"
	build_path = /obj/item/clothing/accessory/holster/saber/greatsword/churchprint
	materials = list(MATERIAL_BIO_SILK = 0.1, MATERIAL_CARBON_FIBER = 0.2)

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

/datum/design/bioprinter/leather/storage/backpack/satchel/neotheology
	name = "Cruciform  Satchel"
	build_path = /obj/item/storage/backpack/satchel/neotheology

/datum/design/bioprinter/leather/storage/backpack/neotheology
	name = "Cruciform Backpack"
	build_path = /obj/item/storage/backpack/neotheology

/datum/design/bioprinter/leather/storage/backpack/sport/neotheology
	name = "Cruciform Sport Backpack"
	build_path = /obj/item/storage/backpack/sport/neotheology

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

/datum/design/bioprinter/belt/utility/neotheology
	name = "Bonfire utility belt"
	build_path = /obj/item/storage/belt/utility/neotheology

/datum/design/bioprinter/belt/security/neotheology
	name = "Bonfire tactical belt"
	build_path = /obj/item/storage/belt/security/neotheology
	materials = list(MATERIAL_BIO_SILK = 1, MATERIAL_CARBON_FIBER = 0.5)

/datum/design/bioprinter/belt/misc/champion
	name = "Champion belt"
	build_path = /obj/item/storage/belt/champion
	materials = list(MATERIAL_BIOMATTER = 50)

// This separates regular clothes designs from NT clothes designs //
/datum/design/bioprinter/nt_clothes/armor_kit
	name = "Armor Bundle"
	build_path = /obj/item/gunbox/church
	materials = list(MATERIAL_BIO_SILK = 15, MATERIAL_CARBON_FIBER = 15)

/datum/design/bioprinter/nt_clothes/acolyte_armor
	name = "Vector Armor"
	build_path = /obj/item/clothing/suit/armor/vest/acolyte
	materials = list(MATERIAL_BIO_SILK = 5, MATERIAL_CARBON_FIBER = 8)

/datum/design/bioprinter/nt_clothes/agrolyte_armor
	name = "Agrolyte Armor"
	build_path = /obj/item/clothing/suit/armor/vest/botanist
	materials = list(MATERIAL_BIO_SILK = 5, MATERIAL_CARBON_FIBER = 8)

/datum/design/bioprinter/nt_clothes/custodian_armor
	name = "Custodian Armor"
	build_path = /obj/item/clothing/suit/armor/vest/custodian
	materials = list(MATERIAL_BIO_SILK = 5, MATERIAL_CARBON_FIBER = 8)

/datum/design/bioprinter/nt_clothes/rosaria_armor
	name = "Rosaria Armor"
	build_path = /obj/item/clothing/suit/armor/vest/rosaria
	materials = list(MATERIAL_BIO_SILK = 5, MATERIAL_CARBON_FIBER = 15)

/datum/design/bioprinter/nt_clothes/acolyte_armor_helm
	name = "Vector Helmet"
	build_path = /obj/item/clothing/head/helmet/acolyte
	materials = list(MATERIAL_BIO_SILK = 3, MATERIAL_CARBON_FIBER = 3)

/datum/design/bioprinter/nt_clothes/agrolyte_armor_helm
	name = "Agrolyte Helmet"
	build_path = /obj/item/clothing/head/helmet/botanist
	materials = list(MATERIAL_BIO_SILK = 3, MATERIAL_CARBON_FIBER = 3)

/datum/design/bioprinter/nt_clothes/custodian_armor_helm
	name = "Custodian Helmet"
	build_path = /obj/item/clothing/head/helmet/custodian
	materials = list(MATERIAL_BIO_SILK = 3, MATERIAL_CARBON_FIBER = 3)

/datum/design/bioprinter/nt_clothes/rosaria_armor_helm
	name = "Rosaria Helmet"
	build_path = /obj/item/clothing/head/helmet/rosaria
	materials = list(MATERIAL_BIO_SILK = 3, MATERIAL_CARBON_FIBER = 7)

/datum/design/bioprinter/nt_clothes/sports_jacket
	name = "Sports Jacket"
	build_path = /obj/item/clothing/suit/storage/neotheosports

/datum/design/bioprinter/nt_clothes/acolyte_uniform
	name = "Vector Garment"
	build_path = /obj/item/clothing/under/rank/acolyte

/datum/design/bioprinter/nt_clothes/church_uniform
	name = "Church Garment"
	build_path = /obj/item/clothing/under/rank/church

/datum/design/bioprinter/nt_clothes/hermes_shoes
	name = "Hermes Boots"
	build_path = /obj/item/clothing/shoes/hermes_shoes
	materials = list(MATERIAL_BIO_SILK = 4, MATERIAL_CARBON_FIBER = 2)

/datum/design/bioprinter/nt_clothes/NTvoid
	name = "Angel Voidsuit"
	build_path = /obj/item/clothing/suit/space/void/NTvoid
	materials = list(MATERIAL_BIO_SILK = 18, MATERIAL_CARBON_FIBER = 18)

/datum/design/bioprinter/nt_clothes/knight_rig
	name = "Knight Hardsuit Module"
	materials = list(MATERIAL_BIOMATTER = 100, MATERIAL_GOLD = 10, MATERIAL_SILVER = 10, MATERIAL_PLASTEEL = 100, MATERIAL_BIO_SILK = 40, MATERIAL_CARBON_FIBER = 28)
	build_path = /obj/item/rig/combat/knight

//[MELEE]
/datum/design/autolathe/sword/nt_sword
	name = "Ulfberth"
	build_path = /obj/item/tool/sword/nt/shortsword
	materials = list(MATERIAL_BIO_SILK = 1, MATERIAL_CARBON_FIBER = 8)

/datum/design/autolathe/sword/nt_longsword
	name = "Horseman Axe"
	build_path = /obj/item/tool/sword/nt/longsword
	materials = list(MATERIAL_BIO_SILK = 1, MATERIAL_CARBON_FIBER = 12)

/datum/design/autolathe/sword/nt_dagger
	name = "Custodian Seax"
	build_path = /obj/item/tool/knife/dagger/nt
	materials = list(MATERIAL_BIO_SILK = 1, MATERIAL_CARBON_FIBER = 3)

/datum/design/autolathe/sword/nt_halberd
	name = "Custodian Atgeir"
	build_path = /obj/item/tool/spear/halberd
	materials = list(MATERIAL_BIO_SILK = 1, MATERIAL_CARBON_FIBER = 18)

/datum/design/autolathe/sword/nt_spear
	name = "Custodian Francisca"
	build_path = /obj/item/tool/sword/nt/spear
	materials = list(MATERIAL_BIO_SILK = 1, MATERIAL_CARBON_FIBER = 4)

/datum/design/autolathe/sword/nt_scourge
	name = "Custodian Nagaika"
	build_path = /obj/item/tool/sword/nt/scourge
	materials = list(MATERIAL_BIO_SILK = 10, MATERIAL_CARBON_FIBER = 18)

/datum/design/autolathe/shield/nt_shield
	name = "Custodian Scutum Shield"
	build_path = /obj/item/shield/riot/nt
	materials = list(MATERIAL_BIO_SILK = 3, MATERIAL_CARBON_FIBER = 21)

/datum/design/autolathe/nt/shield/nt_buckler
	name = "Custodian Targe Shield"
	build_path = /obj/item/shield/buckler/nt
	materials = list(MATERIAL_BIO_SILK = 2, MATERIAL_CARBON_FIBER = 12)

/datum/design/autolathe/nt/sword/nt_verutum
	name = "OT Javelin"
	build_path = /obj/item/stack/thrown/nt/verutum
	materials = list(MATERIAL_BIO_SILK = 1, MATERIAL_CARBON_FIBER = 3)

/datum/design/autolathe/tool_upgrade/sanctifier
	name = "NT Sanctifier"
	build_path = /obj/item/tool_upgrade/augment/sanctifier
	materials = list(MATERIAL_CARBON_FIBER = 3)

/datum/design/autolathe/sword/nt_warhammer
	name = "NT Warhammer"
	build_path = /obj/item/tool/sword/nt/warhammer
	materials = list(MATERIAL_BIO_SILK = 1, MATERIAL_CARBON_FIBER = 12)

/datum/design/autolathe/sword/nt_flanged
	name = "Emberblaze Warhammer"
	build_path = /obj/item/tool/sword/nt/flanged
	materials = list(MATERIAL_BIO_SILK = 1, MATERIAL_CARBON_FIBER = 16)

/datum/design/autolathe/sword/nt_power
	name = "NT Forceblade"
	build_path = /obj/item/tool/sword/nt/power
	materials = list(MATERIAL_BIO_SILK = 1, MATERIAL_CARBON_FIBER = 36)

//[GRENADES]
/datum/design/autolathe/grenade/nt_heatwave
	name = "NT HG \"Inferno\""
	build_path = /obj/item/grenade/heatwave/nt

/datum/design/autolathe/grenade/nt_smokebomb
	name = "NT SG \"Holy Fog\""
	build_path = /obj/item/grenade/smokebomb/nt

/datum/design/autolathe/grenade/nt_frag
	name = "NT DFG \"Holy Thunder\""
	build_path = /obj/item/grenade/frag/nt

/datum/design/autolathe/grenade/nt_flashbang
	name = "NT FBG \"Holy Light\""
	build_path = /obj/item/grenade/flashbang/nt

/datum/design/autolathe/grenade/nt_explosive
	name = "NT OBG \"Holy Grail\""
	build_path = /obj/item/grenade/explosive/nt

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

//[/CRUCIFORM UPGRAED]

/datum/design/autolathe/cruciform_upgrade
	build_path = /obj/item/cruciform_upgrade
	materials = list(MATERIAL_CARBON_FIBER = 24)

/datum/design/autolathe/cruciform_upgrade/natures_blessing
	name = "Natures blessing"
	build_path = /obj/item/cruciform_upgrade/natures_blessing

/datum/design/autolathe/cruciform_upgrade/faiths_shield
	name = "Faiths shield"
	build_path = /obj/item/cruciform_upgrade/faiths_shield

/datum/design/autolathe/cruciform_upgrade/cleansing_presence
	name = "Cleansing presence"
	build_path = /obj/item/cruciform_upgrade/cleansing_presence

/datum/design/autolathe/cruciform_upgrade/martyr_gift
	name = "Martyr gift"
	build_path = /obj/item/cruciform_upgrade/martyr_gift

/datum/design/autolathe/cruciform_upgrade/wrath_of_god
	name = "Wrath of god"
	build_path = /obj/item/cruciform_upgrade/wrath_of_god

/datum/design/autolathe/cruciform_upgrade/speed_of_the_chosen
	name = "Speed of the chosen"
	build_path = /obj/item/cruciform_upgrade/speed_of_the_chosen

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

/datum/design/autolathe/gun_upgrade/barrel/excruciator
	name = "New Testament \"EXCRUCIATOR\" giga lens"
	build_path = /obj/item/gun_upgrade/barrel/excruciator

/datum/design/bioprinter/holyvacuum
	name = "\"Tersus\" Vacuum Cleaner"
	build_path = /obj/item/holyvacuum
	materials = list(MATERIAL_BIO_SILK = 2)

