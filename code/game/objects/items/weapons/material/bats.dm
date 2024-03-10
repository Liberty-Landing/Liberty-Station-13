/obj/item/material/baseballbat
	name = "bat"
	desc = "HOME RUN!"
	icon_state = "metalbat0"
	wielded_icon = "metalbat1"
	item_state = "metalbat0"
	attack_verb = list("smashed", "beaten", "slammed", "smacked", "struck", "battered", "bonked")
	hitsound = 'sound/weapons/blunthit.ogg' // Ouch!
	color = "#824B28" // Bandaid fix for refresh_upgrades()
	default_material = MATERIAL_WOOD
	force_divisor = 0.84           // 15 when unwielded 22 when wielded with weight 18 (wood)
	slot_flags = SLOT_BACK
	structure_damage_factor = STRUCTURE_DAMAGE_HEAVY
	has_alt_mode = TRUE
	alt_mode_toggle = "relaxes the anger behind their grip"
	alt_mode_lossrate = 1
	alt_mode_sharp = FALSE
	is_material_weapon = TRUE

/obj/item/material/baseballbat/update_force()
	..()
	force_unwielded = force
	force_wielded = force * 1.5

//Predefined materials go here.

/obj/item/material/baseballbat/metal
	default_material = MATERIAL_ALUMINIUM
	color = INDSTEEL_COLOUR

/obj/item/material/baseballbat/metal/New(var/newloc)
	..(newloc,MATERIAL_ALUMINIUM)
	color = material.icon_colour

/obj/item/material/baseballbat/uranium
	default_material = MATERIAL_URANIUM
	color = "#007A00"

/obj/item/material/baseballbat/uranium/New(var/newloc)
	..(newloc,MATERIAL_URANIUM)
	color = material.icon_colour

/obj/item/material/baseballbat/gold
	default_material = MATERIAL_GOLD
	color = "#EDD12F"

/obj/item/material/baseballbat/gold/New(var/newloc)
	..(newloc,MATERIAL_GOLD)
	color = material.icon_colour

/obj/item/material/baseballbat/platinum
	default_material = MATERIAL_TITANIUM
	color = "#9999FF"

/obj/item/material/baseballbat/platinum/New(var/newloc)
	..(newloc,MATERIAL_TITANIUMRTC)
	color = material.icon_colour

/obj/item/material/baseballbat/diamond
	default_material = MATERIAL_DIAMOND
	color = "#00FFE1"

/obj/item/material/baseballbat/diamond/New(var/newloc)
	..(newloc,MATERIAL_DIAMOND)
	color = material.icon_colour
