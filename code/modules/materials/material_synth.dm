// These objects are used by cyborgs to get around a lot of the limitations on stacks
// and the weird bugs that crop up when expecting borg module code to behave sanely.
/obj/item/stack/material/cyborg
	uses_charge = 1
	charge_costs = list(1000)
	gender = NEUTER
	matter = null // Don't shove it in the autholathe.

/obj/item/stack/material/cyborg/New()
	if(..())
		name = "[material.display_name] synthesiser"
		desc = "A device that synthesises [material.display_name]."
		matter = null

/obj/item/stack/material/cyborg/plastic
	icon_state = "sheet-plastic"
	default_type = MATERIAL_PLASTIC

/obj/item/stack/material/cyborg/aluminium
	icon_state = "sheet-aluminium"
	default_type = MATERIAL_ALUMINIUM

/obj/item/stack/material/cyborg/indsteel
	icon_state = "sheet-indsteel"
	default_type = MATERIAL_INDSTEEL

/obj/item/stack/material/cyborg/wood
	icon_state = "sheet-wood"
	default_type = MATERIAL_WOOD

/obj/item/stack/material/cyborg/glass
	icon_state = "sheet-glass"
	default_type = MATERIAL_GLASS

/obj/item/stack/material/cyborg/glass/reinforced
	icon_state = "sheet-rglass"
	default_type = MATERIAL_LGLASS
	charge_costs = list(500, 1000)
