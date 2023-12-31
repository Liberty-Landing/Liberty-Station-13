/obj/item/vacuum_cleaner
	desc = "An advanced vacuum cleaner designed by various Federation companies that compresses trash into reusable biomatter bricks. There is no safety switch and it has several warnings on it about the toxic biomatter bricks."
	name = "\"Swift 200\" vacuum cleaner"
	icon = 'icons/obj/janitor.dmi'
	icon_state = "vacuum"
	force = WEAPON_FORCE_WEAK
	throwforce = WEAPON_FORCE_WEAK
	throw_speed = 5
	throw_range = 3
	w_class = ITEM_SIZE_BULKY
	slot_flags = SLOT_BELT|SLOT_BACK
	attack_verb = list("bashed", "bludgeoned", "whacked")
	matter = list(MATERIAL_PLASTIC = 5, MATERIAL_ALUMINIUM = 10, MATERIAL_BIOMATTER = 5)
	price_tag = 300

	var/filth = 0
	var/max_filth = 30
	var/vacuum_time = 30 // Same as a mop, faster than soap.

/obj/item/vacuum_cleaner/Initialize()
	.=..()
	create_reagents(10)
	refill()
	update_icon()

/obj/item/vacuum_cleaner/examine(mob/user)
	..()
	to_chat(user, "\The [src]'s tank contains [filth] units of compressed filth.")

/obj/item/vacuum_cleaner/update_icon()
	cut_overlays()

	if(filth == 0)
		add_overlay("0")
	else
		add_overlay("[CLAMP(round((filth / max_filth * 30),5), 1, 30)]")

/obj/item/vacuum_cleaner/proc/refill()
	reagents.add_reagent("cleaner", 10)  // Need to have cleaner in it for /turf/proc/clean

/obj/item/vacuum_cleaner/attack_self(mob/user)
	.=..()
	if(filth < 1) // No cheating using 0.2 to produce 1.
		to_chat(user, SPAN_NOTICE("There is not enough filth on the [src] to compress into a slab."))
		return
	else
		empty(user)

/obj/item/vacuum_cleaner/proc/empty(var/mob/user)
	var/obj/item/stack/compressedfilth/CF = new(user.loc)  // Drop the content of the vacuum cleaner on the ground
	CF.amount = round(filth, 1) // Round the amount so we don't end up ejecting buggy stacks.
	CF.update_icon() // So that the ejected stack looks its part
	filth = 0
	to_chat(user, SPAN_NOTICE("You empty the storage tank of the [src]."))
	update_icon()

/obj/item/vacuum_cleaner/afterattack(atom/A, mob/user, proximity)
	if(!proximity)
		return
	if(istype(A, /turf) || istype(A, /obj/effect/decal/cleanable) || istype(A, /obj/effect/overlay) && !istype(A, /obj/effect/overlay/water))
		if(filth >= max_filth)
			to_chat(user, SPAN_NOTICE("The storage tank of the [src] is full!"))
			return
		var/turf/T = get_turf(A)
		if(!T)
			return
		spawn()
			user.do_attack_animation(T)
		user.setClickCooldown(2) //We use this to not lock people out of talking or looking around or multy tile vacuuming
		playsound(loc, 'sound/effects/succ.ogg', 25, 1) // It's a vacuum, make it sound like one.
		if(do_after(user, vacuum_time, T))
			if(T)
				filth += 0.2 * T.clean(src, user)  // Five uses, one stack.
			to_chat(user, SPAN_NOTICE("You have vacuumed all the filth!"))
			refill()
			update_icon()

// The snowflake filth material stack to reclaim as biomatter
// Makes it useful to sell to Custodians/CAPSA

/obj/item/stack/compressedfilth
	desc = "A small block of compressed biomatter filth. Gross!"
	name = "compressed filth"
	icon = 'icons/obj/janitor.dmi'
	icon_state = "filth-biomatter"
	price_tag = 1 // It has biomatter... at least some use..?
	matter = list(MATERIAL_BIOMATTER = 1)
	biomatter_in_sheet = 1 // This is a necessary var for bonfire machinery to transform 1 sheet into liquid scorch
	novariants = FALSE
	w_class = ITEM_SIZE_SMALL
	max_amount = 30 // Might seem small, but you need to vacuum A LOT to get to thirty stacks.


