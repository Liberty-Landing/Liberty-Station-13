// Stacked resources. They use a material datum for a lot of inherited values.
/obj/item/stack/material
	force = WEAPON_FORCE_HARMLESS
	throwforce = WEAPON_FORCE_HARMLESS
	w_class = ITEM_SIZE_NORMAL
	icon = 'icons/obj/stack/material.dmi'
	throw_speed = 3
	throw_range = 3
	max_amount = 120

	var/default_type = MATERIAL_ALUMINIUM
	var/material/material
	var/apply_colour //temp pending icon rewrite

/obj/item/stack/material/New(loc, material_count=null)
	.=..(loc, material_count)
	//Make shards if there is a remainder for any reason. If it rounds down to zero, remove it.'
	var/remainder = amount - round(amount, 1)
	if(remainder != 0)
		log_debug("Item: [type] Initial amount:[amount] Remainder: [remainder]")
		amount -= remainder
		new /obj/item/material/shard(get_turf(src), default_type, remainder)
		if(amount == 0)
			qdel(src)
			return

/obj/item/stack/material/Initialize()
	. = ..()
	pixel_x = rand(0,10)-5
	pixel_y = rand(0,10)-5

	if(!default_type)
		default_type = MATERIAL_ALUMINIUM
	material = get_material_by_name("[default_type]")
	if(!material)
		return INITIALIZE_HINT_QDEL

	stacktype = material.stack_type
	if(islist(material.stack_origin_tech))
		origin_tech = material.stack_origin_tech.Copy()

	if(apply_colour)
		color = material.icon_colour

	if(material.conductive)
		flags |= CONDUCT

	matter = material.get_matter()
	update_strings()
/*
/obj/item/stack/material/get_matter()
	. = list()
	if(matter)
		for(var/i in matter)
			matter[i] = amount
		. = matter
*/
/obj/item/stack/material/attack_self(mob/living/user)
	user.craft_menu()

/obj/item/stack/material/get_material()
	return material

/obj/item/stack/material/proc/get_default_type()
	return default_type

/obj/item/stack/material/proc/update_strings()
	// Update from material datum.
	singular_name = material.sheet_singular_name

	if(amount>1)
		name = "[material.use_name] [material.sheet_plural_name]"
		desc = "A stack of [material.use_name] [material.sheet_plural_name]."
		gender = PLURAL
	else
		name = "[material.use_name] [material.sheet_singular_name]"
		desc = "A [material.sheet_singular_name] of [material.use_name]."
		gender = NEUTER

/obj/item/stack/material/use(var/used)
	. = ..()
	update_strings()
	return

/obj/item/stack/material/transfer_to(obj/item/stack/S, var/tamount=null, var/type_verified)
	var/obj/item/stack/material/M = S
	if(!M || !istype(M) || material.name != M.material.name)
		return 0
	var/transfer = ..(S,tamount,1)
	if(src) update_strings()
	if(M) M.update_strings()
	return transfer

/obj/item/stack/material/attack_self(var/mob/user)
	if(!material.build_windows(user, src))
		..()

/obj/item/stack/material/attackby(var/obj/item/W, var/mob/user)
	if(istype(W,/obj/item/stack/cable_coil))
		material.build_wired_product(user, W, src)
		return
	else if(istype(W, /obj/item/stack/rods))
		material.build_rod_product(user, W, src)
		return
	return ..()

/obj/item/stack/material/add(var/extra)
	..()
	update_strings()


/obj/item/stack/material/iron
	name = "iron"
	desc = "Without alloying with another material, nowadays it solely has uses for structural constructions."
	icon_state = "sheet-iron"
	default_type = MATERIAL_IRON
	price_tag = 1
	novariants = FALSE

/obj/item/stack/material/iron/random
	rand_min = 3
	rand_max = 8

/obj/item/stack/material/iron/full
	amount = 120

/obj/item/stack/material/sandstone
	name = "sandstone brick"
	desc = "thick construction material from compressed sand. Rustic and cheap, not very durable on its own."
	icon_state = "sheet-sandstone"
	default_type = MATERIAL_SANDSTONE
	price_tag = 1

/obj/item/stack/material/marble
	name = "marble brick"
	desc = "High quality building material with a timeless beauty and luxurious, polished smoothness."
	icon_state = "sheet-marble"
	default_type = MATERIAL_MARBLE

/obj/item/stack/material/diamond
	name = "diamond"
	desc = "exquisite gemstones with exceptional hardness formed deep within the planet's mantles under intense pressure and heat. Or synthetized, of course."
	icon_state = "sheet-diamond"
	default_type = MATERIAL_DIAMOND
	price_tag = 25
	novariants = FALSE

/obj/item/stack/material/diamond/full
	amount = 120

/obj/item/stack/material/diamond/random
	rand_min = 1
	rand_max = 5

/obj/item/stack/material/briquette
	name = "lignite briquette"
	desc = "compressed block of lignite coal with a shape that aids the fire to spread due to its plentiful airflow. It is used for fuel, as kindling, to power up a generator or heat up places when energy is out."
	icon_state = "sheet-briquette"
	default_type = MATERIAL_BRIQUETTE
	price_tag = 1
	novariants = FALSE

/obj/item/stack/material/briquette/full
	amount = 120

/obj/item/stack/material/briquette/random
	rand_min = 1
	rand_max = 5

/obj/item/stack/material/briquette/tenstack
	rand_min = 10
	rand_max = 12

/obj/item/stack/material/uranium
	name = MATERIAL_URANIUM
	desc = "Heavy and radioactive metallic element, key component in nuclear fuel. Somewhat replaced by Thorium on earth, but the ease for this material to be found in alien planets allowed its uses to be brought back. \
	Can be depleted and used for mecha armor."
	icon_state = "sheet-uranium"
	default_type = MATERIAL_URANIUM
	price_tag = 10
	novariants = FALSE

/obj/item/stack/material/uranium/full
	amount = 120

/obj/item/stack/material/uranium/random
	rand_min = 2
	rand_max = 5

/obj/item/stack/material/plastic
	name = "plastic blend"
	desc = "Composite material formed with many different polymers. The most 3dlathe compatible material, in which only the necessary polymers are used, and the rest is scrapped. However, it struggles to make proper kevlar components without direct manual intervention."
	icon_state = "sheet-plastic"
	default_type = MATERIAL_PLASTIC
	price_tag = 2
	novariants = FALSE

/obj/item/stack/material/plastic/full
	amount = 120

/obj/item/stack/material/plastic/random
	rand_min = 3
	rand_max = 10

/obj/item/stack/material/gold
	name = "gold"
	desc = "Malleable, rare and precious metal. Mainly used for coinage, jewelry, ornamental purposes and as symbol of wealth. Still finds uses in medical applications and machinery such as augments."
	icon_state = "sheet-gold"
	default_type = MATERIAL_GOLD
	price_tag = 10
	novariants = FALSE

/obj/item/stack/material/gold/full
	amount = 120

/obj/item/stack/material/gold/random
	rand_min = 2
	rand_max = 6

/obj/item/stack/material/silver
	name = "silver"
	desc = "Lustruous and precious metal integral in electronics and photography, as the metal with most electrical conductivity. Possess antimicrobial effect and, when on specialized machines, can help stabilize cosmic entropy."
	icon_state = "sheet-silver"
	default_type = MATERIAL_SILVER
	price_tag = 5
	novariants = FALSE

/obj/item/stack/material/silver/random
	rand_min = 3
	rand_max = 8

/obj/item/stack/material/silver/full
	amount = 120

//Fuel for MRSPACMAN generator.
/obj/item/stack/material/tritium
	name = "tritium"
	desc = "The radioactive isotope of hydrogen used for illumination, nuclear fusion, biological tracing and radiolumiescent paint. However, it is radioactive and dangerous, without way to be depleted like Uranium."
	icon_state = "sheet-tritium"
	default_type = MATERIAL_TRITIUM
	apply_colour = 1
	price_tag = 10

/obj/item/stack/material/tritium/full
	amount = 120

/obj/item/stack/material/wood
	name = "wooden plank"
	desc = "renewable natural resource with a good aesthetic appeal, very used in furniture and crafts. Relatively unused nowadays, but still used by Frostwalkers and the Congenital Tribesmen."
	icon_state = "sheet-wood"
	default_type = MATERIAL_WOOD
	price_tag = 1 //Way to easy to get on mass.

/obj/item/stack/material/wood/full
	amount = 120

/obj/item/stack/material/wood/random
	rand_min = 3
	rand_max = 10

/obj/item/stack/material/cloth
	name = "cloth"
	desc = "Tissue made from organic staple fibers, or anything sugar-based, has long been replaced by polymers in clothing manufacturing. However, varieties made of cotton are still found in the local market."
	icon_state = "sheet-cloth"
	default_type = MATERIAL_CLOTH
	price_tag = 1

/obj/item/stack/material/cloth/full
	amount = 120

/obj/item/stack/material/cloth/random
	rand_min = 3
	rand_max = 7

/obj/item/stack/material/silk
	name = "silk"
	desc = "protein polymer made from spider glands, stronger than silkworm silk - far weaker than electrospun biopolymers and polymers used in armor. Can help heal burn damage"
	icon_state = "sheet_silk_bundle"
	default_type = MATERIAL_SILK //We dont work as cloth
	price_tag = 10

/obj/item/stack/material/cardboard
	name = "cardboard"
	desc = "paper-based product used for packaging and stockpile organization."
	icon_state = "sheet-card"
	default_type = MATERIAL_CARDBOARD
	price_tag = 3

/obj/item/stack/material/cardboard/full
	amount = 120

/obj/item/stack/material/cardboard/random
	rand_min = 5
	rand_max = 10

/obj/item/stack/material/leather
	name = "leather"
	desc = "The by-product of skinning local wildlife."
	icon_state = "sheet-leather"
	default_type = MATERIAL_LEATHER
	price_tag = 10

// For recycling purposes, very low quantity so that Trappers are still way better at this.
/obj/item/stack/material/leather/random
	rand_min = 1
	rand_max = 4

/obj/item/stack/material/bone
	name = "bones"
	desc = "rigid skeletal structures found in vertebrates, providing support and protection. Hopefully it isn't human, or colonial alien."
	icon_state = "sheet_bones"
	default_type = MATERIAL_BONE
	price_tag = 10

/obj/item/stack/material/glass
	name = MATERIAL_GLASS
	desc = "transparent or translucent material formed by melting and cooling silica-based substances, often used for windows and containers."
	icon_state = "sheet-glass"
	default_type = MATERIAL_GLASS
	price_tag = 2
	novariants = FALSE

/obj/item/stack/material/glass/full
	amount = 120

/obj/item/stack/material/glass/random
	rand_min = 3
	rand_max = 15

/obj/item/stack/material/glass/laminated
	name = "laminated glass"
	icon_state = "sheet-lglass"
	default_type = MATERIAL_LGLASS

/obj/item/stack/material/glass/mendsilicate
	name = "mendsilicate glass"
	desc = "This sheet is made from the constantly mending and heat-reflecting capacities of cosmic nacre, designed to withstand large temperatures"
	singular_name = "mendsilicate glass sheet"
	icon_state = "sheet-mendsilicateglass"
	default_type = MATERIAL_BGLASS
	price_tag = 6

/obj/item/stack/material/glass/mendsilicate/full
	amount = 120

/obj/item/stack/material/glass/mendsilicate/random
	rand_min = 3
	rand_max = 8

/obj/item/stack/material/mendsilicate/reinforced
	name = "laminated mendsilicate glass"
	desc = "This sheet is made from the constantly mending and heat-reflecting capacities of cosmic nacre. It has been laminated for bulletproof capacities."
	singular_name = "laminated mendsilicate glass sheet"
	icon_state = "sheet-lmendsilicateglass"
	default_type = MATERIAL_LBGLASS
	price_tag = 12

/obj/item/stack/material/mendsilicate/reinforced/full
	amount = 120

/obj/item/stack/material/biomatter
	name = "contained biomatter"
	desc = "gel-like biological substance rich in nutrients and sugar for producing body tissues, or chemical products."
	singular_name = "biomatter canister"
	icon_state = "sheet-biomatter"
	default_type = MATERIAL_BIOMATTER
	price_tag = 1 // At least it's something...?
	biomatter_in_sheet = 1
	novariants = FALSE

/obj/item/stack/material/biomatter/random
	rand_min = 5
	rand_max = 8

/obj/item/stack/material/biomatter/full
	amount = 120

/obj/item/stack/material/carbon_fiber
	name = "carbon fiber"
	desc = "lightweight, high-strength material composed of bonded atoms of carbon. Outstanding in production of armor, it can be further improved into Graphene with 3Dlathe interventions."
	singular_name = "carbon fiber sheet"
	icon_state = "sheet-carbon_fiber"
	default_type = MATERIAL_CARBON_FIBER
	novariants = FALSE
	price_tag = 8

/obj/item/stack/material/carbon_fiber/full
	amount = 120

/obj/item/stack/material/carbon_fiber/random
	rand_min = 3
	rand_max = 8

/obj/item/stack/material/biopolymer_silk
	name = "biopolymer silk"
	desc = "Multi-layered, electrospunned silk fibroin fabrics crosslinked with glutaraldehyde, heated into a crystallinified state. Replaced Kevlar due to its efficient weight-to-protection ratio and 3Dlathes compatibility."
	singular_name = "biopolymer silk sheet"
	icon_state = "sheet-biopolymer"
	default_type = MATERIAL_BIO_SILK
	novariants = FALSE
	price_tag = 4

/obj/item/stack/material/biopolymer_silk/full
	amount = 120

/obj/item/stack/material/biopolymer_silk/random
	rand_min = 3
	rand_max = 8

/obj/item/stack/material/compressed_matter
	name = "compressed matter"
	desc = "Useful matter that has been compressed and squeezed into cartridges."
	singular_name = "compressed matter cartridge"
	icon = 'icons/obj/ammo.dmi'
	icon_state = "rcd"
	item_state = "rcdammo"
	default_type = MATERIAL_COMPRESSED_MATTER
	price_tag = 30

/obj/item/stack/material/compressed_matter/random
	rand_min = 15
	rand_max = 30

/obj/item/stack/material/compressed_matter/full
	amount = 120

//Snowflake material with no way of making for NOW that is used for sandbag creation and repair.
/obj/item/stack/material/sandbag
	name = MATERIAL_SANDBAG
	desc = "A small pile of sandbags ready to be used for temporary fortifications."
	singular_name = "sandbag"
	icon = 'icons/obj/sandbags.dmi'
	icon_state = "sandbags"
	default_type = MATERIAL_SANDBAG
	novariants = TRUE
	price_tag = 10		//Shouldn't be worth anything; it's a literal cloth bag full of sand.
	max_amount = 10		//Keep small to prevent mass-building.

/obj/item/stack/material/sandbag/full
	amount = 10

/obj/item/stack/material/chitin
	name = MATERIAL_CHITIN
	desc = "A strange textured piece of an large insects exoskeleton, acting as an organic polymer material."
	singular_name = "chitin"
	icon_state = "sheet_chitin"
	default_type = MATERIAL_CHITIN
	novariants = TRUE
	price_tag = 10
	max_amount = 50

/obj/item/stack/material/chitin/random
	rand_min = 1
	rand_max = 4

/obj/item/stack/material/darkbone
	name = MATERIAL_DARKBONE
	desc = "A strange blackened bone, dried yet still somehow sturdy. Unlike a normal bone of various creatures it does not appear as brittle, strong and with a certain flexibilty to it."
	singular_name = "dark bone"
	icon_state = "sheet_darkbones"
	default_type = MATERIAL_DARKBONE
	novariants = TRUE
	price_tag = 14		//'Rarer' type of bone, crafts better stuff - therefor slightly more valuable in the long-run.
	max_amount = 50

/obj/item/stack/material/darkbone/random
	rand_min = 1
	rand_max = 4

/obj/item/stack/material/hydrogenc
	name = "hydrogen Clathrates"
	icon_state = "sheet-hydrogen" 
	default_type = MATERIAL_HYDROGENC
	price_tag = 8
	novariants = FALSE

/obj/item/stack/material/hydrogenc/random
	rand_min = 3
	rand_max = 5

/obj/item/stack/material/hydrogenc/full
	amount = 120

//pre-industrial materials, all removed.
/*
/obj/item/stack/material/glass/mendsilicate
	name = "borosilicate glass"
	desc = "This sheet is special plasma-glass alloy designed to withstand large temperatures"
	singular_name = "borosilicate glass sheet"
	icon_state = "sheet-mendsilicate"
	default_type = MATERIAL_LBGLASS
	price_tag = 6

/obj/item/stack/material/ameridian
	name = "ameridian shard"
	desc = "A weird green crystal that seems to grow on its own."
	singular_name = "ameridian crystal"
	icon = 'icons/obj/ameridian.dmi'
	icon_state = "ameridian_crystal_item"
	default_type = MATERIAL_AMERIDIAN
	novariants = TRUE
	price_tag = 50 // ameridian mining is extremly dangerous and very profitable
	max_amount = 360

/obj/item/stack/material/ameridian/full
	amount = 360

/obj/item/stack/material/osmium
	name = "osmium"
	icon_state = "sheet-silver"
	default_type = MATERIAL_TITANIUMRTC
	apply_colour = 1
	price_tag = 12

/obj/item/stack/material/osmium/full
	amount = 120

//Valuable resource, cargo can sell it.
/obj/item/stack/material/platinum
	name = "platinum"
	icon_state = "sheet-platinum"
	default_type = MATERIAL_TITANIUM
	price_tag = 20
	novariants = FALSE

/obj/item/stack/material/platinum/random
	rand_min = 1
	rand_max = 6

/obj/item/stack/material/platinum/full
	amount = 120

//Extremely valuable to Research. (NOT ANYMORE. -Monochrome)
/obj/item/stack/material/mhydrogen
	name = "metallic hydrogen"
	icon_state = "sheet-hydrogen"
	default_type = MATERIAL_MHYDROGEN
	price_tag = 10
	novariants = FALSE

/obj/item/stack/material/mhydrogen/full
	amount = 120

/obj/item/stack/material/hydrogenc
	name = "solid plasma"
	icon_state = "sheet-plasma" //Sprites by CeUvi#1236
	default_type = MATERIAL_HYDROGENC
	price_tag = 8
	novariants = FALSE

/obj/item/stack/material/hydrogenc/random
	rand_min = 3
	rand_max = 5

/obj/item/stack/material/hydrogenc/full
	amount = 120

*/ 



// Post Industrial Materials

/obj/item/stack/material/indsteel
	name = "industrial steel"
	desc = "One of the most robust and versatile steel alloys in existence. Enhanced mainly with niobium, it became the staple material for aerospace, armor, engineering, automative, welding and weapon manufacturing industry."
	icon_state = "sheet-indsteel"
	item_state = "sheet-metal"
	default_type = MATERIAL_INDSTEEL
	price_tag = 8
	novariants = FALSE

/obj/item/stack/material/indsteel/full
	amount = 120

/obj/item/stack/material/indsteel/random
	rand_min = 3
	rand_max = 12

/obj/item/stack/material/mendingnacre
	name = "mending nacre"
	desc = "Mending piece from a still studied substance that looks alike nacre, and it is constantly healing with microscopic activity."
	singular_name = "Mending Nacre"
	icon_state = "mending_nacre_item"
	default_type = MATERIAL_FRAGNACRE
	novariants = TRUE
	price_tag = 50 // obtaining nacre is extremely dangerous and very profitable
	max_amount = 360

/obj/item/stack/material/mendingnacre/full
	amount = 360

/obj/item/stack/material/niobium
	name = "niobium ingot"
	desc = "Fragmented piece from a still studied substance that looks alike nacre, and it is constantly healing with microscopic activity."
	singular_name = "niobium ingot"
	icon_state = "niobium"
	default_type = MATERIAL_NIOBIUM
	novariants = TRUE
	price_tag = 6  
	
/obj/item/stack/material/niobium/random
	rand_min = 1
	rand_max = 4

/obj/item/stack/material/niobium/full
	amount = 120

/obj/item/stack/material/copper
	name = "copper ingot"
	desc = "ductile and malleable metal with excellent conductivity, widely utilized in electrical applications and alloys. Nowadays it is useless on is own, but can easily be used to make non-toxic kitchenware."
	singular_name = "copper ingot"
	icon_state = "copper"
	default_type = MATERIAL_COPPER
	novariants = TRUE
	price_tag = 6  
	
/obj/item/stack/material/copperrandom
	rand_min = 1
	rand_max = 10

/obj/item/stack/material/copperfull
	amount = 120

/obj/item/stack/material/titanium
	name = "titanium"
	desc = "Lightweight, corrosion-resistant metal with high strength, commonly used in aerospace, medical, industrial applications and medium-high tier weapons. Most useful when properly alloyed."
	singular_name = "titanium ingot"
	icon_state = "titanium"
	default_type = MATERIAL_TITANIUM
	novariants = TRUE
	price_tag = 8

/obj/item/stack/material/titanium/random
	rand_min = 1
	rand_max = 4

/obj/item/stack/material/titanium/full
	amount = 120

/obj/item/stack/material/composite
	name = "titanium composite"
	desc = "A durable and lightweight composite combining titanium and niobium made by TerraTherma, the precursor for the Titanium CNT in which the entire universe craves - besides such important use, it has minor aerospace utilities. You will need PIRS and the Custodians of Bonfire to make something better."
	singular_name = "titanium composite"
	icon_state = "composite"
	default_type = MATERIAL_COMPOSITE
	novariants = TRUE
	price_tag = 12

/obj/item/stack/material/titanium/full
	amount = 120

/obj/item/stack/material/titaniumrtc
	name = "reinforced titanium composite"
	desc = "cutting-edge material with the properties of carbon nanotubes and the tensile, high-performace Titanium-Niobium composite. Used only for the best equipments in the universe , a difficult material to be obtained by any colony but the most wealthy of capital worlds."
	singular_name = "reinforced titanium composite"
	icon_state = "titaniumrtc"
	default_type = MATERIAL_TITANIUMRTC
	novariants = TRUE
	price_tag = 25

/obj/item/stack/material/titaniumrtc/full
	amount = 120

/obj/item/stack/material/duralumin
	name = "duralumin"
	desc = "Lightweight, durable alloy which played a crucial role in aviation in the past. Nowadays, it is used for augmentation components, handmade weaponry, tribal equipments, aerospace industry, propellers and many components exposed to seawater."
	icon_state = "sheet-duralumin"
	default_type = MATERIAL_DURALUMIN
	price_tag = 10
	novariants = FALSE

/obj/item/stack/material/duralumin/random
	rand_min = 3
	rand_max = 8

/obj/item/stack/material/duralumin/full
	amount = 120

/obj/item/stack/material/aluminium
	name = "aluminium"
	desc = "While aluminium may be considered a weak metal, its recyclability and malleability contribute heavily to its widespread use in various industries, from packing, tools, machines to even makeshift weapons. Cheapness has a cost for the latter"
	icon_state = "sheet-metal"
	default_type = MATERIAL_ALUMINIUM
	price_tag = 2
	novariants = FALSE

//A stack which starts with the max amount
/obj/item/stack/material/aluminium/full
	amount = 120

/obj/item/stack/material/aluminium/random
	rand_min = 3
	rand_max = 10

/obj/item/stack/material/dilatant
	name = "dilatant plate"
	desc = "innovative material designed by CAPSA. By using biomatter and steel, it is possible to make a plate that becomes rigid when subjected to sudden force or impact, allowing it to resist deformation while remaining lightweight."
	icon_state = "sheet-dilatant"
	default_type = MATERIAL_DILATANT
	price_tag = 12
	novariants = FALSE

/obj/item/stack/material/duralumin/random
	rand_min = 3
	rand_max = 8

/obj/item/stack/material/duralumin/full
	amount = 120