/datum/craft_recipe/clothing
	category = "Clothing"
	icon_state = "armor_part"
	time = 50
	related_stats = list(STAT_COG)

/datum/craft_recipe/clothing/armorvest
	name = "handmade armor vest"
	result = /obj/item/clothing/suit/armor/vest/handmade
	steps = list(
		list(/obj/item/clothing/suit/storage/hazardvest, 1, "time" = 30),
		list(CRAFT_MATERIAL, 4, MATERIAL_ALUMINIUM),
		list(/obj/item/stack/cable_coil, 4)
	)

/datum/craft_recipe/clothing/balaclava
	name = "balaclava"
	result = /obj/item/clothing/mask/balaclava
	steps = list(
		list(/obj/item/stack/material/cloth, 10, time = 15),
		list(QUALITY_CUTTING, 10, 60)
	)

/datum/craft_recipe/clothing/handmadebelt
	name = "hand-made tool belt"
	result = /obj/item/storage/belt/utility/handmade
	icon_state = "clothing"
	steps = list(
		list(/obj/item/stack/cable_coil, 30, time = 15),
		list(QUALITY_CUTTING, 10, 60)
	)

/datum/craft_recipe/clothing/blindfold
	name = "blindfold"
	result = /obj/item/clothing/glasses/blindfold
	icon_state = "clothing"
	steps = list(
		list(/obj/item/stack/material/cloth, 5, time = 15),
		list(QUALITY_CUTTING, 10, 60)
	)

// Masacre poor bucket, but gain some better protection. Cut bigger holes for eyes, drill small ones for some air.
/datum/craft_recipe/clothing/cheap_greathelm
	name = "bucket-helm"
	result = /obj/item/clothing/head/helmet/handmade/greathelm
	steps = list(
		list(/obj/item/reagent_containers/glass/bucket, 1, "time" = 30),
		list(QUALITY_CUTTING, 15, 120),
		list(QUALITY_DRILLING, 10, 60),
		list(CRAFT_MATERIAL, 6, MATERIAL_ALUMINIUM),
		list(/obj/item/stack/cable_coil, 4)
	)

/datum/craft_recipe/clothing/cardborg_helmet
	name = "cardborg helmet"
	result = /obj/item/clothing/head/costume/halloween/cardborg
	icon_state = "clothing"
	steps = list(
		list(CRAFT_MATERIAL, 1, MATERIAL_CARDBOARD)
	)

/datum/craft_recipe/clothing/cardborg_suit
	name = "cardborg suit"
	result = /obj/item/clothing/suit/costume/halloween/cardborg
	icon_state = "clothing"
	steps = list(
		list(CRAFT_MATERIAL, 3, MATERIAL_CARDBOARD)
	)

// Add some aluminium to gloves. Simple.
/datum/craft_recipe/clothing/combat_gloves
	name = "combat gloves"
	result = /obj/item/clothing/gloves/thick/handmade
	icon_state = "clothing"
	steps = list(
		list(/obj/item/clothing/gloves/thick, 1, "time" = 15),
		list(CRAFT_MATERIAL, 2, MATERIAL_ALUMINIUM),
		list(/obj/item/stack/cable_coil, 2)
	)

/datum/craft_recipe/clothing/scav_gloves
	name = "scavenger gloves"
	result = /obj/item/clothing/gloves/dusters/scav_gloves
	icon_state = "armor_part"
	steps = list(
		list(/obj/item/clothing/gloves/thick/handmade, 1, "time" = 15), // Grab combat gloves
		list(/obj/item/clothing/gloves/dusters/indsteel, 1, "time" = 15), // Attach knuckle dusters
		list(CRAFT_MATERIAL, 2, MATERIAL_INDSTEEL), // Plate the armguards with extra aluminium...
		list(QUALITY_WELDING, 10, 20) // ...And weld it in place!
	)

/datum/craft_recipe/clothing/combat_helmet
	name = "combat helmet"
	result = /obj/item/clothing/head/helmet/handmade
	steps = list(
		list(/obj/item/reagent_containers/glass/bucket, 1, "time" = 30),
		list(CRAFT_MATERIAL, 4, MATERIAL_ALUMINIUM),
		list(/obj/item/stack/cable_coil, 2)
	)

/datum/craft_recipe/clothing/chest_rig
	name = "chest rig"
	result = /obj/item/clothing/suit/storage/vest/chestrig
	steps = list(
		list(/obj/item/stack/medical/bruise_pack/handmade, 3, "time" = 10),
		list(/obj/item/stack/rods, 2, "time" = 10),
		list(/obj/item/stack/cable_coil, 2)
	)

/datum/craft_recipe/clothing/riggedvoidsuit_helmet
	name = "makeshift armored void suit helmet"
	result = /obj/item/clothing/head/space/void/riggedvoidsuit
	steps = list(
		list(/obj/item/clothing, 1, time = 30),
		list(CRAFT_MATERIAL, 6, MATERIAL_ALUMINIUM),
		list(CRAFT_MATERIAL, 4, MATERIAL_PLASTIC),
		list(CRAFT_MATERIAL, 3, MATERIAL_GLASS),
		list(/obj/item/stack/cable_coil, 2),
		list(QUALITY_ADHESIVE, 15, "time" = 60)
	)

/datum/craft_recipe/clothing/riggedvoidsuit
	name = "makeshift armored void suit"
	result = /obj/item/clothing/suit/space/void/riggedvoidsuit
	steps = list(
		list(/obj/item/clothing/under, 1),
		list(CRAFT_MATERIAL, 10, MATERIAL_INDSTEEL),
		list(CRAFT_MATERIAL, 20, MATERIAL_PLASTIC),
		list(QUALITY_ADHESIVE, 15, "time" = 60),
		list(CRAFT_MATERIAL, 10, MATERIAL_GLASS),
		list(QUALITY_WELDING, 10, 20)
	)

/datum/craft_recipe/clothing/scavengerarmor
	name = "Scavenged Armor"
	result = /obj/item/clothing/suit/storage/scavengerarmor
	steps = list(
		list(/obj/item/clothing/under, 1),
		list(CRAFT_MATERIAL, 10, MATERIAL_ALUMINIUM), // Melee
		list(CRAFT_MATERIAL, 5, MATERIAL_INDSTEEL), // Bullets
		list(QUALITY_WELDING, 10, 20),
		list(CRAFT_MATERIAL, 10, MATERIAL_GLASS), // Reflective plating?
		list(QUALITY_ADHESIVE, 15, "time" = 60)
	)

/datum/craft_recipe/clothing/scavengerhelmet
	name = "Scavenged Helmet"
	result = /obj/item/clothing/head/helmet/handmade/scavengerhelmet
	steps = list(
		list(/obj/item/clothing/head/helmet/handmade, 1), // Take your average combat helm
		list(CRAFT_MATERIAL, 2, MATERIAL_CLOTH), // Additional warmth protection
		list(QUALITY_ADHESIVE, 15, 15), // Make sure it sticks!
		list(CRAFT_MATERIAL, 2, MATERIAL_INDSTEEL), // Prepare the additional external plates...
		list(QUALITY_HAMMERING, 10, 15), // ...Hammer them into place...
		list(QUALITY_WELDING, 10, 20), // ...and weld them, tadah!
	)

/datum/craft_recipe/clothing/muzzle
	name = "muzzle"
	result = /obj/item/clothing/mask/muzzle
	icon_state = "clothing"
	steps = list(
		list(/obj/item/stack/material/cloth, 5, time = 15),
		list(CRAFT_MATERIAL, 1, MATERIAL_ALUMINIUM),
		list(QUALITY_CUTTING, 10, 60)
	)

// Butcher some clothes into rags to make some cloak
/datum/craft_recipe/clothing/cloak
	name = "ragged cloak"
	result = /obj/item/clothing/suit/hooded/cloak/simple
	icon_state = "clothing"
	steps = list(
		list(/obj/item/clothing, 1, time = 30),
		list(/obj/item/clothing, 1, time = 30),
		list(QUALITY_CUTTING, 10, 60)
	)

/datum/craft_recipe/clothing/sandals
	name = "wooden sandals"
	result = /obj/item/clothing/shoes/sandal
	icon_state = "woodworking"
	steps = list(
		list(CRAFT_MATERIAL, 1, MATERIAL_WOOD)
	)

/****************************
* 	Full body armor vests
****************************/

/datum/craft_recipe/clothing/armorvest/full
	name = "handmade full armor vest"
	result = /obj/item/clothing/suit/armor/vest/handmade/full
	steps = list(
		list(/obj/item/clothing/suit/armor/vest/handmade, 1, "time" = 30),
		list(/obj/item/clothing/under, 1),
		list(QUALITY_CUTTING, 15, 30),
		list(CRAFT_MATERIAL, 4, MATERIAL_ALUMINIUM), // One metal per limb
		list(QUALITY_ADHESIVE, 15, 30)
	)

/datum/craft_recipe/clothing/fullbodyarmor
	name = "full body armor"
	result = /obj/item/clothing/suit/armor/vest/full
	steps = list(
		list(/obj/item/clothing/suit/armor/vest, 1, "time" = 30), //TODO: a better way to do this, every children of armor/vest will be eligible for crafting this one...
		list(/obj/item/clothing/under, 1),
		list(QUALITY_CUTTING, 15, 30),
		list(CRAFT_MATERIAL, 4, MATERIAL_ALUMINIUM), // One sheet per limb
		list(CRAFT_MATERIAL, 4, MATERIAL_PLASTIC),
		list(QUALITY_ADHESIVE, 15, 30)
	)

/datum/craft_recipe/clothing/capsa_fullbody
	name = "full body CAPSA plate carrier"
	result = /obj/item/clothing/suit/armor/vest/capsa/fullbody
	steps = list(
		list(/obj/item/clothing/suit/armor/vest/capsa, 1, "time" = 30),
		list(/obj/item/clothing/under, 1),
		list(QUALITY_CUTTING, 15, 30),
		list(CRAFT_MATERIAL, 4, MATERIAL_ALUMINIUM),
		list(CRAFT_MATERIAL, 4, MATERIAL_PLASTIC),
		list(QUALITY_ADHESIVE, 15, 30)
	)

/datum/craft_recipe/clothing/mtua
	name = "Watchman tactical unit armor"
	result = /obj/item/clothing/suit/armor/vest/ironhammer/full
	steps = list(
		list(/obj/item/clothing/suit/armor/vest/ironhammer, 1, "time" = 30),
		list(/obj/item/clothing/under, 1),
		list(QUALITY_CUTTING, 15, 30),
		list(CRAFT_MATERIAL, 4, MATERIAL_ALUMINIUM), // One metal per limb
		list(QUALITY_ADHESIVE, 15, 30)
	)

/datum/craft_recipe/clothing/blackbolt_fullbody
	name = "Black Bolt full body Scrap Armor"
	result = /obj/item/clothing/suit/storage/scavengerarmor/blackbolt/fullbody
	steps = list(
		list(/obj/item/clothing/suit/storage/scavengerarmor/blackbolt, 1),
		list(/obj/item/clothing/under, 1),
		list(QUALITY_CUTTING, 15, 30),
		list(CRAFT_MATERIAL, 4, MATERIAL_ALUMINIUM),
		list(CRAFT_MATERIAL, 2, MATERIAL_INDSTEEL),
		list(QUALITY_WELDING, 15, 30),
		list(QUALITY_ADHESIVE, 15, 30)
	)

/datum/craft_recipe/clothing/platecarrier
	name = "full body plate carrier"
	result = /obj/item/clothing/suit/armor/platecarrier/full
	steps = list(
		list(/obj/item/clothing/suit/armor/platecarrier, 1, "time" = 30),
		list(/obj/item/clothing/under, 1),
		list(QUALITY_CUTTING, 15, 30),
		list(CRAFT_MATERIAL, 4, MATERIAL_ALUMINIUM), // One metal per limb
		list(CRAFT_MATERIAL, 2, MATERIAL_INDSTEEL),
		list(QUALITY_WELDING, 15, 30),
		list(QUALITY_ADHESIVE, 15, 30)
	)

/datum/craft_recipe/clothing/iambulletproof
	name = "bulletproof suit"
	result = /obj/item/clothing/suit/armor/bulletproof/full
	steps = list(
		list(/obj/item/clothing/suit/armor/bulletproof/, 1, "time" = 30),
		list(/obj/item/clothing/under, 1),
		list(QUALITY_CUTTING, 15, 30),
		list(CRAFT_MATERIAL, 4, MATERIAL_ALUMINIUM), // One metal per limb
		list(CRAFT_MATERIAL, 4, MATERIAL_INDSTEEL),
		list(QUALITY_WELDING, 15, 30),
		list(QUALITY_ADHESIVE, 15, 30)
	)

/datum/craft_recipe/clothing/fullmetalflaket
	name = "full body flak vest"
	result = /obj/item/clothing/suit/armor/flakvest/full
	steps = list(
		list(/obj/item/clothing/suit/armor/flakvest, 1, "time" = 30),
		list(/obj/item/clothing/under, 1),
		list(QUALITY_CUTTING, 15, 30),
		list(CRAFT_MATERIAL, 4, MATERIAL_ALUMINIUM), // One metal per limb
		list(CRAFT_MATERIAL, 4, MATERIAL_ALUMINIUM), // One metal per limb
		list(CRAFT_MATERIAL, 4, MATERIAL_INDSTEEL),
		list(QUALITY_WELDING, 15, 30),
		list(QUALITY_ADHESIVE, 15, 30)
	)

/***********************
* 	Outsider crafts
************************/

/datum/craft_recipe/clothing/woodenarmor
	name = "wooden armor"
	result = /obj/item/clothing/suit/armor/vest/handmadewooden
	icon_state = "woodworking"
	steps = list(
		list(CRAFT_MATERIAL, 10, MATERIAL_WOOD),
		list(QUALITY_SAWING, 10, 60),
		list(CRAFT_MATERIAL, 2, MATERIAL_ALUMINIUM),
		list(/obj/item/stack/material/cloth, 2, time = 30),
		list(QUALITY_CUTTING, 10, 30)
	)

/datum/craft_recipe/clothing/tac_clothes
	name = "tactical baggy rags"
	result = /obj/item/clothing/under/outcast
	icon_state = "clothing"
	steps = list(
		list(/obj/item/clothing, 1, time = 30),
		list(/obj/item/clothing, 1, time = 30),
		list(QUALITY_CUTTING, 15, 30),
		list(CRAFT_MATERIAL, 5, MATERIAL_LEATHER, "time" = 60),
		list(QUALITY_SAWING, 15, 30)
		)

/datum/craft_recipe/clothing/outsider_cloak
	name = "outcast's cloak"
	result = /obj/item/clothing/suit/storage/raggedcape
	icon_state = "clothing"
	steps = list(
		list(/obj/item/clothing, 1, time = 30),
		list(/obj/item/clothing, 1, time = 30),
		list(QUALITY_CUTTING, 15, 30),
		list(CRAFT_MATERIAL, 5, MATERIAL_LEATHER, "time" = 60),
		list(QUALITY_SAWING, 15, 30)
		)

/datum/craft_recipe/clothing/outsider_hood
	name = "outcast's hood"
	result = /obj/item/clothing/head/outcasthood
	icon_state = "clothing"
	steps = list(
		list(/obj/item/clothing, 1, time = 30),
		list(/obj/item/clothing, 1, time = 30),
		list(QUALITY_CUTTING, 15, 30),
		list(CRAFT_MATERIAL, 1, MATERIAL_LEATHER, "time" = 60),
		list(QUALITY_SAWING, 15, 30)
		)

/datum/craft_recipe/clothing/outsider_cape
	name = "outcast's cape"
	result = /obj/item/clothing/accessory/cape/outsider
	icon_state = "clothing"
	steps = list(
		list(/obj/item/clothing/suit/storage/raggedcape, 1, "time" = 30),
		list(QUALITY_CUTTING, 15, 30)
	)
/datum/craft_recipe/clothing/tribalhide
	name = "Tribal Hides"
	result =  /obj/item/clothing/under/tribalhide
	icon_state = "clothing"
	steps = list(
		list(CRAFT_MATERIAL, 5, MATERIAL_LEATHER, "time" = 60),
		list(QUALITY_CUTTING, 15, 30),
	)

/datum/craft_recipe/clothing/swat_yellow
	name = "insulated combat gloves"
	result = /obj/item/clothing/gloves/thick/swat/insulated
	steps = list(
		list(/obj/item/clothing/gloves/thick, 1, "time" = 30),
		list(QUALITY_CUTTING, 15, 30),
		list(CRAFT_MATERIAL, 5, MATERIAL_ALUMINIUM, "time" = 30),
		list(CRAFT_MATERIAL, 5, MATERIAL_INDSTEEL, "time" = 30), // We plate the gloves to justify its armor values
		list(QUALITY_WELDING, 10, "time" = 30), // Melt the metal, then...
		list(QUALITY_HAMMERING, 15, 10), // ...harden into shape
		list(/obj/item/clothing/gloves/insulated, 1, "time" = 30), // This means it can also take budget insuls
		list(QUALITY_CUTTING, 15, 30),
		list(CRAFT_MATERIAL, 3, MATERIAL_PLASTIC), //So if we use buget we have a reason to think its really shock proof
		list(QUALITY_ADHESIVE, 10, "time" = 30)
	)

// Nuckle Dusters and melee based things

/datum/craft_recipe/clothing/dusters
	name = "Aluminium knuckle dusters"
	result = /obj/item/clothing/gloves/dusters
	steps = list(
		list(CRAFT_MATERIAL, 3, MATERIAL_ALUMINIUM), //Grab some aluminium
		list(QUALITY_WELDING, 10, "time" = 30), //Weld it into basic form
		list(QUALITY_HAMMERING, 15, 10) //Harden into shape
	)

/datum/craft_recipe/clothing/dusters/silver
	name = "silver knuckle dusters"
	result = /obj/item/clothing/gloves/dusters/silver
	steps = list(
		list(CRAFT_MATERIAL, 3, MATERIAL_SILVER), //Grab some silver
		list(QUALITY_WELDING, 10, "time" = 30), //Weld it into basic form
		list(QUALITY_HAMMERING, 15, 10) //Harden into shape
	)

/datum/craft_recipe/clothing/dusters/indsteel
	name = "Industrial aluminium knuckle dusters"
	result = /obj/item/clothing/gloves/dusters/indsteel
	steps = list(
		list(CRAFT_MATERIAL, 3, MATERIAL_INDSTEEL), //Grab some Indsteel
		list(QUALITY_WELDING, 10, "time" = 30), //Weld it into basic form
		list(QUALITY_HAMMERING, 15, 10) //Harden into shape
	)

/datum/craft_recipe/clothing/dusters/gold
	name = "golden knuckle dusters"
	result = /obj/item/clothing/gloves/dusters/gold
	steps = list(
		list(CRAFT_MATERIAL, 5, MATERIAL_GOLD), //Grab some gold
		list(CRAFT_MATERIAL, 3, MATERIAL_METAL), //increase silliness because Gold is smooth
		list(QUALITY_WELDING, 10, "time" = 30), //Weld it into basic form
		list(QUALITY_HAMMERING, 15, 10) //Harden into shape
	)

/datum/craft_recipe/clothing/dusters/platinum
	name = "spiked platinum knuckle dusters"
	result = /obj/item/clothing/gloves/dusters/platinum
	steps = list(
		list(CRAFT_MATERIAL, 3, MATERIAL_TITANIUMRTC), //Grab some titaniumrtc
		list(QUALITY_WELDING, 10, "time" = 30), //Weld it into basic form
		list(QUALITY_HAMMERING, 15, 10), //Harden into shape
		list(/obj/item/tool_upgrade/augment/spikes, 1, "time" = 10) //Put 'spiked' in the name
	)

/datum/craft_recipe/clothing/dusters/gloves
	name = "weighted knuckle gloves"
	result = /obj/item/clothing/gloves/dusters/gloves
	steps = list(
		list(/obj/item/clothing/gloves/dusters, 1, "time" = 5), //Tear up the gloves
		list(CRAFT_MATERIAL, 3, MATERIAL_INDSTEEL), //Grab some indsteel
		list(QUALITY_HAMMERING, 15, 10), //Harden into powder
		list(QUALITY_HAMMERING, 15, 10), //Harden into FINE powder
		list(/obj/item/stack/medical/bruise_pack/handmade, 2, "time" = 10) //Cover the holes up
	)
