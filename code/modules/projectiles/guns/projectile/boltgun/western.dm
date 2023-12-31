/obj/item/gun/projectile/boltgun/lever/shotgun
	name = "\"Western\" repeating shotgun"
	desc = "A lever action rebored to take 12gauge shotgun shells. Perfect for those acustomed to horseback or 'on-the-move' fire."
	icon = 'icons/obj/guns/projectile/western.dmi'
	icon_state = "western"
	item_state = "western"
	w_class = ITEM_SIZE_BULKY
	caliber = CAL_SHOTGUN
	fire_sound = 'sound/weapons/guns/fire/shotgun.ogg'
	max_shells = 6
	price_tag = 650
	init_recoil = HMG_RECOIL(1.0)
	damage_multiplier = 0.8
	penetration_multiplier = 0.9
	zoom_factors = list()
	matter = list(MATERIAL_ALUMINIUM = 20, MATERIAL_PLASTIC = 6, MATERIAL_INDSTEEL = 7)
	serial_type = "ML"
	extra_bulk = -2
	gun_tags = list(GUN_PROJECTILE, GUN_INTERNAL_MAG, GUN_SCOPE)
	gun_parts = list(/obj/item/part/gun/frame/western = 1, /obj/item/part/gun/grip/black = 1, /obj/item/part/gun/mechanism/boltgun = 1, /obj/item/part/gun/barrel/shotgun = 1)

	saw_off = TRUE
	sawn = /obj/item/gun/projectile/boltgun/lever/shotgun/sawn

/obj/item/part/gun/frame/western
	name = "Western shotgun frame"
	desc = "A Western lever action shotgun frame. For hunting or endless trench warfare."
	icon_state = "frame_serbrifle"
	result = /obj/item/gun/projectile/boltgun/lever/shotgun
	gripvars = list(/obj/item/part/gun/grip/black)
	resultvars = list(/obj/item/gun/projectile/boltgun/lever/shotgun)
	mechanismvar = /obj/item/part/gun/mechanism/boltgun
	barrelvars = list(/obj/item/part/gun/barrel/shotgun)

/obj/item/gun/projectile/boltgun/lever/shotgun/sawn
	name = "sawn \"Western\" repeating shotgun"
	desc = "A lever action rebored to take 12 gauge shotgun shells. It appears someone has sawn down its stock and barrel."
	icon = 'icons/obj/guns/projectile/sawnoff/western.dmi'
	icon_state = "western"
	item_state = "western"
	w_class = ITEM_SIZE_SMALL
	price_tag = 450
	matter = list(MATERIAL_ALUMINIUM = 10, MATERIAL_PLASTIC = 4, MATERIAL_INDSTEEL = 5)
