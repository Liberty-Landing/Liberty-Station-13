/* Closets for specific jobs
 * Contains:
 *		Bartender
 *		Janitor
 *		Lawyer
 *		Acolyte
 */

/*
 * Bartender
 */
/obj/structure/closet/gmcloset
	name = "formal closet"
	desc = "It's a storage unit for formal clothing."
	icon_door = "black"

/obj/structure/closet/gmcloset/populate_contents()
	new /obj/item/clothing/head/tophat(src)
	new /obj/item/clothing/head/tophat(src)
	new /obj/item/device/radio/headset/headset_service(src)
	new /obj/item/device/radio/headset/headset_service(src)
	new /obj/item/clothing/head/hairflower
	new /obj/item/clothing/suit/storage/toggle/club(src)
	new /obj/item/clothing/under/rank/bartender(src)
	new /obj/item/clothing/under/rank/bartender(src)
	new /obj/item/clothing/accessory/waistcoat(src)
	new /obj/item/clothing/accessory/waistcoat(src)
	new /obj/item/clothing/shoes/color/black(src)
	new /obj/item/clothing/shoes/color/black(src)

/*
 * Chef
 */
/obj/structure/closet/chefcloset
	name = "chef's closet"
	desc = "It's a storage unit for foodservice garments."
	icon_door = "black"

/obj/structure/closet/chefcloset/populate_contents()
	new /obj/item/clothing/under/costume/job/waiter(src)
	new /obj/item/clothing/under/costume/job/waiter(src)
	new /obj/item/clothing/under/rank/bartender(src)
	new /obj/item/device/radio/headset/headset_service(src)
	new /obj/item/device/radio/headset/headset_service(src)
	new /obj/item/storage/box/mousetraps(src)
	new /obj/item/storage/box/mousetraps(src)
	new /obj/item/clothing/under/rank/chef(src)
	new /obj/item/clothing/head/rank/chef(src)
	new /obj/item/clothing/shoes/laceup(src)
	new /obj/item/clothing/shoes/laceup/white(src)
	new /obj/item/clothing/under/helltaker_m(src)
	new /obj/item/clothing/under/helltaker(src)
	new /obj/item/clothing/suit/storage/helltaker_apron(src)
	new /obj/item/clothing/suit/storage/wcoat/helltaker(src)

/*
 * Janitor
 */
/obj/structure/closet/jcloset
	name = "janitorial closet" //TODO: additonal tools for janitor only
	desc = "It's a storage unit for janitorial clothes and gear."
	icon_door = "mixed"

/obj/structure/closet/jcloset/populate_contents()
	if(prob(50))
		new /obj/item/storage/backpack/sport/purple(src)
	else
		new /obj/item/storage/backpack/satchel(src)
	new /obj/item/clothing/under/rank/janitor(src)
	new /obj/item/device/radio/headset/headset_service(src)
	new /obj/item/clothing/gloves/thick(src)
	new /obj/item/clothing/head/soft/purple(src)
	new /obj/item/clothing/head/beret/purple(src)
	new /obj/item/device/lighting/toggleable/flashlight(src)
	new /obj/item/device/lightreplacer(src)
	new /obj/item/storage/bag/trash(src)
	new /obj/item/clothing/shoes/galoshes(src)
	new /obj/item/mop(src)
	new /obj/item/tool/shovel(src)
	new /obj/item/reagent_containers/spray/cleaner(src)
	new /obj/item/newspaper_stack(src)
	new /obj/item/soap/deluxe(src)
	new /obj/item/holyvacuum(src)

//Custodians

/obj/structure/closet/oathbound
	name = "oathbound locker"
	desc = "A locker for the stalward shields and spears of the Custodians."
	icon_state = "acolyte"

/obj/structure/closet/oathbound/populate_contents()
	if(prob(25))
		new /obj/item/storage/backpack/custodian(src)
	else if(prob(25))
		new /obj/item/storage/backpack/sport/custodian(src)
	else
		new /obj/item/storage/backpack/satchel/custodian(src)
	new /obj/item/clothing/under/custodian/oathbound(src)
	new /obj/item/clothing/suit/storage/custodian/oathbound(src)
	new /obj/item/clothing/head/custodian/oathbound(src)
	new /obj/item/storage/fancy/candle_box(src)
	new /obj/item/clothing/mask/gas/germanmask(src)
	new /obj/item/device/radio/headset/church(src)
	new /obj/item/clothing/gloves/thick(src)
	new /obj/item/tool/knife/dagger/custodian(src)
	new /obj/item/tool/sword/custodian/shortsword(src)

/obj/structure/closet/forgemaster
	name = "forgemaster locker"
	desc = "A locker for the smiths and artists of the Custodians."
	icon_state = "custodian"

/obj/structure/closet/forgemaster/populate_contents()
	if(prob(25))
		new /obj/item/storage/backpack/custodian(src)
	else if(prob(25))
		new /obj/item/storage/backpack/sport/custodian(src)
	else
		new /obj/item/storage/backpack/satchel/custodian(src)
	new /obj/item/clothing/under/custodian/forgemaster(src)
	new /obj/item/clothing/suit/storage/custodian/forgemaster(src)
	new /obj/item/clothing/head/custodian/forgemaster(src)
	new /obj/item/clothing/mask/gas/germanmask(src)
	new /obj/item/device/radio/headset/church(src)
	new /obj/item/clothing/gloves/insulated(src)
	new /obj/item/tool_upgrade/productivity/waxcoat(src)

/obj/structure/closet/enkindled
	name = "enkindled locker"
	desc = "A locker for the healers and alchemists of the Custodians."
	icon_state = "botanist"

/obj/structure/closet/enkindled/populate_contents()
	if(prob(25))
		new /obj/item/storage/backpack/custodian(src)
	else if(prob(25))
		new /obj/item/storage/backpack/sport/custodian(src)
	else
		new /obj/item/storage/backpack/satchel/custodian(src)
	new /obj/item/clothing/under/custodian/enkindled(src)
	new /obj/item/clothing/suit/storage/custodian/enkindled(src)
	new /obj/item/clothing/head/custodian/enkindled(src)
	new /obj/item/clothing/mask/gas/germanmask(src)
	new /obj/item/device/radio/headset/church(src)
	new /obj/item/clothing/gloves/latex(src)
	new /obj/item/storage/makeshift_grinder(src)
	new /obj/item/device/makeshift_electrolyser(src)
	new /obj/item/device/makeshift_centrifuge(src)
	new /obj/item/storage/box/beakers(src)
	new /obj/item/storage/box/syringes(src)
	new /obj/item/reagent_containers/dropper(src)

/obj/structure/closet/secure_closet/reinforced/oathpledge
	name = "oathpledge locker"
	desc = "A locker for the leaders and guides of the Custodians."
	req_access = list(access_nt_preacher)
	icon_state = "head_preacher"

/obj/structure/closet/oathpledge/populate_contents()
	if(prob(25))
		new /obj/item/storage/backpack/custodian(src)
	else if(prob(25))
		new /obj/item/storage/backpack/sport/custodian(src)
	else
		new /obj/item/storage/backpack/satchel/custodian(src)
	new /obj/item/clothing/under/custodian/oathpledge(src)
	new /obj/item/clothing/suit/storage/custodian/oathpledge(src)
	new /obj/item/clothing/head/custodian/oathpledge(src)
	new /obj/item/clothing/mask/gas/germanmask(src)
	new /obj/item/device/radio/headset/heads/preacher(src)
	new /obj/item/clothing/gloves/thick(src)
	new /obj/item/tool/sword/custodian/horseaxe(src)
	new /obj/item/forgesigil(src)
