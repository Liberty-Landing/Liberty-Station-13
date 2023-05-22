/*
Quirky Terra Therma weapon as requested by the department. Insert compressed matter from the Forge into this to fire it.
No more 1 shot guns but hey, at least you no longer need cells and can carry a fat-stack of compressed matter instead.
*/
#define PISTOL_SHOT_COST	4
#define SHOTGUN_SHOT_COST	8

/obj/item/gun/projectile/matter_gun
	name = "Mk I \"Forger\" compressed-matter pistol"
	desc = "An odd design where a compressed matter cartriage is loaded into the firearm's designated port, effectively producing bullet-like particles."
	icon = 'icons/obj/guns/nano/pistol.dmi'
	icon_state = "forger"
	item_state = "forger"
	origin_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 2)
	matter = list(MATERIAL_PLASTEEL = 12, MATERIAL_WOOD = 5)
	price_tag = 300
	fire_sound = 'sound/weapons/guns/fire/9mm_pistol.ogg'
	can_dual = TRUE
	damage_multiplier = 1.0
	init_recoil = HANDGUN_RECOIL(0.6)
	gun_tags = list(GUN_PROJECTILE)
	serial_type = "Terra"

	var/projectile_type	= /obj/item/projectile/bullet/pistol_35/nano

	var/max_stored_matter = PISTOL_SHOT_COST * 15 //not the best, but that means it can carry a lot of compressed matter
	var/projectile_cost = PISTOL_SHOT_COST
	var/stored_matter = 0
	var/matter_type = MATERIAL_COMPRESSED_MATTER

	wield_delay = 0.3 SECOND
	wield_delay_factor = 0.2 // 20 vig

	init_firemodes = list(
		list(mode_name="nano bullet", mode_desc="fabricates a bullet directly in the barrel then fires", projectile_type=/obj/item/projectile/bullet/pistol_35/nano, projectile_cost = PISTOL_SHOT_COST, icon="kill"), //this projectile_cost resets the cost in case you keep switching modes
		list(mode_name="superheated slug", mode_desc="overcharge the fabrication mechanism to launch a molten slug that illuminates the area", projectile_type=/obj/item/projectile/bullet/flare/choas, projectile_cost = PISTOL_SHOT_COST * 4, icon="grenade"),
	)// heated costs 4 times as much as a normal shot

/obj/item/gun/projectile/matter_gun/attackby(obj/item/W as obj, mob/user as mob)
	var/obj/item/stack/material/M = W
	if(istype(M) && M.material.name == MATERIAL_COMPRESSED_MATTER)
		var/amount = min(M.get_amount(), round(max_stored_matter - stored_matter))
		if(M.use(amount) && stored_matter < max_stored_matter)
			stored_matter += amount
			playsound(src.loc, 'sound/machines/click.ogg', 50, 1)
			to_chat(user, "<span class='notice'>You load [amount] Compressed Matter into \the [src].</span>. The Forger now holds [stored_matter]/[max_stored_matter] matter-units.")
			update_icon()	//Updates the ammo counter
		if (M.use(amount) && stored_matter >= max_stored_matter)
			to_chat(user, "<span class='notice'>The Forger is full.")
	else
		..()

/obj/item/gun/projectile/matter_gun/consume_next_projectile(mob/user)
	if(stored_matter < projectile_cost) return null
	if(!ispath(projectile_type)) return null

	stored_matter -= projectile_cost
	return new projectile_type(src)

/obj/item/gun/projectile/matter_gun/examine(user)
	. = ..()
	to_chat(user, "It holds [stored_matter]/[max_stored_matter] [matter_type].")

/obj/item/gun/projectile/matter_gun/update_icon()
	..()

	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if (loaded.len)
		iconstring += "-full"
	icon_state = iconstring
	set_item_state(itemstring)

/obj/item/gun/projectile/matter_gun/Initialize()
	. = ..()
	update_icon()

/obj/item/gun/projectile/matter_gun/shotgun
	name = "Mk II \"Forger\" compressed-matter shotgun"
	desc = "An odd design where a compressed matter cartriage is loaded into the firearm's designated port, effectively producing bullet-like particles. \
			This version is far more bulkier than its pistol counterpart, but packs quite a punch. Able to fire projectiles that fragment on impact or incendiary rounds."
	icon = 'icons/obj/guns/nano/shotgun.dmi'
	icon_state = "railgun"
	item_state = "railgun"
	origin_tech = list(TECH_COMBAT = 3, TECH_MATERIAL = 3)
	matter = list(MATERIAL_PLASTEEL = 18, MATERIAL_PLASTIC = 6)
	price_tag = 650
	fire_sound = 'sound/weapons/energy/emitter2.ogg'
	can_dual = FALSE
	init_recoil = RIFLE_RECOIL(0.8)
	gun_tags = list(GUN_PROJECTILE)
	serial_type = "Terra"

	projectile_type	= /obj/item/projectile/bullet/shotgun/ceramic

	max_stored_matter = SHOTGUN_SHOT_COST * 12 //12 shot semi auto shotgun, no way to increase the mag too
	projectile_cost = SHOTGUN_SHOT_COST
	stored_matter = 0
	matter_type = MATERIAL_COMPRESSED_MATTER

	wield_delay = 0.5 SECOND
	wield_delay_factor = 0.3 // 30 vig

	init_firemodes = list(
		list(mode_name="ceramic slug", mode_desc="fires a sinlge high-powered slug", projectile_type=/obj/item/projectile/bullet/shotgun/ceramic, icon="kill"),
		list(mode_name="super-heated pellets", mode_desc="overclock the fabricator to fire a spray of super-heated pellets", projectile_type=/obj/item/projectile/bullet/pellet/shotgun/energy, icon="grenade"),
	)
#undef PISTOL_SHOT_COST
#undef SHOTGUN_SHOT_COST
