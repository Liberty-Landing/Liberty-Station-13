/obj/item/gun/projectile/revolver/capgun
	name = "HS REV \"Miller\"" //for that epic clown robbery meme
	desc = "Looks almost like the real thing! Ages 8 and up."
	icon = 'icons/obj/guns/projectile/ranger.dmi'
	icon_state = "ranger"
	item_state = "ranger"
	caliber = CAL_CAP
	origin_tech = list(TECH_COMBAT = 1, TECH_MATERIAL = 1)
	price_tag = 100
	handle_casings = CYCLE_CASINGS
	max_shells = 7
	ammo_type = /obj/item/ammo_casing/cap
	gun_tags = list(GUN_PROJECTILE, GUN_INTERNAL_MAG, GUN_REVOLVER)
	fire_animatio = FALSE
	serial_type = "TOY-CO"

/obj/item/storage/box/blanks
	name = "cap gun ammo"
	desc = "A box containing ammo for the \"HS REV Miller\" cap gun."
	icon = 'icons/obj/toy.dmi'
	icon_state = "foambox"

/obj/item/storage/box/foambow/populate_contents()
	new /obj/item/ammo_casing/cap(src)
	new /obj/item/ammo_casing/cap(src)
	new /obj/item/ammo_casing/cap(src)
	new /obj/item/ammo_casing/cap(src)
	new /obj/item/ammo_casing/cap(src)
	new /obj/item/ammo_casing/cap(src)
	new /obj/item/ammo_casing/cap(src)

