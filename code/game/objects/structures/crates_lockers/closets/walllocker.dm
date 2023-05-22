/obj/structure/closet/wall_mounted
	name = "wall locker"
	desc = "A wall mounted storage locker."
	icon = 'icons/obj/walllocker.dmi'
	icon_state = "wall-locker"
	anchored = TRUE
	wall_mounted = TRUE //This handles density in closets.dm
	density = FALSE


/obj/structure/closet/wall_mounted/emcloset
	name = "emergency locker"
	desc = "A wall mounted locker with emergency hypotermia management necessities."
	icon_state = "heat"

/obj/structure/closet/wall_mounted/emcloset/populate_contents()
	new /obj/item/tank/emergency_oxygen(src)
	new /obj/item/clothing/mask/breath(src)
	new /obj/item/tool/crowbar(src)
	// Items to heat up in case of extreme cold
	new /obj/item/clothing/suit/storage/toggle/liberass_jacket(src)
	if (prob(20)) // Hot ramen, some water and hotsauce, jackpot!
		new /obj/item/reagent_containers/food/drinks/dry_ramen(src)
		new /obj/item/reagent_containers/food/drinks/cans/waterbottle(src)
		new /obj/item/reagent_containers/food/condiment/pack/hotsauce(src)
	else
		new /obj/item/reagent_containers/food/snacks/openable/selfheat_coffee(src)

/obj/structure/closet/wall_mounted/emcloset/escape_pods
	icon_state = "emerg-escape"


/obj/structure/closet/wall_mounted/firecloset
	name = "fire-safety closet"
	desc = "It's a storage unit for fire-fighting supplies."
	icon_state = "hydrant"

/obj/structure/closet/wall_mounted/firecloset/populate_contents()
	new /obj/item/inflatable/door(src)
	new /obj/item/inflatable/door(src)
	new /obj/item/stack/medical/ointment(src)
	new /obj/item/clothing/head/hardhat/red(src)
	new /obj/item/clothing/mask/gas(src)
	new /obj/item/clothing/gloves/thick(src)
	new /obj/item/clothing/suit/fire(src)
	new /obj/item/tank/oxygen/red(src)
	new /obj/item/extinguisher(src)
