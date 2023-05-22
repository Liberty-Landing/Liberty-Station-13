
/obj/item/mold
	name = "mold base item"
	desc = "Not to be seen in-game."
	icon = 'icons/obj/crafts.dmi'
	icon_state = "dischargemisc_mold"
	throw_range = 5
	matter = list(MATERIAL_BIO_SILK = 10, MATERIAL_PLASTIC = 5)

/obj/item/mold/weapon
	name = "flareforged weapon nanomold"
	desc = "A nanomold forged out of Radiance and other materials that can be configured by a Custodian to start the forging process of a weapon."
	icon_state = "dischargeweapon_mold"

/obj/item/mold/armor
	name = "flareforged armor nanomold"
	desc = "A nanomold forged out of Radiance and other materials that can be configured by a Custodian to start the forging process of a piece of armor."
	icon_state = "dischargearmor_mold"

/obj/item/mold/upgrade
	name = "flareforged upgrade nanomold"
	desc = "A nanomold forged out of Radiance and other materials that can be configured by a Custodian to start the forging process of a Hearthcore upgrade."
	icon_state = "dischargeupgrade_mold"

/obj/item/mold/misc
	name = "flareforged general nanomold"
	desc = "A nanomold forged out of Radiance and other materials that can be configured by a Custodian to start the forging process of a variety of items."

/obj/item/mold/oathpledge_neuron
	name = "oathpledge battleneuron"
	desc = "A unique component given to Oathpledges in order to forge their armor."
	icon_state = "oathpledge_battleneuron"

/obj/item/stack/mold_kit
	name = "moldkit stack base item"
	desc = "Not to be seen in-game."
	icon = 'icons/obj/crafts.dmi'
	icon_state = "radiance_sigil"
	throw_range = 3
	max_amount = 10
	amount = 1

/obj/item/stack/mold_kit/radiance_sigil
	name = "radiance sigils"
	singular_name = "radiance sigil"
	desc = "A holding tray for Radiance used by the Custodians to make especially delicate adjustments to their nanomolds, the Radiance is consumed after their work is done."
	icon_state = "radiance_sigil"
	matter = list(MATERIAL_SILVER = 6)

/obj/item/stack/mold_kit/blacksmithing
	name = "blacksmithing toolset"
	singular_name = "blacksmithing tool"
	desc = "A set of metalsmithing hand-tools created by the Custodians. Only designed to bring shape to their nanomolds, these toolkits are mass-produced and disposable, wearing away into uselessness after their work is done."
	icon_state = "blacksmithing_kit"
	matter = list(MATERIAL_STEEL = 15, MATERIAL_PLASTEEL = 8)

/obj/item/stack/mold_kit/tailoring
	name = "tailoring toolset"
	singular_name = "tailoring tool"
	desc = "A set of tailoring hand-tools created by the Custodians. Only designed to bring shape to their nanomolds, these toolkits are mass-produced and disposable, wearing away into uselessness after their work is done."
	icon_state = "tailoring_kit"
	matter = list(MATERIAL_BIO_SILK = 15, MATERIAL_PLASTIC = 10)

/obj/item/stack/mold_kit/masonry
	name = "masonry toolset"
	singular_name = "masonry tool"
	desc = "A set of carving and sharpening hand-tools created by the Custodians. Only designed to bring shape to their nanomolds, these toolkits are mass-produced and disposable, wearing away into uselessness after their work is done."
	icon_state = "masonry_kit"
	matter = list(MATERIAL_WOOD = 10, MATERIAL_CARBON_FIBER = 15)
