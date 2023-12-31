
/obj/item/device/encryptionkey/
	name = "standard encryption key"
	desc = "An encryption key for a radio headset. Contains cypherkeys."
	icon = 'icons/obj/radio.dmi'
	icon_state = "cypherkey"
	item_state = ""
	w_class = ITEM_SIZE_TINY
	slot_flags = SLOT_EARS
	var/translate_binary = 0
	var/translate_hive = 0
	var/syndie = 0
	var/list/channels = list()
	matter = list(MATERIAL_ALUMINIUM = 1, MATERIAL_PLASTIC = 1)
	preloaded_reagents = list("silicon" = 6, "copper" = 5, "plasticide" = 9)

/obj/item/device/encryptionkey/attackby(obj/item/W as obj, mob/user as mob)

/obj/item/device/encryptionkey/syndicate
	icon_state = "cypherkey"
	channels = list("Mercenary" = 1)
	origin_tech = list(TECH_ILLEGAL = 3)
	syndie = 1//Signifies that it de-crypts Syndicate transmissions

/obj/item/device/encryptionkey/binary
	icon_state = "cypherkey"
	translate_binary = 1
	origin_tech = list(TECH_ILLEGAL = 3)
	matter = list(MATERIAL_ALUMINIUM = 2, MATERIAL_PLASTIC = 2, MATERIAL_SILVER = 2)

/obj/item/device/encryptionkey/headset_bs //Unused BS headset
	name = "blackshield radio encryption key"
	icon_state = "sec_cypherkey"
	channels = list("Blackshield" = 1)	//Marshal coms taken away due to abuse by regular troopers. Sergeant and CO have maintained theirs.

/obj/item/device/encryptionkey/headset_bs/corps //Unused BS headset
	name = "corpsman radio encryption key"
	icon_state = "mil_cypherkey"
	channels = list("Blackshield" = 1, "Medical(I)" = 1)

/obj/item/device/encryptionkey/headset_bs/sergeant //Unused BS headset
	name = "sergeant radio encryption key"
	icon_state = "mil_cypherkey"	//Someone should give this a new sprite at some point and change this text when they do. I'm too lazy to. -Rebel0
	channels = list("Blackshield" = 1, "Marshal" = 1)

/obj/item/device/encryptionkey/headset_mar
	name = "security radio encryption key"
	icon_state = "sec_cypherkey"
	channels = list("Watch" = 1)

/obj/item/device/encryptionkey/headset_eng
	name = "union radio encryption key"
	icon_state = "eng_cypherkey"
	channels = list("Terra" = 1)

/*
/obj/item/device/encryptionkey/headset_rob
	name = "pirs robotics radio encryption key"
	icon_state = "rob_cypherkey"
	channels = list("Terra" = 1, "PIRS" = 1)
*/

/obj/item/device/encryptionkey/headset_bonfire
	name = "bonfire custodian radio encryption key"
	icon_state = "nt_cypherkey"
	channels = list("Custodians" = 1)

/obj/item/device/encryptionkey/headset_sci
	name = "Phokorus Institute science radio encryption key"
	icon_state = "sci_cypherkey"
	channels = list("PIRS" = 1, "Medical(I)" = 1)

/obj/item/device/encryptionkey/headset_capsa
	name = "CAPSA medical encryption key"
	icon_state = "med_cypherkey"
	channels = list("CAPSA" = 1, "Medical(I)" = 1)

/obj/item/device/encryptionkey/headset_com
	name = "council command radio encryption key"
	icon_state = "com_cypherkey"
	channels = list("Board" = 1)

/obj/item/device/encryptionkey/heads/captain
	name = "secretary's encryption key"
	icon_state = "cap_cypherkey"
	channels = list("Board" = 1, "Medical(I)" = 1, "Fontaine" = 1,  "Terra" = 1, "Custodians" = 1, "PIRS" = 1, "CAPSA" = 1, "Skylight" = 1, "AI Private" = 1, "Watch" = 1)

/obj/item/device/encryptionkey/heads/ai_integrated
	name = "ai integrated encryption key"
	desc = "Integrated encryption key"
	icon_state = "cap_cypherkey"
	channels = list("Board" = 1, "Medical(I)" = 1, "Fontaine" = 1,  "Terra" = 1, "Custodians" = 1, "PIRS" = 1, "CAPSA" = 1, "Skylight" = 1, "AI Private" = 1, "Watch" = 1, "Plasmatag B" = 1, "Plasmatag R" = 1, "Plasmatag G" = 1, "Plasmatag Y" = 1)

/obj/item/device/encryptionkey/heads/rd
	name = "research provost's encryption key"
	icon_state = "rd_cypherkey"
	channels = list("PIRS" = 1, "Board" = 1, "Medical(I)" = 1)
	translate_binary = 1

/obj/item/device/encryptionkey/heads/capsa
	name = "surgeon overseer's encryption key"
	icon_state = "rd_cypherkey"
	channels = list("CAPSA" = 1, "Board" = 1, "Medical(I)" = 1)

/obj/item/device/encryptionkey/heads/hos
	name = "security commander's encryption key"
	icon_state = "hos_cypherkey"
	channels = list("Board" = 1, "Watch" = 1)

/obj/item/device/encryptionkey/heads/ce
	name = "union chief's encryption key"
	icon_state = "ce_cypherkey"
	channels = list("Terra" = 1, "Board" = 1)

/*
/obj/item/device/encryptionkey/heads/cmo
	name = "biolab overseer's encryption key"
	icon_state = "cmo_cypherkey"
	channels = list("Medical" = 1, "Command" = 1)
*/

/obj/item/device/encryptionkey/heads/hop //Probably not used anymore
	name = "steward's encryption key"
	icon_state = "hop_cypherkey"
	channels = list("Board" = 1, "Medical(I)" = 1, "Fontaine" = 1,  "Terra" = 0, "Custodians" = 0, "PIRS" = 0, "CAPSA" = 0, "Skylight" = 0, "Watch" = 1, "Plasmatag B" = 0, "Plasmatag R" = 0, "Plasmatag G" = 0, "Plasmatag Y" = 0)

/obj/item/device/encryptionkey/heads/clubmanager
	name = "skylight syndicate club manager radio encryption key"
	icon_state = "qm_cypherkey"
	channels = list("Skylight" = 1, "Board" = 1)

/obj/item/device/encryptionkey/heads/oathpledge
	name = "oathpledge radio encryption key"
	icon_state = "preach_cypherkey"
	channels = list("Custodians" = 1, "Board" = 1)

/obj/item/device/encryptionkey/headset_cargo
	name = "unused radio encryption key"
	desc = "If you see this, something's wrong."
	icon_state = "cargo_cypherkey"
	channels = list("Skylight" = 1)

/obj/item/device/encryptionkey/headset_service
	name = "skylight radio encryption key"
	icon_state = "srv_cypherkey"
	channels = list("Skylight" = 1)

/obj/item/device/encryptionkey/headset_pro
	name = "fontaine radio encryption key"
	icon_state = "srv_cypherkey"
	channels = list("Fontaine" = 1)

/obj/item/device/encryptionkey/heads/foreman
	name = "shepherd radio encryption key"
	icon_state = "qm_cypherkey"
	channels = list("Fontaine" = 1, "Board" = 1)

/obj/item/device/encryptionkey/entertainment
	name = "entertainment radio key"
	channels = list("Skylight" = 1)

/obj/item/device/encryptionkey/headset_blueteam
	name = "entertainment radio key"
	channels = list("Plasmatag B" = 1)

/obj/item/device/encryptionkey/headset_redteam
	name = "entertainment radio key"
	channels = list("Plasmatag R" = 1)

/obj/item/device/encryptionkey/headset_yellowteam
	name = "entertainment radio key"
	channels = list("Plasmatag Y" = 1)

/obj/item/device/encryptionkey/headset_greenteam
	name = "entertainment radio key"
	channels = list("Plasmatag G" = 1)
