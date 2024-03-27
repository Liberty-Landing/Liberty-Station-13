/obj/item/clothing/head/helmet/space/rig/combat
	light_overlay = "helmet_light_dual_green"

/obj/item/rig/combat
	name = "combat hardsuit control module"
	desc = "A sleek and dangerous hardsuit for active combat."
	icon_state = "security_rig"
	suit_type = "combat hardsuit"
	armor_list = list(
		melee = 50,
		bullet = 45,
		energy = 30,
		bomb = 50,
		bio = 100,
		rad = 50
	)
	slowdown = 0.3
	drain = 4
	offline_slowdown = 3
	offline_vision_restriction = 1
	stiffness = 0
	obscuration = 0
	max_upgrades = 1
	helm_type = /obj/item/clothing/head/helmet/space/rig/combat


/obj/item/rig/combat/equipped
	initial_modules = list(
		/obj/item/rig_module/mounted,
		/obj/item/rig_module/vision/thermal,
		/obj/item/rig_module/grenade_launcher,
		/obj/item/rig_module/ai_container,
		/obj/item/rig_module/power_sink,
		/obj/item/rig_module/electrowarfare_suite,
		/obj/item/rig_module/modular_injector/combat
		)


//Ironhammer rig suit
/obj/item/clothing/head/helmet/space/rig/combat/ironhammer
	light_overlay = "sec_light"

/obj/item/rig/combat/ironhammer
	name = "security hardsuit control module"
	desc = "Standard operative suit issued to Liberty Watch operatives. Provides balanced overall protection against various threats and widely used on planets surface, space stations or in open space."
	icon_state = "ihs_rig"
	helm_type = /obj/item/clothing/head/helmet/space/rig/combat/ironhammer
	suit_type = "ironhammer hardsuit"

/obj/item/rig/combat/ironhammer/equipped
	initial_modules = list(
		/obj/item/rig_module/ai_container,
		/obj/item/rig_module/maneuvering_jets,
		/obj/item/rig_module/storage
		)
/*
Pending CustodianIRR sprites later
/obj/item/rig/combat/custodianirr
	name = "Heavy CustodianIRR RIG"
	desc = " A cherished Custodian creation, the design of this heavy Rigsuit has became the base for many next generation Federation RIGs.\
	While its protection surpasses many modern Rigs, it remains unmodifiable, adhering to Custodian armor constraints. \
	Despite its artificial muscles, the suit is slower due to its substantial weight. \
	However, it provides comfort and would be even heavier without such innovation. \
	Crafted out of fear of a potential coalition attack in the past, it predates Elohopea's time before they were under the Federation's flag."
	icon_state = "custodianirr"
	suit_type = "custodianirr" // Rig Sprite still going to be made
	armor_list = list(
		melee = 60,
		bullet = 66,
		energy = 60,
		bomb = 60,
		bio = 100,
		rad = 50
	)
	slowdown = 0.6
	drain = 5
	offline_slowdown = 5 //unpowered, it is the WORST thing in the world. There is practically a mountain on your back.
	offline_vision_restriction = 1
	max_upgrades = 0
	chest_type = /obj/item/clothing/suit/space/rig/combat/custodianirr
	helm_type =  /obj/item/clothing/head/helmet/space/rig/combat/custodianirr
	boot_type =  /obj/item/clothing/shoes/magboots/rig/combat/custodianirr
	glove_type = /obj/item/clothing/gloves/rig/combat/custodianirr

/obj/item/rig/combat/custodianirr/equipped
	initial_modules = list(
		/obj/item/rig_module/storage,
		/obj/item/rig_module/device/flash,
		/obj/item/rig_module/maneuvering_jets,
		/obj/item/rig_module/held/shield
		)

/obj/item/clothing/suit/space/rig/combat/knight
	name = "custodianirr hardsuit breastplate"

/obj/item/clothing/gloves/rig/combat/knight //I LOVE Gundam Tanaka#9565 PLATONICALLY!!!
	name = "custodianirr hardsuit gauntlets"

/obj/item/clothing/shoes/magboots/rig/combat/custodianirr //I LOVE Gundam Tanaka#9565 PLATONICALLY!!!
	name = "custodianirr hardsuit greaves"

/obj/item/clothing/head/helmet/space/rig/combat/custodianirr
	name = "Custodianirr Oval Helmet"
	desc = "A helmet of genuine skull-protection goodness. You better hope this will never go unpowered, otherwise you got a mountain weighting down your spine."
	light_overlay = "helmet_light_dual"
	armor_list = list(
		melee = 50,
		bullet = 50,
		energy = 50,
		bomb = 50,
		bio = 100,
		rad = 50
	)
*/
