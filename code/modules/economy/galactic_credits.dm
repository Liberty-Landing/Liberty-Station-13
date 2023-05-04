// Using stacks since /obj/item/spacecash has no support for different currencies. Shit code, but cash-handling will need a rework to support alt currencies.
/obj/item/stack/gal_cred
	name = "Galatic Credits"
	desc = "The most common currency used around the galaxy, accepted by most non-Coalition traders. At least credits hold their value better than corporate scrip or coalition dinars."
	icon = 'icons/obj/currency/spacebucks.dmi'
	icon_state = "cred"
	w_class = ITEM_SIZE_TINY
	amount = 1
	max_amount = 1000
	stacktype = /obj/item/stack/gal_cred
	novariants = TRUE					// Skips base /obj/item/stack update_icon() checks
	price_tag = 10						// 10-to-1 exchange rate with scrip

/obj/item/stack/gal_cred/update_icon()
	switch(amount)
		if(1)
			icon_state = "[initial(icon_state)]1"
		if(2 to 6)
			icon_state = "[initial(icon_state)]5"
		if(6 to 11)
			icon_state = "[initial(icon_state)]10"
		if(11 to 21)
			icon_state = "[initial(icon_state)]20"
		if(21 to 51)
			icon_state = "[initial(icon_state)]50"
		if(51 to 101)
			icon_state = "[initial(icon_state)]100"
		if(101 to 201)
			icon_state = "[initial(icon_state)]200"
		if(201 to 501)
			icon_state = "[initial(icon_state)]500"
		if(501 to 1001)
			icon_state = "[initial(icon_state)]1000"

	..()

/obj/item/stack/gal_cred/attack_hand(mob/user)
	if(user.get_inactive_hand() == src)
		split_cash(user)
	else
		..()

/obj/item/stack/gal_cred/attack_self(mob/user)
	split_cash(user)

/obj/item/stack/gal_cred/proc/split_cash(mob/user)
	var/count = input(user, "How many credits do you want to take? (0 to [amount])", "Take Money") as num
	count = round(CLAMP(count, 0, max_amount))

	if(!count)
		return
	else if(!Adjacent(user))
		to_chat(user, SPAN_WARNING("You need to be in arm's reach for that!"))
		return

	amount -= count

	if(!amount)
		user.drop_from_inventory(src)
		qdel(src)

	var/obj/item/stack/gal_cred/cred_stack = new (user.loc)
	cred_stack.amount = count
	cred_stack.update_icon()
	user.put_in_hands(cred_stack)
	update_icon()

/obj/item/stack/gal_cred/random
	rand_min = 1
	rand_max = 1000

/obj/item/stack/gal_cred/full
	amount = 1000
