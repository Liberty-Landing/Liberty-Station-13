/*
 * Baseline Helmets
 */

//Regular Helmets
/obj/item/clothing/head/helmet
	name = "helmet"
	desc = "Standard operator gear. Protects the head from impacts."
	icon_state = "helmet"
	item_state_slots = list(
		slot_l_hand_str = "helmet",
		slot_r_hand_str = "helmet",
		)
	item_flags = THICKMATERIAL
	body_parts_covered = HEAD | EARS
	armor_list = list(
		melee = 35,
		bullet = 25,
		energy = 20,
		bomb = 25,
		bio = 0,
		rad = 0
	)
	flags_inv = HIDEEARS
	cold_protection = HEAD
	min_cold_protection_temperature = HELMET_MIN_COLD_PROTECTION_TEMPERATURE
	heat_protection = HEAD
	max_heat_protection_temperature = HELMET_MAX_HEAT_PROTECTION_TEMPERATURE
	siemens_coefficient = 0.7
	w_class = ITEM_SIZE_NORMAL
	price_tag = 100
	tool_qualities = list(QUALITY_ARMOR = 100)
	max_upgrades = 1

/obj/item/clothing/head/helmet/tanker
	name = "tanker helmet"
	desc = "Protects the head from damage while you are in a mech or joy riding the cargo trolley."
	icon_state = "tanker_helmet"
	item_flags = THICKMATERIAL
	flags_inv = HIDEEARS|BLOCKHAIR
	siemens_coefficient = 1
	price_tag = 160
	armor_list = list(
		melee = 15,
		bullet = 15,
		energy = 0,
		bomb = 0,
		bio = 0,
		rad = 0
	)

/obj/item/clothing/head/armor/helmet/tanker/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Black"] = "tanker_helmet"
	options["Green"] = "tanker_helmet_green"
	options["Brown"] = "tanker_helmet_brown"
	options["Gray"] = "tanker_helmet_gray"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		to_chat(M, "You adjusted your helmet's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/head/helmet/biker
	name = "biker helmet"
	desc = "A helmet usually worn by bikers to protect their heads. This one comes in black."
	icon_state = "celty" // Durarara reference
	item_state = "celty"
	item_flags = THICKMATERIAL
	flags_inv = HIDEEARS|BLOCKHAIR|HIDEEYES|BLOCKFACEHAIR|HIDEFACE //Speaking with one on should be muffled
	price_tag = 150
	armor_list = list(
		melee = 20,
		bullet = 10,
		energy = 5,
		bomb = 15, // Shock-absorbent
		bio = 0,
		rad = 0
	)

/obj/item/clothing/head/helmet/biker/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Black"] = "celty"
	options["White"] = "celty_white"
	options["Red"] = "celty_red"
	options["Green"] = "celty_green"
	options["Blue"] = "celty_blue"
	options["Purple"] = "celty_purple"
	options["Pink"] = "celty_pink"
	options["Yellow"] = "celty_yellow"
	options["Rugby"] = "rugby"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		to_chat(M, "You adjusted your helmet's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/head/helmet/handmade
	name = "handmade combat helmet"
	desc = "It looks like it was made from a bucket and some steel. Uncomfortable and heavy but better than nothing."
	icon_state = "hm_helmet"
	armor_list = list(
		melee = 25,
		bullet = 10,
		energy = 20,
		bomb = 10,
		bio = 0,
		rad = 0
	)
	price_tag = 75
	max_upgrades = 2

/obj/item/clothing/head/helmet/handmade/greathelm
	name = "bucket-helm"
	desc = "A bucket with two holes for eyes and some smaller ones for ventilation, with steel added to gain some protection. One may say, <i>'Situla Vult!'</i>."
	icon_state = "hm_greathelm"
	armor_list = list(melee = 27, bullet = 15,energy = 25, bomb = 12, bio = 1, rad = 0) // Only difference with handmade combat helmet is 2 sheets of metal, shouldn't be that far superior.
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|BLOCKHAIR
	body_parts_covered = HEAD|FACE|EARS|EYES
	siemens_coefficient = 0.6
	price_tag = 85
	obscuration = MEDIUM_OBSCURATION

/obj/item/clothing/head/helmet/gladiator
	name = "gladiator helmet"
	desc = "Ave, Imperator, morituri te salutant."
	icon_state = "gladiator"
	armor_list = list(
		melee = 20,
		bullet = 10,
		energy = 10,
		bomb = 10,
		bio = 0,
		rad = 0
	)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|BLOCKHAIR
	body_parts_covered = HEAD|FACE|EARS
	siemens_coefficient = 1

/obj/item/clothing/head/helmet/steelpot
	name = "steelpot helmet"
	desc = "A titanium helmet of serbian origin. Still widely used despite being discontinued."
	icon_state = "steelpot"
	armor_list = list(melee = 35, bullet = 30, energy = 0, bomb = 30, bio = 0, rad = 0) // slightly buffed IHS helmet minus energy resistance
	flags_inv = BLOCKHEADHAIR|HIDEEARS
	body_parts_covered = HEAD|EARS
	siemens_coefficient = 1


/obj/item/clothing/head/helmet/visor/cyberpunkgoggle
	name = "\improper Type-34C Semi-Enclosed Head Wear"
	desc = "Civilian model of a popular helmet used by certain law enforcement agencies. It does not have any armor plating, but has a neo-laminated fabric lining."
	icon_state = "cyberpunkgoggle"
	flags_inv = HIDEEARS|HIDEEYES|BLOCKHAIR
	siemens_coefficient = 0.9	//More conductive than most helmets
	armor_list = list(
		melee = 5,
		bullet = 20,
		energy = 10,
		bomb = 0,
		bio = 0,
		rad = 0
	)

/obj/item/clothing/head/helmet/visor/cyberpunkgoggle/armored
	name = "\improper Type-34 Semi-Enclosed Headwear"
	desc = "Armored helmet used by certain law enforcement agencies. It's hard to believe there's someone somewhere behind that."
	armor_list = list(
		melee = 30,
		bullet = 30,
		energy = 30,
		bomb = 20,
		bio = 0,
		rad = 0
	)

/obj/item/clothing/head/helmet/mercenary
	name = "mercenary helmet"
	desc = "What happens when someone combines ablative, melee, and bullet plating in the form of a fetching tan and visor. Not as singularly powerful as each individually but the best all round protection one can get."
	icon_state = "merchelm"
	armor_list = list(melee = 55, bullet = 55, energy = 55, bomb = 45, bio = 0, rad = 0) // best what you can get
	obscuration = LIGHT_OBSCURATION

/obj/item/clothing/head/helmet/generic_full
	name = "full helmet"
	desc = "A generic non-branded full cover helmet with decent all round protection."
	icon_state = "helmet_full"
	armor_list = list(melee = 30, bullet = 30, energy = 30, bomb = 25, bio = 10, rad = 10)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|BLOCKHAIR
	body_parts_covered = HEAD|FACE|EARS
	obscuration = LIGHT_OBSCURATION

/obj/item/clothing/head/helmet/swat
	name = "\improper SWAT helmet"
	desc = "These are often used by highly trained SWAT Members."
	icon_state = "swat"
	armor_list = list(melee = 80, bullet = 60, energy = 40, bomb = 50, bio = 10, rad = 0)
	flags_inv = HIDEEARS|HIDEEYES
	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_HELMET_MIN_COLD_PROTECTION_TEMPERATURE
	siemens_coefficient = 0.5
	price_tag = 150

/obj/item/clothing/head/helmet/ballistic
	name = "ballistic helmet"
	desc = "Standard military gear. Protects the head from impacts and shrapnel."
	icon_state = "helmet_mil"
	armor_list = list(melee = 30, bullet = 40, energy = 20, bomb = 30, bio = 0, rad = 0)

/obj/item/clothing/head/helmet/ballistic/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Baseline"] = "helmet_mil_alt"
	options["Green"] = "helmet_green"
	options["Tan"] = "helmet_tan"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		to_chat(M, "You adjusted your attire's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/*
 * Factions
 */

//Watchmen
/obj/item/clothing/head/helmet/marshal
	name = "watchmen helmet"
	desc = "Standard operator gear. Protects the head from impacts. Painted in Watchmen colors and features an eye shield"
	icon_state = "watch_helmet"
	icon_state = "watch_helmet"
	armor_list = list(melee = 30, bullet = 30,energy = 25, bomb = 25, bio = 70, rad = 0)
	body_parts_covered = HEAD|EYES|EARS

/obj/item/clothing/head/helmet/warrant_officer
	name = "warrant officer full helmet"
	desc = "A full helmet with a built in glow visor. This one appears to be fitted with new visor servos internally to protect from flashes as well as a bullet-proof reinforced mouth guard!"
	icon_state = "watch_deputy_helm"
	item_state = "watch_deputy_helm"
	flash_protection = FLASH_PROTECTION_MODERATE
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|BLOCKHAIR
	armor_list = list(melee = 50, bullet = 50, energy = 30, bomb = 10, bio = 100, rad = 0)

/obj/item/clothing/head/helmet/warrant_officer/update_icon()
	if(on)
		icon_state = "watch_deputy_helm_on"
		set_light(2, 2, COLOR_LIGHTING_ORANGE_MACHINERY)
	else
		icon_state = "watch_deputy_helm"
		set_light(0, 0)
	update_wear_icon()
	..()

//Custodians


/obj/item/clothing/head/helmet/custodian
	name = "custodian helmet base item"
	desc = "Not supposed to be seen in-game"
	icon_state = "oathbound_helmet"
	item_state = "oathbound_helmet"
	armor_list = list(melee = 30, bullet = 30, energy = 30, bomb = 30, bio = 0, rad = 0)
	max_upgrades = 2
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|BLOCKHAIR
	body_parts_covered = HEAD|FACE|EARS
	obscuration = LIGHT_OBSCURATION
	heat_protection = HEAD|FACE|EARS
	max_heat_protection_temperature = FIRESUIT_MAX_HEAT_PROTECTION_TEMPERATURE
	cold_protection = HEAD|FACE|EARS
	min_cold_protection_temperature = T0C - 20
	matter = list(MATERIAL_STEEL = 15, MATERIAL_PLASTEEL = 13, MATERIAL_BIO_SILK = 30, MATERIAL_PLASTIC = 10)

/obj/item/clothing/head/helmet/custodian/firesuit
	name = "flameshield helmet"
	desc = "A helmet used by the Custodians to operate the Bonfire and to protect them from high heat sources. \
	Flameshield suits are composed of specialized threads and porous foam that offer no protection whatsoever to physical trauma, energy weaponry, and other forms of damage."
	icon_state = "custodian_firehelmet"
	item_state = "custodian_firehelmet"
	armor_list = list(melee = 0, bullet = 0, energy = 0, bomb = 0, bio = 0, rad = 0)
	slowdown = 1.5
	matter = list(MATERIAL_BIO_SILK = 10)

/obj/item/clothing/head/helmet/custodian/oathbound
	name = "oathbound helmet"
	desc = "A forged helm made for the front lines of the Custodians, the Oathbound. The unique design and materials keep the fire at bay."
	icon_state = "oathbound_helmet"
	item_state = "oathbound_helmet"

/obj/item/clothing/head/helmet/custodian/enkindled
	name = "enkindled helmet"
	desc = "A helmet design tooled after ancient healing legends, made for the Enkindled, incredibly resistant to fire."
	icon_state = "enkindled_helmet"
	item_state = "enkindled_helmet"

/obj/item/clothing/head/helmet/custodian/forgemaster
	name = "forgemaster helmet"
	desc = "A helmet designed to keep the user safe from hot sparks and searing heat, made for the Forgemasters."
	icon_state = "forgemaster_helmet"
	item_state = "forgemaster_helmet"

/obj/item/clothing/head/helmet/custodian/oathpledge
	name = "oathpledge helmet"
	desc = "A helmet for the leaders and guides of the Custodians, this design is extremely resistant to damage."
	icon_state = "oathpledge_helmet"
	item_state = "oathpledge_helmet"
	armor_list = list(melee = 40, bullet = 40, energy = 40, bomb = 40, bio = 100, rad = 0)
	matter = list(MATERIAL_STEEL = 30, MATERIAL_PLASTEEL = 16, MATERIAL_BIO_SILK = 30, MATERIAL_PLASTIC = 15)

//Hunter's Lodge
/obj/item/clothing/head/helmet/huntmaster_helmet
	name = "huntmaster nomad helm"
	desc = "Made from the hide of a render patriarch, this visored helmet made of bone and leather with glass lenses to keep blood and grit from the eyes. \
			There is a small chimera etched into the bone on the rear of the helmet."
	item_state = "huntmaster_helmet"
	icon_state = "huntmaster_helmet"
	armor_list = list(
		melee = 60,
		bullet = 20,
		energy = 15,
		bomb = 15,
		bio = 15,
		rad = 0
	)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|BLOCKHAIR
	body_parts_covered = HEAD|FACE|EARS

/obj/item/clothing/head/helmet/huntmaster_helmet/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["huntmaster horned nomad helm"] = "huntmaster_helmet"
	options["huntmaster horned helm long snout"] = "huntmaster_helmet_alt"
	options["huntmaster hornless nomad helm"] = "huntmaster_helmet_hornless"
	options["huntmaster hornless helm long snout"] = "huntmaster_helmet_hornless_alt"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		to_chat(M, "You adjusted your helmet's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/head/helmet/hunter
	name = "hunter's hood"
	desc = "A visored helmet made of bone and leather with glass lenses to keep blood and grit from the eyes."
	item_state = "hunter_helmet"
	icon_state = "hunter_helmet"
	armor_list = list(
		melee = 60,
		bullet = 10,
		energy = 5,
		bomb = 0,
		bio = 10,
		rad = 0
	)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|BLOCKHAIR
	body_parts_covered = HEAD|FACE|EARS

/obj/item/clothing/head/helmet/hunter/stalker
	item_state = "hunter_helmet_stalker"
	icon_state = "hunter_helmet_stalker"

/obj/item/clothing/head/helmet/hunter/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["combat helmet"] = "hunter_helmet"
	options["stalker hood"] = "hunter_helmet_stalker"
	options["visored helmet"] = "hunter_helmet_visor"
	options["nomad hooded-helm"] = "hunter_helmet_nomad"
	options["nomad helm long snout"] = "hunter_helmet_nomad_alt"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		to_chat(M, "You adjusted your helmet's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

//Guild
/obj/item/clothing/head/helmet/technomancersuit
	name = "'Mark V' environmental protection helmet"
	desc = "You feel like this helmet is rare, for some reason."
	icon_state = "technohelmet"
	armor_list = list(melee = 40, bullet = 40, energy = 40, bomb = 60, bio = 100, rad = 100)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|BLOCKHAIR
	body_parts_covered = HEAD|FACE|EARS
	flash_protection = FLASH_PROTECTION_MODERATE
	action_button_name = "Toggle Headlamp"
	light_overlay = "technohelmet_light"
	brightness_on = 4
	max_upgrades = 2
	obscuration = LIGHT_OBSCURATION

/obj/item/clothing/head/helmet/technomancersuit/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Environmental Default Helmet"] = "technohelmet"
	options["Anthro Helmet"] = "technohelmet_anthro"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		item_state = options[choice]
		to_chat(M, "You adjusted your mask's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

//PIRS
/obj/item/clothing/head/helmet/pirssuit
	name = "'Mark II' environmental protection helmet"
	desc = "You feel like this helmet is cheap, for some reason."
	icon_state = "science_helmet"
	item_state = "science_helmet"
	armor_list = list(melee = 15, bullet = 15, energy = 25, bomb = 35, bio = 50, rad = 50)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|BLOCKHAIR
	body_parts_covered = HEAD|FACE|EARS
	matter = list(MATERIAL_STEEL = 20)
	flash_protection = FLASH_PROTECTION_MINOR
	max_upgrades = 2

// CAPSA

/obj/item/clothing/head/helmet/pirssuit/cso
	name = "Surgeon Overseer's cowl helmet"
	desc = "An airtight and sterile helmet in the form of a plague doctor's mask, hooded with silk fibroins. \
			Offers excellent protection against bacteria and doubles as a gas mask."
	icon_state = "plague_knight"
	item_state = "plague_knight"
	armor_list = list(melee = 35, bullet = 25, energy = 20, bomb = 35, bio = 100, rad = 75)
	obscuration = LIGHT_OBSCURATION
	flash_protection = FLASH_PROTECTION_MODERATE

//////////////

/*
 * Racial / Lore
 */

/obj/item/clothing/head/armor/helmet/penance
	name = "penance helmet"
	desc = "An old iron-wrought helmet upon a chainmail coif. These were resurrected from the time of castle retinues to serve again upon the heads of terrified conscripts and penal soldiers in the battle of Krios when the surplus of kevlar dwindled to a luxury; now only a distant piece of trash on a disconnected world. Among Kriosians, wearing this is a sign of penance and military ritual. Among Men, it is poverty and desperation interchanged."
	icon_state = "helmet_kriosanpenace"
	flags_inv = BLOCKHAIR
	armor_list = list(
		melee = 15,
		bullet = 15,
		energy = 0,
		bomb = 10,
		bio = 0,
		rad = 0
	)

/obj/item/clothing/head/armor/helmet/frog
	name = "mar'qua helmet"
	desc = "A very old helmet from times of the first mar'qua spacefarers. It is beaten around the edges and made out of metal instead of polymer and alloys like the modern ones. Still for the mar'qua in the colony this is probably the best they have."
	icon_state = "helmet_frog"
	flags_inv = BLOCKHAIR
	armor_list = list(
		melee = 20,
		bullet = 20,
		energy = 5,
		bomb = 10,
		bio = 0,
		rad = 0
	)

/*
 * Special helmets
 */
//Bulletproof
/obj/item/clothing/head/helmet/bulletproof
	name = "bulletproof helmet"
	desc = "A bulletproof security helmet that excels in protecting the wearer against traditional projectile weaponry and explosives to a minor extent."
	icon_state = "bulletproof"
	body_parts_covered = HEAD | EARS | FACE
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|BLOCKHAIR
	armor_list = list(
		melee = 25,
		bullet = 60,
		energy = 25,
		bomb = 10,
		bio = 0,
		rad = 0
	)
	price_tag = 250

//Ablatives
/obj/item/clothing/head/helmet/laserproof
	name = "ablative helmet"
	desc = "A helmet that excels in protecting the wearer against energy projectiles."
	icon_state = "ablative"
	armor_list = list(melee = 30, bullet = 30, energy = 75, bomb = 50, bio = 10, rad = 0)
	flags_inv = HIDEEARS|HIDEEYES
	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_HELMET_MIN_COLD_PROTECTION_TEMPERATURE
	siemens_coefficient = 0.5
	price_tag = 150
	obscuration = LIGHT_OBSCURATION

/obj/item/clothing/head/helmet/laserproof/marshal
	icon_state = "watch_ablative"
	item_state = "watch_ablative"

/obj/item/clothing/head/helmet/laserproof/iron_lock_security
	name = "outdated ablative helmet"
	desc = "A \"Iron Lock Security\" helmet that excels in protecting the wearer against energy projectiles this even after all these years still is the base of ablative helmet design. Produced by Similacrum Robotics"
	icon_state = "ablative"
	armor_list = list(melee = 20, bullet = 20, energy = 70, bomb = 50, bio = 10, rad = 0)
	flags_inv = HIDEEARS|HIDEEYES
	cold_protection = HEAD
	matter = list(MATERIAL_STEEL = 5, MATERIAL_PLASTIC = 10, MATERIAL_PLATINUM = 2) //cheaper
	min_cold_protection_temperature = SPACE_HELMET_MIN_COLD_PROTECTION_TEMPERATURE
	siemens_coefficient = 0.5
	price_tag = 150

//Thunderdome
/obj/item/clothing/head/helmet/thunderdome
	name = "\improper Thunderdome helmet"
	desc = "<i>'Let the battle commence!'</i>"
	icon_state = "thunderdome"
	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_HELMET_MIN_COLD_PROTECTION_TEMPERATURE
	siemens_coefficient = 1

/*
 * Special helmets with HUDs
 */

//Security
/obj/item/clothing/head/helmet/riot_hud
	name = "watchmen riot helmet"
	desc = "Standard-issue liberty watch helmet with a basic HUD and targeting system included, produced by Seinemetall Defense GmbH after more classic riot helmets were not able to handle the day to day riots."
	icon_state = "watch_riot"
	item_state = "watch_riot"
	flags_inv = HIDEEARS|BLOCKHAIR
	body_parts_covered = HEAD|FACE|EARS
	armor_list = list(
		melee = 60,
		bullet = 25,
		energy = 25,
		bomb = 25,
		bio = 0,
		rad = 0
	)
	item_flags = THICKMATERIAL | COVER_PREVENT_MANIPULATION
	flash_protection = FLASH_PROTECTION_MODERATE
	var/last_toggle = 0
	var/toggle_delay = 2 SECONDS
	action_button_name = "Toggle Security Hud"
	var/obj/item/clothing/glasses/hud/security/hud
	price_tag = 300

/obj/item/clothing/head/helmet/riot_hud/New()
	..()
	hud = new(src)
	hud.canremove = FALSE

/obj/item/clothing/head/helmet/riot_hud/ui_action_click()
	if(..())
		return TRUE
	toggle()

/obj/item/clothing/head/helmet/riot_hud/verb/toggle()
	set name = "Toggle Riot HUD"
	set desc = "Shows you jobs and criminal statuses"
	set category = "Object"
	var/mob/user = loc
	if(usr.stat || user.restrained())
		return
	if(user.get_equipped_item(slot_head) != src)
		return
	if(hud in src)
		if(user.equip_to_slot_if_possible(hud, slot_glasses) && world.time > last_toggle)
			to_chat(user, "You flip down [src] HUD goggles with a high-pitched whine.")
			last_toggle = world.time + toggle_delay
			hud.toggle(user, TRUE)//Turns the goggles on
			update_icon()
		else
			to_chat(user, "You are wearing something which is in the way or trying to flip the googles too fast!")
	else
		if(ismob(hud.loc) && world.time > last_toggle)
			last_toggle = world.time + toggle_delay
			var/mob/hud_loc = hud.loc
			hud_loc.drop_from_inventory(hud, src)
			hud.toggle(user, FALSE)//Turns the goggles off so they won't drain power while retracted
			to_chat(user, "You flip up [src] HUD goggles, turning them off.")
			hud.forceMove(src)
		else
			to_chat(user, "You can't pull off the goggles so fast!")
		update_icon()
	usr.update_action_buttons()

/obj/item/clothing/head/helmet/riot_hud/dropped(usr)
	..()
	if(hud.loc != src)
		if(ismob(hud.loc))
			var/mob/hud_loc = hud.loc
			hud_loc.drop_from_inventory(hud, src)
			to_chat(hud_loc, "[hud] automaticly retract in [src].")
		hud.forceMove(src)
		update_icon()

/obj/item/clothing/head/helmet/riot_hud/update_icon()
	if(hud in src)
		icon_state = "watch_riot"
		set_light(0, 0)
	else
		icon_state = "watch_riot_on"
		set_light(2, 2, COLOR_LIGHTING_ORANGE_MACHINERY)
	update_wear_icon()
	..()

//Nightvision
/obj/item/clothing/head/helmet/bulletproof/ironhammer_nvg
	name = "watch tactical bulletproof helmet"
	desc = "A bulletproof security helmet that excels in protecting the wearer against traditional projectile weaponry and explosives to a minor extent. \
			Comes with inbuilt nightvision HUD."
	icon_state = "watch_nvg"
	body_parts_covered = HEAD | EARS
	flags_inv = NONE
	action_button_name = "Toggle Night Vision"
	var/obj/item/clothing/glasses/powered/nightvision_helmet/hud
	var/last_toggle = 0
	var/toggle_delay = 2 SECONDS
	price_tag = 600

/obj/item/clothing/head/helmet/bulletproof/ironhammer_nvg/New()
	..()
	hud = new(src)
	hud.canremove = FALSE

/obj/item/clothing/head/helmet/bulletproof/ironhammer_nvg/ui_action_click()
	if(..())
		return TRUE
	toggle()

/obj/item/clothing/head/helmet/bulletproof/ironhammer_nvg/verb/toggle()
	set name = "Toggle Night Vision HUD"
	set desc = "Allows you to see in the dark."
	set category = "Object"
	var/mob/user = loc
	if(usr.stat || user.restrained())
		return
	if(user.get_equipped_item(slot_head) != src)
		return
	if(hud in src)
		if(user.equip_to_slot_if_possible(hud, slot_glasses) && world.time > last_toggle)
			to_chat(user, "You flip down [src] night vision goggles with a high-pitched whine.")
			last_toggle = world.time + toggle_delay
			hud.toggle(user, TRUE)
			update_icon()
		else
			to_chat(user, "You are wearing something which is in the way or trying to flip the googles too fast!")
	else
		if(ismob(hud.loc) && world.time > last_toggle)
			last_toggle = world.time + toggle_delay
			var/mob/hud_loc = hud.loc
			hud_loc.drop_from_inventory(hud, src)
			hud.toggle(user, FALSE)
			to_chat(user, "You flip up [src] night vision goggles, turning them off.")
			hud.forceMove(src)
		else
			to_chat(user, "You can't pull off the goggles so fast!")
		update_icon()
	usr.update_action_buttons()

/obj/item/clothing/head/helmet/bulletproof/ironhammer_nvg/dropped(usr)
	..()
	if(hud.loc != src)
		if(ismob(hud.loc))
			var/mob/hud_loc = hud.loc
			hud_loc.drop_from_inventory(hud, src)
			to_chat(hud_loc, "[hud] automaticly retract in [src].")
		hud.forceMove(src)
		update_icon()

/obj/item/clothing/head/helmet/bulletproof/ironhammer_nvg/update_icon()
	if(hud in src)
		icon_state = "watch_nvg"
		set_light(0, 0)
	else
		icon_state = "watch_nvg_on"
		set_light(1, 1, COLOR_LIGHTING_GREEN_MACHINERY)
	update_wear_icon()
	..()

//Thermal - No
/*
/obj/item/clothing/head/helmet/bulletproof/ironhammer_thermal
	name = "marshal thermo-nightvision helmet"
	desc = "A bulletproof security helmet that excels in protecting the wearer against traditional projectile weaponry and explosives to a minor extent. \
			Comes with inbuilt thermal imaging HUD."
	icon_state = "bulletproof_ironhammer_thermal"
	body_parts_covered = HEAD|EARS
	flags_inv = NONE
	action_button_name = "Toggle Thermal Night Vision HUD"
	var/last_toggle = 0
	var/toggle_delay = 2 SECONDS
	var/obj/item/clothing/glasses/powered/thermal/thermal_helmet/hud
	price_tag = 2000

/obj/item/clothing/head/helmet/bulletproof/ironhammer_thermal/New()
	..()
	hud = new(src)
	hud.canremove = FALSE

/obj/item/clothing/head/helmet/bulletproof/ironhammer_thermal/ui_action_click()
	if(..())
		return TRUE
	toggle()

/obj/item/clothing/head/helmet/bulletproof/ironhammer_thermal/verb/toggle()
	set name = "Toggle Thermal Night Vision HUD"
	set desc = "Allows you to see in the dark."
	set category = "Object"
	var/mob/user = loc
	if(usr.stat || user.restrained())
		return
	if(user.get_equipped_item(slot_head) != src)
		return
	if(hud in src)
		if(user.equip_to_slot_if_possible(hud, slot_glasses) && world.time > last_toggle)
			to_chat(user, "You flip down [src] thermal imaging goggles with a high-pitched whine.")
			last_toggle = world.time + toggle_delay
			hud.toggle(user, TRUE)
			update_icon()
		else
			to_chat(user, "You are wearing something which is in the way or trying to flip the googles too fast!")
	else
		if(ismob(hud.loc) && world.time > last_toggle)
			last_toggle = world.time + toggle_delay
			var/mob/hud_loc = hud.loc
			hud_loc.drop_from_inventory(hud, src)
			hud.toggle(user, FALSE)
			to_chat(user, "You flip up [src] thermal imaging goggles, turning them off.")
			hud.forceMove(src)
		else
			to_chat(user, "You can't pull off the goggles so fast!")
		update_icon()
	usr.update_action_buttons()

/obj/item/clothing/head/helmet/bulletproof/ironhammer_thermal/dropped(usr)
	..()
	if(hud.loc != src)
		if(ismob(hud.loc))
			var/mob/hud_loc = hud.loc
			hud_loc.drop_from_inventory(hud, src)
			to_chat(hud_loc, "[hud] automaticly retract in [src].")
		hud.forceMove(src)
		update_icon()

/obj/item/clothing/head/helmet/bulletproof/ironhammer_thermal/update_icon()
	if(hud in src)
		icon_state = "bulletproof_ironhammer_thermal"
		set_light(0, 0)
	else
		icon_state = "bulletproof_ironhammer_thermal_on"
		set_light(1, 1, COLOR_LIGHTING_RED_BRIGHT)
	update_wear_icon()
	..()
*/
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/*
 * Faceshield Helmets
 */


// toggleable face guard
/obj/item/clothing/head/helmet/faceshield
	//We cant just use the armor var to store the original since initial(armor) will return a null pointer
	var/tint_down = TINT_LOW
	var/tint_up = TINT_NONE
	var/obscuration_down = MEDIUM_OBSCURATION
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|BLOCKHEADHAIR
	var/flags_inv_up = HIDEEARS
	body_parts_covered = HEAD|EARS|EYES|FACE
	var/body_parts_covered_up = HEAD|EARS
	flash_protection = FLASH_PROTECTION_MODERATE
	var/flash_protection_up = FLASH_PROTECTION_NONE
	action_button_name = "Flip Face Shield"
	tool_qualities = list()
	max_upgrades = 0
	var/list/armor_up = list()
	var/up = FALSE
	var/base_state

/obj/item/clothing/head/helmet/faceshield/riot
	name = "riot helmet"
	desc = "It's a outdated helmet specifically designed to protect against close range attacks."
	icon_state = "riot"
	armor_up = list(melee = 35, bullet = 25, energy = 25, bomb = 20, bio = 0, rad = 0)
	armor_list = list(melee = 40, bullet = 40, energy = 30, bomb = 35, bio = 0, rad = 0)
	item_flags = THICKMATERIAL | COVER_PREVENT_MANIPULATION
	price_tag = 150

/obj/item/clothing/head/helmet/faceshield/attack_self()
	if(!base_state)
		base_state = icon_state
	toggle()

/obj/item/clothing/head/helmet/faceshield/update_icon()
	if(!base_state)
		base_state = icon_state
	if(up)
		icon_state = "[base_state]_up"
	else
		icon_state = "[base_state]"

/obj/item/clothing/head/helmet/faceshield/refresh_upgrades()
	. = ..()
	if(!base_state)
		base_state = icon_state
	if(up)
		armor = getArmor(arglist(armor_up))
		flash_protection = flash_protection_up
		tint = tint_up
		obscuration = initial(obscuration)
		flags_inv = flags_inv_up
		body_parts_covered = body_parts_covered_up
	else
		flash_protection = initial(flash_protection)
		tint = initial(tint)
		obscuration = initial(obscuration)
		flags_inv = initial(flags_inv)
		body_parts_covered = initial(body_parts_covered)

//I wanted to name it set_up() but some how I thought that would be misleading
/obj/item/clothing/head/helmet/faceshield/proc/set_is_up(is_up)
	if(up == is_up) return
	up = is_up

	refresh_upgrades()

	update_icon()
	update_wear_icon()	//update our mob overlays

/obj/item/clothing/head/helmet/faceshield/verb/toggle()
	set category = "Object"
	set name = "Adjust face shield"
	set src in usr

	if(!usr.incapacitated())
		src.set_is_up(!src.up)

		if(src.up)
			to_chat(usr, "You push the [src] up out of your face.")
		else
			to_chat(usr, "You flip the [src] down to protect your face.")

		usr.update_action_buttons()

// S E R B I A //

/obj/item/clothing/head/helmet/faceshield/altyn
	name = "altyn helmet"
	desc = "A titanium helmet of serbian origin. Still widely used despite being discontinued."
	icon_state = "altyn"
	armor_up = list(melee = 20, bullet = 15, energy = 0, bomb = 15, bio = 0, rad = 0)
	armor_list = list(melee = 40, bullet = 45, energy = 10, bomb = 35, bio = 0, rad = 0)
	siemens_coefficient = 1
	up = TRUE

/obj/item/clothing/head/helmet/faceshield/altyn/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Baseline"] = "altyn"
	options["Brown"] = "altyn_brown"
	options["Black"] = "altyn_black"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		base_state = options[choice]
		icon_state = options[choice]
		item_state = options[choice]
		if(up)
			icon_state = "[base_state]up"
		item_state_slots = list(
		slot_l_hand_str = options[choice],
		slot_r_hand_str = options[choice],
		)
		to_chat(M, "You adjusted your helmet's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/head/helmet/faceshield/altyn/ironhammer
	icon_state = "watch_altyn"

/obj/item/clothing/head/helmet/faceshield/altyn/maska
	name = "maska helmet"
	desc = "\"I do not know who I am, I don\'t know why I\'m here. All I know is that I must kill.\""
	icon_state = "maska"
	armor_list = list(melee = 55, bullet = 55, energy = 0, bomb = 45, bio = 0, rad = 0) // best what you can get, unless you face lasers


/obj/item/clothing/head/helmet/faceshield/altyn/maska/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["maska"] = "maska"
	options["maska killa"] = "maska_killa"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		base_state = options[choice]
		icon_state = options[choice]
		item_state = options[choice]
		if(up)
			icon_state = "[base_state]up"
		item_state_slots = list(
		slot_l_hand_str = options[choice],
		slot_r_hand_str = options[choice],
		)
		to_chat(M, "You adjusted your helmet's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/head/helmet/faceshield/altyn/milisha/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["maska dark camo"] = "maska_bs"
	options["maska forest camo"] = "maska_bs_green"
	options["maska red rock camo"] = "maska_bs_tan"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		base_state = options[choice]
		icon_state = options[choice]
		item_state = options[choice]
		if(up)
			icon_state = "[base_state]up"
		item_state_slots = list(
		slot_l_hand_str = options[choice],
		slot_r_hand_str = options[choice],
		)
		to_chat(M, "You adjusted your helmet's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/head/helmet/faceshield/paramedic
	name = "advanced paramedic helmet"
	desc = "A smart helmet that aids in medical tracking. It will periodically alert its user of people in critical condition."
	description_info = "Tracking of suit sensors' alert can be turned off by alt-clicking the helmet."
	icon_state = "paramed_helm"
	item_state = "paramed_helm"
	flags_inv = HIDEEARS|BLOCKHAIR
	item_flags = BLOCK_GAS_SMOKE_EFFECT|AIRTIGHT
	tint_down = TINT_NONE
	obscuration_down = LIGHT_OBSCURATION
	matter = list(
		MATERIAL_PLASTEEL = 10,
		MATERIAL_GLASS = 5,
		MATERIAL_PLASTIC = 5,
		MATERIAL_PLATINUM = 2
		)
	armor_up = list(melee = 5, bullet = 20, energy = 10, bomb = 10, bio = 100, rad = 50)
	armor_list = list(melee = 25, bullet = 25, energy = 25, bomb = 20, bio = 100, rad = 50)
	up = TRUE
	var/speaker_enabled = TRUE
	var/scan_scheduled = FALSE
	var/scan_interval = 15 SECONDS
	var/repeat_report_after = 60 SECONDS
	var/list/crewmembers_recently_reported = list()

/obj/item/clothing/head/helmet/faceshield/paramedic/equipped(mob/M)
	. = ..()
	schedule_scan()

/obj/item/clothing/head/helmet/faceshield/paramedic/proc/schedule_scan()
	if(scan_scheduled)
		return

	if(!speaker_enabled)
		return

	scan_scheduled = TRUE
	spawn(scan_interval)
		if(QDELETED(src))
			return
		scan_scheduled = FALSE
		report_health_alerts()


/obj/item/clothing/head/helmet/faceshield/paramedic/proc/schedule_memory_cleanup(entry)
	spawn(repeat_report_after)
		if(QDELETED(src))
			return
		crewmembers_recently_reported.Remove(entry)


/obj/item/clothing/head/helmet/faceshield/paramedic/proc/report_health_alerts()
	if(!speaker_enabled)
		return

	if(!ishuman(loc))
		return

	var/mob/living/carbon/human/user = loc

	var/list/crewmembers = list()
	var/list/z_levels_to_scan = list(1, 2, 3, 4, 5, 8, 9)

	for(var/z_level in z_levels_to_scan)
		crewmembers += crew_repository.health_data(z_level)

	if(crewmembers.len)
		for(var/i = 1, i <= crewmembers.len, i++)
			var/list/entry = crewmembers[i]
			if(entry["alert"] && !entry["muted"])
				if(entry["name"] in crewmembers_recently_reported)
					continue
				crewmembers_recently_reported += entry["name"]
				schedule_memory_cleanup(entry["name"])
				to_chat(user, SPAN_WARNING("[src] beeps: '[entry["name"]]'s on-suit sensors broadcast an emergency signal. Access monitoring software for details.'"))

	schedule_scan()

/obj/item/clothing/head/helmet/faceshield/paramedic/AltClick()
	toogle_speaker()

/obj/item/clothing/head/helmet/faceshield/paramedic/verb/toogle_speaker()
	set name = "Toogle helmet's speaker"
	set category = "Object"
	set src in usr

	if(speaker_enabled)
		to_chat(usr, SPAN_WARNING("[src] beeps: 'Notifications disabled.'"))
		speaker_enabled = FALSE
	else
		to_chat(usr, SPAN_WARNING("[src] beeps: 'Notifications enabled.'"))
		speaker_enabled = TRUE
		report_health_alerts()

/obj/item/clothing/head/helmet/faceshield/paramedic/toggle()
	set category = "Object"
	set name = "Adjust face shield"
	set src in usr

	if(!usr.incapacitated())
		src.set_is_up(!src.up)

		if(src.up)
			to_chat(usr, "You open the hatches of the [src].")
		else
			to_chat(usr, "You close the hatches of the [src] to protect your face.")

		usr.update_action_buttons()

/obj/item/clothing/head/helmet/pirssuit/cso
	name = "Chief Surgeon Overseer's plague helmet"
	desc = "A robust, airtight helmet with air filtration systems fashioned in the shape of a crow mask from the plague doctors of antiquity. \
			An exquisite pattern of silk fibroin adorns its exterior, giving it the appearance of a hood."
	icon_state = "plague_knight"
	item_state = "plague_knight"
	armor_list = list(melee = 35, bullet = 25, energy = 20, bomb = 35, bio = 100, rad = 75)
	obscuration = LIGHT_OBSCURATION
	flash_protection = FLASH_PROTECTION_MODERATE
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|BLOCKHAIR
	item_flags = BLOCK_GAS_SMOKE_EFFECT|AIRTIGHT // Doubles as gas mask, like the paramedic helmet
	body_parts_covered = HEAD|FACE|EARS
	matter = list(MATERIAL_STEEL = 20) // TODO: Add silk fibroin matter once it's coded in
	max_upgrades = 2

