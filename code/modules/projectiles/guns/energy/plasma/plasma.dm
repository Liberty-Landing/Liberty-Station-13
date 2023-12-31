/obj/item/gun/energy/plasma
	name = "\"Shenyang\" plasma rifle"
	desc = "One of the first successful designs made by the Astrakhan corporation, the \"Shenyang\" uses advanced plasma generation technology to emit powerful blasts of energized matter or large, consuming fireballs."
	icon = 'icons/obj/guns/energy/pulse.dmi'
	icon_state = "pulse"
	item_state = null	//so the human update icon uses the icon_state instead.
	item_charge_meter = TRUE
	w_class = ITEM_SIZE_HUGE
	slot_flags = SLOT_BACK
	force = WEAPON_FORCE_PAINFUL
	matter = list(MATERIAL_INDSTEEL = 17, MATERIAL_WOOD = 8, MATERIAL_SILVER = 6, MATERIAL_URANIUM = 4)
	price_tag = 2000
	origin_tech = list(TECH_COMBAT = 3, TECH_PLASMA = 2)
	fire_sound = 'sound/weapons/energy/pulse.ogg'
	projectile_type = /obj/item/projectile/plasma/light
	cell_type = /obj/item/cell/medium
	sel_mode = 1
	charge_cost = 15
	fire_delay = 4
	twohanded = TRUE
	can_dual = FALSE

	init_firemodes = list(
		list(mode_name="Burn", mode_desc="A relatively light plasma round", projectile_type=/obj/item/projectile/plasma/light, fire_sound='sound/weapons/energy/melt.ogg', burst=1, fire_delay=4, charge_cost=15, icon="kill", projectile_color = "#0088ff"),
		list(mode_name="Sear", mode_desc="A three-round burst of light plasma rounds, for dealing with unruly crowds", projectile_type=/obj/item/projectile/plasma/light, fire_sound='sound/weapons/energy/melt.ogg', burst=3, fire_delay=12, burst_delay=1, charge_cost=15, icon="burst", projectile_color = "#0088ff"),
		list(mode_name="INCINERATE", mode_desc="A heavy armor-stripping plasma round", projectile_type=/obj/item/projectile/plasma/aoe/heat, fire_sound='sound/weapons/energy/incinerate.ogg', burst=1, fire_delay=20, charge_cost=90, icon="destroy", projectile_color = "#FFFFFF"),
	)
	init_recoil = RIFLE_RECOIL(1)

	gun_tags = list(GUN_ENERGY, GUN_SCOPE)
	serial_type = "Astrakhan"

/obj/item/gun/energy/plasma/mounted
	self_recharge = TRUE
	use_external_power = TRUE
	safety = FALSE
	twohanded = FALSE
	init_recoil = HANDGUN_RECOIL(0.1)

/obj/item/gun/energy/plasma/mounted/blitz
	name = "Astrahkan PR \"Xiang\""
	desc = "A miniaturized plasma rifle, remounted for robotic use only. Also has the ablity to have a Master Unmaker integrated into it."
	icon_state = "plasma_turret"
	charge_meter = FALSE
	serial_type = "Astrakhan"
	gun_tags = list(GUN_ENERGY, GUN_SCOPE)
	allow_simulacrum_mods = TRUE

/obj/item/gun/energy/plasma/destroyer
	name = "\"Hunan\" plasma rifle"
	desc = "An older Astrakhan corporation brand plasma rifle, developed in direct response to compete against the highly successful \"Cassad\" design by Hellion Electronics Concern. Reliable and capable of firing suppressive bursts of lower-temperature plasma."
	icon = 'icons/obj/guns/energy/destroyer.dmi'
	fire_sound = 'sound/weapons/energy/pulse.ogg'
	matter = list(MATERIAL_INDSTEEL = 20, MATERIAL_WOOD = 8, MATERIAL_SILVER = 10, MATERIAL_URANIUM = 7)
	projectile_type = /obj/item/projectile/beam/pulse
	charge_cost = 150 //4 shots out of a 600M
	fire_delay = 15
	origin_tech = list(TECH_COMBAT = 4, TECH_PLASMA = 3)
	damage_multiplier = 1.3
	init_firemodes = list(
		list(mode_name="DISINTEGRATE", mode_desc="A powerful area of effect shot", projectile_type=/obj/item/projectile/plasma/aoe/heat/strong, fire_sound='sound/weapons/energy/incinerate.ogg', fire_delay=20, charge_cost=200, icon="destroy", projectile_color = "#ff1212"),
		list(mode_name="ERADICATE", mode_desc="Strong, fully-automatic fire", mode_type = /datum/firemode/automatic, projectile_type=/obj/item/projectile/plasma, fire_sound='sound/weapons/energy/vaporize.ogg', fire_delay=4, charge_cost=35, icon="burst", projectile_color = "#00AAFF"),
	)

/obj/item/gun/energy/plasma/super_heavy
	name = "\"Ragefire\" Experimental Plasma Gun"
	desc = "A Phokorus Institute brand experimental weapon that uses coolant to fire deadly plasma projectiles without needing to cool down between shots, however the gun is extremely unstable without cooling."
	icon = 'icons/obj/guns/energy/plasma.dmi'
	icon_state = "plasma"
	fire_sound = 'sound/weapons/energy/lasercannonfire.ogg'
	projectile_type = /obj/item/projectile/plasma/heavy/super_heavy
	cell_type = /obj/item/cell/medium
	charge_cost = 150
	matter = list(MATERIAL_INDSTEEL = 10, MATERIAL_ALUMINIUM = 20, MATERIAL_SILVER = 5, MATERIAL_HYDROGENC = 10)
	damage_multiplier = 1
	twohanded = FALSE
	can_dual = TRUE
	slot_flags = SLOT_BELT|SLOT_BACK|SLOT_HOLSTER
	serial_type = "PI"

	var/explode_chance // the % of chance the gun has to explode each time it is fired without coolant. It is random between each gun.
	var/explode_chance_min = 5 // The mininum of explode_chance
	var/explode_chance_max = 30 // The maximum of explode_chance
	var/coolant_used_per_shot = 10 // Amount of coolant used per shot.

	var/obj/item/reagent_containers/container //Beaker inserted.

	// Value used for the explosion, same as a normal mine.
	var/explosion_d_size = 0
	var/explosion_h_size = 0
	var/explosion_l_size = 3
	var/explosion_f_size = 5

	init_firemodes = list(
		list(mode_name="Super-heavy Plasma", mode_desc="A massive plasma bolt to melt even indsteel", projectile_type=/obj/item/projectile/plasma/heavy/super_heavy, fire_sound='sound/weapons/energy/pulse.ogg', fire_delay=5, icon="kill", projectile_color = "#FFFF00"),
	)

/obj/item/gun/energy/plasma/super_heavy/examine(mob/user)
	..()
	if(container)
		to_chat(user, SPAN_NOTICE("The [src.name] currently contain [container.reagents.total_volume] of chemicals."))

// We want that every gun got a random chance of exploding.
/obj/item/gun/energy/plasma/super_heavy/New()
	..()
	explode_chance = rand(explode_chance_min, explode_chance_max) // If there's no coolant, it got a random chance to explode, the chance itself is random.

/obj/item/gun/energy/plasma/super_heavy/attackby(obj/item/W, mob/user)

	if(istype(W, /obj/item/tool)) // Is it a tool?
		var/obj/item/tool/T = W // To use tool-only checks
		if(QUALITY_BOLT_TURNING in T.tool_qualities) // Can we turn bolts with the tool?
			if(container) // Do we have something to remove?
				if(T.use_tool(user, src, WORKTIME_NORMAL, QUALITY_BOLT_TURNING, FAILCHANCE_VERY_EASY, required_stat = STAT_MEC)) // Skill check.
					to_chat(user, "You remove the [container.name] from the [src.name].")
					container.forceMove(user.loc) //Move the container to the floor of the user.
					container = null // We no longer have a container.
					return
			to_chat(user, "[src.name] doesn't have a container.")

	if(istype(W, /obj/item/reagent_containers)) // Is it something that hold chems ?

		// Do we already have one inside?
		if(container)
			to_chat(user, "The [src.name] already got a beaker.")
			return
		else
			var/obj/item/reagent_containers/C = W

			// Remove the container from the user and put it in the gun
			user.remove_from_mob(C) // Remove from the mob's hand before moving it.
			C.forceMove(src) // Moving the container into the gun.
			container = C // Assiging a reference variable
			to_chat(user, "You add the [W.name] to the [src].")
			return
	..()
	return

/obj/item/gun/energy/plasma/super_heavy/handle_post_fire(mob/user)
	..() // We shoot the gun before using the coolant.
	if(!(container) || !(container.reagents.remove_reagent("coolant", coolant_used_per_shot))) // First check if we have a container, if we do, then try to remove the coolant, if it can't, we continue.
		to_chat(user, SPAN_WARNING("Your [src.name] starts to overheat.")) // Warn the user that they ran out.

		if(prob(explode_chance)) // This roll the dice to see if the gun explode.
			usr.visible_message(SPAN_DANGER("[usr]'s [src.name] overheat and explode !")) // Obvious Message
			explosion(user, explosion_d_size * damage_multiplier, explosion_h_size * damage_multiplier, explosion_l_size * damage_multiplier, explosion_f_size * damage_multiplier) // EXPLOSION !
			qdel(src) // The gun blew up, it is no more.
			return
	return
