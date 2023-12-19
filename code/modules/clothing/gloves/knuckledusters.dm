
/obj/item/clothing/gloves/dusters
	name = "steel knuckle dusters"
	desc = "More pain for them, less for you."
	description_info = "Have to be worn in your gloves slot to increase your punch damage."
	icon_state = "dusters"
	item_state = "dusters"
	min_cold_protection_temperature = null // They don't protect you from the cold at all!
	var/punch_increase = 5
	var/dusters_givith = FALSE
	var/to_remove_givith = FALSE
	price_tag = 10

/obj/item/clothing/gloves/dusters/dropped(var/mob/M)
	..()
	update_dusters(M)

/obj/item/clothing/gloves/dusters/equipped(var/mob/M)
	.=..()
	update_dusters(M)


/obj/item/clothing/gloves/dusters/proc/update_dusters(mob/living/carbon/human/user)
	if(istype(user))
		if(user.gloves == src && !dusters_givith)
			user.punch_damage_increase += punch_increase
			dusters_givith = TRUE
			to_remove_givith = TRUE
		if(to_remove_givith && !(user.gloves == src))
			user.punch_damage_increase -= punch_increase
			dusters_givith = FALSE
			to_remove_givith = FALSE

/obj/item/clothing/gloves/dusters/silver
	name = "silver knuckle dusters"
	desc = "More pain for them, more bling for you. Said to help protect the mind."
	icon_state = "dusters_silver"
	item_state = "dusters_silver"
	psi_blocking = 10
	price_tag = 30

/obj/item/clothing/gloves/dusters/plasteel
	name = "plasteel knuckle dusters"
	desc = "More pain for them, now doubled."
	icon_state = "dusters_plasteel"
	item_state = "dusters_plasteel"
	punch_increase = 10
	armor = list(
		melee = 15, //Just a litttttle bit of armor so your not defenceless
		bullet = 5,
		energy = 0,
		bomb = 0,
		bio = 0,
		rad = 0
	)
	price_tag = 20

/obj/item/clothing/gloves/dusters/scav_gloves
	name = "scavenged gloves"
	desc = "A pair of fluffy, reinforced combat gloves with plasteel knuckle dusters. \
			A jury-rigged work of art for those that value protection from whatever \
			they can scrap on the field, and throwing deadlier punches."
	icon_state = "scav_gloves"
	item_state = "scav_gloves"
	min_cold_protection_temperature = T0C - 5 // Gloves, not just dusters
	punch_increase = 10 // They're an upgrade, but let's not get out of hand.
	armor_list = list(
		melee = 35, // 10 more than combat, Plasteel reinforced
		bullet = 15,
		energy = 20, // No ablative materials means energy protection stays the same
		bomb = 10, // Plasteel protects a little bit against bombs
		bio = 0,
		rad = 0
	)
	price_tag = 200 // Combat gloves + plasteel knuckles price

/obj/item/clothing/gloves/dusters/gold
	name = "golden knuckle dusters"
	desc = "More pain for them, more style for you."
	icon_state = "dusters_gold"
	item_state = "dusters_gold"
	punch_increase = 10
	price_tag = 50

/obj/item/clothing/gloves/dusters/platinum
	name = "spiked platinum knuckle dusters"
	desc = "Hurt like hell, and stylish as well."
	icon_state = "dusters_platinum"
	item_state = "dusters_platinum"
	punch_increase = 15 // Made of platinum and are crafted with spikes, extra damage.
	price_tag = 30

// Custodian Druzhina-exclusive cestus. Ignites all living carbon forms in flames when punches connect.
/obj/item/clothing/gloves/dusters/flamecestus
    name = "Druzhina flame cestus"
    desc = "Silvery wrapping with hollow tubes for radiance to freight by fisting something. Coats the enemy in radiance to ignite."
    icon_state = "dusters_silver"
    item_state = "dusters_silver"
    punch_increase = 5 // Just a little extra damage, already strong by being able to light non-robots on fire.
    price_tag = 0


/obj/item/clothing/gloves/dusters/flamecestus/update_dusters(mob/living/carbon/human/user)
	if(istype(user))
		// Give us the flag that causes us to light people on fire with unarmed attacks.
		if(user.gloves == src && !dusters_givith)
			user.punch_damage_increase += punch_increase
			dusters_givith = TRUE
			to_remove_givith = TRUE
			user.shining_finger = TRUE
		// Remove the flag from us when we take off our gloves.
		if(to_remove_givith && !(user.gloves == src))
			user.punch_damage_increase -= punch_increase
			dusters_givith = FALSE
			to_remove_givith = FALSE
			user.shining_finger = FALSE

/obj/item/clothing/gloves/dusters/gloves
	name = "knuckle gloves"
	desc = "Gloves with additional reinforcment on the knuckles. \
	These have plasteel powder sewn into the knuckles, adding more kinetic energy to your punches."
	icon_state = "knuckles"
	item_state = "knuckles"
	min_cold_protection_temperature = T0C - 5 // Gloves, not just dusters
	armor = list(
		melee = 10, // Just a litttttle bit of armor so you're not defenseless
		bullet = 5,
		energy = 0,
		bomb = 0,
		bio = 0,
		rad = 0
	)
	price_tag = 100

/obj/item/clothing/gloves/dusters/berserk_pack
	name = "bloodied knuckleduster"
	desc = "A single, bloodied knuckleduster emanating a strong, anomalous and ominous aura of murder and rage. \
			Whatever it previous owner killed, its blood still stains the spikes at its tip. \
			You feel like wearing it might make you able to brawl against the hordes of hell itself."
	icon_state = "berserk_pack"
	item_state = "berserk_pack"
	punch_increase = 50 // Still VERY high, this is FLAT damage.
	price_tag = 666

// Maybe applying a red overlay to the screen would be too much.
/obj/item/clothing/gloves/dusters/berserk_pack/equipped(var/mob/M)
	..()
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		if(H.gloves == src)
			to_chat(H, SPAN_WARNING("\red <font size=3><b>Rip and Tear, until it is DONE!</b></font>")) // Berserk pack active!

//But what if we want to wear it on our left hand?
/obj/item/clothing/gloves/dusters/berserk_pack/verb/swap_hands()
	set name = "Swap Hands"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["right hand"] = "berserk_pack"
	options["left hand"] = "berserk_pack_left"

	var/choice = input(M,"What hand do you want to wear it on?","Swap hands") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		item_state = options[choice]
		to_chat(M, "You decide to wear your singular knuckleduster in your [choice].")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return TRUE
//