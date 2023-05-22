/*
/obj/structure/closet/secure_closet/reinforced/preacher
	name = "prime's locker"
	req_access = list(access_chapel_office)
	icon_state = "head_preacher"

/obj/structure/closet/secure_closet/reinforced/preacher/populate_contents()
	if(prob(25))
		new /obj/item/storage/backpack/custodian(src)
	else if(prob(25))
		new /obj/item/storage/backpack/sport/custodian(src)
	else
		new /obj/item/storage/backpack/satchel/custodian(src)
	new /obj/item/clothing/under/rank/preacher(src)
	new /obj/item/device/radio/headset/church(src)
	new /obj/item/storage/belt/utility/custodian(src)
	new /obj/item/clothing/shoes/reinforced(src)
	new /obj/item/clothing/suit/storage/chaplain(src)
	new /obj/item/clothing/gloves/thick(src)
	new /obj/item/clothing/accessory/halfcape/prime(src)
	new /obj/item/storage/fancy/candle_box(src)
	new /obj/item/storage/fancy/candle_box(src)
	new /obj/item/deck/tarot(src)
	new /obj/item/storage/sheath/joyeuse(src)
	new /obj/item/tool/knife/neotritual(src)
	new /obj/item/clothing/suit/armor/vest/prime(src)
	new /obj/item/clothing/head/helmet/prime(src)
	new /obj/item/clothing/suit/storage/neotheosports(src)
	new /obj/item/shield_projector/rectangle/church_personal(src)
*/

