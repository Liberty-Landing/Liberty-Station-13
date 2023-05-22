//mre food


/obj/item/reagent_containers/food/snacks/openable
	name = "chips"
	desc = "A closed bag of chips, ready to be opened."
	icon_state = "lays"
	trash = /obj/item/trash/chips
	filling_color = "#948051"
	nutriment_desc = list("salt" = 1, "chips" = 2, "preservatives" = 3)
	nutriment_amt = 6
	preloaded_reagents = list("protein" = 3, "sodiumchloride" = 5)
	cooked = TRUE
	reagent_flags = NONE
	var/alt_desc = "A now opend bag of chips."
	var/can_warm = FALSE
	var/warm = FALSE
	var/open = FALSE
	var/list/heated_reagents = list("tricordrazine" = 5)
	var/bitten_icon_alt = FALSE
	var/bitten_icon_alt_active = FALSE
	var/throw_away_wrapper = FALSE
	var/icon_pointer = null
	matter = list(MATERIAL_BIOMATTER = 6)
	junk_food = TRUE

/obj/item/reagent_containers/food/snacks/openable/update_icon()
	..()

	var/iconstring = initial(icon_state)
	if(icon_pointer)
		iconstring = icon_pointer

	if (open)
		iconstring += "_open"

	if (bitten_icon_alt_active)
		iconstring += "_bite"

	if (warm)
		iconstring += "_hot"

	icon_state = iconstring

/obj/item/reagent_containers/food/snacks/openable/attack(mob/M as mob, mob/user as mob, def_zone)
	. = ..()
	if(!open)
		open()
		to_chat(user, SPAN_WARNING("You viciously open \the [src] with your teeth, you animal."))
	if(bitten_icon_alt)
		bitten_icon_alt_active = TRUE
		update_icon()
		//So we dont need to run update icon every attack
		bitten_icon_alt = FALSE

/obj/item/reagent_containers/food/snacks/openable/proc/heat()
	for(var/reagent in heated_reagents)
		reagents.add_reagent(reagent, heated_reagents[reagent])
	bitesize = 6
	update_icon()
	if(throw_away_wrapper)
		trash = null
		new /obj/item/trash/os_wrapper(get_turf(src))

/obj/item/reagent_containers/food/snacks/openable/proc/open(mob/user)
	desc = alt_desc
	open = TRUE
	reagent_flags |= REFILLABLE
	update_icon()

/obj/item/reagent_containers/food/snacks/openable/attack_self(mob/user)
	if(!open)
		open()
		to_chat(user, SPAN_NOTICE("You open up \the [src]."))
		return
	if(warm)
		to_chat(user, SPAN_NOTICE("You already crushed \the [src] and it's still heating up, be patient."))
		return
	if(can_warm)
		user.visible_message(
			SPAN_NOTICE("[user] crushes \the [src] package."),
			"You crush \the [src] package and feel a comfortable heat build up.",
		)
		warm = TRUE
		spawn(300)
			to_chat(user, "You think \the [src] is ready to eat about now.")
			heat()

/obj/item/reagent_containers/food/snacks/openable/chips_alt
	name = "chips"
	desc = "A closed bag of chips, ready to be opened."
	icon_state = "lays_green"
	trash = /obj/item/trash/chips_green

/obj/item/reagent_containers/food/snacks/openable/liquidfood //No longer vendable
	name = "\improper liquidfood ration"
	desc = "A prepackaged grey slurry of all the essential nutrients for a spacefarer on the go. Should this be crunchy?"
	alt_desc = "A prepackaged grey slurry of all the essential nutrients for a spacefarer on the go. Looking inside tends to loose your apatite."
	icon_state = "liquidfood" //Sprite by Michiyamenotehifunana
	trash = /obj/item/trash/liquidfood
	filling_color = "#A8A8A8"
	bitesize = 4
	center_of_mass = list("x"=16, "y"=15)
	nutriment_desc = list("chalk" = 6)
	nutriment_amt = 20
	preloaded_reagents = list("iron" = 3, "preservatives" = 5)
	matter = list(MATERIAL_BIOMATTER = 8)
	junk_food = TRUE

/obj/item/reagent_containers/food/snacks/openable/mre
	name = "mre"
	desc = "A closed Meal-Ready-to-Eat, ready to be opened."
	alt_desc = "A plethora of steaming beans mixed with meat, ready for consumption."
	icon_state = "mre"
	trash = /obj/item/trash/mre
	filling_color = "#948051"
	nutriment_desc = list("heartiness" = 1, "beans" = 3)
	nutriment_amt = 6
	preloaded_reagents = list("protein" = 3, "sodiumchloride" = 5)
	cooked = TRUE
	reagent_flags = NONE
	warm = FALSE
	open = FALSE
	heated_reagents = list("tricordrazine" = 5)
	matter = list(MATERIAL_BIOMATTER = 6)
	can_warm = TRUE

/obj/item/reagent_containers/food/snacks/openable/mre/alt
	desc = "A closed Meal-Ready-to-Eat, ready to be opened. This one is a wok MRE mix."
	alt_desc = "A nice mix of noodles and herbs all waiting to be eaten."
	icon_state = "wok"
	trash = /obj/item/trash/mre/alt
	nutriment_desc = list("pasta" = 1, "salt" = 3, "herbs" = 3)

/obj/item/reagent_containers/food/snacks/openable/mre/os
	name = "SR Fast Noodles"
	desc = "A closed wok, ready to be opened."
	alt_desc = "A nice mix of noodles and herbs all waiting to be eaten."
	icon_state = "os_wok"
	trash = /obj/item/trash/mre/os

	preloaded_reagents = list("protein" = 3, "sodiumchloride" = 5)
	heated_reagents = list("dermaline" = 5)
	nutriment_desc = list("pasta" = 1, "salt" = 3, "herbs" = 3)

/obj/item/reagent_containers/food/snacks/openable/can
	name = "ration can"
	desc = "Can of stew meat, tab right on top for easy opening."
	alt_desc = "An opened can of stewed meat, ready for consumption."
	icon_state = "ration_can"
	trash = /obj/item/trash/mre_can
	filling_color = "#948051"
	nutriment_desc = list("heartiness" = 1, "meat" = 3)
	nutriment_amt = 5
	preloaded_reagents = list("protein" = 6, "iron" = 2)
	heated_reagents = list("bicaridine" = 5, "kelotane" = 5)
	matter = list(MATERIAL_BIOMATTER = 12)
	can_warm = TRUE

/obj/item/reagent_containers/food/snacks/openable/candy
	name = "morale bar"
	desc = "Some brand of non-melting military chocolate."
	alt_desc = "Some brand of non-melting military chocolate. This one is open, and still unmelted."
	icon_state = "mre_candy"
	trash = /obj/item/trash/mre_candy
	nutriment_desc = list("sweetness" = 1, "chocolate" = 3)
	preloaded_reagents = list("sugar" = 3, "coco" = 2)
	junk_food = FALSE //Helps with morale

/obj/item/reagent_containers/food/snacks/openable/candy/shokoladka
	desc = "Shokoladka branded non-melting military chocolate."
	alt_desc = "Shokoladka branded non-melting military chocolate. This one is open, and still unmelted."
	icon_state = "shokoladka"
	trash = /obj/item/trash/mre_shokoladka
	bitten_icon_alt = TRUE

/obj/item/reagent_containers/food/snacks/openable/candy/dalococh
	desc = "Dalococh branded non-melting military chocolate."
	alt_desc = "Dalococh branded non-melting military chocolate. This one is open, and still unmelted."
	icon_state = "dalococh"
	trash = /obj/item/trash/mre_dalococh
	bitten_icon_alt = TRUE

/obj/item/reagent_containers/food/snacks/openable/selfheat_coffee
	name = "Self-Heating Coffee Can"
	desc = "A can of pure black coffee with a self-heating mechanism. A survivalist's best friend, it requires no fire - just open up, shake and wait before drinking!"
	alt_desc = "A can of pure black coffee, piping hot and ready to warm you up."
	icon_state = "selfheat_coffee"
	trash = /obj/item/trash/selfheat_coffee
	filling_color = "#482000d3"
	preloaded_reagents = list() // Nothing
	nutriment_amt = 10
	nutriment_desc = list("tart black coffee" = 5, "bushcrafting" = 3, "warmth" = 2)
	cooked = TRUE
	reagent_flags = NONE // No refilling no reusing
	warm = FALSE
	open = FALSE
	heated_reagents = list("coffee" = 20) // 20 coffee + 10 nutriment regardless of warmed up or not
	matter = list(MATERIAL_BIOMATTER = 6)
	can_warm = TRUE

/obj/item/reagent_containers/food/snacks/openable/selfheat_coffee/attack_self(mob/user)
	if(!open)
		open()
		to_chat(user, SPAN_NOTICE("You crack \the [src] open."))
		return
	if(warm)
		to_chat(user, SPAN_NOTICE("You already started the heat up process of \the [src], be patient until it's warm."))
		return
	if(can_warm)
		user.visible_message(
			SPAN_NOTICE("[user] gently shakes \the [src]."),
			"You gently shake \the [src] and feel a comfortable heat build up.",
		)
		warm = TRUE
		spawn(300)
			to_chat(user, "You think \the [src] is warm enough to drink now.")
			heat()

/obj/item/reagent_containers/food/snacks/openable/selfheat_coffee/feed_sound(var/mob/user)
	playsound(user.loc, 'sound/items/drink.ogg', rand(10, 50), 1) // Despite its code path, it's a drink, not a snacc!

/obj/item/reagent_containers/food/snacks/openable/candy/os
	desc = "SR branded non-melting chocolate."
	alt_desc = "SR branded non-melting chocolate. This one is open, and still unmelted."
	icon_state = "chocolate"
	trash = /obj/item/trash/os_coco_wrapper
	bitten_icon_alt = FALSE

/obj/item/reagent_containers/food/snacks/openable/candy/os/Initialize(mapload)
	. = ..()
	switch (pickweight(list("chocolate_milk" = 1,
	"chocolate_grape" = 1,
	"chocolate_chestnut" = 1,
	"chocolate_bitter" = 1,
	"chocolate_fruit" = 1,
	"chocolate_almond" = 1,
	"chocolate" = 1)))

		if("chocolate_milk")
			desc = "SR branded non-melting chocolate. This one has been enhanced with extra milk."
			alt_desc = "SR branded non-melting chocolate. This one has been enhanced with extra milk. This one is open, and still unmelted."
			icon_state = "chocolate_milk"
			preloaded_reagents = list("sugar" = 3, "coco" = 2, "milk" = 5)
			icon_pointer = "chocolate_milk"
			return

		if("chocolate_grape")
			desc = "SR branded non-melting chocolate. This one sports a grape flavour."
			alt_desc = "SR branded non-melting chocolate. This one sports a grape flavour. This one is open, and still unmelted."
			icon_state = "chocolate_grape"
			preloaded_reagents = list("sugar" = 3, "coco" = 2, "grapejuice" = 5)
			icon_pointer = "chocolate_grape"
			return

		if("chocolate_chestnut")
			desc = "SR branded non-melting chocolate. This one warns of chestnuts being added into the bar."
			alt_desc = "SR branded non-melting chocolate. This one warns of chestnuts being added into the bar. This one is open, and still unmelted."
			icon_state = "chocolate_chestnut"
			preloaded_reagents = list("sugar" = 3, "coco" = 2, "dexalinp" = 5)
			icon_pointer = "chocolate_chestnut"
			return

		if("chocolate_bitter")
			desc = "SR branded non-melting chocolate. This one has coffee added in making it bitter."
			alt_desc = "SR branded non-melting chocolate. This one has coffee added in making it bitter. This one is open, and still unmelted."
			icon_state = "chocolate_bitter"
			preloaded_reagents = list("sugar" = 3, "coco" = 2, "coffee" = 5)
			icon_pointer = "chocolate_bitter"
			return

		if("chocolate_fruit")
			desc = "SR branded non-melting chocolate, mixed with berry flavours."
			alt_desc = "SR branded non-melting chocolate, mixed with berry flavours. This one is open, and still unmelted."
			icon_state = "chocolate_fruit"
			icon_pointer = "chocolate_fruit"
			preloaded_reagents = list("sugar" = 3, "coco" = 2, "strawberryjuice" = 2, "blueberryjuice" = 2, "berryjuice" = 2)
			return

		if("chocolate_almond")
			desc = "SR branded non-melting chocolate. This one warns of almond being added into the bar."
			alt_desc = "SR branded non-melting chocolate. This one warns of almond being added into the bar. This one is open, and still unmelted."
			icon_state = "chocolate_almond"
			icon_pointer = "chocolate_almond"
			preloaded_reagents = list("sugar" = 3, "coco" = 2, "soymilk" = 5)
			return

		if("chocolate") //Default
			desc = "SR branded non-melting chocolate."
			alt_desc = "SR branded non-melting chocolate. This one is open, and still unmelted."
			icon_state = "chocolate"
			return

/obj/item/reagent_containers/food/snacks/openable/os_meat
	name = "Cubed Steak"
	desc = "A self heating packet with commpressed meat in the form of a steak."
	alt_desc = "A fresh-ish commpressed meat steak."
	icon_state = "steak_red"
	trash = /obj/item/trash/os_wrapper
	filling_color = "#948051"
	nutriment_desc = list("heartiness" = 1, "meat" = 3)
	nutriment_amt = 5
	preloaded_reagents = list("protein" = 6, "iron" = 2)
	heated_reagents = list("bicaridine" = 5, "dexalinp" = 5)
	matter = list(MATERIAL_BIOMATTER = 12)
	can_warm = TRUE
	throw_away_wrapper = TRUE

/obj/item/reagent_containers/food/snacks/openable/os_meat/Initialize(mapload)
	. = ..()
	if(prob(50))
		icon_state = "steak_green"
		icon_pointer = "steak_green"
		alt_desc = "A fresh roach stake, hopefully safe for human consumtion..."
		preloaded_reagents = list("protein" = 6, "egg" = 2)
		heated_reagents = list("bicaridine" = 5, "dexalinp" = 5)

/obj/item/reagent_containers/food/snacks/openable/os_bun
	name = "Hot Bun"
	desc = "A loaf of bread in a self heating container."
	alt_desc = "A fluffy soft and sweet bread bun."
	icon_state = "bun"
	trash = /obj/item/trash/os_wrapper
	filling_color = "#948051"
	center_of_mass = list("x"=16, "y"=12)
	nutriment_desc = list("bun" = 4)
	nutriment_amt = 4
	matter = list(MATERIAL_BIOMATTER = 5)
	preloaded_reagents = list("nutriment" = 2, "woodpulp" = 2)
	heated_reagents = list("nutriment" = 2, "sugar" = 2)
	can_warm = TRUE
	throw_away_wrapper = TRUE

/obj/item/reagent_containers/food/snacks/openable/os_heart
	name = "Hearty Meal"
	desc = "A prepacked full heart?"
	alt_desc = "A gummy heart made with three chambers of different flavours."
	icon_state = "heart"
	trash = /obj/item/trash/os_wrapper
	filling_color = "#948051"
	center_of_mass = list("x"=16, "y"=12)
	nutriment_desc = list("hard gummy candy" = 4)
	nutriment_amt = 4
	matter = list(MATERIAL_BIOMATTER = 5)
	preloaded_reagents = list("nutriment" = 1, "sugar" = 3)
	heated_reagents = list("nutriment" = 2, "cordradaxon" = 2)
	can_warm = TRUE
	throw_away_wrapper = TRUE

/obj/item/reagent_containers/food/snacks/openable/os_liver
	name = "Liver Meal"
	desc = "A prepacked full liver?"
	alt_desc = "A gummy liver made two main lobes of flavour."
	icon_state = "liver"
	trash = /obj/item/trash/os_wrapper
	filling_color = "#948051"
	center_of_mass = list("x"=16, "y"=12)
	nutriment_desc = list("soft gummy candy" = 4)
	nutriment_amt = 4
	matter = list(MATERIAL_BIOMATTER = 5)
	preloaded_reagents = list("nutriment" = 1, "sugar" = 3)
	heated_reagents = list("nutriment" = 2, "carthatoline" = 2)
	can_warm = TRUE
	throw_away_wrapper = TRUE

/obj/item/reagent_containers/food/snacks/openable/os_soypack
	name = "SR portable SoyPack."
	desc = "SR portable SoyPack."
	alt_desc = "SR portable SoyPack."
	icon_state = "soylent_orange"
	trash = /obj/item/trash/os_soypack

/obj/item/reagent_containers/food/snacks/openable/os_soypack/Initialize(mapload)
	. = ..()
	switch (pickweight(list("soylent_orange" = 1,
	"soylent_fish" = 1,
	"soylent_strawberry" = 1,
	"soylent_apple" = 1,
	"soylent_grape" = 1,
	"soylent_vanilla" = 1)))

		if("soylent_orange")
			desc = "A SR SoyPack, this one has added orange flavour."
			alt_desc = "A SR SoyPack, this one has added orange flavour. The smell of oranges is rather faint..."
			icon_state = "soylent_orange"
			icon_pointer = "soylent_orange"
			preloaded_reagents = list("soymilk" = 3, "orangejuice" = 2, "milk" = 5)
			return

		if("soylent_fish")
			desc = "A SR SoyPack, this one has added shellfish flavours."
			alt_desc = "A SR SoyPack, this one has added shellfish flavour. The smell of rotton fish reaks from the cap."
			icon_state = "soylent_fish"
			icon_pointer = "soylent_fish"
			preloaded_reagents = list("soymilk" = 3, "deadrum" = 2, "milk" = 5)
			return

		if("soylent_strawberry")
			desc = "A SR SoyPack, this one has added strawberry flavouring."
			alt_desc = "A SR SoyPack, this one has added strawberry flavour. A sickenly sweet smell lingers from the cap."
			icon_state = "soylent_strawberry"
			icon_pointer = "soylent_strawberry"
			preloaded_reagents = list("soymilk" = 1, "strawberryjuice" = 4, "milk" = 5)
			return

		if("soylent_apple")
			desc = "A SR SoyPack, this one has added green apple flavouring."
			alt_desc = "A SR SoyPack, this one has added green apple flavour. The smell of cinnamon is stronger then apple..."
			icon_state = "soylent_apple"
			icon_pointer = "soylent_apple"
			preloaded_reagents = list("soymilk" = 3, "cinnamonpowder" = 2, "milk" = 5)
			return

		if("soylent_grape")
			desc = "A SR SoyPack, this one has added red grape flavouring."
			alt_desc = "A SR SoyPack, this one has added grape flavour. Shockingly has no smell."
			icon_state = "soylent_grape"
			icon_pointer = "soylent_grape"
			preloaded_reagents = list("soymilk" = 3, "grapejuice" = 2, "milk" = 5)
			return

		if("soylent_vanilla")
			desc = "A SR SoyPack, the most basic packet."
			alt_desc = "A SR SoyPack this one being the basic vanilla but it has no smell of vanilla!"
			icon_state = "soylent_vanilla"
			icon_pointer = "soylent_vanilla"
			preloaded_reagents = list("soymilk" = 5, "milk" = 5) //SCAM!
			return


//Other mre food items


/obj/item/reagent_containers/food/snacks/mre_paste
	name = "nutrient paste"
	desc = "A peachy looking paste."
	icon_state = "paste"
	trash = /obj/item/trash/mre_paste
	filling_color = "#DEDEAB"
	nutriment_desc = list("acrid peaches" = 2)
	bitesize = 2
	nutriment_amt = 3
	preloaded_reagents = list("chronos" = 2, "paracetamol" = 3)
	matter = list(MATERIAL_BIOMATTER = 3)
	junk_food = TRUE

/obj/item/reagent_containers/food/snacks/os_paste
	name = "SR nutrient paste"
	desc = "A chalky looking paste tube."
	icon_state = "os_paste"
	trash = /obj/item/trash/os_paste_empty
	filling_color = "#DEDEAB"
	nutriment_desc = list("chalk" = 2)
	bitesize = 2
	nutriment_amt = 3
	preloaded_reagents = list("kelotane" = 3, "sugar" = 2)
	matter = list(MATERIAL_BIOMATTER = 3)
	junk_food = TRUE

/obj/item/reagent_containers/food/snacks/canned_peaches
	name = "canned peaches"
	desc = "A can of peaches."
	icon_state = "peachcan"
	trash = /obj/item/trash/peachcan
	filling_color = "#DEDEAB"
	nutriment_desc = list("acrid peaches" = 2)
	bitesize = 2
	nutriment_amt = 3
	preloaded_reagents = list("sugar" = 2)
	matter = list(MATERIAL_BIOMATTER = 9)
	junk_food = TRUE

/obj/item/reagent_containers/food/snacks/mre_cracker
	name = "enriched cracker"
	desc = "It's a salted cracker, the surface looks saturated with oil."
	icon_state = "mre_cracker"
	filling_color = "#F5DEB8"
	center_of_mass = list("x"=17, "y"=6)
	nutriment_desc = list("salt" = 1, "cracker" = 2)
	bitesize = 2
	nutriment_amt = 1
	preloaded_reagents = list("dexalinp" = 1, "nicotine" = 1)
	matter = list(MATERIAL_BIOMATTER = 2)
	junk_food = TRUE


