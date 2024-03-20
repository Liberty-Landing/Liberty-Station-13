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

/* Custodians are not peasants. Begone, NeoTheology Commoners.
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
*/

//The Cataphract focus on defense and defending others, while making use of radiance to manifest ways to counter enemy's move in the battlefield. They make ~stands~ (automatons) to supply their defensive capacity and area-negating capacity.
/obj/item/hearthcore_upgrade/blazing_aegis
	name = "Cataphract - Blazing Aegis"
	desc = "The Cataphract is the embodyment eternal resilience, recalling ancient tactics old, safeguarding comrades and allowing their survival under any condition. \
	This Hearthcore expansion will slightly increase a Knight's resistance to physical trauma and burns from any source."
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

/* Custodians are not peasants. Begone, NeoTheology Commoners.
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
*/

/obj/item/hearthcore_upgrade/atonement_gift
	name = "Grenadier Expansion - Atonement's gift"
	desc = "The Grenadier are as dangerous as they are useful, the true definition of taking risks for highest rewards. . \
	This type of knight has been projected by Forgemasters and are respectively not an extension of the Custodians. This upgrade causes a Custodian to cause a healing burst upon dying. It will heal for a massive amount to all humanoid creatures, even those without hearthcores. However, in the process of doing so, this upgrade destroys itself."
	icon_state = "atonement_gift"
	matter = list(MATERIAL_BIOMATTER = 50, MATERIAL_GOLD = 5, MATERIAL_INDSTEEL = 5, MATERIAL_HYDROGENC = 5)
	var/burn_damage = 50 //No. Custodians are not going to heal from dying. They'd rather die than heal an enemy by accident.

/*
/datum/core_module/activatable/proc/activate()
	if(implant && istype(module) && !(module in implant.modules))
		implant.add_module(module)
		active = TRUE

	var/datum/core_module/hearthcore/neotheologyhud/hud_module = C.get_module(/datum/core_module/hearthcore/neotheologyhud)
	if(hud_module) //toggles an already existing church HUD module that shows a little icon on Hearthcore users
		success_message = "Turning off Sight of Knights."
		C.remove_module(hud_module)
	else
		success_message = "Turning on Sight of Knights."
		C.add_module(new /datum/core_module/hearthcore/neotheologyhud)
	return TRUE
		var/datum/core_module/lectures/hearthcore/druzhina = C.get_module(/datum/core_module/lectures/hearthcore/druzhina)

*/

/obj/item/hearthcore_upgrade/atonement_gift/OnInstall(var/disciple, var/_hearthcore)
	..()
	hearthcore.add_module(new HEARTHCORE_GRENADIER)
	to_chat(wearer, SPAN_NOTICE("The Radiance weaves through your organs, refining your lungs to breath and fuel the fire within."))

/obj/item/hearthcore_upgrade/atonement_gift/OnUninstall()
	..()
	hearthcore.remove_module(HEARTHCORE_GRENADIER)
	to_chat(wearer, SPAN_NOTICE("Your trained radiance is stripped bare from knowledge, and you can feel it breathing underneath your skin, relieved rather than angry. Hold it. You've been torturing your own neurons this entire time?!f"))

/obj/item/hearthcore_upgrade/burning_fury
	name = "Druzhina Expansion - Burning Fury"
	desc = "The Druzhina Knights stand with allies, a beacon of power that punishes enemies without burning those held dear with fiery wrath. \
	The flame that burns twice as bright burns half as long. This hearthcore expansion make the knight deal more damage in melee, but also receive a slightly more damage from almost all sources."
	icon_state = "burning_fury"
	matter = list(MATERIAL_BIOMATTER = 50, MATERIAL_GOLD = 5, MATERIAL_INDSTEEL = 15)
	var/damage_mod = 0.2 //20% more damage in melee attacking
	var/receive_damage_mod = 0.2 //20% more damage form all sources other than clone

/obj/item/hearthcore_upgrade/burning_fury/OnInstall(var/disciple, var/_hearthcore)
	..()
	hearthcore.add_module(new HEARTHCORE_DRUZHINA)
	to_chat(wearer, SPAN_NOTICE("The radiance weaves into the fabric of your strategic acumen, bolstering collective protection, while fortifying your cognitive framework."))
	wearer.damage_multiplier += damage_mod
	wearer.species.brute_mod += receive_damage_mod
	wearer.species.burn_mod += receive_damage_mod
	wearer.species.oxy_mod += receive_damage_mod
	wearer.species.toxins_mod += receive_damage_mod
	wearer.species.radiation_mod += receive_damage_mod

/obj/item/hearthcore_upgrade/burning_fury/OnUninstall()
	..()
	hearthcore.remove_module(HEARTHCORE_DRUZHINA)
	to_chat(wearer, SPAN_NOTICE("Your trained radiance is stripped bare from knowledge suffering briefly the symptoms of dementia, you even forget your own name until realization kicks in."))
	wearer.damage_multiplier -= damage_mod
	wearer.species.brute_mod -= receive_damage_mod
	wearer.species.burn_mod -= receive_damage_mod
	wearer.species.oxy_mod -= receive_damage_mod
	wearer.species.toxins_mod -= receive_damage_mod
	wearer.species.radiation_mod -= receive_damage_mod

/obj/item/hearthcore_upgrade/embers_of_swiftness
	name = "Hussar Expansion - Embers of Swiftness"
	desc = "The Hussar embodies swiftness and sophistication, executing dazzling feats to open holes in enemy defenses and seize the advantage before falling back in a hit-and-run. This expansion increases the movement speed of the Knights."
	icon_state = "embers_swiftness"
	matter = list(MATERIAL_BIO_SILK = 70, MATERIAL_SILVER = 10, MATERIAL_INDSTEEL = 10, MATERIAL_GOLD = 3, MATERIAL_HYDROGENC = 1)
	var/speed_increase = 0.1 //10% faster, stacks with other sorces so its to be balanced with that

/obj/item/hearthcore_upgrade/embers_of_swiftness/OnInstall(var/disciple, var/_hearthcore)
	..()
	hearthcore.add_module(new HEARTHCORE_HUSSAR)
	to_chat(wearer, SPAN_NOTICE("The Radiance intertwines with your muscles, infusing your legs with oxygenated vitality that propels you beyond limits."))

/obj/item/hearthcore_upgrade/embers_of_swiftness/OnUninstall()
	..()
	hearthcore.remove_module(HEARTHCORE_HUSSAR)
	to_chat(wearer, SPAN_NOTICE("Your trained radiance is stripped bare from knowledge as your vision goes darker. You feel short of air as your legs feel numb, but soon enough these feelings end."))

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

/obj/item/hearthcore_upgrade/holy
	name = "Recovery"
	desc = "This upgrade is a powerful limiter removal that allows a Custodian to resucitate instantly after death. \
			The massive strain on the Hearthcore, however, vaporizes the upgrade once used."
	icon_state = "hearthcore_upgrade" // Placeholder.
	matter = list(MATERIAL_BIOMATTER = 100, MATERIAL_BIO_SILK = 50, MATERIAL_CARBON_FIBER = 50, MATERIAL_TITANIUMRTC = 10) // Rare and costly


/obj/item/hearthcore_upgrade/holy/OnInstall(var/disciple, var/_hearthcore)
	..()
	wearer.stats.addPerk(PERK_INFLUX)

/obj/item/hearthcore_upgrade/cleansing_flames/OnUninstall()
	..()
	wearer.stats.removePerk(PERK_INFLUX)

