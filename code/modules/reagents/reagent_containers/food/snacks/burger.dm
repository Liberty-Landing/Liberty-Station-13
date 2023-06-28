
/obj/item/reagent_containers/food/snacks/human
	var/hname = ""
	var/job = null
	filling_color = "#D63C3C"

/obj/item/reagent_containers/food/snacks/human/burger
	name = "-burger"
	desc = "A bloody burger."
	icon_state = "hburger"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=11)
	preloaded_reagents = list("protein" = 6)
	matter = list(MATERIAL_BIOMATTER = 16)

/obj/item/reagent_containers/food/snacks/cheeseburger
	name = "cheeseburger"
	desc = "The cheese adds a good flavor."
	icon_state = "cheeseburger"
	center_of_mass = list("x"=16, "y"=11)
	nutriment_desc = list("cheese" = 2, "bun" = 2)
	nutriment_amt = 2
	preloaded_reagents = list("protein" = 2)
	matter = list(MATERIAL_BIOMATTER = 12)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/monkeyburger
	name = "burger"
	desc = "Meatkind come together, united between fluffy buns." // Pax hamburgana.
	icon_state = "hburger"
	filling_color = "#D63C3C"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=11)
	nutriment_desc = list("bun" = 2)
	nutriment_amt = 3
	preloaded_reagents = list("protein" = 3)
	matter = list(MATERIAL_BIOMATTER = 13)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/fishburger
	name = "fillet-o-carp sandwich"
	desc = "Almost like a carp is yelling somewhere... Give me back that fillet-o-carp, give me that carp."
	icon_state = "fishburger"
	filling_color = "#FFDEFE"
	bitesize = 3
	center_of_mass = list("x"=16, "y"=10)
	preloaded_reagents = list("protein" = 6)
	matter = list(MATERIAL_BIOMATTER = 14)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/baconburger
	name = "bacon burger"
	desc = "What makes a burger even more perfect? The addition of bacon, of course."
	icon_state = "baconburger"
	bitesize = 3
	preloaded_reagents = list("protein" = 6)
	nutriment_desc = list("meaty perfection" = 10, "bun" = 2)
	matter = list(MATERIAL_BIOMATTER = 14)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/chickenburger
	name = "fried poultry burger"
	desc =	"A burger consisting of crispy fried poultry instead of a patty, a classic alternative for those who prefer chicken or whatever tastes closest to it."
	icon_state = "chickenburger"
	bitesize = 3
	preloaded_reagents = list("protein" = 6)
	nutriment_amt = 10
	nutriment_desc = list("crispy fried poultry" = 8, "fluffy bun" = 2)
	matter = list(MATERIAL_BIOMATTER = 14)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/tofuburger
	name = "tofu burger"
	desc = "What.. is that meat?"
	icon_state = "tofuburger"
	filling_color = "#FFFEE0"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=10)
	nutriment_desc = list("bun" = 2, "pseudo-soy meat" = 3)
	nutriment_amt = 6
	matter = list(MATERIAL_BIOMATTER = 12)
	cooked = TRUE


/obj/item/reagent_containers/food/snacks/xenoburger
	name = "xenoburger"
	desc = "Smells caustic. Tastes like heresy."
	icon_state = "xburger"
	filling_color = "#43DE18"
	center_of_mass = list("x"=16, "y"=11)
	matter = list(MATERIAL_BIOMATTER = 13)

/obj/item/reagent_containers/food/snacks/xenoburger/Initialize(mapload)
	. = ..()
	reagents.add_reagent("protein", 8)
	bitesize = 2

/obj/item/reagent_containers/food/snacks/spellburger
	name = "spell burger"
	desc = "This is absolutely Ei Nath."
	icon_state = "spellburger"
	filling_color = "#D505FF"
	bitesize = 2
	nutriment_desc = list("magic" = 3, "buns" = 3)
	nutriment_amt = 6
	matter = list(MATERIAL_BIOMATTER = 13)

/obj/item/reagent_containers/food/snacks/jellyburger
	name = "jelly burger"
	desc = "Culinary delight..?"
	icon_state = "jellyburger"
	filling_color = "#B572AB"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=11)
	nutriment_desc = list("buns" = 5)
	nutriment_amt = 5
	matter = list(MATERIAL_BIOMATTER = 8)

/obj/item/reagent_containers/food/snacks/jellyburger/slime
	preloaded_reagents = list("slimejelly" = 5)

/obj/item/reagent_containers/food/snacks/jellyburger/cherry
	preloaded_reagents = list("cherryjelly" = 5)

/obj/item/reagent_containers/food/snacks/bigbiteburger
	name = "big bite burger"
	desc = "Forget the Big Mac. THIS is the future! It has big \"R\" stamped on it's bun."
	icon_state = "bigbiteburger"
	filling_color = "#E3D681"
	bitesize = 3
	center_of_mass = list("x"=16, "y"=11)
	nutriment_desc = list("buns" = 4)
	nutriment_amt = 4
	preloaded_reagents = list("protein" = 10)
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 60)

/obj/item/reagent_containers/food/snacks/superbiteburger
	name = "super bite burger"
	desc = "This is a mountain of a burger. FOOD!"
	icon_state = "superbiteburger"
	filling_color = "#CCA26A"
	bitesize = 10
	center_of_mass = list("x"=16, "y"=3)
	nutriment_desc = list("buns" = 25)
	nutriment_amt = 25
	preloaded_reagents = list("protein" = 40) // CALORIES GALORE! Changing to reflect the materials used and complexity of the recipe - Seb
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 40)

//Roach burgers

/obj/item/reagent_containers/food/snacks/kampferburger
	name = "roach burger"
	desc = "A burger made out of a roach. Tasty but chewy."
	icon_state = "kampferburger"
	bitesize = 1
	center_of_mass = list("x"=16, "y"=11)
	nutriment_desc = list("bun" = 2)
	nutriment_amt = 2
	preloaded_reagents = list("protein" = 4)
	matter = list(MATERIAL_BIOMATTER = 15)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/panzerburger
	name = "exoskeleton roach burger"
	desc = "A burger made out of a exoskeleton roach. Surprisingly heavy."
	icon_state = "panzerburger"
	bitesize = 3
	center_of_mass = list("x"=16, "y"=11)
	nutriment_desc = list("bun" = 2)
	nutriment_amt = 1
	preloaded_reagents = list("protein" = 8)
	matter = list(MATERIAL_BIOMATTER = 17)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/jagerburger
	name = "hunter-killer roach burger"
	desc = "A burger made out of a hunter-killer roach. The hunter becomes the hunted."
	icon_state = "jagerburger"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=11)
	nutriment_desc = list("bun" = 2)
	nutriment_amt = 3
	preloaded_reagents = list("protein" = 6)
	matter = list(MATERIAL_BIOMATTER = 16)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/seucheburger
	name = "vapour roach burger"
	desc = "A burger made out of a vapour roach. This can't be healthy."
	icon_state = "seucheburger"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=11)
	nutriment_desc = list("bun" = 2)
	nutriment_amt = 2
	preloaded_reagents = list("protein" = 4)
	matter = list(MATERIAL_BIOMATTER = 16)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/bigroachburger
	name = "big roach burger"
	desc = "A burger made out of many different roaches. A gourmet meal."
	icon_state = "bigroachburger"
	bitesize = 3
	center_of_mass = list("x"=16, "y"=11)
	nutriment_desc = list("bun" = 2)
	nutriment_amt = 3
	preloaded_reagents = list("protein" = 8)
	matter = list(MATERIAL_BIOMATTER = 35)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/fuhrerburger
	name = "overlord roach burger"
	desc = "A burger made out of a fuhrer roach. Consume the king of bugs."
	icon_state = "fuhrerburger"
	bitesize = 3
	center_of_mass = list("x"=16, "y"=11)
	nutriment_desc = list("bun" = 2)
	nutriment_amt = 3
	preloaded_reagents = list("protein" = 8, "fuhrerole" = 3)
	matter = list(MATERIAL_BIOMATTER = 20)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/kaiserburger
	name = "hivelord roach Burger"
	desc = "The rarest experience for your taste buds"
	icon_state = "kaiserburger"
	bitesize = 3
	center_of_mass = list("x"=16, "y"=11)
	nutriment_desc = list("bun" = 2)
	nutriment_amt = 3
	preloaded_reagents = list("protein" = 10)
	matter = list(MATERIAL_BIOMATTER = 50)
	cooked = TRUE
