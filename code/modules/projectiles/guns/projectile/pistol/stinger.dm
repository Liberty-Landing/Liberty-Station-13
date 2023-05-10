/obj/item/gun/projectile/stinger
	name = "\"Stinger\" pistol"
	desc = "A specialized pistol made for police enforcement, the \"Stinger\" is a posterboy image for local security forces and even those back in Federation space. \
			This design appears to be made locally by gunsmiths, sporting small variations from its Federation design. Chambered in 9mm"
	icon = 'icons/obj/guns/projectile/stinger.dmi'
	icon_state = "stinger"
	item_state = "stinger"
	w_class = ITEM_SIZE_SMALL
	caliber = CAL_PISTOL
	can_dual = TRUE
	origin_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 2)
	matter = list(MATERIAL_PLASTIC = 6)
	price_tag = 350
	fire_sound = 'sound/weapons/guns/fire/9mm_pistol.ogg'
	load_method = SINGLE_CASING|MAGAZINE
	mag_well = MAG_WELL_PISTOL | MAG_WELL_H_PISTOL
	gun_tags = list(GUN_PROJECTILE, GUN_SILENCABLE, GUN_MAGWELL)
	damage_multiplier = 1.1
	penetration_multiplier = 0.9
	init_recoil = HANDGUN_RECOIL(0.8)
	serial_type = "LG"

	wield_delay = 0 SECOND
	gun_parts = list(/obj/item/part/gun/frame/stinger = 1, /obj/item/part/gun/grip/rubber = 1, /obj/item/part/gun/mechanism/pistol = 1, /obj/item/part/gun/barrel/pistol = 1)

/obj/item/part/gun/frame/stinger
	name = "Stinger frame"
	desc = "A Stinger pistol frame. A cops best friend."
	icon_state = "frame_clarissa"
	result = /obj/item/gun/projectile/stinger
	resultvars = list(/obj/item/gun/projectile/stinger)
	gripvars = list(/obj/item/part/gun/grip/rubber)
	mechanismvar = /obj/item/part/gun/mechanism/pistol
	barrelvars = list(/obj/item/part/gun/barrel/pistol)

/obj/item/gun/projectile/stinger/preloaded

/obj/item/gun/projectile/stinger/preloaded/New()
	. = ..()
	ammo_magazine = new /obj/item/ammo_magazine/highcap_pistol_35/rubber(src)

/obj/item/gun/projectile/stinger/update_icon()
	..()

	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if (!ammo_magazine || !length(ammo_magazine.stored_ammo))
		iconstring += "_slide"

	if (silenced)
		iconstring += "_s"
		itemstring += "_s"

	icon_state = iconstring
	set_item_state(itemstring)

/obj/item/gun/projectile/stinger/pepperball
	name = "\"Stinger-P\" pistol"
	desc = "A specialized pistol made for police enforcement, the \"Stinger\" is a posterboy image for local security forces and even those back in Federation space. \
			This design appears to be made locally by gunsmiths, sporting small variations from its Federation design. Chambered in 9mm. \
			This specific model appears to be a Liberty Watch variant, a synthaizer built in coating bullets with non-lethal variants of chemicals to take down hostiles."
	icon_state = "stingerpep"

/obj/item/gun/projectile/stinger/pepperball/sopo
	name = "\"Stinger-S\" pistol"
	desc = "A specialized pistol made for police enforcement, the \"Stinger\" is a posterboy image for local security forces and even those back in Federation space. \
			This design appears to be made locally by gunsmiths, sporting small variations from its Federation design. Chambered in 9mm. \
			This specific model appears to sport CAPSA colors on it, a synthesizer built in coating bullets in non-lethal variants of chemicals such as soporifics to take down unruly patients."
	icon_state = "stingersop"
