
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

/obj/item/mold/granule_neuron
	name = "Infusive Granule Neuron"
	desc = "These neurons contains SMAs (Shape-Memory Alloy) that are deployed by infusive radiance in the darksilver matrix of custodian armor and weapons. \
	It only works for Darksilver subtype of steel. The radiance itself heatens the metal so the equipment will go back to it's original shape after deformation, \
	Which adds resilience against repeated impacts, deformation, and keeping a blade sharp for longer. It barely does something against metal that was removed after impact."
	icon_state = "oathpledge_battleneuron"

/obj/item/mold/renshaw_neuron
	name = "Infusive Renshaw Neuron"
	desc = "These neurons contains Graphene-Infused Steel Alloys with nanocomposites that are deployed by infusive radiance in the darksilver matrix of custodian armor and weapons. \
	It only works for Darksilver subtype of steel due to it's compatible metal matrix. The radiance reinforces the steel alloy with nanocomposites together with graphene rods within the steel matrix.\
	The nanocomposites absorbs and dissipates energy, together with graphene rods to better distribute electrical charges and impact across the body to lessen the chance of the user getting severely damage in only one place."
	icon_state = "renshaw_infusive"

/obj/item/mold/cartwheel_neuron
	name = "Infusive Cartwheel Neuron"
	desc = "These neurons contains Nanostructured Steel Alloys with vibrating technology that are deployed by infusive radiance in the darksilver matrix of custodian armor and weapons. \
	It only works for Darksilver subtype of steel. The radiance reinforces the steel alloy with nano-sized grains that enhances hardness and toughness, \
	making the metal resistant to penetration, making it less brittle and more deformable, relying on SMAs to keep it in place. \
	The nanosized grains, when powered by radiance, implement vibrational technology within a blade, causing it to vibrate at high frequencies before impact, greatly enhancing cutting effectiveness."
	icon_state = "cartwheel_infusive"

/obj/item/mold/purifier_essence //only spawned by hearthcoreless Peerage
	name = "Essence of the Purifier"
	desc = "Radiance in cristalized form, with important alveoli functions to keep it alive. \
	It exists to replace those who cannot abide by the oaths, or are too susceptible to the symptons of argyria. \
	This bundle of radiance is used to improve some civilizan-grade custodian weapons into an squire-themed one. \
	Since this is still a prototype, you will not be able to make much at all."
	icon_state = "purifier_infusive"

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
	matter = list(MATERIAL_ALUMINIUM = 15, MATERIAL_INDSTEEL = 8)

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

/obj/item/dog_armor
	name = "Foog bloodline armor"
	desc = "An elohopean design used to protect dogs during urban combat in the past, \
			in which dogs were crucial to recover the lost and wounded under artillery fire. \
			Currently, this design is used by the borzois under the Foog bloodline."
	icon = 'icons/mob/lord_foog.dmi'
	icon_state = "foog_armor"

/obj/item/stack/custodian_neural
	name = "Custodian Neural Link"
	singular_name = "Custodian Neuron"
	desc = "You were totally not supposed to see this. Go awaaaay."
	icon = 'icons/obj/neural_link.dmi'
	icon_state = "raw_ectoderm"
	throw_range = 5
	matter = list(MATERIAL_SILVER = 1, MATERIAL_BIOMATTER = 5)

/obj/item/stack/custodian_neural/ectoderm
	name = "Raw Ectoderm"
	singular_name = "Pile of Raw Ectoderm "
	desc = "The result of purification. The Brain, ganglia and many nerves. \
			Sterilized by flames, now dry, denied of degradation and coated in silver. \
			Ectoderm is used to produce new radiance nerves without being genetically bound to their previous owner."
	icon_state = "raw_ectoderm"


