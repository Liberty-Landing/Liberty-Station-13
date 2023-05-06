/obj/structure/closet/secure_closet/reinforced/quartermaster
	name = "club manager's locker"
	req_access = list(access_merchant)
	icon_state = "qm"

/obj/structure/closet/secure_closet/reinforced/quartermaster/populate_contents()
	new /obj/item/clothing/under/skylight_sweater(src)
	new /obj/item/clothing/shoes/laceup(src)
	new /obj/item/device/radio/headset/heads/clubmanager(src)
	new /obj/item/clothing/accessory/halfcape/ceo(src)
	new /obj/item/tank/emergency_oxygen(src)
	new /obj/item/clothing/mask/gas(src)
	new /obj/item/clothing/head/fedora/feathered(src)
	new /obj/item/device/scanner/price(src)
	new /obj/item/gun/projectile/revolver/little_comet(src)
	new /obj/item/gun_upgrade/mechanism/glass_widow(src)
	new /obj/item/ammo_magazine/ammobox/pistol_35(src)
	new /obj/item/ammo_magazine/ammobox/pistol_35/rubber(src)
	new /obj/item/stack/os_cash/random(src)
	new /obj/item/direct_line(src)
	new /obj/item/storage/box/ids(src)

/obj/structure/closet/secure_closet/personal/cargotech
	name = "fixer's locker"
	req_access = list(access_merchant)
	access_occupy = list(access_cargo)
	icon_state = "cargo"

/obj/structure/closet/secure_closet/personal/cargotech/populate_contents()
	new /obj/item/clothing/under/skylight_outfit(src)
	new /obj/item/clothing/suit/storage/toggle/skylight_coat(src)
	new /obj/item/clothing/shoes/color/black(src)
	new /obj/item/device/radio/headset/headset_service(src) //LL edit. Our cargo and service are together
	new /obj/item/clothing/gloves/thick(src)
	new /obj/item/device/scanner/price(src)
	if(prob(30))
		new /obj/item/storage/backpack/satchel(src)
	else if(prob(50))
		new /obj/item/storage/backpack(src)
	else
		new /obj/item/storage/backpack/duffelbag(src)
	if(prob(100))
		new /obj/item/gun/projectile/clarissa(src)
		new /obj/item/ammo_magazine/highcap_pistol_35(src)
		new /obj/item/ammo_magazine/highcap_pistol_35(src)
	else
		new /obj/item/gun/projectile/shotgun/doublebarrel/sawn(src)
		new /obj/item/ammo_casing/shotgun/pellet/prespawned(src)
		new /obj/item/ammo_casing/shotgun/pellet/prespawned(src)
	if(prob(50)) //melee weapons
		new /obj/item/clothing/gloves/dusters(src)
	else if(prob(50))
		new /obj/item/material/baseballbat/metal(src)
	else
		new /obj/item/material/butterfly/switchblade(src)
	if(prob(25))
		new /obj/item/reagent_containers/syringe/stim/turbo(src)
	else if(prob(25))
		new /obj/item/reagent_containers/syringe/stim/boxer(src)
	else if(prob(25))
		new /obj/item/reagent_containers/syringe/stim/violence_ultra(src)
	else
		new /obj/item/reagent_containers/syringe/stim/party_drops(src)
	if(prob(50)) //welcome to the mob family
		new /obj/item/reagent_containers/food/snacks/pastatomato(src)
	else if(prob(50))
		new /obj/item/reagent_containers/food/snacks/meatballspagetti(src)
	else
		new /obj/item/reagent_containers/food/snacks/boiledspagetti(src)

/obj/structure/closet/secure_closet/personal/artist
	name = "Skylight artist's locker"
	req_access = list(access_theatre)
	access_occupy = list(access_cargo)
	icon_state = "cargo"

/obj/structure/closet/secure_closet/personal/artist/populate_contents()
	new /obj/item/clothing/suit/artist(src)
	new /obj/item/clothing/under/rank/artist(src)
	new /obj/item/clothing/suit/artist(src)
	new /obj/item/clothing/shoes/artist_shoes(src)
	new /obj/item/clothing/head/beret/artist(src)
	new /obj/item/clothing/glasses/artist(src)
	new /obj/item/clothing/mask/gas/artist_hat(src)
	new /obj/item/device/radio/headset/headset_service(src)
	new /obj/item/circuitboard/artist_bench(src)
	new /obj/item/storage/pouch/grow_a_gun(src)
	new /obj/item/toy/badtothebone(src) // They should be able to use this just as much.

/obj/structure/closet/wardrobe/color/pink/artist

/obj/structure/closet/wardrobe/color/pink/artist/populate_contents()
	//new/obj/item/clothing/under/mime(src)
	new/obj/item/clothing/shoes/color/black(src)
	new/obj/item/clothing/gloves/color/white(src)
	//new/obj/item/clothing/mask/gas/mime(src)
	new/obj/item/clothing/head/beret(src)
	new/obj/item/pen/crayon/mime(src)
	new/obj/item/reagent_containers/food/drinks/bottle/bottleofnothing(src)
	new/obj/item/bikehorn(src)
	new/obj/item/clothing/glasses/monocle(src)
	new/obj/item/storage/fancy/crayons(src)
	new/obj/item/reagent_containers/spray/waterflower(src)
	new/obj/item/device/pda/clown(src)
	new/obj/item/storage/pouch/grow_a_gun(src)
	//new/obj/item/clothing/mask/gas/plaguedoctor(src)
	new/obj/item/clothing/gloves/color/green(src)
	//new/obj/item/clothing/gloves/color/rainbow(src)
	new/obj/item/storage/backpack/clown(src)
	//new/obj/item/clothing/shoes/clown_shoes(src)
	//new/obj/item/clothing/under/rank/clown(src)
	new/obj/item/clothing/mask/gas/clown_hat(src)
