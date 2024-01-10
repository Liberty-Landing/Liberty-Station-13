/obj/item/hearthcore_upgrade
	name = "Base Hearthcore Upgrade"
	desc = "Hearthcore upgrade, is now part of our reality."
	icon = 'icons/obj/module.dmi'
	icon_state = "core_upgrade"
	var/mob/living/carbon/human/wearer
	var/obj/item/implant/core_implant/hearthcore/hearthcore
	var/active = FALSE

/obj/item/hearthcore_upgrade/proc/install(var/mob/living/target, var/obj/item/implant/core_implant/hearthcore/_hearthcore)
	forceMove(_hearthcore)
	_hearthcore.upgrade = src
	wearer = target
	hearthcore = _hearthcore
	active = TRUE
	OnInstall(target, _hearthcore)
	wearer.visible_message(SPAN_WARNING("[src] attaches itself to [wearer]'s Hearthcore."))
	return active

/obj/item/hearthcore_upgrade/proc/uninstall()
	forceMove(get_turf(wearer))
	hearthcore.upgrade = null
	wearer.visible_message(SPAN_WARNING("[src] removes itself from [wearer]'s Hearthcore."))
	OnUninstall()
	wearer = null
	hearthcore = null
	active = FALSE
	return active

/obj/item/hearthcore_upgrade/proc/OnInstall(var/disciple, var/_hearthcore)

/obj/item/hearthcore_upgrade/proc/OnUninstall()

/obj/item/hearthcore_upgrade/natures_blessing
	name = "Nature's blessing"
	desc = "This upgrade stabilizes the Faithful and nurtures the plants near the follower. Useful for the aspiring Agrolytes."
	icon_state = "natures_blessing"
	matter = list(MATERIAL_BIOMATTER = 100, MATERIAL_GOLD = 5, MATERIAL_INDSTEEL = 5)
	var/cooldown = 1 SECONDS // Just to make sure that upgrade don't go berserk.
	var/initial_time

/obj/item/hearthcore_upgrade/natures_blessing/OnInstall(var/disciple, var/_hearthcore)
	..()
	START_PROCESSING(SSobj, src)

/obj/item/hearthcore_upgrade/natures_blessing/OnUninstall()
	..()
	STOP_PROCESSING(SSobj, src)

/obj/item/hearthcore_upgrade/natures_blessing/Process()
	for(var/obj/machinery/portable_atmospherics/hydroponics/tray in oviewers(5, wearer))
		if(tray.seed && !tray.dead)
			var/max_health = tray.seed.get_trait(TRAIT_ENDURANCE)
			if(tray.health < max_health)
				tray.health += 0.1
			if(tray.weedlevel)
				tray.weedlevel -= 0.1
	if(world.time < initial_time + cooldown)
		return
	initial_time = world.time
	for(var/mob/living/L in oviewers(5, wearer))
		if(ishuman(L))
			var/mob/living/carbon/human/H = L
			if(H.stat == DEAD || !(H.get_core_implant(/obj/item/implant/core_implant/hearthcore)))
				continue
			if(H.getBruteLoss() > 50)
				H.adjustBruteLoss(-0.2)
			if(H.getFireLoss() > 50)
				H.adjustFireLoss(-0.2)

/obj/item/hearthcore_upgrade/blazing_aegis
	name = "Blazing Aegis"
	desc = "This upgrade will slightly increase a Custodian's resistance to physical trauma and burns from any source."
	icon_state = "blazing_aegis"
	matter = list(MATERIAL_CARBON_FIBER = 50, MATERIAL_GOLD = 5, MATERIAL_INDSTEEL = 10)
	var/shield_mod = 0.1

/obj/item/hearthcore_upgrade/blazing_aegis/OnInstall(var/disciple, var/_hearthcore)
	..()
	wearer.species.brute_mod -= shield_mod
	wearer.species.burn_mod -= shield_mod

/obj/item/hearthcore_upgrade/blazing_aegis/OnUninstall()
	..()
	wearer.species.brute_mod += shield_mod
	wearer.species.burn_mod += shield_mod

/obj/item/hearthcore_upgrade/cleansing_flames
	name = "Cleansing Flames"
	desc = "This upgrade cleans tiles that the Custodian walks upon. Will slowly cause space vines and maint-shrooms to wither and die in the follower's presence."
	icon_state = "cleansing_flames"
	matter = list(MATERIAL_BIO_SILK = 50, MATERIAL_SILVER = 5, MATERIAL_INDSTEEL = 5)
	var/area_radius = 5

/obj/item/hearthcore_upgrade/cleansing_flames/OnInstall(var/disciple, var/_hearthcore)
	..()
	START_PROCESSING(SSobj, src)

/obj/item/hearthcore_upgrade/cleansing_flames/OnUninstall()
	..()
	STOP_PROCESSING(SSobj, src)

/obj/item/hearthcore_upgrade/cleansing_flames/Process()
	wearer.clean_blood()
	var/list/affected = range(area_radius, src)
	for(var/obj/effect/plant/shroom in affected)
		if(istype(shroom.seed, /datum/seed/mushroom/maintshroom))
			shroom.health -= (shroom.max_health * 0.1)
			shroom.check_health()

/obj/item/hearthcore_upgrade/martyr_gift
	name = "Martyr's gift"
	desc = "This upgrade causes a Custodian to cause a healing burst upon dying. It will heal for a massive amount to all humanoid creatures, even those without hearthcores. However, in the process of doing so, this upgrade destroys itself."
	icon_state = "martyr_gift"
	matter = list(MATERIAL_BIOMATTER = 50, MATERIAL_GOLD = 5, MATERIAL_INDSTEEL = 5, MATERIAL_HYDROGENC = 5)
	var/damage_healed = 50 //Heals everyone and every mob around it

/obj/item/hearthcore_upgrade/burning_fury
	name = "Burning Fury"
	desc = "The flame that burns twice as bright burns half as long. This upgrade make the follower deal more damage in melee, but also receive a slightly more damage from almost all sources."
	icon_state = "burning_fury"
	matter = list(MATERIAL_BIOMATTER = 50, MATERIAL_GOLD = 5, MATERIAL_INDSTEEL = 15)
	var/damage_mod = 0.2 //20% more damage in melee attacking
	var/receive_damage_mod = 0.2 //20% more damage form all sources other than clone

/obj/item/hearthcore_upgrade/burning_fury/OnInstall(var/disciple, var/_hearthcore)
	..()
	wearer.damage_multiplier += damage_mod
	wearer.species.brute_mod += receive_damage_mod
	wearer.species.burn_mod += receive_damage_mod
	wearer.species.oxy_mod += receive_damage_mod
	wearer.species.toxins_mod += receive_damage_mod
	wearer.species.radiation_mod += receive_damage_mod

/obj/item/hearthcore_upgrade/burning_fury/OnUninstall()
	..()
	wearer.damage_multiplier -= damage_mod
	wearer.species.brute_mod -= receive_damage_mod
	wearer.species.burn_mod -= receive_damage_mod
	wearer.species.oxy_mod -= receive_damage_mod
	wearer.species.toxins_mod -= receive_damage_mod
	wearer.species.radiation_mod -= receive_damage_mod

/obj/item/hearthcore_upgrade/embers_of_swiftness
	name = "Embers of Swiftness"
	desc = "This upgrade increases the movement speed of the Custodian."
	icon_state = "embers_swiftness"
	matter = list(MATERIAL_BIO_SILK = 70, MATERIAL_SILVER = 10, MATERIAL_INDSTEEL = 10, MATERIAL_GOLD = 3, MATERIAL_HYDROGENC = 1)
	var/speed_increase = 0.1 //10% faster, stacks with other sorces so its to be balanced with that

/obj/item/hearthcore_upgrade/phoenix_edict
	name = "Phoenix Edict"
	desc = "This upgrade is a powerful limiter removal that allows a Custodian to resucitate instantly after death. \
			The massive strain on the Hearthcore, however, vaporizes the upgrade once used."
	icon_state = "hearthcore_upgrade" // Placeholder.
	matter = list(MATERIAL_BIOMATTER = 100, MATERIAL_BIO_SILK = 50, MATERIAL_CARBON_FIBER = 50, MATERIAL_TITANIUMRTC = 10) // Rare and costly


/obj/item/hearthcore_upgrade/phoenix_edict/OnInstall(var/disciple, var/_hearthcore)
	..()
	wearer.stats.addPerk(PERK_PHOENIX)

/obj/item/hearthcore_upgrade/cleansing_flames/OnUninstall()
	..()
	wearer.stats.removePerk(PERK_PHOENIX)

