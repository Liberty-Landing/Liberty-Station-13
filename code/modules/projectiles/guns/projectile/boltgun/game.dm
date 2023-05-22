/obj/item/gun/projectile/boltgun/gamer
	name = "\"Big Game\" boltgun"
	desc = "A famous and affordable weapon found both within the galaxy's mid-reaches and outer-reaches. \
			Chambered in 7.62mm, this weapon sports ten more rounds than it's cheaper \"Mosin\" ."
	icon = 'icons/obj/guns/projectile/game.dmi'
	icon_state = "boltgun"
	item_state = "boltgun"
	w_class = ITEM_SIZE_HUGE
	force = WEAPON_FORCE_ROBUST
	slot_flags = SLOT_BACK
	origin_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 2)
	caliber = CAL_RIFLE
	fire_delay = 3
	damage_multiplier = 1.4
	penetration_multiplier  = 1.6
	init_recoil = HMG_RECOIL(0.8)
	handle_casings = HOLD_CASINGS
	load_method = SINGLE_CASING|SPEEDLOADER
	max_shells = 15
	fire_sound = 'sound/weapons/guns/fire/mosin.ogg'
	reload_sound = 'sound/weapons/guns/interact/rifle_load.ogg'
	fire_sound_silenced = 'sound/weapons/guns/fire/silenced_rifle.ogg' // More cohesive sound, still loud for its caliber
	matter = list(MATERIAL_STEEL = 20, MATERIAL_PLASTIC = 10)
	price_tag = 500
	sharp = FALSE
	gun_tags = list(GUN_PROJECTILE, GUN_INTERNAL_MAG, GUN_SCOPE, GUN_SILENCABLE)
	saw_off = FALSE
	sawn = /obj/item/gun/projectile/boltgun/gamer/sawn
	serial_type = "Car-Van"

	extra_damage_mult_scoped = 0.4
	zoom_factors = list(1.0)

	wield_delay = 0.3 SECOND
	wield_delay_factor = 0.2 // 20 vig
	gun_parts = list(/obj/item/part/gun/frame/boltgun = 1, /obj/item/part/gun/grip/black = 1, /obj/item/part/gun/mechanism/boltgun = 1, /obj/item/part/gun/barrel/lrifle = 1)

/obj/item/gun/projectile/boltgun/gamer/sawn
	name = "\"Big Game\" obrez boltgun"
	desc = "Sawn down verson of a high powered bolt gun sporting ten more rounds in its internals then a normal bolt gun."
	icon = 'icons/obj/guns/projectile/sawnoff/mosin.dmi'
	icon_state = "obrez"
	item_state = "obrez"
	force = WEAPON_FORCE_NORMAL
	w_class = ITEM_SIZE_NORMAL
	slot_flags = SLOT_BELT|SLOT_HOLSTER
	price_tag = 75
	sharp = 0
	init_recoil = HMG_RECOIL(0.8)
	penetration_multiplier = 0.5
	damage_multiplier = 1
	fire_delay = 4
	max_shells = 15
	gun_tags = list(GUN_PROJECTILE, GUN_INTERNAL_MAG, GUN_SILENCABLE)
	matter = list(MATERIAL_STEEL = 10, MATERIAL_PLASTIC = 4)
	saw_off = FALSE
	bolt_training = FALSE //Training didnt cover obrez
	gun_parts = list(/obj/item/part/gun/grip/black = 1, /obj/item/part/gun/mechanism/boltgun = 1, /obj/item/part/gun/barrel/lrifle = 1)
