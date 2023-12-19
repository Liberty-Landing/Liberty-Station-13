//Warning! If you change icon_state or item_state, make sure you change path for sneath as well. icons/obj/sneath.dmi

// Skeleton custodian melee weapon
/obj/item/tool/sword/custodian
	name = "custodian melee weapon"
	desc = "If you can see this in-game, report it."
	icon = 'icons/obj/custodians_melee.dmi'
	icon_state = "ulfberth_sword"
	item_state = "ulfberth_sword"
	force = WEAPON_FORCE_DANGEROUS
	throwforce = WEAPON_FORCE_WEAK
	armor_penetration = ARMOR_PEN_DEEP
	price_tag = 300
	matter = list(MATERIAL_BIO_SILK = 25, MATERIAL_STEEL = 5)

/obj/item/tool/sword/custodian/equipped(mob/living/M)
	. = ..()
	if(is_held() && is_custodian_of_bonfire(M))
		embed_mult = 0.05
	else
		embed_mult = initial(embed_mult)

/obj/item/tool/sword/custodian/shortsword
	name = "ulfberht"
	desc = "As much as swords may be underused by the Custodians in exchange for polearms and axes, many short swords are produced for a cheap price. \
	The ulfberht are regarded as a work of art rather than a weapon - but are still a capable sidearm."
	icon = 'icons/obj/custodians_melee.dmi'
	icon_state = "ulfberth_sword"
	item_state = "ulfberth_sword"
	force = WEAPON_FORCE_ROBUST
	throwforce = WEAPON_FORCE_DANGEROUS
	armor_penetration = ARMOR_PEN_DEEP
	price_tag = 650
	matter = list(MATERIAL_BIO_SILK = 15, MATERIAL_PLASTIC = 10, MATERIAL_STEEL = 10)
	alt_mode_lossrate = 0.7
	alt_mode_toggle = "flips their grip to use the blunt side of the blade"

/obj/item/tool/sword/custodian/horseaxe
	name = "horseman axe"
	desc = "An efficient tin-opener of a weapon, excellent for penetrating armor - the sight of such a large axe is not far-fetched from horror stories, as such blade and weight can easily chop an arm. \
	This piece of equipment is the most well used piece of melee weaponry of the Custodians."
	icon_state = "horsemans_axe"
	item_state = "horsemans_axe"
	wielded_icon = "horsemans_axe_wielded"
	force = WEAPON_FORCE_BRUTAL
	armor_penetration = ARMOR_PEN_MASSIVE
	w_class = ITEM_SIZE_BULKY
	slot_flags = SLOT_BACK | SLOT_BELT
	price_tag = 850
	alt_mode_lossrate = 0.7
	alt_mode_toggle = "flips the axe to its broad side"
	matter = list(MATERIAL_BIO_SILK = 15, MATERIAL_PLASTIC = 10, MATERIAL_PLASTEEL = 16, MATERIAL_STEEL = 30, MATERIAL_CARBON_FIBER = 8)
	item_icons = list(
		slot_back_str = 'icons/inventory/back/mob.dmi')
	item_state_slots = list(
		slot_back_str = "horsemans_axe"
		)

/obj/item/tool/knife/dagger/custodian
	name = "custodian seax"
	desc = "A really small sword used to puncture enemies in between armor, or to be used as a tool for cutting like a knife, even if it is clearly more efficient for stabbing."
	icon = 'icons/obj/custodians_melee.dmi'
	icon_state = "custodian_seax"
	item_state = "custodian_seax"
	force = WEAPON_FORCE_PAINFUL // 2 more damage than a dagger
	armor_penetration = ARMOR_PEN_HALF // With the same amount of penetration
	backstab_damage = 23 // Beware the ides of March.
	price_tag = 300
	matter = list(MATERIAL_BIO_SILK = 10, MATERIAL_STEEL = 10)

/obj/item/tool/knife/dagger/custodian/equipped(mob/living/M)
	. = ..()
	if(is_held() && is_custodian_of_bonfire(M))
		embed_mult = 0.05 // Masters of melee combat possess more expertise and will embed their weapons less.
	else
		embed_mult = initial(embed_mult)

/obj/item/tool/spear/atgeir
	name = "custodian atgeir"
	desc = "The polearm that anticipates bloodshed, serving in the battlefield as a multipurpose staff with a spearhead mixed with the blade of an axe. \
	The weapon is large and heavy, very difficult to store - yet way more brutal than any average melee weapon."
	icon = 'icons/obj/custodians_melee.dmi'
	icon_state = "custodian_atgeir"
	item_state = "custodian_atgeir"
	wielded_icon = "custodian_atgeir_wielded"
	force = WEAPON_FORCE_BRUTAL
	armor_penetration = ARMOR_PEN_MASSIVE
	throwforce = WEAPON_FORCE_LETHAL
	slot_flags = SLOT_BACK | SLOT_BELT
	price_tag = 850
	matter = list(MATERIAL_STEEL = 15, MATERIAL_PLASTEEL = 8, MATERIAL_BIO_SILK = 15, MATERIAL_PLASTIC = 10, MATERIAL_WOOD = 10, MATERIAL_CARBON_FIBER = 15)
	item_icons = list(
		slot_back_str = 'icons/inventory/back/mob.dmi')
	item_state_slots = list(
		slot_back_str = "custodian_atgeir"
		)

/obj/item/tool/spear/atgeir/equipped(mob/living/M)
	. = ..()
	if(is_held() && is_custodian_of_bonfire(M))
		embed_mult = 0.05
	else
		embed_mult = initial(embed_mult)

/obj/item/tool/sword/custodian/whip
	name = "custodian nagaika"
	desc = "A whip made from compacted and oil-hardened silk with dense dark silver on its tip, with protuding blades that open and close on impact to inflict superfluous injury, the very same reason why Hollow-points are considered a war crime to use. \
	Good thing whoever wrote that only included “bullets”, otherwise the Custodians would be practicing warcrimes every day by default."
	icon_state = "custodian_nagaika"
	item_state = "custodian_nagaika"
	force = WEAPON_FORCE_PAINFUL
	armor_penetration = ARMOR_PEN_MASSIVE
	edge = FALSE
	sharp = FALSE
	var/agony = 35
	var/stun = 0
	w_class = ITEM_SIZE_SMALL
	price_tag = 800
	matter = list(MATERIAL_BIO_SILK = 40, MATERIAL_CARBON_FIBER = 10, MATERIAL_PLASTEEL = 2, MATERIAL_STEEL = 10)
	has_alt_mode = FALSE

/obj/item/tool/sword/custodian/whip/apply_hit_effect(mob/living/carbon/human/target, mob/living/user, hit_zone)
	. = ..()
	if(ishuman(target))
		target.stun_effect_act(stun, agony, hit_zone, src)

/obj/item/tool/sword/custodian/throwaxe
	name = "custodian francisca"
	desc = "The Francisca is an efficient throwing axe with an arch-shaped head. Small and concealable, the angle of the blade allows better breaking of shields, disrupting enemy lines and wounding an enemy hand-to-hand combat would happen. \
	Even if the blade were not to strike the target, its weight has the potential of breaking necks."
	icon_state = "custodian_francisca"
	item_state = "custodian_francisca"
	force = WEAPON_FORCE_DANGEROUS
	throwforce = WEAPON_FORCE_LETHAL * 1.5 // 60 damage
	armor_penetration = ARMOR_PEN_DEEP
	throw_speed = 4
	price_tag = 400
	alt_mode_lossrate = 0.7
	alt_mode_toggle = "flips the axe to its broad side"
	matter = list(MATERIAL_BIO_SILK = 15, MATERIAL_PLASTEEL = 2, MATERIAL_STEEL = 5)

/obj/item/tool/sword/custodian/throwaxe/equipped(mob/living/W)
	. = ..()
	if(is_held() && is_custodian_of_bonfire(W))
		embed_mult = 0.2 // This ONLY applies to using it as a melee weapon.
	else
		embed_mult = initial(embed_mult)

// When thrown, it is guaranteed to embed.
/obj/item/tool/sword/custodian/throwaxe/dropped(mob/living/W)
	embed_mult = 600
	..()

/obj/item/tool/sword/custodian/warhammer
	name = "emberblaze warhammer"
	desc = "An one handed Raven's beak that rapidly blazes when in connection with the Hearthcore and transfers its massive heat towards an chosen victim way worse than an laser sword would, enough to cause third-degree burns, and it is used to counter enemies using armor with high melee protection. \
	It is TOO efficient to cleanse the pests - to the point that it is more likely to dust giant insects rather than allowing the Custodian to gather its meat for materials."
	icon_state = "emberblaze_warhammer"
	item_state = "emberblaze_warhammer"
	wielded_icon = "emberblaze_warhammer_wielded"
	force = WEAPON_FORCE_BRUTAL
	armor_penetration = ARMOR_PEN_MASSIVE
	effective_faction = list("spider") // Spiders are weak to crushing.
	damage_mult = 1.2
	w_class = ITEM_SIZE_BULKY
	price_tag = 800
	attack_verb = list("attacked", "smashed", "bludgeoned", "beaten")
	matter = list(MATERIAL_BIO_SILK = 15, MATERIAL_PLASTIC = 10, MATERIAL_PLASTEEL = 16, MATERIAL_STEEL = 30, MATERIAL_SILVER = 2)
	tool_qualities = list(QUALITY_HAMMERING = 10) //Not designed for that fine nailing
	var/glowing = FALSE
	sharp = FALSE
	edge = FALSE // Much fun as it is to just golf club someone's head off, no.
	embed_mult = 0
	has_alt_mode = FALSE
	var/effect_time = 3 MINUTES
	var/power_cost = 20
	hitsound = 'sound/weapons/blunthit.ogg'

/obj/item/tool/sword/custodian/warhammer/attack_self(mob/user)
	var/mob/living/carbon/human/theuser = user
	var/obj/item/implant/core_implant/hearthcore/CI = theuser.get_core_implant()
	if(!CI || !CI.active || !CI.wearer || !istype(CI,/obj/item/implant/core_implant/hearthcore))
		to_chat(user, SPAN_WARNING("You do not have an active Hearthcore with which to power this!"))
		return
	if(CI.power < power_cost)
		to_chat(user, SPAN_WARNING("You do not have enough power!"))
		return
	if(glowing)
		to_chat(user, SPAN_WARNING("The warhammer is still lit up."))
		return
	else
		CI.use_power(power_cost)
		heat_hammer()

/obj/item/tool/sword/custodian/warhammer/proc/heat_hammer()
	set_light(l_range = 4, l_power = 2, l_color = COLOR_YELLOW)
	visible_message(SPAN_NOTICE("[src] radiates a searing heat!"))
	glowing = TRUE
	heat = 1873
	update_icon()
	damtype = BURN
	addtimer(CALLBACK(src, .proc/discard_effect, src), src.effect_time)
	return TRUE

/obj/item/tool/sword/custodian/warhammer/proc/discard_effect()
	set_light(l_range = 0, l_power = 0, l_color = COLOR_BLUE)
	glowing = FALSE
	damtype = initial(damtype)
	heat = initial(heat)
	update_icon()
	visible_message(SPAN_NOTICE("[src]'s heat dies down."))

/obj/item/tool/sword/custodian/warhammer/update_icon()
	if(glowing)
		icon_state = initial(icon_state) + "_lit"
	else
		icon_state = initial(icon_state)
	..()

/obj/item/tool/sword/custodian/conflagration
	name = "conflagration sword"
	desc = "An advanced, expensive, and work-intensive sword produced by the Custodians, the blade is enhanced under the Radiance."
	icon_state = "conflagrationsword"
	item_state = "conflagrationsword"
	force = WEAPON_FORCE_BRUTAL
	armor_penetration = ARMOR_PEN_EXTREME
	w_class = ITEM_SIZE_BULKY
	price_tag = 1200
	alt_mode_lossrate = 0.7
	matter = list(MATERIAL_BIO_SILK = 40, MATERIAL_STEEL = 15, MATERIAL_CARBON_FIBER = 15, MATERIAL_SILVER = 6, MATERIAL_PLASTEEL = 8, MATERIAL_PLASTIC = 20, MATERIAL_WOOD = 10)
	tool_qualities = list(QUALITY_CUTTING = 10)
	var/glowing = FALSE
	slot_flags = SLOT_BACK | SLOT_BELT
	has_alt_mode = FALSE
	var/effect_time = 1 MINUTES //used for the addtimer() proc
	var/power_cost = 45
	item_icons = list(
		slot_back_str = 'icons/inventory/back/mob.dmi') //this is how to set the back sprite
	item_state_slots = list(
		slot_back_str = "conflagrationsword"
		)

/obj/item/tool/sword/custodian/conflagration/attack_self(mob/user)
	var/mob/living/carbon/human/theuser = user
	var/obj/item/implant/core_implant/hearthcore/CI = theuser.get_core_implant()
	if(!CI || !CI.active || !CI.wearer || !istype(CI,/obj/item/implant/core_implant/hearthcore)) //Active hearthcore check
		to_chat(user, SPAN_WARNING("You do not have an active Hearthcore with which to power this!"))
		return
	if(CI.power < power_cost)
		to_chat(user, SPAN_WARNING("You do not have enough power!"))
		return
	if(glowing)
		to_chat(user, SPAN_WARNING("The sword is still lit up."))
		return
	else
		CI.use_power(power_cost)
		ignite_sword(user)

/obj/item/tool/sword/custodian/conflagration/apply_hit_effect(mob/living/target, mob/living/user, hit_zone)
	..() //We first let the base apply_hit_effect() proc do its thing, attacking with the sword
	if (glowing) //then we check if we burn the target
		if (iscarbon(target))
			scorch_attack(target, 20)

/obj/item/tool/sword/custodian/conflagration/proc/ignite_sword(mob/user)
	set_light(l_range = 4, l_power = 2, l_color = COLOR_BLUE)
	visible_message(SPAN_NOTICE("[user] infuses Radiance into [src]"))
	glowing = TRUE
	heat = 1873
	update_icon()
	user.update_inv_r_hand() // These two procs are needed to update the on-mob sprites, update_icons() is not it
	user.update_inv_l_hand()
	addtimer(CALLBACK(src, .proc/discard_effect, src), src.effect_time) //setn
	return TRUE

/obj/item/tool/sword/custodian/conflagration/proc/discard_effect(var/mob/user)
	user = get_holding_mob()
	set_light(l_range = 0, l_power = 0, l_color = COLOR_BLUE)
	glowing = FALSE
	heat = initial(heat)
	update_icon()
	user.update_inv_r_hand() //Get rid of the radiant sprites
	user.update_inv_l_hand()
	visible_message(SPAN_NOTICE("[src]'s flames subside."))

/obj/item/tool/sword/custodian/conflagration/update_icon() //Toggles the "turned on" icon and on-mob sprites based on the "glowing" var
	if(glowing)
		icon_state = initial(icon_state) + "_radiant"
		item_state = initial(item_state) + "_radiant"
	else
		icon_state = initial(icon_state)
		item_state = initial(item_state)
	..()

/obj/item/shield/riot/custodian
	name = "custodian scutum shield"
	desc = "A wall of a shield, oblong, convex and absurdly difficult to store, yet efficient to keep bullets and melee attacks at bay. \
	The reinforcements of the shield allows major protection for an experienced user, yet its efficiency is limited for the inexperienced. \
	It has leather straps behind it to store large equipment such as staves, throwing spears and others."
	icon = 'icons/obj/custodians_melee.dmi'
	icon_state = "custodian_scutum"
	item_state = "custodian_scutum"
	force = WEAPON_FORCE_ROBUST
	throwforce = WEAPON_FORCE_ROBUST + 4 // 30 damage, it's made of steel rather than pre-preg
	hitsound = 'sound/weapons/shield/shieldbash_metal.ogg'
	armor_list = list(melee = 20, bullet = 20, energy = 10, bomb = 15, bio = 0, rad = 0)
	matter = list(MATERIAL_STEEL = 30, MATERIAL_SILVER = 6, MATERIAL_PLASTEEL = 16, MATERIAL_BIO_SILK = 30, MATERIAL_PLASTIC = 20, MATERIAL_WOOD = 10, MATERIAL_CARBON_FIBER = 15)
	price_tag = 1000
	base_block_chance = 60
	item_flags = DRAG_AND_DROP_UNEQUIP
	alt_mode_lossrate = 0.9

	max_durability = 200
	durability = 200

	item_icons = list(
		slot_back_str = 'icons/inventory/back/mob.dmi')
	item_state_slots = list(
		slot_back_str = "custodian_scutum"
		)

	var/obj/item/storage/internal/container
	var/storage_slots = 3
	var/max_w_class = ITEM_SIZE_HUGE
	var/list/can_hold = new/list(
		/obj/item/tool/sword/custodian/shortsword,
		/obj/item/tool/sword/custodian/throwaxe,
		/obj/item/tool/knife/dagger/custodian,
		/obj/item/melee_training,
		/obj/item/book/lectures
		)

/obj/item/shield/riot/custodian/New()
	container = new /obj/item/storage/internal(src)
	container.storage_slots = storage_slots
	container.can_hold = can_hold
	container.max_w_class = max_w_class
	container.master_item = src
	.=..()

/obj/item/shield/riot/custodian/proc/handle_attack_hand(mob/user as mob)
	return container.handle_attack_hand(user)

/obj/item/shield/riot/custodian/proc/handle_mousedrop(var/mob/user, var/atom/over_object)
	return container.handle_mousedrop(user, over_object)

/obj/item/shield/riot/custodian/MouseDrop(obj/over_object)
	if(container.handle_mousedrop(usr, over_object))
		return TRUE
	return ..()

/obj/item/shield/riot/custodian/attack_hand(mob/user as mob)
	if (loc == user)
		container.open(user)
	else
		container.close_all()
		..()

	src.add_fingerprint(user)
	return

/obj/item/shield/riot/custodian/attackby(obj/item/W as obj, mob/user as mob)
	if(istype(W, /obj/item/tool/baton) || istype(W, /obj/item/tool/sword/custodian))
		on_bash(W, user)
	else
		..()

/obj/item/shield/riot/custodian/get_block_chance(mob/user, var/damage, atom/damage_source = null, mob/attacker = null)
	return base_block_chance

/obj/item/shield/buckler/custodian
	name = "custodian heater shield"
	desc = "A small shield efficient for bashing enemies in the head as much as it allows the user to protect themselves from damage. \
	Rather useless for the inexperienced, yet the ones who mastered the use of shields may have incredible capacity to protect themselves from harm."
	icon = 'icons/obj/custodians_melee.dmi'
	icon_state = "custodian_heater"
	item_state = "custodian_heater"
	matter = list(MATERIAL_STEEL = 20, MATERIAL_PLASTEEL = 8, MATERIAL_BIO_SILK = 15, MATERIAL_PLASTIC = 10, MATERIAL_WOOD = 10, MATERIAL_CARBON_FIBER = 15, MATERIAL_SILVER = 2)
	price_tag = 500
	base_block_chance = 45
	item_flags = DRAG_AND_DROP_UNEQUIP
	max_durability = 150 //So we can break and need repairs from time to time
	durability = 150
	force = WEAPON_FORCE_ROBUST
	throwforce = WEAPON_FORCE_BRUTAL // Captain America would be proud
	hitsound = 'sound/weapons/shield/shieldbash_metal.ogg'
	alt_mode_lossrate = 0.6
	var/obj/item/storage/internal/container
	var/storage_slots = 1
	var/max_w_class = ITEM_SIZE_HUGE
	var/list/can_hold = list(
		/obj/item/tool/sword/custodian/shortsword,
		/obj/item/tool/sword/custodian/throwaxe, //Romans would have these with their shield to wear down their foe
		/obj/item/tool/knife/dagger/custodian,
		/obj/item/melee_training,
		/obj/item/book/lectures
		)

/obj/item/shield/buckler/custodian/New()
	container = new /obj/item/storage/internal(src)
	container.storage_slots = storage_slots
	container.can_hold = can_hold
	container.max_w_class = max_w_class
	container.master_item = src
	..()

/obj/item/shield/buckler/custodian/proc/handle_attack_hand(mob/user as mob)
	return container.handle_attack_hand(user)

/obj/item/shield/buckler/custodian/proc/handle_mousedrop(var/mob/user, var/atom/over_object)
	return container.handle_mousedrop(user, over_object)

/obj/item/shield/buckler/custodian/MouseDrop(obj/over_object)
	if(container.handle_mousedrop(usr, over_object))
		return TRUE
	return ..()

/obj/item/shield/buckler/custodian/attack_hand(mob/user as mob)
	if (loc == user)
		container.open(user)
	else
		container.close_all()
		..()

	add_fingerprint(user)
	return

/obj/item/shield/riot/custodian/attackby(obj/item/W as obj, mob/user as mob)
	if(istype(W, /obj/item/tool/baton) || istype(W, /obj/item/tool/sword/custodian))
		on_bash(W, user)
	else
		..()

// Nonlethal training weapons below

// Not a weapon, not a tool, can't be upgraded, can't lethally hit others with it, all share same damage.
/obj/item/melee_training
	name = "training weapon"
	desc = "You shouldn't be seeing this."
	icon = 'icons/obj/custodians_melee.dmi'
	icon_state = "training_sword"
	item_state = "training_sword"
	hitsound = 'sound/weapons/wood_hit.ogg'
	w_class = ITEM_SIZE_NORMAL
	slot_flags = SLOT_BACK|SLOT_BELT
	matter = list(MATERIAL_WOOD = 10)
	damtype = HALLOSS
	attack_verb = list("hit")
	force = WEAPON_FORCE_PAINFUL // Minimum required for use against the dummies.
	armor_penetration = ARMOR_PEN_SHALLOW
	structure_damage_factor = STRUCTURE_DAMAGE_BLUNT
	flags = NOBLOODY

// Wooden baton behavior.
/obj/item/melee_training/attack(mob/M as mob, mob/living/user as mob)
	// Friendly sparring until it hurts.
	if(user.a_intent == I_HELP)
		damtype = HALLOSS
		force = WEAPON_FORCE_DANGEROUS
		armor_penetration = ARMOR_PEN_SHALLOW
		hitsound = 'sound/weapons/wood_hit.ogg'
		attack_verb = list("hit")
	// Since we bump on people while on disarm intent, it means we really want to take them down.
	if(user.a_intent == I_DISARM)
		damtype = HALLOSS
		force = WEAPON_FORCE_ROBUST
		armor_penetration = ARMOR_PEN_MODERATE
		attack_verb = list("swiped")
		hitsound = 'sound/effects/woodhit.ogg'
	// You better not.
	if(user.a_intent == I_HURT)
		to_chat(user, SPAN_WARNING("These training weapons are not meant for violent use."))
		return
	return ..() // Normal behavior etc.

/obj/item/melee_training/sword
	name = "training wooden sword"
	desc = "A sword carved out of wood, it finds more use as a training tool than a proper weapon. However, it hurts to be hit by."

/obj/item/melee_training/spear
	name = "training spear"
	desc = "A wooden pole with a soft silk fibroin end, it finds more use as a training tool than a proper weapon. However, it hurts to be hit by."
	icon_state = "training_spear"
	item_state = "training_spear"
	wielded_icon = "training_spear_wielded"
	w_class = ITEM_SIZE_BULKY

/obj/item/melee_training/axe
	name = "training axe"
	desc = "An axe carved out of wood, it finds more use as a training tool than a proper weapon. However, it hurts to be hit by."
	icon_state = "training_axe"
	item_state = "training_axe"

/obj/item/melee_training/staff
	name = "training quarterstaff"
	desc = "A pole of quartersawn hardwood with silk fibroin wraps, it finds more use as a training tool than a proper weapon. However, it hurts to be hit by."
	icon_state = "training_staff"
	item_state = "training_staff"
	wielded_icon = "training_staff_wielded"
	w_class = ITEM_SIZE_BULKY

/obj/item/melee_training/foil
	name = "training foil"
	desc = "A thin, flexible sword made of carbon fiber with a blunt tip, it finds more use as a training tool than a proper weapon. However, it hurts to be hit by."
	icon_state = "training_foil"
	item_state = "training_foil"
	matter = list(MATERIAL_WOOD = 10, MATERIAL_CARBON_FIBER = 5)

