/obj/machinery/spicebed
	name = "spicebed grower"
	desc = "A complex hydroponic tray designed to grow selected, rare herbs that normally could have never been cultivated by traditional methods."
	icon = 'icons/obj/neotheology_spicebed.dmi'
	icon_state = "spice_pot"
	density = TRUE
	anchored = TRUE
	layer = BELOW_OBJ_LAYER
	use_power = IDLE_POWER_USE
	idle_power_usage = 10
	active_power_usage = 1000
	circuit = null
	var/obj/item/spice_plant/planted_item = null
	var/growth = 0 //Amount of growth are plant has, its a counter not a true false
	var/max_growth = 100
	var/can_harvest = FALSE

/obj/machinery/spicebed/update_icon()
	cut_overlays()
	icon_state = initial(icon_state)

	if(planted_item)
		var/grabbed_number = growth_to_percent()
		switch(grabbed_number)
			if(0)
				add_overlay("seed_ling")
			if(1)
				add_overlay("[planted_item.name]_1")
			if(2)
				add_overlay("[planted_item.name]_2")
			if(3)
				add_overlay("[planted_item.name]_3")
			if(4)
				add_overlay("[planted_item.name]_4")

/obj/machinery/spicebed/proc/growth_to_percent()
	//Another kinda gross proc
	if(growth >= 100)
		return 4
	if(growth >= 75)
		return 3
	if(growth >= 50)
		return 2
	if(growth >= 25)
		return 1
	if(growth >= 0)
		return 0

/obj/machinery/spicebed/examine(mob/user)
	..()
	if(planted_item)
		to_chat(user, "<span class='warning'>You can see some [planted_item.name] growing, looks like [get_growth_prefex()].")

/obj/machinery/spicebed/proc/get_growth_prefex(mob/user)
	if(!planted_item)
		return "nothing is growing"
	else
		var/grabbed_number = growth_to_percent()
		switch(grabbed_number)
			if(0)
				return "it has just been planted"
			if(1)
				return "the seedling has sprouted and is growing"
			if(2)
				return "the plant is about halfway done growing"
			if(3)
				return "the spice is about ready to be harvested"
			if(4)
				return "the spice is ready to be harvested"

/obj/machinery/spicebed/attackby(obj/item/I, mob/user)

	//Hijack tool uses for this, helps us not decontruct this
	if(istool(I))
		tool_use(I, user)
		return

	if(istype(I, /obj/item/spice_plant))
		if(!planted_item)
			planted_item = I
			qdel(I)
			to_chat(user, "<span class='warning'>You plant \the [I.name] in \the [src].")
		else
			to_chat(user, "<span class='warning'>The [src] already has a plant inside.")
		return

	..()

/obj/machinery/spicebed/Process()
	//If we dont have a plant then we dont care
	if(!planted_item)
		return
	if(prob(planted_item.growth_chance))
		growth += planted_item.growthrate
		update_icon()
		if(growth >= 100)
			can_harvest = TRUE

/obj/machinery/spicebed/proc/tool_use(obj/item/I, mob/user)
	//Little gross of a proc but this should allow us to with many tools remove the plant
	var/tool_type = I.get_tool_type(user, list(QUALITY_SHOVELING, QUALITY_CUTTING, QUALITY_DIGGING), src)
	if(user.a_intent == I_HURT)
		switch(tool_type)
			if(QUALITY_SHOVELING)
				if(I.use_tool(user, src, WORKTIME_NORMAL, tool_type, FAILCHANCE_VERY_EASY, required_stat = STAT_TGH))
					clean_spicebed()
			if(QUALITY_CUTTING)
				if(I.use_tool(user, src, WORKTIME_NORMAL, tool_type, FAILCHANCE_VERY_EASY, required_stat = STAT_BIO))
					clean_spicebed()
			if(QUALITY_DIGGING)
				if(I.use_tool(user, src, WORKTIME_NORMAL, tool_type, FAILCHANCE_VERY_EASY, required_stat = STAT_ROB))
					clean_spicebed()
	return

/obj/machinery/spicebed/attack_hand(mob/living/user)
	if(planted_item && can_harvest)
		harvest_cultiviation(user)
	else
		to_chat(user, "<span class='warning'>The plant isnt ready to be harvested yet.")

/obj/machinery/spicebed/proc/harvest_cultiviation(mob/living/user)
	if(planted_item && growth >= max_growth)
		if(planted_item.amount_to_harvest)
			for(var/amount in planted_item.amount_to_harvest)
				new planted_item(get_turf(user))
			clean_spicebed()

/obj/machinery/spicebed/proc/clean_spicebed()
	QDEL_NULL(planted_item)
	growth = 0
	update_icon()


//The spices

//TODO: move these somewere reasonable
/obj/item/spice_plant
	name = "rotton gourd seed"
	desc = "A bad seed from a bad plant, you should report this somewere."
	icon = 'icons/obj/neotheology_spicebed.dmi'
	icon_state = "debug"
	var/amount_to_harvest = 3 //When we harvest this plant how many items we get
	var/growthrate = 5 //How much out of 100 are plant is growing per successful process tick
	var/growth_chance = 80 //How likely we are to grow in a process tick
	var/Qi = "debug"

/obj/item/spice_plant/ginger_root
	name = "ginger root"
	desc = "Ginger roots are extensively employed in food and drink brewing, primarily to maintain the Enkindled Calderon's flasks at a consistent temperature, \
	preventing heat dissipation until the flask is broken. This ensures the flask retains its heat throughout the process."
	icon_state = "ginger_root"
	amount_to_harvest = 4
	growthrate = 2
	growth_chance = 80
	Qi = "gr"

/obj/item/spice_plant/spikenard
	name = "spikenard bundle"
	desc = "Spikenard, which was employed as a perfume and a wine spice during the Early Roman Empire and even referenced in the Bible, is utilized by the Custodians as an essential oil in numerous fast-burning flasks."
	icon_state = "spikenard"
	amount_to_harvest = 2
	growthrate = 10
	growth_chance = 60
	sanity_damage = -0.01
	Qi = "sn"

/obj/item/spice_plant/clove
	name = "clove root"
	desc = "Due to the presence of eugenol, clove brews are widely recognized for their analgesic properties and effectiveness as an insect repellent. Numerous clove-based brews can have a highly toxic effect on insects."
	icon_state = "clove"
	amount_to_harvest = 3
	growthrate = 5
	growth_chance = 75
	Qi = "cr"

/obj/item/spice_plant/cinnamon
	name = "cinnamon branch"
	desc = "Although it has no direct impact on health, cinnamon is commonly added to custodian brews to facilitate the absorption of the brew by the body, enabling chemicals to reach areas beyond the stomach. It is widely utilized in various custodian healing liqueurs."
	icon_state = "cinnamon"
	amount_to_harvest = 3
	growthrate = 5
	growth_chance = 75
	Qi = "cam"

/obj/item/spice_plant/rosemary
	name = "rosemary bundle"
	desc = "A fragrant herb esteemed by Custodians, celebrated for enhancing memory and concentration, promoting vitality and resilience - but mostly used for culinary purposes."
	icon_state = "rosemary"
	amount_to_harvest = 2
	growthrate = 10
	growth_chance = 60
	sanity_damage = -0.01
	Qi = "rm"

/obj/item/spice_plant/cumin
	name = "cumin bims"
	desc = "Cumin, a spice abundant in antioxidants like flavonoids, plays a vital role in countering the adverse effects of potions. It is often found alongside potions containing Clove as the main ingredient. \
	Strangely enough, most custodians highly dislike Cumin for its soapy taste, but its usefulness remains as their sole reason for its inclusion."
	icon_state = "cumin"
	amount_to_harvest = 6
	growthrate = 5
	growth_chance = 50
	Qi = "qm"

/obj/item/spice_plant/lilyflower
	name = "lily flower"
	desc = "The Lily Flower is widely recognized for its ability to alleviate the discomfort caused by burns, ulcers, and cough. It has also come to symbolize perseverance within the Custodian community, often adorning their walls as a symbolic representation."
	icon_state = "lilyflower"
	amount_to_harvest = 2
	growthrate = 2
	growth_chance = 90
	sanity_damage = -0.01
	Qi = "lyf"

/obj/item/spice_plant/marigold
	name = "marigold flower"
	desc = "Marigold, renowned for its antiseptic properties and historical use in wound treatment before the advent of chemical synthesis, plays a crucial role for the Custodians. \
	It holds special significance within enkindled communities, symbolizing a culture where gifting a Marigold to another Enkindled signifies either a lovely flirt or celebrating for one's health."
	icon_state = "marigold"
	amount_to_harvest = 2
	growthrate = 2
	growth_chance = 90
	sanity_damage = -0.01
	Qi = "mgf"

/obj/item/spice_plant/yerbamate
	name = "yerba mate branch"
	desc = "Coming from the Custodian's south american first colonial reaches centuries ago, the Yerba Mate still remains very present on their culture, possessing beneficial properties that aid in digestion, \
	provide relief from respiratory ailments and body energy. It is extensively utilized in advanced custodian brews to enhance the oxygen levels circulating in the veins, thereby optimizing muscular activity and endurance."
	icon_state = "yerbamate"
	amount_to_harvest = 3
	growthrate = 5
	growth_chance = 80
	Qi = "yba"

/obj/item/spice_plant/coriander
	name = "coriander leaf"
	desc = "Coriander, long known for its potential to ease gastrointestinal issues, is used by the Enkindled in potion production. \
	This process denatures coriander's chemicals, enabling targeted muscular tension in specific body areas. \
	Crafted potions were believed to enhance blood circulation independently of the heart, a forgotten Enkindled secret."
	icon_state = "coriander"
	amount_to_harvest = 3
	growthrate = 5
	growth_chance = 80
	Qi = "cad"

/obj/item/spice_plant/gourd
	name = "gourd bulb"
	desc = "A large gourd bulb, can be cut open to use as a glass, poke a hole as a flask or even converted with some silk into a payload."
	icon_state = "gourd"
	amount_to_harvest = 4
	growthrate = 15
	growth_chance = 90
	Qi = "g"

/obj/item/reagent_containers/food/drinks/flask/gourdflask
	name = "gourd flask"
	desc = "A gourd utilized as a flask for easy access. Not really better than the average flask, but it is lightweight and gives anything a tasteful oak taste - and making sure you are not drinking microplastics or aluminium ions."
	icon = 'icons/obj/neotheology_spicebed.dmi'
	icon_state = "drinkable_gourd"
	volume = 60

/obj/item/stack/thrown/gourd
	name = "throwable gourd"
	desc = "A gourd fastened with biosilk to be easily throwed against any victim. There is aluminium wrappings and radiance inside that breaks the gourd when a suitable impact reaches it. Being shot at doesn't trigger any explosion."
	icon_state = "throwable_gourd"
	icon = 'icons/obj/neotheology_spicebed.dmi'
	amount = 1
	max_amount = 1

/obj/item/stack/thrown/gourd/launchAt(atom/target, mob/living/carbon/C)
	var/ROB_throwing_damage = max(C.stats.getStat(STAT_ROB), 1)
	throwforce = WEAPON_FORCE_LETHAL / (1 + 100 / ROB_throwing_damage) + initial(throwforce)
	..()

/obj/item/spice_plant/gourd/attackby(obj/item/I, mob/user)

	var/tool_type = I.get_tool_type(user, list(QUALITY_CUTTING), src)
	if(user.a_intent == I_HURT)
		switch(tool_type)
			if(QUALITY_CUTTING)
				if(I.use_tool(user, src, WORKTIME_NORMAL, tool_type, FAILCHANCE_VERY_EASY, required_stat = STAT_BIO))
					new /obj/item/cut_gourd(get_turf(user))
					qdel(src)
	if(user.a_intent == I_HELP)
		switch(tool_type)
			if(QUALITY_CUTTING)
				if(I.use_tool(user, src, WORKTIME_NORMAL, tool_type, FAILCHANCE_VERY_EASY, required_stat = STAT_BIO))
					new /obj/item/reagent_containers/food/drinks/flask/gourdflask(get_turf(user))
					qdel(src)
	if(istype(I, /obj/item/stack/material/biopolymer_silk))
		new /obj/item/stack/thrown/gourd(get_turf(user))
		qdel(src)

/obj/item/cut_gourd
	name = "cut gourd"
	desc = "A gourd blump cut directly in half to use as a bowl for potion brewing base."
	icon = 'icons/obj/neotheology_spicebed.dmi'
	icon_state = "cut_gourd"
	var/slot_one = ""
	var/slot_two = ""
	var/slot_three = ""
	var/slot_four = ""
	var/anti_cheat = FALSE

/obj/item/cut_gourd/attackby(obj/item/I, mob/user)
	if(istype(I, /obj/item/spice_plant))
		var/obj/item/spice_plant/sp = I
		if(sp.Qi)
			add_plant(I, user)

/obj/item/cut_gourd/proc/add_plant(obj/item/spice_plant/SP, mob/user)
	if(anti_cheat)
		to_chat(user, "Your already thinking of the plant to add.")
		return

	var/obj/item/spice_plant/plant_to_add = SP

	anti_cheat = TRUE

	var/choice = input(user, "What slot do you add the spice in?") as null|anything in list("Slot One","Slot Two","Slot Three","Slot Four") //,"Call in a Favour"

	switch(choice)

		if("Slot One")
			if(!slot_one)
				to_chat(user, "You add [plant_to_add.name] into the first slot.")
			else
				to_chat(user, "You dump the old ingredient out and replace it with [plant_to_add.name], first slot.")
			slot_one = plant_to_add.Qi
			qdel(plant_to_add)
		if("Slot Two")
			if(!slot_two)
				to_chat(user, "You add [plant_to_add.name] into the first slot.")
			else
				to_chat(user, "You dump the old ingredient out and replace it with [plant_to_add.name], second slot.")

			slot_two = plant_to_add.Qi
			qdel(plant_to_add)
		if("Slot Tree")
			if(!slot_two)
				to_chat(user, "You add [plant_to_add.name] into the third slot.")
			else
				to_chat(user, "You dump the old ingredient out and replace it with [plant_to_add.name], third slot.")

			slot_three = plant_to_add.Qi
			qdel(plant_to_add)
		if("Slot Four")
			if(!slot_two)
				to_chat(user, "You add [plant_to_add.name] into the forth slot.")
			else
				to_chat(user, "You dump the old ingredient out and replace it with [plant_to_add.name], forth slot.")

			slot_four = plant_to_add.Qi
			qdel(plant_to_add)

		else
			to_chat(user, "You add [plant_to_add.name] into the none of the slots.")
			anti_cheat = FALSE
			return

	anti_cheat = FALSE


/obj/machinery/potionmaker
	name = "cultivation pot"
	desc = "A massive cooking pot for cultivation and potion brewing."
	icon = 'icons/obj/neotheology_spicebed.dmi'
	icon_state = "potionmaker"
	density = TRUE
	anchored = TRUE
	layer = BELOW_OBJ_LAYER
	use_power = IDLE_POWER_USE
	idle_power_usage = 0
	active_power_usage = 0
	circuit = null
	var/obj/item/cut_gourd/cg
	var/active = FALSE
	var/cooktime = 30 SECONDS

/obj/machinery/potionmaker/attack_hand(mob/living/user as mob)
	if(active)
		to_chat(user, "Something's already brewing...")
		return
	if(cg && !active)
		icon_state = "potionmaker_active"
		active = TRUE
		addtimer(CALLBACK(src, .proc/repice_index), cooktime)

	to_chat(user, "There is nothing inside the pot to brew.")

/obj/machinery/potionmaker/attackby(obj/item/I, mob/user)
	if(istype(I, /obj/item/cut_gourd))
		user.drop_from_inventory(I, src)
		cg = I
		return
	..()

/obj/machinery/potionmaker/proc/repice_index()
	var/index_leaser = "[cg.slot_one][cg.slot_two][cg.slot_three][cg.slot_four]"
	if(!index_leaser)
		active = FALSE
		return
	QDEL_NULL(cg)
	switch(index_leaser)
		if("debug", "debugdebug")
			new /obj/item/stack/thrown/gourd(src.loc)
		else
			new /obj/effect/decal/cleanable/ash(src.loc)

	active = FALSE
	icon_state = "potionmaker"

/datum/reagent/medicine/potion/tincture
	name = "Healing Tincture"
	id = "tincture"
	description = "The healing potion of the custodian shows its ways by increasing the patient’s skin recovery, proliferating endothelial cells and fibroblasts \
	to better improve wound healing. The Tincture is a vasodilator - so it doesn’t only have the symptoms of sildenafil, but also increases blood loss from open wounds."
	taste_description = "peppery anise"
	taste_mult = 3
	reagent_state = LIQUID
	color = "#BF0000"
	overdose = REAGENTS_OVERDOSE
	scannable = FALSE
	metabolism = 0.2
	nerve_system_accumulations = 0 // Potions do not increase nerve system accumulations, but gives a downside and don't replace chems.

/datum/reagent/medicine/potion/tincture/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	M.heal_organ_damage(0.15 * effect_multiplier, 0, 3 * effect_multiplier)
	M.add_chemical_effect(CE_BLOODCLOT, -0.30) //I'm sure this will not goddamn work, but I need to see.

// Aggressive Enkindled Potions

/datum/reagent/waterpotion //I think this can have 12 alts
	name = "Boiling Water"
	id = "waterpotion"
	description = "A single gourd filled with pure boiling water, there’s a mysterious orange covering \
	in the internal areas of the flask that avoids the heat from leaving the glass itself - leaving the water eternally boiling."
	taste_description = "bitter demise"
	reagent_state = LIQUID //Water is, in fact, dry.
	color = "#0064C877"
	scannable = TRUE
	appear_in_default_catalog = FALSE
	metabolism = REM * 10
	taste_description = "water"
	glass_icon_state = "glass_clear"

/datum/reagent/waterpotion/affect_blood(mob/living/carbon/M)
	M.adjust.adjustFireLoss(15)
	M.add_chemical_effect(CE_TOXIN, 1)

/datum/reagent/waterpotion/affect_ingest(mob/living/carbon/M)
	M.adjust.adjustFireLoss(10)

/datum/reagent/waterpotion/on_mob_add(mob/living/L)
	. = ..()
	L.damage_through_armor(15, BURN, attack_flag = ARMOR_BIO)

/datum/reagent/waterpotion/affect_touch(mob/living/L)
	on_mob_add(L)

/datum/reagent/waterpotion //I think this can have 12 alts
	name = "Boiling Water"
	id = "waterpotion"
	description = "A single gourd filled with a mysterious brown boiling oil, there’s a mysterious, almost undetectable covering in the internal areas of the flask that avoid the heat from leaving the glass itself - leaving the oil eternally boiling."
	taste_description = "bitter demise"
	reagent_state = LIQUID //Water is, in fact, dry.
	color = "#0064C877"
	scannable = TRUE
	appear_in_default_catalog = FALSE
	metabolism = REM * 10
	taste_description = "water"
	glass_icon_state = "glass_clear"

/datum/reagent/waterpotion/affect_blood(mob/living/carbon/M)
	M.adjust.adjustFireLoss(15)
	M.add_chemical_effect(CE_TOXIN, 1)

/datum/reagent/waterpotion/affect_ingest(mob/living/carbon/M)
	M.adjust.adjustFireLoss(10)

/datum/reagent/waterpotion/on_mob_add(mob/living/L)
	. = ..()
	L.damage_through_armor(15, BURN, attack_flag = ARMOR_BIO)

/datum/reagent/waterpotion/affect_touch(mob/living/L)
	on_mob_add(L)


/datum/reagent/burns
	name = "Burning Oils"
	id = "burns"
	description = "Heated oils with fibers of iron and salt. While it's cold inside the glass, contact with skin, chitin or any dermis tissue makes its temperature violently react..."
	taste_description = "liquid fire"
	reagent_state = LIQUID //for sake of simple
	color = "#642424"
	scannable = FALSE
	appear_in_default_catalog = FALSE
	metabolism = 0.1
	overdose = 5

/datum/reagent/burns/overdose(mob/living/carbon/M)
	M.adjustFireLoss(7)

/datum/reagent/burns/affect_blood(mob/living/carbon/M)
	M.adjustFireLoss(3)

/datum/reagent/burns/affect_ingest(mob/living/carbon/M)
	M.adjustFireLoss(5)

/datum/reagent/burns/on_mob_add(mob/living/L)
	. = ..()
	if(!ishuman(L))
		L.damage_through_armor(230, BURN, attack_flag = ARMOR_BIO)
		L.adjust_fire_stacks(4)
		L.IgniteMob()
		return
	L.damage_through_armor(20, BURN, attack_flag = ARMOR_BIO)
	L.adjust_fire_stacks(2)
	L.IgniteMob() // It reacts violently against flesh and chitin, so it ignites naturally in contact with it, and O2 in the atmosphere.

/datum/reagent/silversthread
	name = "Silversthread Brew"
	id = "silversthread_brew"
	description = "A mix of metals and salts boiled into one another, said to be able to make people take more physical punishment, \
				   with the drawback of making your metallic coating more vulnerable to fire. It also makes breathing harder..."
	taste_description = "salt of metal"
	reagent_state = LIQUID
	color = "#4e3f3f"
	scannable = FALSE
	appear_in_default_catalog = FALSE
	metabolism = 0.001 //Takes a long time to remove
	overdose = 3

/datum/reagent/iron_skin_brew/overdose(mob/living/carbon/M, alien)
	M.adjustCloneLoss(1) //The body breaks apart

/datum/reagent/iron_skin_brew/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	M.add_chemical_effect(CE_TOXIN, 3)

/datum/reagent/iron_skin_brew/affect_ingest(mob/living/carbon/M, alien, effect_multiplier)
	return // The chemical is meant to be ingested, but unless we do this, we'll get poisoned

/datum/reagent/iron_skin_brew/on_mob_add(mob/living/L)
	. = ..()
	var/mob/living/carbon/human/ironskin = L
	if(!ishuman(L))
		if(ironskin.species.reagent_tag == IS_CHTMANT) // This turns skin into iron, Cht'mant get horribly tortured by it
			ironskin.add_chemical_effect(CE_TOXIN, 0.4)
			ironskin.paralysis = max(L.paralysis, 5)
			ironskin.adjustCloneLoss(2)
			return
	ironskin.mob_bomb_defense += 25
	ironskin.falls_mod -= 0.4
	ironskin.brute_mod_perk -= 0.2
	ironskin.burn_mod_perk += 0.2
	ironskin.oxy_mod_perk  += 2 //Iron casket

/datum/reagent/iron_skin_brew/on_mob_delete(mob/living/L)
	. = ..()
	var/mob/living/carbon/human/ironskin = L
	if(!ishuman(L))
		return
	ironskin.mob_bomb_defense -= 25
	ironskin.falls_mod += 0.4
	ironskin.Paralyse(3)
	ironskin.burn_mod_perk -= 0.2
	ironskin.brute_mod_perk += 0.2
	ironskin.oxy_mod_perk  -= 2

/datum/reagent/toxin_draft
	name = "Noxious Sludge"
	id = "toxin_draft"
	description = " A nefarious concoction toxic to all living beings."
	taste_description = "bitter demise"
	reagent_state = LIQUID
	color = "#365f3f"
	scannable = FALSE
	appear_in_default_catalog = FALSE
	metabolism = 0.1
	overdose = 5

/datum/reagent/toxin_draft/overdose(mob/living/carbon/M)
	M.add_chemical_effect(CE_TOXIN, 5)

/datum/reagent/toxin_draft/affect_blood(mob/living/carbon/M)
	M.add_chemical_effect(CE_TOXIN, 1)

/datum/reagent/toxin_draft/affect_ingest(mob/living/carbon/M)
	M.add_chemical_effect(CE_TOXIN, 3)

/datum/reagent/toxin_draft/on_mob_add(mob/living/L)
	. = ..()
	if(!ishuman(L))
		L.adjustToxLoss(180)
		L.adjustCloneLoss(120)
		return
	L.adjustFireLoss(20)
	L.adjustCloneLoss(10)

/datum/reagent/toxin_draft/affect_touch(mob/living/L)
	on_mob_add(L)

/datum/reagent/sight_dram
	name = "Ocular Remedy"
	id = "sight_dram"
	description = "A mix of common compounds to repair sight."
	taste_description = "charcoal"
	reagent_state = LIQUID
	color = "#629ac0"
	scannable = FALSE
	appear_in_default_catalog = FALSE
	metabolism = 0.1
	overdose = 3

/datum/reagent/sight_dram/overdose(mob/living/carbon/M)
	M.add_chemical_effect(CE_TOXIN, 2)

/datum/reagent/sight_dram/affect_blood(mob/living/carbon/M)
	M.add_chemical_effect(CE_TOXIN, 5) //DONT INJECT IT

/datum/reagent/sight_dram/affect_ingest(mob/living/carbon/M, alien, effect_multiplier)
	M.eye_blurry = max(M.eye_blurry - (5 * effect_multiplier), 0)
	M.eye_blind = max(M.eye_blind - (5 * effect_multiplier), 0)
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		var/obj/item/organ/internal/eyes/E = H.random_organ_by_process(OP_EYES)
		if(E && istype(E))
			if(E.damage > 0)
				E.damage = max(E.damage - (5), 0)

/datum/reagent/harms
	name = "Ch'alla Volkn"
	id = "harms"
	description = "A mix of solid sharp sands and metal designed to cut down whoever they are thrown at." // POCKET SAND!
	taste_description = "bitter demise"
	reagent_state = SOLID //for sake of simple
	color = "#b9af1f"
	scannable = FALSE
	appear_in_default_catalog = FALSE
	metabolism = 0.1
	overdose = 5

/datum/reagent/harms/overdose(mob/living/carbon/M)
	M.add_chemical_effect(CE_TOXIN, 5)

/datum/reagent/harms/affect_blood(mob/living/carbon/M)
	M.add_chemical_effect(CE_TOXIN, 1)

/datum/reagent/harms/affect_ingest(mob/living/carbon/M)
	M.add_chemical_effect(CE_TOXIN, 3)

/datum/reagent/harms/on_mob_add(mob/living/L)
	. = ..()
	if(!ishuman(L))
		L.damage_through_armor(230, BRUTE, attack_flag = ARMOR_BIO)
		return
	L.damage_through_armor(20, BRUTE, attack_flag = ARMOR_BIO)

/datum/reagent/harms/affect_touch(mob/living/L)
	on_mob_add(L)


/datum/reagent/red_heart
	name = "Vitaurum"
	id = "red_heart"
	description = "A small droplet of red gold created by an alchemist \
				   who could not cope with the loss of their familiar. \
				   Said to have the power to revive beasts."
	taste_description = "zapping away your taste buds"
	reagent_state = LIQUID //for sake of simple
	color = "#da4a12"
	scannable = FALSE
	appear_in_default_catalog = FALSE
	metabolism = 1
	overdose = 2

/datum/reagent/red_heart/overdose(mob/living/carbon/M)
	M.adjustCloneLoss(3)

/datum/reagent/red_heart/affect_blood(mob/living/carbon/M)
	M.add_chemical_effect(CE_TOXIN, 3)

/datum/reagent/red_heart/affect_ingest(mob/living/carbon/M, alien, effect_multiplier)
	return

/datum/reagent/red_heart/on_mob_add(mob/living/L)
	. = ..()
	if(L.stat == DEAD) //Anti-cheat so you dont inject this into a mob to deal 80% damage
		if(!ishuman(L))
			L.revive()
			L.adjustBruteLoss(L.get_health() * 0.8) //takes away 80% health
			return


/datum/reagent/toxin/slimetoxin/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		if(H.species.name != SPECIES_SLIME && !H.isSynthetic()) //cannot transform if already a slime perosn or lack flesh to transform
			if(istype(H.get_core_implant(), /obj/item/implant/core_implant/cruciform))
				H.gib() //Deus saves
			else
				to_chat(M, SPAN_DANGER("Your flesh rapidly mutates!"))
				for(var/obj/item/W in H) //Check all items on the person
					if(istype(W, /obj/item/organ/external/robotic) || istype(W, /obj/item/implant)) //drop prosthetic limbs and implants, you are a slime now.
						W.dropped()
				H.set_species(SPECIES_SLIME)


/*ASSETS AREA
/obj/item/material/shard/Crossed(AM as mob|obj)
	..()
	if(isliving(AM))
		var/mob/M = AM

		if(M.buckled) //wheelchairs, office chairs, rollerbeds
			return

		playsound(src.loc, 'sound/effects/glass_step.ogg', 50, 1) // not sure how to handle metal shards with sounds
		if(ishuman(M))
			var/mob/living/carbon/human/H = M

			if(H.species.siemens_coefficient<0.5) //Thick skin.
				return

			if(H.shoes)
				return

			to_chat(M, SPAN_DANGER("You step on \the [src]!"))

			var/list/check = list(BP_L_LEG, BP_R_LEG)
			while(check.len)
				var/picked = pick(check)
				var/obj/item/organ/external/affecting = H.get_organ(picked)
				if(affecting)
					if(BP_IS_ROBOTIC(affecting))
						return
					if(affecting.take_damage(5, BRUTE))
						H.UpdateDamageIcon()
					H.updatehealth()
					if(!(H.species.flags & NO_PAIN))
						H.Weaken(3)
					return
				check -= picked
			return
*/
