/datum/craft_recipe/repairs
	category = "Repairs"
	time = 60
	related_stats = list(STAT_MEC)
	icon_state = "gun"

/datum/craft_recipe/repairs/double_barrel
	name = "Double barrel shotgun"
	result = /obj/item/gun/projectile/shotgun/doublebarrel
	steps = list(
		list(/obj/item/gun/projectile/shotgun/doublebarrel/sawn, 1, "time" = 60),
		list(CRAFT_MATERIAL, 6, MATERIAL_INDSTEEL),
		list(QUALITY_SAWING, 30, "time" = 60),
		list(QUALITY_WELDING, 30, "time" = 60)
	)

// This takes an already existing gun to refurbish it into another. It belongs here.
/datum/craft_recipe/gun/maresleg
	name = "\"Mares Leg\" lever shotgun"
	result = /obj/item/gun/projectile/boltgun/lever/shotgun
	steps = list(
		list(/obj/item/gun/projectile/boltgun/lever, 1, time = 60),
		list(QUALITY_ADHESIVE, 10, 60),
		list(QUALITY_SCREW_DRIVING, 10),
		list(CRAFT_MATERIAL, 6, MATERIAL_ALUMINIUM),
		list(QUALITY_BOLT_TURNING, 20, 30),
		list(QUALITY_WELDING, 10, 20)
	)

/datum/craft_recipe/repairs/western
	name = "Western lever shotgun"
	result = /obj/item/gun/projectile/boltgun/lever/shotgun
	steps = list(
		list(/obj/item/gun/projectile/boltgun/lever/shotgun/sawn, 1, "time" = 60),
		list(CRAFT_MATERIAL, 6, MATERIAL_INDSTEEL),
		list(CRAFT_MATERIAL, 6, MATERIAL_PLASTIC),
		list(QUALITY_SAWING, 30, "time" = 60),
		list(QUALITY_WELDING, 30, "time" = 60)
	)

/datum/craft_recipe/repairs/grizzly_shotgun
	name = "Trench shotgun"
	result = /obj/item/gun/projectile/shotgun/pump
	steps = list(
		list(/obj/item/gun/projectile/shotgun/pump/sawn, 1, "time" = 60),
		list(CRAFT_MATERIAL, 6, MATERIAL_INDSTEEL),
		list(CRAFT_MATERIAL, 6, MATERIAL_PLASTIC),
		list(QUALITY_SAWING, 30, "time" = 60),
		list(QUALITY_HAMMERING, 30, "time" = 60)
	)

/datum/craft_recipe/repairs/judge
	name = "Judge automatic shotgun"
	result = /obj/item/gun/projectile/shotgun/judge
	steps = list(
		list(/obj/item/gun/projectile/shotgun/judge/sawn, 1, "time" = 60),
		list(CRAFT_MATERIAL, 8, MATERIAL_INDSTEEL),
		list(CRAFT_MATERIAL, 6, MATERIAL_PLASTIC),
		list(QUALITY_SAWING, 30, "time" = 60),
		list(QUALITY_HAMMERING, 30, "time" = 60)
	)

/datum/craft_recipe/repairs/ak47_rifle
	name = "Kalashnikov rifle"
	result = /obj/item/gun/projectile/automatic/ak47
	steps = list(
		list(/obj/item/gun/projectile/automatic/ak47/sawn, 1, "time" = 60),
		list(CRAFT_MATERIAL, 6, MATERIAL_ALUMINIUM),
		list(CRAFT_MATERIAL, 6, MATERIAL_INDSTEEL),
		list(QUALITY_SAWING, 30, "time" = 60),
		list(QUALITY_HAMMERING, 30, "time" = 60)
	)

/datum/craft_recipe/repairs/rosefield
	name = "Rosefield boltgun"
	result = /obj/item/gun/projectile/boltgun/rosefield
	steps = list(
		list(/obj/item/gun/projectile/boltgun/rosefield/sawn, 1, "time" = 60),
		list(CRAFT_MATERIAL, 10, MATERIAL_WOOD),
		list(CRAFT_MATERIAL, 10, MATERIAL_INDSTEEL),
		list(CRAFT_MATERIAL, 10, MATERIAL_GLASS),
		list(QUALITY_SAWING, 30, "time" = 60),
		list(QUALITY_HAMMERING, 30, "time" = 60),
		list(QUALITY_WELDING, 30, "time" = 60)
	)

/datum/craft_recipe/repairs/novakovic_boltgun
	name = "Mosin boltgun"
	result = /obj/item/gun/projectile/boltgun
	steps = list(
		list(/obj/item/gun/projectile/boltgun/sawn, 1, "time" = 60),
		list(CRAFT_MATERIAL, 10, MATERIAL_WOOD),
		list(CRAFT_MATERIAL, 10, MATERIAL_ALUMINIUM),
		list(QUALITY_SAWING, 30, "time" = 60),
		list(QUALITY_HAMMERING, 30, "time" = 60),
		list(QUALITY_WELDING, 30, "time" = 60)
	)

/datum/craft_recipe/repairs/juggernaut_helm
	name = "Juggernaut bomb helmet"
	result = /obj/item/clothing/head/helmet/space/bomb/security
	steps = list(
		list(/obj/item/clothing/head/helmet/space/bomb, 1, "time" = 60),
		list(CRAFT_MATERIAL, 10, MATERIAL_PLASTIC),
		list(/obj/item/tool_upgrade/armor/melee, 1, "time" = 60),
		list(CRAFT_MATERIAL, 10, MATERIAL_ALUMINIUM),
		list(CRAFT_MATERIAL, 10, MATERIAL_INDSTEEL),
		list(QUALITY_SAWING, 30, "time" = 60),
		list(/obj/item/tool_upgrade/armor/bullet, 1, "time" = 60),
		list(CRAFT_MATERIAL, 10, MATERIAL_SILK),
		list(QUALITY_HAMMERING, 30, "time" = 60),
		list(/obj/item/tool_upgrade/reinforcement/rubbermesh, 1, "time" = 60),
		list(QUALITY_WELDING, 30, "time" = 60)
	)

/datum/craft_recipe/repairs/juggernaut_suit
	name = "Watchman E.O.D suit"
	result = /obj/item/clothing/suit/space/bomb/security
	steps = list(
		list(/obj/item/clothing/suit/space/bomb, 1, "time" = 60),
		list(CRAFT_MATERIAL, 10, MATERIAL_PLASTIC),
		list(/obj/item/tool_upgrade/armor/melee, 1, "time" = 60),
		list(CRAFT_MATERIAL, 10, MATERIAL_ALUMINIUM),
		list(CRAFT_MATERIAL, 10, MATERIAL_INDSTEEL),
		list(QUALITY_SAWING, 30, "time" = 60),
		list(/obj/item/tool_upgrade/armor/bullet, 1, "time" = 60),
		list(CRAFT_MATERIAL, 10, MATERIAL_SILK),
		list(QUALITY_HAMMERING, 30, "time" = 60),
		list(/obj/item/tool_upgrade/reinforcement/rubbermesh, 1, "time" = 60),
		list(QUALITY_WELDING, 30, "time" = 60)
	)
