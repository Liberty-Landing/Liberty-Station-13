/obj/item/gun/matter/launcher/nt_sprayer
	name = "sludge staff"
	desc = "An odd tool used by the Custodians. Uses solid biomass as ammo and spreads a slipping solution on hit. Despite many attempts to reverse-engineer it, nobody outside of the Forgemasters is quite sure how it works."
	icon_state = "sludge_staff"
	icon = 'icons/obj/guns/matter/sludge.dmi'
	slot_flags = SLOT_BACK
	fire_sound = 'sound/weapons/Genhit.ogg'
	origin_tech = list(TECH_COMBAT = 1, TECH_MATERIAL = 1, TECH_BIO = 4)
	matter_type = MATERIAL_BIOMATTER
	stored_matter = 0 //We do not print with free biomatter
	projectile_cost = 0.5
	projectile_type = /obj/item/arrow/slipping

	init_firemodes = list(
		list(mode_name="normal", mode_desc="Small short lasting slipping bolt", projectile_type=/obj/item/arrow/slipping, fire_sound='sound/weapons/Genhit.ogg', fire_delay=14, icon="toxin", projectile_cost = 0.5),
		list(mode_name="stronger", mode_desc="Small long lasting slipping bolt", projectile_type=/obj/item/arrow/slipping/bigger, fire_sound='sound/weapons/Genhit.ogg', fire_delay=25, icon="toxin", projectile_cost = 1.5),
	)
	serial_type = "Bonfire"

/obj/item/arrow
	var/recoil = 2  // Light recoil, it's just some cleaning stuff

/obj/item/arrow/slipping
	icon = 'icons/obj/projectiles.dmi'
	icon_state = "toxin"
	throwforce = 1
	sharp = FALSE

/obj/item/arrow/slipping/throw_impact()
	..()

	create_reagents(5)
	reagents.add_reagent("lube", 1)
	reagents.add_reagent("surfactant", 2)
	reagents.add_reagent("water", 2)

	qdel(src)

/obj/item/arrow/slipping/bigger

/obj/item/arrow/slipping/bigger/throw_impact()
	..()

	create_reagents(15)
	reagents.add_reagent("lube", 3)
	reagents.add_reagent("surfactant", 6)
	reagents.add_reagent("water", 6)

	qdel(src)


/obj/item/gun/matter/launcher/nt_sprayer/mini
	name = "\"Spot\" cleaning pistol"
	desc = "The janitor's choice of cleaner. Uses cellulose based solution to clean upto 99% of dirt grime and oil, even comes with a sling to fit on your back."
	icon_state = "si_sprayer"
	icon = 'icons/obj/guns/matter/nt_sprayer.dmi'
	w_class = ITEM_SIZE_NORMAL
	slot_flags = SLOT_BACK|SLOT_BELT|SLOT_HOLSTER
	fire_sound = 'sound/weapons/Genhit.ogg'
	origin_tech = list(TECH_COMBAT = 1, TECH_MATERIAL = 1, TECH_BIO = 2)
	matter = list(MATERIAL_PLASTEEL = 5, MATERIAL_WOOD = 3, MATERIAL_PLASTIC = 15)
	matter_type = MATERIAL_WOOD
	serial_type = "PI"
	projectile_type = /obj/item/arrow/cleansing

	max_stored_matter = 3 //Annoying to use do to low ammo

	stored_matter = 0 //When freshly printed we do have ammo
	projectile_cost = 1

	init_firemodes = list(
		list(mode_name="normal", mode_desc="Small short lasting cleansing bolt that cleans a few tiles", projectile_type=/obj/item/arrow/cleansing, fire_sound='sound/weapons/Genhit.ogg', fire_delay=14, icon="toxin", projectile_cost = 1),
		list(mode_name="stronger", mode_desc="Small long lasting cleansing bolt that cleans a few tiles", projectile_type=/obj/item/arrow/cleansing/bigger, fire_sound='sound/weapons/Genhit.ogg', fire_delay=25, icon="toxin", projectile_cost = 3),
	)

/obj/item/arrow/cleansing
	icon = 'icons/obj/projectiles.dmi'
	icon_state = "toxin"
	throwforce = 1
	sharp = FALSE

/obj/item/arrow/cleansing/throw_impact()
	..()

	create_reagents(5)
	reagents.add_reagent("cleaner", 1)
	reagents.add_reagent("surfactant", 2)
	reagents.add_reagent("water", 2)

	qdel(src)

/obj/item/arrow/cleansing/bigger

/obj/item/arrow/cleansing/bigger/throw_impact()
	..()

	create_reagents(15)
	reagents.add_reagent("cleaner", 3)
	reagents.add_reagent("surfactant", 6)
	reagents.add_reagent("water", 6)

	qdel(src)
