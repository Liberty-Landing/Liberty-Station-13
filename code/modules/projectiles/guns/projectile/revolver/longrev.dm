/obj/item/gun/projectile/revolver/longboi
	name = "\"Long\" revolver"
	desc = "A novelty revolver made by the Skylight with a stupidly long barrel favored by those with less sense than style, its extended barrel gives it incredible stopping power and penetration but loses recoil control. Uses 6.5mm."
	icon = 'icons/obj/guns/projectile/Long_Revolver.dmi'
	icon_state = "longRevolver"
	w_class = ITEM_SIZE_NORMAL
	caliber = CAL_SRIFLE					//Literally a 6.5 meme-gun
	slot_flags = SLOT_BACK|SLOT_BELT	//Can't fit a holster due to length
	origin_tech = list(TECH_COMBAT = 3, TECH_MATERIAL = 3)
	max_shells = 6
	matter = list(MATERIAL_INDSTEEL = 12, MATERIAL_WOOD = 6)
	price_tag = 1250 //It's a novelty item.
	damage_multiplier = 1.4 // One of the highest damage multipliers
	penetration_multiplier = 1.4
	init_recoil = HANDGUN_RECOIL(2)	// Long barrel makes it unwieldy
	gun_tags = list(GUN_PROJECTILE, GUN_INTERNAL_MAG, GUN_REVOLVER)
	twohanded = TRUE
	serial_type = "LG"
	wield_delay = 0.5 SECOND
	wield_delay_factor = 0.5 // 50 vig
	gun_parts = list(/obj/item/stack/material/aluminium = 10)

