/datum/gear/factionsecurity/marshal/ushanka
	display_name = "Armored watch Ushanka"
	path = /obj/item/clothing/head/helmet/marshal/ushanka
	allowed_roles = list(JOBS_SECURITY)
	slot = slot_head
	sort_category = "Faction: Security"

/datum/gear/factionsecurity
	display_name = "winter coat, security"
	path = /obj/item/clothing/suit/hooded/wintercoat/security
	allowed_roles = list(JOBS_SECURITY)
	slot = slot_wear_suit
	sort_category = "Faction: Security"
	cost = 0

/datum/gear/factionsecurity/ironhammer_wintercoat //it's just a generic marshal plate carrier coat with no added coverage -Dongels
	display_name = "security armored coat"
	path = /obj/item/clothing/suit/armor/vest/ironhammer_wintercoat
	slot = slot_wear_suit

/datum/gear/factionsecurity/beretcommander
	display_name = "beret, security head"
	path = /obj/item/clothing/head/rank/commander
	allowed_roles = list("Deputy Chief")
	slot = slot_head
	sort_category = "Faction: Security"

/datum/gear/factionsecurity/beretironhammer
	display_name = "beret, security"
	path = /obj/item/clothing/head/rank/ironhammer
	slot = slot_head

/datum/gear/factionsecurity/beretwarden
	display_name = "beret, armorer"
	path = /obj/item/clothing/head/rank/warden/beret
	allowed_roles = list("Armorer")
	slot = slot_head

/datum/gear/factionsecurity/cloak
	display_name = "cloak, deputy chief"
	path = /obj/item/clothing/accessory/job/cape/ihc
	allowed_roles = list("Deputy Chief")
	slot = slot_wear_suit

/datum/gear/factionsecurity/cloakironhammer
	display_name = "cloak, security"
	path = /obj/item/clothing/accessory/job/cape/ironhammer
	slot = slot_wear_suit

/datum/gear/factionsecurity/capfield
	display_name = "cap, field"
	path = /obj/item/clothing/head/soft/sec2soft
	sort_category = "Faction: Security"

/datum/gear/factionsecurity/cappatrolblack
	display_name = "cap, patrol black"
	path = /obj/item/clothing/head/seccorp
	slot = slot_head
	sort_category = "Faction: Security"

/datum/gear/factionsecurity/cappatrolblue
	display_name = "cap, patrol blue"
	path = /obj/item/clothing/head/seccap
	slot = slot_head
	sort_category = "Faction: Security"

/datum/gear/factionsecurity/capsarge
	display_name = "cap, armorer"
	path = /obj/item/clothing/head/soft/sarge2soft
	allowed_roles = list("Armorer")

/datum/gear/factionsecurity/bdu
	display_name = "security BDU selection"
	path = /obj/item/clothing/under/rank/bdu
	flags = GEAR_HAS_TYPE_SELECTION
	slot = slot_w_uniform

/datum/gear/factionsecurity/gorka_ih
	display_name = "gorka jacket, security"
	path = /obj/item/clothing/suit/gorka/toggle/gorka_ih
	slot = slot_wear_suit

/datum/gear/factionsecurity/afghanka_pants
	display_name = "afghanka pants, security"
	path = /obj/item/clothing/under/rank/security/afghanka_pants
	slot = slot_w_uniform

/datum/gear/factionsecurity/afghanka_jacket
	display_name = "afghanka jacket, security"
	path = /obj/item/clothing/suit/storage/toggle/afghanka_watch
	slot = slot_wear_suit

/datum/gear/factionsecurity/gorkasecurity
	display_name = "gorka jumpsuit, security"
	path = /obj/item/clothing/under/rank/security/gorka_ih
	slot = slot_w_uniform

/datum/gear/factionsecurity/gorkasecuritypants
	display_name = "gorka pants, security"
	path = /obj/item/clothing/under/rank/security/gorkapantsih
	slot = slot_w_uniform

/datum/gear/factionsecurity/gorka_pants
	display_name = "gorka security pants"
	path = /obj/item/clothing/under/rank/security/gorkapantsih
	slot = slot_w_uniform

/datum/gear/factionsecurity/security
	display_name = "security HUD"
	path = /obj/item/clothing/glasses/hud/security

/datum/gear/factionsecurity/secpatch
	display_name = "HUD eyepatch"
	path = /obj/item/clothing/glasses/eyepatch/secpatch

/datum/gear/factionsecurity/security_tact
	display_name = "tactical security HUD"
	path = /obj/item/clothing/glasses/sechud/tactical
	cost = 2 //has flash protection

/datum/gear/factionsecurity/secglasses
	display_name = "HUD Glasses"
	path = /obj/item/clothing/glasses/sechud
	cost = 2 //has flash protection

/datum/gear/factionsecurity/snowsuitsecurity
	display_name = "snowsuit, security"
	path = /obj/item/clothing/suit/storage/snowsuit/security
	slot = slot_wear_suit
	sort_category = "Faction: Security"

/datum/gear/factionsecurity/winterbootssecurity
	display_name = "winter boots, security"
	path = /obj/item/clothing/shoes/winter/security
	slot = slot_shoes
	sort_category = "Faction: Security"

/datum/gear/factionsecurity/armoredcossackcoat
	display_name = "jaeger hussar coat"
	path = /obj/item/clothing/suit/greatcoat/cossackarmoredcoat
	slot = slot_wear_suit
	sort_category = "Faction: Security"
	cost = 2
