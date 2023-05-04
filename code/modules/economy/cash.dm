//#define CASH_PER_STAT 1000 // The cost of a single level of a statistic

/obj/item/spacecash
	name = "0 scrip"
	desc = "It's worth 0 scrips."
	gender = PLURAL
	icon = 'icons/obj/items.dmi'
	icon_state = "1"
	opacity = 0
	density = 0
	anchored = 0.0
	force = 1
	throwforce = 1
	throw_speed = 1
	throw_range = 2
	w_class = ITEM_SIZE_SMALL
	var/access = list()
	access = access_crate_cash
	var/worth = 0

/obj/item/spacecash/attackby(obj/item/W as obj, mob/user as mob)
	if(istype(W, /obj/item/spacecash))
		if(istype(W, /obj/item/spacecash/ewallet))
			return FALSE

		var/obj/item/spacecash/bundle/bundle
		if(!istype(W, /obj/item/spacecash/bundle))
			var/obj/item/spacecash/cash = W
			user.drop_from_inventory(cash)
			bundle = new (src.loc)
			bundle.worth += cash.worth
			qdel(cash)
		else //is bundle
			bundle = W
		bundle.worth += src.worth
		bundle.update_icon()
		if(ishuman(user))
			var/mob/living/carbon/human/h_user = user
			h_user.drop_from_inventory(src)
			h_user.drop_from_inventory(bundle)
			h_user.put_in_hands(bundle)
		to_chat(user, SPAN_NOTICE("You add [src.worth] scrips worth of money to the bundles.<br>It holds [bundle.worth] scrips now."))
		qdel(src)

/obj/item/spacecash/Destroy()
	. = ..()
	worth = 0		// Prevents money from be duplicated anytime.

/obj/item/spacecash/bundle
	name = "pile of scrips"
	icon_state = ""
	desc = "They are worth 0 scrips."
	worth = 0

/obj/item/spacecash/bundle/update_icon()
	cut_overlays()
	var/sum = src.worth
	var/num = 0
	var/list/denominations = list(1000,500,200,100,50,20,10,1)
	for(var/i in denominations)
		while(sum >= i && num < 50)
			sum -= i
			num++
			var/credit_type
			if(prob(33))
				credit_type = "_alt"
			if(prob(20))
				credit_type = "_coin"
			if(prob(10))
				credit_type = "_crushed"
			var/image/banknote = image('icons/obj/items.dmi', "[i][credit_type]")
			var/matrix/M = matrix()
			M.Translate(rand(-6, 6), rand(-4, 8))
			M.Turn(pick(-45, -27.5, 0, 0, 0, 0, 0, 0, 0, 27.5, 45))
			banknote.transform = M
			src.add_overlay(banknote)
	if(num == 0) // Less than one credit, let's just make it look like 1 for ease
		var/credit_type
		if(prob(33))
			credit_type = "_alt"
		if(prob(20))
			credit_type = "_coin"
		if(prob(10))
			credit_type = "_crushed"
		var/image/banknote = image('icons/obj/items.dmi', "1[credit_type]")
		var/matrix/M = matrix()
		M.Translate(rand(-6, 6), rand(-4, 8))
		M.Turn(pick(-45, -27.5, 0, 0, 0, 0, 0, 0, 0, 27.5, 45))
		banknote.transform = M
		src.add_overlay(banknote)
	src.desc = "They are worth [worth] scrips."
	if(worth in denominations)
		src.name = "[worth] scrip"
	else
		src.name = "pile of scrips"

/obj/item/spacecash/bundle/attack_self()
	var/amount = input(usr, "How many scrips do you want to take? (0 to [src.worth])", "Take Money", 20) as num
	amount = round(CLAMP(amount, 0, src.worth))
	if(amount==0) return 0
	else if (!Adjacent(usr))
		to_chat(usr, SPAN_WARNING("You need to be in arm's reach for that!"))
		return

	src.worth -= amount
	src.update_icon()
	if(!worth)
		usr.drop_from_inventory(src)
		qdel(src)
	if(amount in list(1000,500,200,100,50,20,1))
		var/cashtype = text2path("/obj/item/spacecash/bundle/c[amount]")
		var/obj/cash = new cashtype (usr.loc)
		usr.put_in_hands(cash)
	else
		var/obj/item/spacecash/bundle/bundle = new (usr.loc)
		bundle.worth = amount
		bundle.update_icon()
		usr.put_in_hands(bundle)

/obj/item/spacecash/bundle/Initialize()
	. = ..()
	//AddComponent(/datum/component/inspiration, CALLBACK(src, .proc/return_stats))

/// Returns a list to use with inspirations. It can be empty if there's not enough money in the bundle. Important side-effects: converts worth to points, thus reducing worth.
/*
/obj/item/spacecash/bundle/proc/return_stats()
	RETURN_TYPE(/list)
	var/points = clamp(worth/CASH_PER_STAT, 0, 10) // capped at 10 points per bundle, costs 10k
	var/list/stats = list()
	// Distribute points evenly with random statistics. Just skips the loop if there's not enough money in the bundle, resulting in an empty list.
	//worth -= points*CASH_PER_STAT //point cost: disabled
	while(points--)
		var/selected_stat = pick(ALL_STATS)
		if(stats[selected_stat] == null) stats[selected_stat] = 0
		stats[selected_stat] += 1 // Picks a random stat, if not present it adds it with a value of 1, else it increases the value by 1
	update_icon()
	if(!worth)
		qdel(src)
	return stats
*/

//Sprites by Près de l'oiseau#2625 (alts, coins) && Ceurelian#3684 (defaults, crushed)
/obj/item/spacecash/bundle/c1
	name = "1 scrip"
	icon_state = "1"
	desc = "It's worth 1 scrip."
	worth = 1

	New()
		if(prob(30))
			icon_state = "1_alt"
		if(prob(30))
			icon_state = "1_coin"
		if(prob(10))
			icon_state = "1_crushed"

/obj/item/spacecash/bundle/c10
	name = "10 scrips"
	icon_state = "10"
	desc = "It's worth 10 scrips."
	worth = 10

	New()
		if(prob(30))
			icon_state = "10_alt"
		if(prob(30))
			icon_state = "10_coin"
		if(prob(10))
			icon_state = "10_crushed"

/obj/item/spacecash/bundle/c20
	name = "20 scrips"
	icon_state = "20"
	desc = "It's worth 20 scrips."
	worth = 20

	New()
		if(prob(30))
			icon_state = "20_alt"
		if(prob(30))
			icon_state = "20_coin"
		if(prob(10))
			icon_state = "20_crushed"

/obj/item/spacecash/bundle/c50
	name = "50 scrips"
	icon_state = "50"
	desc = "It's worth 50 scrips."
	worth = 50

	New()
		if(prob(30))
			icon_state = "50_alt"
		if(prob(30))
			icon_state = "50_coin"
		if(prob(10))
			icon_state = "50_crushed"

/obj/item/spacecash/bundle/c100
	name = "100 scrips"
	icon_state = "100"
	desc = "It's worth 100 scrips."
	worth = 100

	New()
		if(prob(30))
			icon_state = "100_alt"
		if(prob(30))
			icon_state = "100_coin"
		if(prob(10))
			icon_state = "100_crushed"

/obj/item/spacecash/bundle/c200
	name = "200 scrips"
	icon_state = "200"
	desc = "It's worth 200 scrips."
	worth = 200

	New()
		if(prob(30))
			icon_state = "200_alt"
		if(prob(30))
			icon_state = "200_coin"
		if(prob(10))
			icon_state = "200_crushed"

/obj/item/spacecash/bundle/c500
	name = "500 scrips"
	icon_state = "500"
	desc = "It's worth 500 scrips."
	worth = 500

	New()
		if(prob(30))
			icon_state = "500_alt"
		if(prob(30))
			icon_state = "500_coin"
		if(prob(10))
			icon_state = "500_crushed"

/obj/item/spacecash/bundle/c1000
	name = "1000 scrips"
	icon_state = "1000"
	desc = "It's worth 1000 scrips."
	worth = 1000

	New()
		if(prob(30))
			icon_state = "1000_alt"
		if(prob(30))
			icon_state = "1000_coin"
		if(prob(10))
			icon_state = "1000_crushed"

proc/spawn_money(var/sum, spawnloc, mob/living/carbon/human/human_user as mob)
	if(sum in list(1000,500,200,100,50,20,10,1))
		var/cash_type = text2path("/obj/item/spacecash/bundle/c[sum]")
		var/obj/cash = new cash_type (usr.loc)
		if(ishuman(human_user) && !human_user.get_active_hand())
			human_user.put_in_hands(cash)
	else
		var/obj/item/spacecash/bundle/bundle = new (spawnloc)
		bundle.worth = sum
		bundle.update_icon()
		if (ishuman(human_user) && !human_user.get_active_hand())
			human_user.put_in_hands(bundle)
	return

/obj/item/spacecash/ewallet
	name = "Charge card"
	icon_state = "efundcard"
	desc = "A card that holds an amount of money."
	var/owner_name = "" //So the ATM can set it so the EFTPOS can put a valid name on transactions.

/obj/item/spacecash/ewallet/examine(mob/user)
	..(user)
	if (!(user in view(2)) && user!=src.loc) return
	to_chat(user, "\blue Charge card's owner: [src.owner_name]. Scrips remaining: [src.worth].")

//#undef CASH_PER_STAT
