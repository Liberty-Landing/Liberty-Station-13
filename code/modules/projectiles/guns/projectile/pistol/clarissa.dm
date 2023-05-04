//Bad loadout gun for self defence when spawning in against simple roaches or the like.

/obj/item/gun/projectile/clarissa
	name = "\"Clarissa\" compact pistol"
	desc = "A pocket pistol made on demand, it uses older designs of fully plastic pistols used by spies to take down a target while undercover as civilians,\
	but now is commonly for self-defence. Due to its full plastic internals, it has low stopping power and is impossible to maintain. Uses 9mm rounds."
	icon = 'icons/obj/guns/projectile/clarissa_black.dmi'
	icon_state = "clarissa"
	item_state = "clarissa"
	w_class = ITEM_SIZE_SMALL
	caliber = CAL_PISTOL
	can_dual = TRUE
	silenced = FALSE
	origin_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 2)
	matter = list(MATERIAL_PLASTIC = 6)
	price_tag = 80
	fire_sound = 'sound/weapons/guns/fire/9mm_pistol.ogg'
	load_method = SINGLE_CASING|MAGAZINE
	mag_well = MAG_WELL_PISTOL | MAG_WELL_H_PISTOL
	gun_tags = list(GUN_PROJECTILE, GUN_SILENCABLE, GUN_MAGWELL)
	damage_multiplier = 0.7
	init_recoil = HANDGUN_RECOIL(0.2)
	serial_type = "Car-Van"

	wield_delay = 0 SECOND
	gun_parts = list(/obj/item/stack/material/plastic = 4)
