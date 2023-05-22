// Using stacks since /obj/item/spacecash has no support for different currencies. Shit code, but cash-handling will need a rework to support alt currencies.
/obj/item/stack/dinar
	name = "Coalition Dinar"
	desc = "The most common currency used around the galaxy, accepted by most non-Coalition traders. At least credits hold their value better than corporate scrip or coalition dinars."
	icon = 'icons/obj/currency/dinar.dmi'
	icon_state = "dinar"
	w_class = ITEM_SIZE_TINY
	amount = 1
	max_amount = 10000
	stacktype = /obj/item/stack/dinar
	novariants = TRUE					// Skips base /obj/item/stack update_icon() checks
	price_tag = 0						// Less than a 1-to-1 exchange rate with scrip.

/obj/item/stack/dinar/update_icon()
	switch(amount)
		if(1 to 9)
			icon_state = "[initial(icon_state)]1"
		if(10 to 49)
			icon_state = "[initial(icon_state)]10"
		if(50 to 99)
			icon_state = "[initial(icon_state)]50"
		if(100 to 199)
			icon_state = "[initial(icon_state)]100"
		if(200 to 499)
			icon_state = "[initial(icon_state)]200"
		if(500 to 999)
			icon_state = "[initial(icon_state)]500"
		if(1000 to 4999)
			icon_state = "[initial(icon_state)]1000"
		if(5000 to 10001)
			icon_state = "[initial(icon_state)]10000"

	..()

/obj/item/stack/dinar/attack_hand(mob/user)
	if(user.get_inactive_hand() == src)
		split_cash(user)
	else
		..()

/obj/item/stack/dinar/attack_self(mob/user)
	split_cash(user)

/obj/item/stack/dinar/proc/split_cash(mob/user)
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

	var/obj/item/stack/dinar/cred_stack = new (user.loc)
	cred_stack.amount = count
	cred_stack.update_icon()
	user.put_in_hands(cred_stack)
	update_icon()

/obj/item/stack/dinar/random
	rand_min = 50
	rand_max = 1000

/obj/item/stack/dinar/full
	amount = 10000
