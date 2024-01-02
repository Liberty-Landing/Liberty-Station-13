										/***************/
										/* GUNSMITHING */
										/***************/

// Gunsmithing crafting tab, to put to use the Gunsmith perk that Armorer and the Chief have
// These have lower tool quality requirements to compensate for the lower MEC these professions have

/datum/craft_recipe/gun_smithing
	category = "Gunsmithing"
	time = 20
	related_stats = list(STAT_MEC)
	requiredPerk = PERK_GUNSMITH

// Combined effort of Union and PIRS creation, but used for security.
/datum/craft_recipe/gun_smithing/bastion
	name = "Bastion Shield"
	result = /obj/item/shield/riot/bastion
	steps = list(
		list(/obj/item/shield/riot, 1, "time" = 30),
		list(CRAFT_MATERIAL, 3, MATERIAL_INDSTEEL, "time" = 30),
		list(QUALITY_SAWING, 20, "time" = 60),
		list(CRAFT_MATERIAL, 2, MATERIAL_ALUMINIUM, "time" = 30),
		list(QUALITY_WELDING, 20, "time"= 60),
		list(CRAFT_MATERIAL, 1, MATERIAL_LBGLASS, "time" = 30),
		list(QUALITY_HAMMERING, 20, "time" = 40)
	)

// Handmade gunparts, making it tedious to not make it spammable and justify a preference for the fabricator
// These also encourage taking parts to the armorer to obtain better parts out of them for recycling

/datum/craft_recipe/gun_smithing/rubbergrip
	name = "Handmade Rubber Grip"
	result = /obj/item/part/gun/grip/rubber
	steps = list(
		list(/obj/item/part/gun/grip, 1, "time" = 20), // ANY grip
		list(QUALITY_SAWING, 20),
		list(QUALITY_HAMMERING, 20),
		list(/obj/item/tool_upgrade/reinforcement/rubbermesh, 1), // Rubber!
		list(QUALITY_WELDING, 20)
	)

/datum/craft_recipe/gun_smithing/machinegun_mec
	name = "Handmade Machinegun Mechanism"
	result = /obj/item/part/gun/mechanism/machinegun
	steps = list(
		list(/obj/item/part/gun/mechanism/autorifle, 1, "time" = 20), // Printing is better as it costs the same indsteel
		list(QUALITY_DRILLING, 20),
		list(CRAFT_MATERIAL, 2, MATERIAL_ALUMINIUM, "time" = 30),
		list(QUALITY_WELDING, 20),
		list(QUALITY_SAWING, 20)
	)

/datum/craft_recipe/gun_smithing/antim_barrel
	name = "14.5mm Anti-Materiel Barrel"
	result = /obj/item/part/gun/barrel/antim
	steps = list(
		list(/obj/item/part/gun/barrel/lrifle, 1, "time" = 30), // Shotgun bore is too big for 14.5mm
		list(QUALITY_DRILLING, 20), // Making the bore bigger
		list(CRAFT_MATERIAL, 3, MATERIAL_INDSTEEL, "time" = 30),
		list(QUALITY_HAMMERING, 20),
		list(QUALITY_WELDING, 20)
	)

// High-end gun frame making, to make recycling good gun frames into a "better" option
// Fosters recycling and a way for Armorers to earn some extra cash by transforming certain frames into better ones

/datum/craft_recipe/gun_smithing/wrist_breaker
	name = "Wristbreaker Revolver Frame"
	result = /obj/item/part/gun/frame/breaker
	steps = list(
		list(/obj/item/part/gun/frame/ranger, 1, "time" = 30), // Closest high end highest caliber revolver available in design.
		list(CRAFT_MATERIAL, 2, MATERIAL_WOOD, "time" = 30),
		list(QUALITY_SCREW_DRIVING, 20, "time"= 30),
		list(CRAFT_MATERIAL, 3, MATERIAL_INDSTEEL, "time" = 30),
		list(QUALITY_HAMMERING, 20, "time" = 30),
		list(QUALITY_DRILLING, 15, "time" = 30),
		list(QUALITY_WELDING, 20, "time"= 30)
	)

/datum/craft_recipe/gun_smithing/judge_shotgun
	name = "\"Judge\" Automatic Shotgun"
	result = /obj/item/part/gun/frame/judge
	steps = list(
		list(/obj/item/part/gun/frame/sweeper, 1, "time" = 30), // Sort of the same mechanism behind automatic shotgun
		list(CRAFT_MATERIAL, 3, MATERIAL_INDSTEEL, "time" = 30),
		list(QUALITY_HAMMERING, 20, "time" = 30),
		list(QUALITY_DRILLING, 15, "time" = 30),
		list(QUALITY_WELDING, 20, "time"= 30),
		list(QUALITY_SCREW_DRIVING, 20, "time"= 30)
	)

/datum/craft_recipe/gun_smithing/fiveoh
	name = "Five-Oh Frame"
	result = /obj/item/part/gun/frame/specialist
	steps = list(
		list(/obj/item/part/gun/frame/broz, 1, "time" = 30), // 9mm SMG, no need to rebore
		list(CRAFT_MATERIAL, 3, MATERIAL_INDSTEEL, "time" = 30),
		list(QUALITY_HAMMERING, 20, "time" = 30),
		list(QUALITY_DRILLING, 15, "time" = 30),
		list(QUALITY_WELDING, 20, "time"= 30),
		list(QUALITY_SCREW_DRIVING, 20, "time"= 30)
	)

/datum/craft_recipe/gun_smithing/tactical_smg
	name = "\"Tactical\" SMG Frame"
	result = /obj/item/part/gun/frame/tactical
	steps = list(
		list(/obj/item/part/gun/frame/umbani, 1, "time" = 30), // 10mm SMG, no need to rebore
		list(CRAFT_MATERIAL, 3, MATERIAL_INDSTEEL, "time" = 30),
		list(QUALITY_HAMMERING, 20, "time" = 30),
		list(QUALITY_DRILLING, 15, "time" = 30),
		list(QUALITY_WELDING, 20, "time"= 30),
		list(QUALITY_SCREW_DRIVING, 20, "time"= 30)
	)

/datum/craft_recipe/gun_smithing/kraut_recycle
	name = "Kraut Caseless Rifle Frame"
	result = /obj/item/part/gun/frame/kraut
	steps = list(
		list(/obj/item/part/gun/frame/nationale, 1, "time" = 30),
		list(CRAFT_MATERIAL, 5, MATERIAL_PLASTIC, "time" = 30),
		list(QUALITY_HAMMERING, 20, "time" = 30),
		list(QUALITY_DRILLING, 15, "time" = 30),
		list(CRAFT_MATERIAL, 3, MATERIAL_INDSTEEL, "time" = 30),
		list(QUALITY_WELDING, 20, "time"= 30),
		list(QUALITY_SCREW_DRIVING, 20, "time"= 30)
	)

/datum/craft_recipe/gun_smithing/oprifle
	name = "\"Operator\" Caseless Rifle Frame"
	result = /obj/item/part/gun/frame/operator_rifle
	steps = list(
		list(/obj/item/part/gun/frame/kraut, 1, "time" = 30), // So high end we require another high-end
		list(CRAFT_MATERIAL, 5, MATERIAL_ALUMINIUM, "time" = 30),
		list(QUALITY_HAMMERING, 20, "time" = 30),
		list(QUALITY_WELDING, 20, "time"= 30),
		list(QUALITY_SCREW_DRIVING, 20, "time"= 30)
	)

// VERY high end. Requires the materials it's composed of, an Operator frame, and NVG's.
/datum/craft_recipe/gun_smithing/amr
	name = "Anti-Materiel Rifle Frame"
	result = /obj/item/part/gun/frame/heavysniper
	steps = list(
		list(/obj/item/part/gun/frame/operator_rifle, 1, "time" = 30),
		list(CRAFT_MATERIAL, 30, MATERIAL_INDSTEEL),
		list(QUALITY_SAWING, 30, "time" = 30),
		list(QUALITY_HAMMERING, 30, "time" = 30),
		list(QUALITY_WELDING, 30, "time"= 30),
		list(/obj/item/clothing/glasses/powered/night, 1, "time" = 30),
		list(QUALITY_CUTTING, 20, "time"= 30),
		list(QUALITY_SCREW_DRIVING, 30, "time"= 50),
		list(CRAFT_MATERIAL, 2, MATERIAL_URANIUM), // Consider it a small atomcell for the NV's
		list(QUALITY_SCREW_DRIVING, 30, "time"= 50),
		list(CRAFT_MATERIAL, 5, MATERIAL_TITANIUMRTC),
		list(QUALITY_HAMMERING, 30, "time" = 30),
		list(QUALITY_WELDING, 30, "time"= 30),
		list(CRAFT_MATERIAL, 3, MATERIAL_DIAMOND),
		list(QUALITY_CUTTING, 25, "time"= 30),
		list(QUALITY_HAMMERING, 30, "time" = 30)
	)

// Gun Mods, they belong better for gunsmiths than any other profession out there

/datum/craft_recipe/gun_smithing/weintraub
	name = "\"Hurricane\" full auto kit"
	result = /obj/item/gun_upgrade/mechanism/weintraub
	icon_state = "gun"
	steps = list(
		list(CRAFT_MATERIAL, 3, MATERIAL_INDSTEEL, "time" = 30),
		list(QUALITY_SAWING, 20, "time" = 60),
		list(QUALITY_HAMMERING, 20, "time" = 40),
		list(QUALITY_WELDING, 20, "time" = 40),
		list(CRAFT_MATERIAL, 2, MATERIAL_PLASTIC, "time" = 30),
		list(QUALITY_SCREW_DRIVING, 20, "time" = 90)
	)

/datum/craft_recipe/gun_smithing/overshooter
	name = "\"Overshooter\" internal magazine kit"
	result = /obj/item/gun_upgrade/mechanism/overshooter
	icon_state = "gun"
	steps = list(
		list(CRAFT_MATERIAL, 1, MATERIAL_INDSTEEL, "time" = 30),
		list(QUALITY_SAWING, 20, "time" = 60),
		list(QUALITY_HAMMERING, 20, "time" = 40),
		list(QUALITY_WELDING, 20, "time" = 40),
		list(CRAFT_MATERIAL, 2, MATERIAL_PLASTIC, "time" = 30),
		list(QUALITY_SCREW_DRIVING, 20, "time" = 90)
	)

/datum/craft_recipe/gun_smithing/dangerzone
	name = "\"Danger Zone\" Trigger"
	result = /obj/item/gun_upgrade/trigger/dangerzone
	icon_state = "gun"
	steps = list(
		list(CRAFT_MATERIAL, 1, MATERIAL_INDSTEEL, "time" = 30),
		list(QUALITY_SAWING, 20, "time" = 60),
		list(QUALITY_HAMMERING, 20, "time" = 40),
		list(QUALITY_WELDING, 20, "time" = 40),
		list(CRAFT_MATERIAL, 2, MATERIAL_PLASTIC, "time" = 30),
		list(QUALITY_BOLT_TURNING, 20, "time" = 90)
	)

/datum/craft_recipe/gun_smithing/forged
	name = "Reinforced Barrel"
	result = /obj/item/gun_upgrade/barrel/forged
	icon_state = "gun"
	steps = list(
		list(CRAFT_MATERIAL, 1, MATERIAL_INDSTEEL, "time" = 30),
		list(QUALITY_SAWING, 20, "time" = 60),
		list(QUALITY_HAMMERING, 20, "time" = 40),
		list(QUALITY_WELDING, 20, "time" = 40),
		list(CRAFT_MATERIAL, 1, MATERIAL_PLASTIC, "time" = 30),
		list(QUALITY_BOLT_TURNING, 20, "time" = 90)
	)

/datum/craft_recipe/gun_smithing/heavy_barrel
	name = "Heavy barrel"
	result = /obj/item/gun_upgrade/barrel/bore
	icon_state = "gun"
	steps = list(
		list(CRAFT_MATERIAL, 1, MATERIAL_INDSTEEL, "time" = 30),
		list(QUALITY_SAWING, 20, "time" = 60),
		list(QUALITY_HAMMERING, 20, "time" = 40),
		list(QUALITY_WELDING, 20, "time" = 40),
		list(CRAFT_MATERIAL, 1, MATERIAL_PLASTIC, "time" = 30),
		list(QUALITY_BOLT_TURNING, 20, "time" = 90),
		list(QUALITY_SAWING, 20, "time" = 60),
		list(QUALITY_HAMMERING, 20, "time" = 40),
		list(QUALITY_WELDING, 20, "time" = 40),
		list(QUALITY_DRILLING, 20, "time" = 90),
		list(CRAFT_MATERIAL, 2, MATERIAL_INDSTEEL, "time" = 30),
		list(QUALITY_BOLT_TURNING, 20, "time" = 90)
	)

/datum/craft_recipe/gun_smithing/silencer
	name = "Silencer"
	result = /obj/item/gun_upgrade/muzzle/silencer
	icon_state = "gun"
	steps = list(
		list(CRAFT_MATERIAL, 3, MATERIAL_INDSTEEL, "time" = 30),
		list(QUALITY_SAWING, 20, "time" = 60),
		list(QUALITY_HAMMERING, 20, "time" = 40),
		list(QUALITY_WELDING, 20, "time" = 40),
		list(CRAFT_MATERIAL, 2, MATERIAL_PLASTIC, "time" = 30),
		list(QUALITY_CUTTING, 20, "time" = 90)
	)

