//Those are all weapons that don't had tool modding at some point, but should have it for balance purposes.

/obj/item/tool/broken_bottle
	name = "broken bottle"
	desc = "A bottle with a sharp broken bottom."
	icon = 'icons/obj/drinks.dmi'
	icon_state = "broken_bottle"
	matter = list(MATERIAL_GLASS = 2)
	worksound = WORKSOUND_HARD_SLASH
	force = WEAPON_FORCE_PAINFUL
	throwforce = WEAPON_FORCE_WEAK
	item_state = "beer"
	attack_verb = list("stabbed", "slashed", "attacked")
	sharp = TRUE
	edge = FALSE
	max_upgrades = 1 //it's not even a tool
	tool_qualities = list(QUALITY_CUTTING = 10)
	var/icon/broken_outline = icon('icons/obj/drinks.dmi', "broken")

/obj/item/tool/nailstick
	name = "nailed stick"
	desc = "Stick with some nails in it. Looks sharp enough."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "hm_spikeclub"
	item_state = "hm_spikeclub"
	force = WEAPON_FORCE_PAINFUL
	throwforce = WEAPON_FORCE_PAINFUL
	w_class = ITEM_SIZE_NORMAL
	origin_tech = list(TECH_COMBAT = 2)
	attack_verb = list("beaten", "slammed", "smacked", "struck", "battered")
	structure_damage_factor = STRUCTURE_DAMAGE_HEAVY
	max_upgrades = 5
	tool_qualities = list(QUALITY_HAMMERING = 10)
	effective_faction = list("spider") // Spiders are weak to crushing.
	damage_mult = 2

/obj/item/tool/hatchet
	name = "hatchet"
	desc = "A very sharp axe blade upon a short fiber-metal handle. It has a long history of chopping things, but now it is used for chopping wood."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "hatchet"
	matter = list(MATERIAL_STEEL = 4, MATERIAL_PLASTIC = 3)
	worksound = WORKSOUND_HARD_SLASH
	force = WEAPON_FORCE_PAINFUL
	throwforce = WEAPON_FORCE_PAINFUL
	w_class = ITEM_SIZE_SMALL
	sharp = TRUE
	edge = TRUE
	armor_penetration = ARMOR_PEN_SHALLOW
	origin_tech = list(TECH_MATERIAL = 2, TECH_COMBAT = 1)
	attack_verb = list("chopped", "torn", "cut")
	tool_qualities = list(QUALITY_CUTTING = 20, QUALITY_SAWING = 15)
	worksound = WORKSOUND_HARD_SLASH
	price_tag = 30

/obj/item/tool/fireaxe
	name = "fire axe"
	desc = "Truly, the weapon of a madman. Who would think to fight fire with an axe?"
	icon = 'icons/obj/weapons.dmi'
	icon_state = "fireaxe0"
	wielded_icon = "fireaxe1"
	sharp = TRUE
	edge = TRUE
	armor_penetration = ARMOR_PEN_DEEP
	tool_qualities = list(QUALITY_CUTTING = 10, QUALITY_PRYING = 20, QUALITY_SAWING = 15)
	w_class = ITEM_SIZE_HUGE
	slot_flags = SLOT_BACK
	force = WEAPON_FORCE_BRUTAL
	attack_verb = list("attacked", "chopped", "cleaved", "torn", "cut")
	hitsound = 'sound/weapons/bladeslice.ogg'
	structure_damage_factor = STRUCTURE_DAMAGE_BREACHING
	embed_mult = 1.2 //Axes cut deep, and their hooked shape catches on things
	worksound = WORKSOUND_HARD_SLASH
	price_tag = 190
	item_icons = list(
		slot_back_str = 'icons/inventory/back/mob.dmi')
	item_state_slots = list(
		slot_back_str = "fireaxe0_back"
		)

/obj/item/tool/fireaxe/afterattack(atom/A as mob|obj|turf|area, mob/user as mob, proximity)
	if(!proximity) return
	..()
	if(A && wielded)
		if(istype(A,/obj/effect/plant))
			var/obj/effect/plant/P = A
			P.die_off()

/obj/item/tool/fireaxe/militia_tomahawk
	name = "tactical tomahawk"
	desc = "For cutting, sawing, prying, and throwing at targets mid back-flip."
	icon_state = "sec_tomahawk"
	wielded_icon = "sec_tomahawk"
	force = WEAPON_FORCE_ROBUST
	throwforce = WEAPON_FORCE_LETHAL // Meant to be a throwing weapon
	slot_flags = SLOT_BELT|SLOT_BACK
	tool_qualities = list(QUALITY_CUTTING = 30, QUALITY_SAWING = 25, QUALITY_PRYING = 15)
	w_class = ITEM_SIZE_NORMAL
	price_tag = 45

/obj/item/tool/fireaxe/handmade
	name = "makeshift axe"
	desc = "A heavy plasteel blade affixed to a welded metal shaft, for close up carnage."
	icon_state = "makeshift_axe"
	item_state = "makeshift_axe"
	wielded_icon = "makeshift_axe_wielded"
	matter = list(MATERIAL_STEEL = 3, MATERIAL_PLASTEEL = 3)
	force = WEAPON_FORCE_DANGEROUS
	throwforce = WEAPON_FORCE_NORMAL
	armor_penetration = ARMOR_PEN_MODERATE
	w_class = ITEM_SIZE_NORMAL
	attack_verb = list("chopped", "torn", "cut", "cleaved", "slashed")
	tool_qualities = list(QUALITY_CUTTING = 10)
	structure_damage_factor = STRUCTURE_DAMAGE_BREACHING
	embed_mult = 1.1
	degradation = 1.5
	max_upgrades = 5
	has_alt_mode = TRUE
	alt_mode_damagetype = HALLOSS
	alt_mode_verbs = list("bashes", "beats", "clobbers")
	alt_mode_sharp = FALSE
	alt_mode_toggle = "flips the axe to its broad side"

/obj/item/tool/minihoe
	name = "mini hoe"
	desc = "It's used for removing weeds or scratching your back."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "hoe"
	item_state = "hoe"
	matter = list(MATERIAL_STEEL = 2, MATERIAL_PLASTIC = 2)
	force = WEAPON_FORCE_WEAK
	throwforce = WEAPON_FORCE_WEAK
	max_upgrades = 2
	tool_qualities = list(QUALITY_SHOVELING = 10)
	w_class = ITEM_SIZE_SMALL
	attack_verb = list("slashed", "sliced", "cut", "clawed")

/obj/item/tool/scythe
	name = "scythe"
	desc = "A sharp and curved blade on a long fiber-metal handle, this tool makes it easy to reap what you sow."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "scythe0"
	matter = list(MATERIAL_PLASTEEL = 7, MATERIAL_PLASTIC = 3)
	sharp = TRUE
	edge = TRUE
	worksound = WORKSOUND_HARD_SLASH
	force = WEAPON_FORCE_PAINFUL
	throwforce = WEAPON_FORCE_PAINFUL
	w_class = ITEM_SIZE_BULKY
	slot_flags = SLOT_BACK
	attack_verb = list("chopped", "sliced", "cut", "reaped")
	tool_qualities = list(QUALITY_CUTTING = 15, QUALITY_SAWING = 10)
	item_icons = list(
		slot_back_str = 'icons/inventory/back/mob.dmi')
	item_state_slots = list(
		slot_back_str = "scythe0_back"
		)

	has_alt_mode = TRUE
	alt_mode_damagetype = HALLOSS
	alt_mode_verbs = list("jabs", "prods", "wacks")
	alt_mode_sharp = FALSE
	alt_mode_toggle = "flips the scythe backwards to use as a blunt spear"
	alt_mode_lossrate = 0.3

//Flails
/obj/item/tool/chainofcommand
	name = "chain of command"
	desc = "A tool used by great men to placate the frothing masses."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "chain"
	item_state = "chain"
	flags = CONDUCT
	slot_flags = SLOT_BELT
	force = WEAPON_FORCE_DANGEROUS
	throwforce = WEAPON_FORCE_DANGEROUS
	w_class = ITEM_SIZE_NORMAL
	origin_tech = list(TECH_COMBAT = 4)
	attack_verb = list("flogged", "whipped", "lashed", "disciplined")
	max_upgrades = 2
	tool_qualities = list(QUALITY_HAMMERING = 5)
	blacklist_upgrades = list(/obj/item/tool_upgrade/augment/hammer_addon = TRUE) // Can't attach a plate to a chain.

	has_alt_mode = TRUE
	alt_mode_damagetype = HALLOSS
	alt_mode_verbs = list("flogged", "whipped", "lashed", "disciplined")
	alt_mode_toggle = "relaxes the anger behind their grip"
	alt_mode_lossrate = 0.7

//Swords

/obj/item/tool/sword
	name = "claymore"
	desc = "What are you standing around staring at this for? Get to killing!"
	icon = 'icons/obj/weapons.dmi'
	icon_state = "claymore"
	item_state = "claymore"
	matter = list(MATERIAL_PLASTEEL = 15, MATERIAL_PLASTIC = 5)
	sharp = TRUE
	edge = TRUE
	slot_flags = SLOT_BELT
	worksound = WORKSOUND_HARD_SLASH
	force = WEAPON_FORCE_BRUTAL
	armor_penetration = ARMOR_PEN_DEEP
	throwforce = WEAPON_FORCE_NORMAL
	attack_verb = list("attacked", "slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	hitsound = 'sound/weapons/bladeslice.ogg'
	tool_qualities = list(QUALITY_CUTTING = 10, QUALITY_SAWING = 10)
	structure_damage_factor = STRUCTURE_DAMAGE_BLADE
	w_class = ITEM_SIZE_BULKY
	price_tag = 100

	has_alt_mode = TRUE
	alt_mode_damagetype = HALLOSS
	alt_mode_sharp = FALSE
	alt_mode_verbs = list("bashes", "stunts", "hilts", "blunts")
	alt_mode_toggle = "uses the broad side of their weapon"
	alt_mode_lossrate = 0.3

/obj/item/tool/sword/katana
	name = "katana"
	desc = "Modern Japanese-style blade that has no curve to it. This one looks pretty sharp."
	icon_state = "katana" // New sprite courtesy of Kavric
	item_state = "katana"
	hitsound = 'sound/weapons/heavyslash.ogg'
	matter = list(MATERIAL_PLASTEEL = 10, MATERIAL_STEEL = 5, MATERIAL_DIAMOND = 1) //sharpened using diamond dust or whatever
	slot_flags = SLOT_BELT | SLOT_BACK
	force = WEAPON_FORCE_ROBUST
	armor_penetration = ARMOR_PEN_EXTREME
	alt_mode_toggle = "flips their grip to use the blunt side of the blade"
	item_icons = list(
		slot_back_str = 'icons/inventory/back/mob.dmi')
	item_state_slots = list(
		slot_back_str = "katana_back"
		)

/obj/item/tool/sword/union
	name = "Combat Sword"
	desc = "A Sturdy Combat Sword, seen in many conflicts around the galaxy and ideal to fight alien lifeforms, raiders or as a nice gardering tool, this one has a special design and a knuckleduster on it."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "combat_sword"//new sprites by dromki.
	item_state = "combat_sword"
	matter = list(MATERIAL_PLASTEEL = 15, MATERIAL_PLASTIC = 5)
	sharp = TRUE
	edge = TRUE
	w_class = ITEM_SIZE_NORMAL
	slot_flags = SLOT_BELT
	item_icons = list(
		slot_back_str = 'icons/inventory/back/mob.dmi')
	item_state_slots = list(
		slot_back_str = "combat_sword"
		)
	worksound = WORKSOUND_HARD_SLASH
	force = WEAPON_FORCE_ROBUST
	armor_penetration = ARMOR_PEN_DEEP
	effective_faction = list("xenomorph", "balkan") // The factions mentioned on the blade's description
	alt_mode_toggle = "flips their grip to use the blunt side of the blade"
	damage_mult = 1.5
	throwforce = WEAPON_FORCE_NORMAL
	attack_verb = list("attacked", "slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	hitsound = 'sound/weapons/bladeslice.ogg'
	tool_qualities = list(QUALITY_CUTTING = 10, QUALITY_SAWING = 10)
	structure_damage_factor = STRUCTURE_DAMAGE_BLADE
	w_class = ITEM_SIZE_BULKY
	price_tag = 100

	has_alt_mode = TRUE
	alt_mode_damagetype = HALLOSS
	alt_mode_sharp = FALSE
	alt_mode_verbs = list("bashes", "stunts", "hilts", "blunts")
	alt_mode_toggle = "uses the broad side of their weapon"
	alt_mode_lossrate = 0.3

/obj/item/tool/sword/katana/union
	name = "Diamond Edge Sword"
	desc = "A Sturdy Advanced Combat Sword, seen in hands of expert mercenaries,duelists or well paid Bodyguards this sword is special in design, balance and made for a true fighter, if said fighter can afford a weapon like this."
	icon_state = "diamond_edge" // New sprite courtesy of nayu//replaced by dromki with new design and mob sprites.
	item_state = "diamond_edge"
	hitsound = 'sound/weapons/heavyslash.ogg'
	matter = list(MATERIAL_PLASTEEL = 10, MATERIAL_STEEL = 5, MATERIAL_DIAMOND = 1) //sharpened using diamond dust or whatever// now has literally the diamonds on the blade
	slot_flags = SLOT_BELT | SLOT_BACK
	force = WEAPON_FORCE_BRUTAL
	armor_penetration = ARMOR_PEN_MASSIVE
	alt_mode_toggle = "flips their grip to use the blunt side of the blade"
	item_icons = list(
		slot_back_str = 'icons/inventory/back/mob.dmi')
	item_state_slots = list(
		slot_back_str = "diamond_edge"
		)
	effective_faction = list("xenomorph", "balkan", "circhosian") // Same as the combat sword, but also cultists
	damage_mult = 1.5

/obj/item/tool/sword/katana_makeshift
	name = "makeshift katana"
	desc = "Modern Japanese-style blade that has no curve to it. This one is two knives welded together, proving where there's a will and a weeb there's a way."
	icon_state = "katana_improv"
	item_state = "katana_improv"
	matter = list(MATERIAL_STEEL = 10, MATERIAL_PLASTIC = 2) //twice the value of a kitche knife
	slot_flags = SLOT_BELT|SLOT_BACK
	force = WEAPON_FORCE_DANGEROUS
	armor_penetration = ARMOR_PEN_SHALLOW
	alt_mode_toggle = "flips their grip to use the blunt side of the blade"
	price_tag = 40

/obj/item/tool/sword/katana/nano
	name = "\improper Phokorus Institute \"Muramasa\" katana"
	desc = "After an extensive binge of ancient animated recordings, a scientist decided to upgrade a recovered katana."
	icon_state = "eutactic_katana"
	item_state = "eutactic_katana"
	toggleable = TRUE

	suitable_cell = /obj/item/cell/small

	use_power_cost = 0.4
	passive_power_cost = 0.4

	switched_on_qualities = list(QUALITY_CUTTING = 25, QUALITY_SAWING = 15)
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 6)
	switched_on_forcemult = 1.2 //40
	price_tag = 800

	has_alt_mode = FALSE

/obj/item/tool/sword/katana/nano/turn_on(mob/user)
	.=..()
	if(.)
		embed_mult = 0
		playsound(user, 'sound/weapons/saberon.ogg', 50, 1)

/obj/item/tool/sword/katana/nano/turn_off(mob/user)
	..()
	embed_mult = initial(embed_mult)
	playsound(user, 'sound/weapons/saberoff.ogg', 50, 1)

/obj/item/tool/sword/katana/nano/update_icon()
	..()
	if(cell)
		overlays += "[icon_state]_cell"
	if(switched_on)
		overlays += "[icon_state]_power_on"
	else
		overlays += "[icon_state]_power_off"

/obj/item/tool/sword/katana/firebrand //Firebrand. Sprited and Implemented by Sieghardt
	name = "Union Firebrand"
	desc = "Originally the fever dream of an brave Union Chief looking for a better way to deal with roaches, the Firebrand ended up as a hellish implement of war. While turned off, this is a blunted hunk of metal. When turned on the Firebrand becomes a bringer of fiery doom to anyone unlucky enough to be its path."
	icon_state = "firebrand"
	item_state = "firebrand"
	toggleable = TRUE

	max_fuel = 100
	use_fuel_cost = 0.5
	passive_fuel_cost = 0.1
	price_tag = 700

	switched_on_qualities = list(QUALITY_CUTTING = 25, QUALITY_SAWING = 15, QUALITY_CAUTERIZING = 10, QUALITY_WELDING = 15)
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 4)
	force = WEAPON_FORCE_NORMAL
	switched_on_forcemult = 3.3 //33
	//Weaker than the Muramasa and other high end weapons, as it's not LETHAL, but sets the target on fire. 1 stack though.
	structure_damage_factor = STRUCTURE_DAMAGE_BLUNT
	//A heated blade can not be sharp, it's just shaped like a sword while being a blunt object. When turned off it has as much damage as other blunt implements.
	heat = 2250
	glow_color = COLOR_ORANGE
	//Stronger when turned on. Will emit heat, turn its damage type to burn and set targets on fire.

	has_alt_mode = FALSE

/obj/item/tool/sword/katana/firebrand/is_hot()
	if(switched_on)
		return heat

/obj/item/tool/sword/katana/firebrand/turn_on(mob/user)
	.=..()
	if(.)
		embed_mult = 0
		damtype = BURN
		set_light(2)
		playsound(loc, 'sound/items/welderactivate.ogg', 50, 1)
		//Too hot to get stuck into crud.

/obj/item/tool/sword/katana/firebrand/apply_hit_effect(atom/target, blocked=FALSE)
	.=..()
	if(iscarbon(target) && switched_on)
		var/mob/living/carbon/M = target
		M.adjust_fire_stacks(1)
		M.IgniteMob()
		//Sets the target on fire, however only 1 stack at a time rather than 4 like most incendiary ammo.

/obj/item/tool/sword/katana/firebrand/turn_off(mob/user)
	..()
	embed_mult = initial(embed_mult)
	damtype = initial(damtype)
	set_light(0)
	playsound(loc, 'sound/items/welderdeactivate.ogg', 50, 1)

/obj/item/tool/sword/katana/firebrand/update_icon()
	..()
	if(switched_on)
		icon_state = "firebrand_on"
		item_state = "firebrand_on"
	else
		icon_state = initial(icon_state)
		item_state = initial(item_state)

/obj/item/tool/sword/saber
	name = "decorative saber"
	desc = "A finely made formal blade as a ornamental show of class or force. Despite being primarily for show it cuts deep and painfully."
	icon = 'icons/obj/weapons-blades.dmi'
	icon_state = "saber"
	item_state = "saber"
	armor_penetration = ARMOR_PEN_SHALLOW
	price_tag = 400
	has_alt_mode = TRUE
	alt_mode_damagetype = HALLOSS
	alt_mode_sharp = FALSE
	alt_mode_verbs = list("bashes", "stunts", "wacks", "blunts")
	alt_mode_toggle = "flips their grip to use the blunt side of the blade"
	alt_mode_lossrate = 0.6

/obj/item/tool/sword/saber/cutlass
	name = "cutlass"
	desc = "A finely made sword for pirates or military men who take themselves too seriously."
	icon_state = "cutlass"
	item_state = "cutlass"
	price_tag = 300
	alt_mode_verbs = list("bashes", "stunts", "hilts", "blunts")
	alt_mode_toggle = "flips their grip to use the blunt side of the blade"

/obj/item/tool/sword/handmade
	name = "junkblade"
	desc = "Hack and slash!"
	icon_state = "msword"
	item_state = "msword"
	slot_flags = SLOT_BELT|SLOT_BACK
	matter = list(MATERIAL_PLASTEEL = 5, MATERIAL_STEEL = 2) // 2 rods, 5 plasteel
	armor_penetration = ARMOR_PEN_MODERATE
	tool_qualities = list(QUALITY_CUTTING = 15,  QUALITY_SAWING = 5)
	degradation = 1.5 // Crappily made
	max_upgrades = 5 // Handmade nature
	price_tag = 100 // Made with plasteel

/obj/item/tool/sword/foreman
	name = "\"Maw Opener\" Greatsword"
	desc = "This thing is too big to be called a sword. \
			Too big, too thick, too heavy, and too rough, \
			it is more like a large hunk of plasteel. \nA \
			Shepherd's weapon of choice when bashing is not enough; \
			you have to cleave through the hordes to survive, and keep struggling."
	icon_state = "renderslayer"
	item_state = "renderslayer"
	force = WEAPON_FORCE_BRUTAL + 2 // 35 damage
	slot_flags = SLOT_BELT|SLOT_BACK
	armor_penetration = ARMOR_PEN_MASSIVE // Sharp edge
	effective_faction = list("agape") // Called like this for a reason
	damage_mult = 2
	matter = list(MATERIAL_PLASTEEL = 30, MATERIAL_STEEL = 5)
	w_class = ITEM_SIZE_BULKY
	origin_tech = list(TECH_COMBAT = 3)
	attack_verb = list("attacked", "CLANG'd", "slashed", "sliced", "diced", "cut")
	hitsound = 'sound/weapons/renderslash.ogg' // Not gonna CLANG this up for the sake of our ears, but snowflake attack sound.
	item_icons = list(
		slot_back_str = 'icons/inventory/back/mob.dmi')
	item_state_slots = list(
		slot_back_str = "renderslayer"
		)

/obj/item/tool/knife/ritual/blade
	name = "awakened blade"
	desc = "The last stage of ascension a ritual knife, its latent powers fully awoken by the crayons' magic. \
			Suspiciously glowing runes are drawn on its surface that glow at random intervals."
	icon_state = "crayon_blade"
	matter = list(MATERIAL_PLASTEEL = 15, MATERIAL_STEEL = 2, MATERIAL_DIAMOND = 1)
	force = WEAPON_FORCE_ROBUST + 4 // 30 damage
	armor_penetration = ARMOR_PEN_MASSIVE // More balanced than psi weapons with psi mania perk.
	w_class = ITEM_SIZE_BULKY
	max_upgrades = 2
	slot_flags = SLOT_BELT|SLOT_BACK
	hitsound = 'sound/weapons/renderslash.ogg' // Snowflake
	item_icons = list(
		slot_back_str = 'icons/inventory/back/mob.dmi')
	item_state_slots = list(
		slot_back_str = "crayon_blade"
		)

/obj/item/tool/sword/machete
	name = "machete"
	desc = "An explorer's best friend and trust back up plan. Or primary plan for those who like to get in there personally."
	icon = 'icons/obj/weapons-blades.dmi'
	icon_state = "machete"
	item_state = "machete"
	tool_qualities = list(QUALITY_CUTTING = 10,  QUALITY_SAWING = 20) //So we can cut down trees
	force = WEAPON_FORCE_ROBUST
	alt_mode_toggle = "flips their grip to use the blunt side of the blade"
	w_class = ITEM_SIZE_NORMAL
	price_tag = 120

/obj/item/tool/sword/cleaver
	name = "hunters cleaver"
	desc = "A handcrafted weapon, this massive sword is especially effective against tengolos, xenomorphs, and tengolo berserkers, dealing double its normal damage with every strike."
	icon = 'icons/obj/weapons-blades.dmi'
	icon_state = "cleaver"
	item_state = "cleaver_back"
	tool_qualities = list(QUALITY_CUTTING = 30)
	force = WEAPON_FORCE_BRUTAL
	armor_penetration = ARMOR_PEN_SHALLOW
	w_class = ITEM_SIZE_BULKY
	effective_faction = list("tengo", "tengolo_berserker", "xenomorph") // Which faction the cleaver is effective against.
	damage_mult = 2 // The damage multiplier the cleaver get when attacking that faction.
	price_tag = 200
	item_icons = list(
		slot_back_str = 'icons/obj/weapons-blades.dmi')
	item_state_slots = list(
		slot_back_str = "cleaver_back"
		)
/obj/item/tool/gauntlet
	name = "render gauntlet"
	desc = "A crudely made gauntlet consisting of straps, metal reinforcement and render skin - including it's deadly claws."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "gauntlet"
	tool_qualities = list(QUALITY_CUTTING = 20,  QUALITY_SAWING = 20) //Cuts people down just like trees.
	force = WEAPON_FORCE_BRUTAL
	armor_penetration = ARMOR_PEN_MODERATE
	w_class = ITEM_SIZE_NORMAL
	origin_tech = list(TECH_COMBAT = 5)
	attack_verb = list("clawed", "scratched", "lacerated", "slashed")
	price_tag = 200
	alt_mode_toggle = "retracts the claws to strike with a closed fist"

/obj/item/tool/power_fist
	name = "power fist"
	desc = "A battery powered hydraulic combat gauntlet designed for extended operations where close combat and muscles matter most."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "powerfist"
	item_state = "powerfist"
	toggleable = TRUE
	worksound = WORKSOUND_HAMMER
	switched_on_forcemult = 3.3 //33
	armor_penetration = ARMOR_PEN_MODERATE
	w_class = ITEM_SIZE_NORMAL
	origin_tech = list(TECH_COMBAT = 7)
	attack_verb = list("punched", "decked", "haymakered", "uppercut")
	degradation = 0.7
	use_power_cost = 1
	suitable_cell = /obj/item/cell/medium
	switched_on_qualities = list(QUALITY_HAMMERING = 30)
	switched_off_qualities = list(QUALITY_HAMMERING = 10)
	hitsound = 'sound/weapons/smash.ogg'
	price_tag = 300

	has_alt_mode = TRUE
	alt_mode_damagetype = HALLOSS
	alt_mode_sharp = FALSE
	alt_mode_verbs = list("bashes", "stunts", "wacks", "blunts")
	alt_mode_toggle = "adjusts their grip to strike lightly"
	alt_mode_lossrate = 0.9

/obj/item/tool/power_fist/turn_on(mob/user)
	if (cell && cell.charge > 0)
		item_state = "[initial(item_state)]_on"
		to_chat(user, SPAN_NOTICE("You switch [src] on."))
		playsound(loc, 'sound/effects/sparks4.ogg', 50, 1)
		..()
	else
		item_state = initial(item_state)
		to_chat(user, SPAN_WARNING("[src] has no power!"))

/obj/item/tool/power_fist/turn_off(mob/user)
	item_state = initial(item_state)
	playsound(loc, 'sound/effects/sparks4.ogg', 50, 1)
	to_chat(user, SPAN_NOTICE("You switch [src] off."))
	..()

//POLEARMS
/obj/item/tool/spear
	icon = 'icons/obj/weapons.dmi'
	icon_state = "spear_glass"
	item_state = "spear_glass"
	wielded_icon = "spear_glass_wielded"
	name = "shard spear"
	desc = "A spiky bit of material tied onto a metal pole with some wire. \
			It's an insult to spears across the galaxy - but it can still do some nasty damage as a thrown weapon."
	w_class = ITEM_SIZE_HUGE
	slot_flags = SLOT_BACK
	throw_speed = 3
	edge = TRUE
	sharp = TRUE
	tool_qualities = list(QUALITY_CUTTING = 10)
	origin_tech = list(TECH_COMBAT = 1)
	hitsound = 'sound/weapons/slice.ogg' // Sounds more like a stab than a cut.
	attack_verb = list("attacked", "poked", "jabbed", "torn", "gored")
	embed_mult = 1.5
	price_tag = 50
	//attack_distance = 2


	force = WEAPON_FORCE_PAINFUL
	throwforce = WEAPON_FORCE_DANGEROUS
	armor_penetration = ARMOR_PEN_MODERATE
	throw_speed = 3
	max_upgrades = 5

	item_icons = list(
		slot_back_str = 'icons/inventory/back/mob.dmi')
	item_state_slots = list(
		slot_back_str = "spearglass0_back"
		)

	has_alt_mode = TRUE
	alt_mode_damagetype = HALLOSS
	alt_mode_sharp = FALSE
	alt_mode_verbs = list("bashes", "stunts", "wacks", "blunts")
	alt_mode_toggle = "switches their stance to strike with the shaft"
	alt_mode_lossrate = 0.4



/obj/item/tool/spear/steel
	name = "steel spear"
	desc = "A steel spearhead welded to a crude metal shaft, made from two welded rods. It'll serve well enough."
	icon_state = "spear_steel"
	item_state = "spear_steel"
	wielded_icon = "spear_steel_wielded"
	force = WEAPON_FORCE_DANGEROUS
	throwforce = WEAPON_FORCE_ROBUST
	armor_penetration = ARMOR_PEN_DEEP
	tool_qualities = list(QUALITY_CUTTING = 10,  QUALITY_WIRE_CUTTING = 5, QUALITY_SCREW_DRIVING = 5)
	matter = list(MATERIAL_STEEL = 3)
	structure_damage_factor = STRUCTURE_DAMAGE_WEAK

/obj/item/tool/spear/plasteel
	name = "plasteel spear"
	desc = "A carefully crafted plasteel spearhead affixed to a metal shaft, it is welded securely on and feels balanced. Show them the past still lives."
	icon_state = "spear_plasteel"
	item_state = "spear_plasteel"
	wielded_icon = "spear_plasteel_wielded"
	force = WEAPON_FORCE_ROBUST
	throwforce = WEAPON_FORCE_BRUTAL
	armor_penetration = ARMOR_PEN_DEEP
	tool_qualities = list(QUALITY_CUTTING = 15,  QUALITY_WIRE_CUTTING = 10, QUALITY_SCREW_DRIVING = 10)
	matter = list(MATERIAL_STEEL = 1, MATERIAL_PLASTEEL = 2)
	structure_damage_factor = STRUCTURE_DAMAGE_NORMAL

/obj/item/tool/spear/uranium
	name = "uranium spear"
	desc = "A steel spear with a uranium lined spearhead. Your foes may survive the stab, but the toxin will linger."
	icon_state = "spear_uranium"
	item_state = "spear_uranium"
	wielded_icon = "spear_uranium_wielded"
	force = WEAPON_FORCE_DANGEROUS
	throwforce = WEAPON_FORCE_DANGEROUS
	armor_penetration = ARMOR_PEN_DEEP
	tool_qualities = list(QUALITY_CUTTING = 10,  QUALITY_WIRE_CUTTING = 5, QUALITY_SCREW_DRIVING = 5)
	matter = list(MATERIAL_STEEL = 3, MATERIAL_URANIUM = 1)

/obj/item/tool/spear/uranium/apply_hit_effect(mob/living/carbon/human/target, mob/living/user, hit_zone)
	..()
	if(istype(target))
		target.apply_effect(rand(5, 10), IRRADIATE)

/obj/item/tool/spear/makeshift_halberd
	name = "makeshift halberd"
	desc = "Slap a heavy blade on some rods duct-taped together and call it a day."
	icon_state = "makeshift_halberd"
	item_state = "makeshift_halberd"
	wielded_icon = "makeshift_halberd_wielded"
	force = WEAPON_FORCE_ROBUST
	throwforce = WEAPON_FORCE_NORMAL
	armor_penetration = ARMOR_PEN_SHALLOW
	tool_qualities = list(QUALITY_CUTTING = 10)
	matter = list(MATERIAL_STEEL = 5)
	alt_mode_toggle = "flips the halberd to its broad side"

/obj/item/tool/spear/hunter_halberd
	name = "halberd"
	desc = "A hand-crafted halberd with a red cloth wrapped around the base of the blade itself. A Hunter's signature melee weapon of choice."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "hunter_halberd"
	item_state = "hunter_halberd"
	wielded_icon = "hunter_halberd_wielded"
	force = WEAPON_FORCE_BRUTAL
	armor_penetration = ARMOR_PEN_DEEP
	price_tag = 500
	matter = list(MATERIAL_STEEL = 22, MATERIAL_WOOD = 10, MATERIAL_PLASTEEL = 4)

//Shitty loadout weapons
/obj/item/tool/cheap
	name = "cheap sword"
	desc = "A sword of acceptable quality, mass-produced by Skylight. It's no work art, but it's sharp enough to get the job done."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "cheap_sword"
	item_state = "cheap_sword"
	matter = list(MATERIAL_STEEL = 10, MATERIAL_PLASTIC = 5)
	sharp = TRUE
	edge = TRUE
	w_class = ITEM_SIZE_NORMAL
	slot_flags = SLOT_BELT
	worksound = WORKSOUND_HARD_SLASH
	force = WEAPON_FORCE_PAINFUL
	armor_penetration = ARMOR_PEN_GRAZING //Horrid weapons but in loadout

	throwforce = WEAPON_FORCE_NORMAL
	attack_verb = list("attacked", "slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	hitsound = 'sound/weapons/bladeslice.ogg'
	tool_qualities = list(QUALITY_CUTTING = 5, QUALITY_SAWING = 5)
	structure_damage_factor = STRUCTURE_DAMAGE_WEAK
	w_class = ITEM_SIZE_NORMAL
	price_tag = 100

	has_alt_mode = TRUE
	alt_mode_damagetype = HALLOSS
	alt_mode_sharp = FALSE
	alt_mode_verbs = list("bashes", "stunts", "wacks", "blunts")
	alt_mode_toggle = "flips their grip to use the blunt side of the blade"
	alt_mode_lossrate = 0.9 //Little loss so people can use these in real gimmics

/obj/item/tool/cheap/axe
	name = "cheap tomahawk"
	desc = "A tomahawk of acceptable quality, mass-produced by Skylight. Just expensive enough to be called tactical."
	throwforce = WEAPON_FORCE_ROBUST // Tomahawks are meant to be thrown
	icon_state = "cheap_axe"
	item_state = "cheap_axe"
	attack_verb = list("attacked", "slashed", "chopped", "sliced", "torn", "ripped", "diced", "cut")

/obj/item/tool/cheap/katana
	name = "cheap katana"
	desc = "A katana of acceptable quality, mass-produced by Skylight. Easily their best-selling product from this lineup."
	armor_penetration = ARMOR_PEN_MODERATE // Something something sharper
	icon_state = "katana_old"
	item_state = "katana"

/obj/item/tool/cheap/spear
	name = "cheap spear"
	desc = "A spear of acceptable quality, mass-produced by Skylight. Place sharp end towards enemy."
	icon_state = "cheap_spear"
	item_state = "cheap_spear"
	w_class = ITEM_SIZE_HUGE
	slot_flags = SLOT_BACK|SLOT_BELT
	throwforce = WEAPON_FORCE_ROBUST // Not as strong as a crafted plasteel one. Shouldn't be.
	throw_speed = 3
	embed_mult = 1.5
	structure_damage_factor = STRUCTURE_DAMAGE_WEAK
	tool_qualities = list(QUALITY_CUTTING = 5,  QUALITY_WIRE_CUTTING = 5, QUALITY_SCREW_DRIVING = 5)
	hitsound = 'sound/weapons/slice.ogg'
	attack_verb = list("attacked", "poked", "jabbed", "torn", "gored")
	item_icons = list(
		slot_back_str = 'icons/inventory/back/mob.dmi')
	item_state_slots = list(
		slot_back_str = "cheap_spear"
		)
	alt_mode_toggle = "switches their stance to strike at targets with the shaft"
	alt_mode_lossrate = 0.4

/obj/item/tool/cheap/saber
	name = "cheap saber"
	desc = "A saber of acceptable quality, mass-produced by Skylight. Probably not fit for parrying, but why not give it a try?"
	icon_state = "cheap_saber"
	item_state = "cutlass"
