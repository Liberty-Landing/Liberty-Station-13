/*Mastercraft weapons are rare rewards from dungeons and other places that are hard to get to via difficulty.
These weapons should be 'reasonable' in terms of their balance; they can be VERY strong but should not be a 1-shot machine on players or boss-tier mobs.
The idea behind these weapons is that they are 'one-of-a-time' or single batch production limited edition weapons. Oddity weapons refers to Noble background weapons. - Rebel0*/

// Ballistic Guns

/obj/item/gun/projectile/clarissa/stealth
	name = "\"Red Devil\" compact pistol"
	desc = "A strange weapon produced by some sort of unknown or long-gone company, one of its limited single-batch manufactured line of firearms. It appears be chambered in 9mm. \
			A version of the \"Glass Widow\" this pistol appears to sport a built-in supressor, a better grip, sensitive trigger, and an improved barrel. The thing even appears to take SMG mags as well!"
	icon = 'icons/obj/guns/projectile/old/clarissa.dmi'
	icon_state = "clarissa"
	mag_well = MAG_WELL_PISTOL | MAG_WELL_H_PISTOL | MAG_WELL_SMG | MAG_WELL_DRUM		//Gives a reason to use it.
	damage_multiplier = 1.3		//Bit better than normal. Mag-capacity helps too.
	penetration_multiplier = 1.2
	serial_type = "Mastercraft"
	silenced = TRUE

	init_firemodes = list(
		SEMI_AUTO_NODELAY,
		BURST_2_ROUND_NOLOSS
		)

/obj/item/gun/projectile/revolver/ranger/gatvolver
	name = "\"Overlord\" magnum revolver"
	desc = "A strange weapon produced by some sort of unknown or long-gone company, one of its limited single-batch manufactured line of firearms. It appears be chambered in 10mm. \
			Unlike a normal revolver this one appears to somehow have four cylinders! Maybe the bluespace crystal in its center has something to do with it..."
	max_shells = 30
	init_recoil = RIFLE_RECOIL(1.1)
	price_tag = 3000
	icon = 'icons/obj/guns/projectile/gatvolver.dmi'
	icon_state = "overlord_blue"
	item_state = "overlord_blue"
	serial_type = "Mastercraft"

/obj/item/gun/projectile/revolver/ranger/gatvolver/New()
	..()
	item_flags |= BLUESPACE
	bluespace_entropy(2, get_turf(src)) //Same as the normal bluespace crystal

/obj/item/gun/projectile/automatic/broz/evil
	name = "\"PM-9 Evil\" SMG"
	desc = "A strange weapon produced by some sort of unknown or long-gone company, one of its limited single-batch manufactured line of firearms. It appears be chambered in 9mm. \
			This specific weapon looks like a basement made gun, it even lacks a serial number. Oddly this thing hits like a truck, possibly by the strange gauss-like barrel on it. Though.. it jams often."
	price_tag = 1000
	init_recoil = RIFLE_RECOIL(1)
	damage_multiplier = 3.0			//NOW THAT'S A LOTA DAMAGE!! (9mm so needs to be strong)
	penetration_multiplier = 1.5	//Not much - has a ton of damage already.
	icon_state = "evil"
	var/jammed = FALSE
	var/jam_chance = 15

/obj/item/gun/projectile/automatic/broz/evil/special_check(mob/user)
	if(jammed)
		to_chat(user, SPAN_WARNING("[src] is jammed!"))
		return 0
	else
		if(loaded.len && prob(jam_chance))
			jammed = TRUE
			playsound(src.loc, 'sound/weapons/guns/interact/hpistol_cock.ogg', 70, 1)
			to_chat(user, SPAN_DANGER("[src] is jammed!"))
			return 0
	return ..()

/obj/item/gun/projectile/shotgun/doublebarrel/king_shotgun
	name = "\"King's\" shotgun"
	desc = "A strange weapon produced by some sort of unknown or long-gone company, one of its limited single-batch manufactured line of firearms. It appears be chambered in 12 gauge. \
			A replica of a prized legendary royal shotgun wielded by a king that was once prophesized to have used it for their own undoing. Oddly it seems to sport a firemode to fire two barrels.. but it only has one. For now."
	icon_state = "shotgun"
	load_method = SINGLE_CASING|SPEEDLOADER
	handle_casings = CYCLE_CASINGS
	flags = CONDUCT
	slot_flags = SLOT_BACK
	caliber = CAL_SHOTGUN
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_STEEL = 10)
	max_shells = 1
	damage_multiplier = 2
	penetration_multiplier = 2
	init_recoil = RIFLE_RECOIL(4)
	price_tag = 3250
	gun_tags = list(GUN_PROJECTILE, GUN_INTERNAL_MAG) //Regains its internal mag due to its more annoying way of reloading
	serial_type = "BlueCross"
	icon = 'icons/obj/guns/projectile/sawnoff/bluecross_shotgun.dmi'
	init_firemodes = list(
		list(mode_name="King's Wrath", mode_desc="Echos the will of king that onced used it.", burst=1, icon="semi"), //Snowflake fire mode for snowflake gun
		list(mode_name="August Presence", mode_desc="Fires two of the king's decrees at the same time.", burst=2, icon="semi")
		)

/obj/item/gun/projectile/shotgun/doublebarrel/bluecross_shotgun/bolt_act(mob/living/user)
	bolt_open = !bolt_open
	if(bolt_open)
		playsound(src.loc, 'sound/weapons/guns/interact/shotgun_break.ogg', 75, 1)
		to_chat(user, SPAN_NOTICE("You snap the barrel open."))
	else
		playsound(src.loc, 'sound/weapons/guns/interact/shotgun_close.ogg', 75, 1)
		to_chat(user, SPAN_NOTICE("You snap the barrel closed"))
		bolt_open = 0
	add_fingerprint(user)
	update_icon()

/obj/item/gun/projectile/automatic/slaught_o_matic/lockpickomatic
	name = "\"Lockpick-o-Matic\""
	desc = "A strange weapon produced by some sort of unknown or long-gone company, one of its limited single-batch manufactured line of firearms. It appears be chambered in 7mm. \
			A mix of several other Slot-o-Matics put together after being sawn apart to make a rainbow and then fitted with a long unreloadable caseless magazine."
	caliber = CAL_CLRIFLE
	fire_sound = 'sound/weapons/guns/fire/m41_shoot.ogg'
	ammo_type = "/obj/item/ammo_casing/pistol"
	mag_well = MAG_WELL_PULSE
	magazine_type = /obj/item/ammo_magazine/cl7mm
	gun_tags = list(GUN_PROJECTILE)
	possible_colors = list("rainbow")
	init_recoil = EMBEDDED_RECOIL(0.5)
	price_tag = 300
	serial_type = "Mastercraft"

/obj/item/gun/projectile/colt/cult
	name = "Brass \"Cult\" pistol"
	desc = "A strange weapon produced by some sort of unknown or long-gone company, one of its limited single-batch manufactured line of firearms. It appears be chambered in 10mm. \
			A normal looking ML Colt but somehow made completely out of brass, with a small light in its chamber that glows an eerie red and feeling warm to the touch. \
			If you listen in closely, there's a faint sound of whirling cogs coming from the inside.."
	icon = 'icons/obj/guns/projectile/colt.dmi'
	icon_state = "brass"
	item_state = "brass"
	caliber = CAL_MAGNUM
	origin_tech = list(TECH_MAGNET = 10) //3500 points for rnd, eh its meant to stay in player hands not be deconned
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_GOLD = 10, MATERIAL_SILVER = 10, MATERIAL_GLASS = 10, MATERIAL_PLATINUM = 8)
	price_tag = 2450
	fire_sound = 'sound/weapons/guns/fire/9mm_pistol.ogg'
	can_dual = TRUE
	load_method = MAGAZINE
	mag_well = MAG_WELL_PISTOL | MAG_WELL_H_PISTOL
	damage_multiplier = 1.5
	penetration_multiplier = 1.2 // So that it's good for PVE too
	init_recoil = HANDGUN_RECOIL(0.3)
	gun_tags = list(GUN_PROJECTILE, GUN_SILENCABLE, GUN_MAGWELL)
	serial_type = "Mastercraft"

//Energy Guns

/obj/item/gun/energy/ntpistol/mana
	name = "\"Mana from Heaven\" energy pistol"
	desc = "A strange weapon produced by some sort of unknown or long-gone company, one of its limited single-batch manufactured line of firearms. \
	A black and blue version of the defunct \"Serenity\" energy pistol, somehow despite looking just like a repainted job it conserves power unusually well."
	icon_state = "ntpistol"
	fire_sound = 'sound/weapons/energy/laser_pistol.ogg'
	charge_cost = 2
	projectile_type = /obj/item/projectile/beam
	can_dual = TRUE
	init_firemodes = list(
		WEAPON_NORMAL,
		WEAPON_CHARGE
	)
	twohanded = FALSE
	suitable_cell = /obj/item/cell/small
	cell_type = /obj/item/cell/small
	price_tag = 2550
	serial_type = "Mastercraft"
	icon = 'icons/obj/guns/energy/ntpistol_bluecross.dmi'

/obj/item/gun/energy/lasersmg/chaos_engine
	name = "Hell's Teeth \"Chaos Engine\""
	desc = "A strange weapon produced by some sort of unknown or long-gone company, one of its limited single-batch manufactured line of firearms. \
			A styled red laser submachine gun often referred to as a chaos engine due to its unpredictability and penchant for letting its user unleash a blended hell of lasers."
	icon = 'icons/obj/guns/energy/lasersmg_hell.dmi'
	icon_state = "chaossmg"
	item_state = "chaossmg"
	projectile_type = /obj/item/projectile/beam/weak // Stronger
	damage_multiplier = 1 //makeshift laser
	init_recoil = HANDGUN_RECOIL(0.3)
	init_offset = 10 //makeshift laser
	charge_cost = 20 // Less cost than a Lasblender, but let's not get out of hand here
	price_tag = 1500
	init_firemodes = list(
		BURST_8_ROUND,
		FULL_AUTO_600 // UNLEASH HELL
		)
	serial_type = "Mastercraft"

/obj/item/gun/energy/sniperrifle/saint
	name = "\"Saint\" laser rifle"
	desc = "A strange weapon produced by some sort of unknown or long-gone company, one of its limited single-batch manufactured line of firearms. \
	The normal \"Valkyrie\" design meeting the improvements with Kalmyk design in a wooden frame with a golden barrel to help conduct the extra little bit of juice to hit as hard as possible."
	charge_cost = 200
	extra_damage_mult_scoped = 0.2
	fire_delay = 25
	price_tag = 3750
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_WOOD = 8, MATERIAL_GOLD = 9, MATERIAL_URANIUM = 6) //The normal valk needs silver this is gold plated!
	icon = 'icons/obj/guns/energy/sniper_saint.dmi'
	fire_sound = 'sound/weapons/energy/aer9fire.ogg'
	serial_type = "Mastercraft"

/obj/item/gun/energy/xray/psychic_cannon
	name = "\"Manta-RAY\" cannon"
	desc = "A strange weapon produced by some sort of unknown or long-gone company, one of its limited single-batch manufactured line of firearms. \
			An unusual gun sought after by the Phokorus Institute when it appears for both its utility and its research value. It's durasteel interior and unknown technological function allows \
			this weapon to use moderately high damage armor penetrating x-ray laser blasts. While a strict step up from a standard x-ray weapon in all ways, this weapon is more valued for \
			its research points in the deconstrustive analyzer."
	icon = 'icons/obj/guns/energy/psychiccannon.dmi'
	icon_state = "psychic_lasercannon"
	item_state = "psychic_lasercannon"
	fire_sound = 'sound/weapons/energy/laser3.ogg'
	origin_tech = list(TECH_COMBAT = 19, TECH_MATERIAL = 19, TECH_MAGNET = 19, TECH_ILLEGAL = 19)
	price_tag = 4000
	damage_multiplier = 1.2
	charge_cost = 100
	twohanded = FALSE
	gun_tags = list(GUN_LASER, GUN_ENERGY)
	can_dual = TRUE
	slot_flags = SLOT_BACK|SLOT_BELT|SLOT_HOLSTER
	serial_type = "Mastercraft"

/obj/item/gun/projectile/that_gun/update_icon()
	..()
	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if (ammo_magazine)
		iconstring += "[ammo_magazine? "_mag[ammo_magazine.max_ammo]": ""]"
		itemstring += "_full"

	if (!ammo_magazine || !length(ammo_magazine.stored_ammo))
		iconstring += "_slide"

	icon_state = iconstring
	set_item_state(itemstring)
/*
/obj/item/gun/energy/lasersmg/p9evil
	name = "P9 \"Evil\" smg"
	desc = "An anomalous weapon created by rivals of the unknown person(or group?) of the Mastercraft, their work marked by a crimson cross, these weapons are known to vanish and reappear when left alone. \
			An odd looking tool-made smg of sorts, made completely out of stamped metal and hatred. You wonder by looking at this how many people have used this worn weapon of war. \
			Looking at it long enough appears to make you see red.. feeling as if its draining your life force just to fire it! Let the hatred RISE!"
	icon = 'icons/obj/guns/energy/p9evil.dmi'
	icon_state = "evil"
	item_state = "evil"
	origin_tech = list(TECH_ILLEGAL = 5)
	matter = list(MATERIAL_PLASTEEL = 6, MATERIAL_STEEL = 25)
	price_tag = 2500
	projectile_type = /obj/item/projectile/beam/weak/pistol_35
	charge_cost = 1000000000000000000000000000000000000
	suitable_cell = null
	fire_sound = 'sound/weapons/guns/fire/grease_fire.ogg'
	can_dual = TRUE
	damage_multiplier = 1.2
	penetration_multiplier = 1.2
	init_recoil = HANDGUN_RECOIL(0.1)
	gun_tags = list(GUN_ENERGY, GUN_LASER, GUN_SILENCABLE)
	init_firemodes = list(
		SEMI_AUTO_NODELAY,
		BURST_3_ROUND,
		FULL_AUTO_300
		)
	serial_type = "Crimson Cross"

/obj/item/gun/energy/lasersmg/p9evil/consume_next_projectile(mob/user)
	visible_message(SPAN_WARNING("The [src] draws the life of the user!"))
	playsound(loc, 'sound/weapons/Egloves.ogg', 50, 1, -1)
	user.maxHealth -=0.1
	user.health -=0.1
	return new projectile_type(src)
*/

//Melee Weapons
/obj/item/tool/nailstick/ogre
	name = "\"Oni\" Greatclub"
	desc = "A strange weapon produced by some sort of unknown weaponsmith or long-gone company, likely one of only a few ever made. \
			A wooden club inscribed with several symbols of jana, though they make no sense put together. The wood is of unusual qualities and some lunatic hammered carbon fiber nails into \
			it. Either the maker didn't know or didn't care about the value, it still ended up a supremely deadly weapon ... or hammer."
	icon_state = "oni"
	force = WEAPON_FORCE_BRUTAL
	throwforce = WEAPON_FORCE_PAINFUL
	w_class = ITEM_SIZE_NORMAL
	armor_penetration = ARMOR_PEN_HALF
	structure_damage_factor = STRUCTURE_DAMAGE_DESTRUCTIVE
	tool_qualities = list(QUALITY_HAMMERING = 20)
	max_upgrades = 3
	price_tag = 3500 // It has durasteel spikes
	matter = list(MATERIAL_WOOD = 4, MATERIAL_CARBON_FIBER = 1)

/obj/item/tool/knife/dagger/assassin/ubersaw //Waiting for code to be done to deal blood damage/take % of blood
	name = "\"Uber\" syringe-dagger"
	desc = "A strange weapon produced by some sort of unknown weaponsmith or long-gone company, likely one of only a few ever made. \
			Whoever made this was very pro-active about collecting samples in the middle of active combat. They probably lost their medical license."
	price_tag = 1900

/obj/item/tool/wrench/big_wrench/freedom
	name = "\"Freedom\" wrench"
	desc = "A strange weapon produced by some sort of unknown weaponsmith or long-gone company, likely one of only a few ever made. \
			The sign of a man is someone who can build and who can break, with a wrench like this, you'll do both."
	icon_state = "freedom_wrench"
	w_class = ITEM_SIZE_NORMAL
	tool_qualities = list(QUALITY_BOLT_TURNING = 80, QUALITY_HAMMERING = 80)
	matter = list(MATERIAL_PLASTEEL = 5)
	force = WEAPON_FORCE_BRUTAL
	structure_damage_factor = STRUCTURE_DAMAGE_DESTRUCTIVE
	throwforce = WEAPON_FORCE_PAINFUL
	degradation = 0.7
	max_upgrades = 4
	price_tag = 1500

/obj/item/tool/saw/hyper/doombringer
	name = "\"Doombringer\" chainsword"
	desc = "A strange weapon produced by some sort of unknown weaponsmith or long-gone company, likely one of only a few ever made. \
			The only thing they fear is you."
	icon_state = "rip_and_tear"
	item_state = "rip_and_tear"
	switched_on_icon_state = "rip_and_tear"
	switched_on_item_state = "rip_and_tear"
	wielded_icon = "rip_and_tear_on"
	hitsound = WORKSOUND_CHAINSAW
	worksound = WORKSOUND_CHAINSAW
	force = WEAPON_FORCE_DANGEROUS
	switched_on_forcemult = 4.4 //88
	w_class = ITEM_SIZE_NORMAL
	armor_penetration = ARMOR_PEN_DEEP
	switched_on_penmult = 2.5 //50
	matter = list(MATERIAL_SILVER = 2, MATERIAL_PLASTEEL = 10, MATERIAL_PLASTIC = 3)
	tool_qualities = list(QUALITY_SAWING = 70, QUALITY_CUTTING = 60, QUALITY_WIRE_CUTTING = 30)
	max_upgrades = 1//Already over powered.
	degradation = 0.1
	use_power_cost = 1
	suitable_cell = /obj/item/cell/medium
	price_tag = 1850

/obj/item/tool/saw/hyper/doombringer/turn_on(mob/user)
	if (cell && cell.charge >= 1)
		item_state = "[initial(item_state)]_on"
		to_chat(user, SPAN_NOTICE("You rev up the [src]."))
		to_chat(user, SPAN_WARNING("\red <font size=3><b>Rip and Tear, until it is DONE.</b></font>")) // Berserk pack active
		playsound(loc, 'sound/items/chainsaw_on.ogg', 40)

	else
		item_state = initial(item_state)
		to_chat(user, SPAN_WARNING("[src]'s battery is dead or missing."))
	..()

/obj/item/tool/saw/hyper/doombringer/turn_off(mob/user)
	item_state = initial(item_state)
	playsound(loc, 'sound/items/chainsaw_off.ogg', 80)
	to_chat(user, SPAN_NOTICE("You turn the [src] off."))
	..()


//Armor


//Tools and tool mods (these are for things not intended for fighting but for actual tools)
