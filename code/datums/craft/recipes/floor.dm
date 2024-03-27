/datum/craft_recipe/floor
	category = "Floors"
	steps = list(
		list(CRAFT_MATERIAL, 1, MATERIAL_ALUMINIUM),
	)
	flags = CRAFT_BATCH
	time = 1 //Crafting individual tiles is fast
	related_stats = list(STAT_MEC)

/datum/craft_recipe/floor/underplating
	name = "underplating"
	result = /obj/effect/flooring_type_spawner
	time = WORKTIME_SLOW
	flags = CRAFT_ON_FLOOR|CRAFT_ONE_PER_TURF
	steps = list(
		list(CRAFT_MATERIAL, 15, MATERIAL_ALUMINIUM)
	)
	related_stats = list(STAT_MEC)

/datum/craft_recipe/floor/catwalk
	name = "catwalk"
	result = /obj/structure/catwalk
	time = WORKTIME_FAST
	flags = CRAFT_ON_FLOOR|CRAFT_ONE_PER_TURF
	steps = list(
		list(CRAFT_MATERIAL, 8, MATERIAL_ALUMINIUM)
	)
	related_stats = list(STAT_MEC)

/datum/craft_recipe/floor/wood
	name = "wood floor tile"
	result = /obj/item/stack/tile/wood
	icon_state = "woodworking"
	steps = list(
		list(CRAFT_MATERIAL, 1, MATERIAL_WOOD)
	)

/datum/craft_recipe/floor/ashwood
	name = "ash wood floor tile"
	result = /obj/item/stack/tile/wood/ashen
	icon_state = "woodworking"
	steps = list(
		list(CRAFT_MATERIAL, 1, MATERIAL_WOOD)
	)

/datum/craft_recipe/floor/redashen
	name = "red ash wood floor tile"
	result = /obj/item/stack/tile/wood/ashen/red
	icon_state = "woodworking"
	steps = list(
		list(CRAFT_MATERIAL, 1, MATERIAL_WOOD)
	)

/datum/craft_recipe/floor/dullashen
	name = "dull ash wood floor tile"
	result = /obj/item/stack/tile/wood/ashen/dull
	icon_state = "woodworking"
	steps = list(
		list(CRAFT_MATERIAL, 1, MATERIAL_WOOD)
	)

/datum/craft_recipe/floor/rustic
	name = "rustic wood floor tile"
	result = /obj/item/stack/tile/wood/old
	icon_state = "woodworking"
	steps = list(
		list(CRAFT_MATERIAL, 1, MATERIAL_WOOD)
	)

/datum/craft_recipe/floor/veridicalrustic
	name = "veridical rustic wood floor tile"
	result = /obj/item/stack/tile/wood/old/veridical
	icon_state = "woodworking"
	steps = list(
		list(CRAFT_MATERIAL, 1, MATERIAL_WOOD)
	)

/datum/craft_recipe/floor/tatami
	name = "tatami mats"
	result = /obj/item/stack/tile/wood/tatami
	icon_state = "woodworking"
	steps = list(
		list(CRAFT_MATERIAL, 1, MATERIAL_WOOD)
	)

/datum/craft_recipe/floor/cafe
	name = "cafe floor tile"
	result = /obj/item/stack/tile/floor/cafe
	steps = list(
		list(CRAFT_MATERIAL, 1, MATERIAL_PLASTIC)
	)

/datum/craft_recipe/floor/techmaint
	name = "maintenance floor tile"
	result = /obj/item/stack/tile/floor/techmaint
	steps = list(
		list(CRAFT_MATERIAL, 1, MATERIAL_ALUMINIUM)
	)

/datum/craft_recipe/floor/techmaint_perforated
	name = "perforated maintenance floor tile"
	result = /obj/item/stack/tile/floor/techmaint/perforated
	steps = list(
		list(CRAFT_MATERIAL, 1, MATERIAL_ALUMINIUM)
	)

/datum/craft_recipe/floor/techmaint_panels
	name = "panels maintenance floor tile"
	result = /obj/item/stack/tile/floor/techmaint/panels
	steps = list(
		list(CRAFT_MATERIAL, 1, MATERIAL_ALUMINIUM)
	)

/datum/craft_recipe/floor/techmaint_cargo
	name = "cargo maintenance floor tile"
	result = /obj/item/stack/tile/floor/techmaint/cargo
	steps = list(
		list(CRAFT_MATERIAL, 1, MATERIAL_ALUMINIUM)
	)

/datum/craft_recipe/floor/aluminium
	name = "regular aluminium floor tile"
	result = /obj/item/stack/tile/floor/aluminium

/datum/craft_recipe/floor/aluminium/panels
	name = "aluminium panel tile"
	result = /obj/item/stack/tile/floor/aluminium/panels

/datum/craft_recipe/floor/aluminium/techfloor
	name = "aluminium tech-floor tile"
	result = /obj/item/stack/tile/floor/aluminium/techfloor

/datum/craft_recipe/floor/aluminium/techfloor_grid
	name = "aluminium tech-floor tile with vents"
	result = /obj/item/stack/tile/floor/aluminium/techfloor_grid

/datum/craft_recipe/floor/aluminium/brown_perforated
	name = "aluminium brown perforated tile"
	result = /obj/item/stack/tile/floor/aluminium/brown_perforated

/datum/craft_recipe/floor/aluminium/gray_perforated
	name = "aluminium gray perforated tile"
	result = /obj/item/stack/tile/floor/aluminium/gray_perforated

/datum/craft_recipe/floor/aluminium/cargo
	name = "aluminium cargo tile"
	result = /obj/item/stack/tile/floor/aluminium/cargo

/datum/craft_recipe/floor/aluminium/brown_platform
	name = "aluminium brown platform tile"
	result = /obj/item/stack/tile/floor/aluminium/brown_platform

/datum/craft_recipe/floor/aluminium/gray_platform
	name = "aluminium gray platform tile"
	result = /obj/item/stack/tile/floor/aluminium/gray_platform

/datum/craft_recipe/floor/aluminium/danger
	name = "aluminium danger tile"
	result = /obj/item/stack/tile/floor/aluminium/danger

/datum/craft_recipe/floor/aluminium/golden
	name = "aluminium golden tile"
	result = /obj/item/stack/tile/floor/aluminium/golden

/datum/craft_recipe/floor/aluminium/bluecorner
	name = "aluminium blue corner tile"
	result = /obj/item/stack/tile/floor/aluminium/bluecorner

/datum/craft_recipe/floor/aluminium/orangecorner
	name = "aluminium orange corner tile"
	result = /obj/item/stack/tile/floor/aluminium/orangecorner

/datum/craft_recipe/floor/aluminium/greencorner
	name = "aluminium green corner tile"
	result = /obj/item/stack/tile/floor/aluminium/greencorner

/datum/craft_recipe/floor/aluminium/violetcorener
	name = "aluminium violet corner tile"
	result = /obj/item/stack/tile/floor/aluminium/violetcorener

/datum/craft_recipe/floor/aluminium/cyancorner
	name = "aluminium cyan corner tile"
	result = /obj/item/stack/tile/floor/aluminium/cyancorner

/datum/craft_recipe/floor/aluminium/monofloor
	name = "aluminium mono-floor tile"
	result = /obj/item/stack/tile/floor/aluminium/monofloor

/datum/craft_recipe/floor/aluminium/bar_flat
	name = "aluminium bar flat tile"
	result = /obj/item/stack/tile/floor/aluminium/bar_flat

/datum/craft_recipe/floor/aluminium/bar_dance
	name = "aluminium bar dance tile"
	result = /obj/item/stack/tile/floor/aluminium/bar_dance

/datum/craft_recipe/floor/aluminium/bar_light
	name = "aluminium bar light tile"
	result = /obj/item/stack/tile/floor/aluminium/bar_light


/datum/craft_recipe/floor/white
	name = "regular white floor tile"
	result = /obj/item/stack/tile/floor/white
	steps = list(
		list(CRAFT_MATERIAL, 1, MATERIAL_PLASTIC)
	)

/datum/craft_recipe/floor/white/panels
	name = "white panel tile"
	result = /obj/item/stack/tile/floor/white/panels

/datum/craft_recipe/floor/white/techfloor
	name = "white tech-floor tile"
	result = /obj/item/stack/tile/floor/white/techfloor

/datum/craft_recipe/floor/white/techfloor_grid
	name = "white tech-floor tile with vents"
	result = /obj/item/stack/tile/floor/white/techfloor_grid

/datum/craft_recipe/floor/white/brown_perforated
	name = "white brown perforated tile"
	result = /obj/item/stack/tile/floor/white/brown_perforated

/datum/craft_recipe/floor/white/gray_perforated
	name = "white gray perforated tile"
	result = /obj/item/stack/tile/floor/white/gray_perforated

/datum/craft_recipe/floor/white/cargo
	name = "white cargo tile"
	result = /obj/item/stack/tile/floor/white/cargo

/datum/craft_recipe/floor/white/brown_platform
	name = "white brown platform tile"
	result = /obj/item/stack/tile/floor/white/brown_platform

/datum/craft_recipe/floor/white/gray_platform
	name = "white gray platform tile"
	result = /obj/item/stack/tile/floor/white/gray_platform

/datum/craft_recipe/floor/white/danger
	name = "white danger tile"
	result = /obj/item/stack/tile/floor/white/danger

/datum/craft_recipe/floor/white/golden
	name = "white golden tile"
	result = /obj/item/stack/tile/floor/white/golden

/datum/craft_recipe/floor/white/bluecorner
	name = "white blue corner tile"
	result = /obj/item/stack/tile/floor/white/bluecorner

/datum/craft_recipe/floor/white/orangecorner
	name = "white orange corner tile"
	result = /obj/item/stack/tile/floor/white/orangecorner

/datum/craft_recipe/floor/white/greencorner
	name = "white green corner tile"
	result = /obj/item/stack/tile/floor/white/greencorner

/datum/craft_recipe/floor/white/violetcorener
	name = "white violet corner tile"
	result = /obj/item/stack/tile/floor/white/violetcorener

/datum/craft_recipe/floor/white/cyancorner
	name = "white cyan corner tile"
	result = /obj/item/stack/tile/floor/white/cyancorner

/datum/craft_recipe/floor/white/monofloor
	name = "white mono-floor tile"
	result = /obj/item/stack/tile/floor/white/monofloor

/datum/craft_recipe/floor/dark
	name = "regular dark floor tile"
	result = /obj/item/stack/tile/floor/dark

/datum/craft_recipe/floor/dark/panels
	name = "dark panel tile"
	result = /obj/item/stack/tile/floor/dark/panels

/datum/craft_recipe/floor/dark/techfloor
	name = "dark tech-floor tile"
	result = /obj/item/stack/tile/floor/dark/techfloor

/datum/craft_recipe/floor/dark/techfloor_grid
	name = "dark tech-floor tile with vents"
	result = /obj/item/stack/tile/floor/dark/techfloor_grid

/datum/craft_recipe/floor/dark/brown_perforated
	name = "dark brown perforated tile"
	result = /obj/item/stack/tile/floor/dark/brown_perforated

/datum/craft_recipe/floor/dark/gray_perforated
	name = "dark gray perforated tile"
	result = /obj/item/stack/tile/floor/dark/gray_perforated

/datum/craft_recipe/floor/dark/cargo
	name = "dark cargo tile"
	result = /obj/item/stack/tile/floor/dark/cargo

/datum/craft_recipe/floor/dark/brown_platform
	name = "dark brown platform tile"
	result = /obj/item/stack/tile/floor/dark/brown_platform

/datum/craft_recipe/floor/dark/gray_platform
	name = "dark gray platform tile"
	result = /obj/item/stack/tile/floor/dark/gray_platform

/datum/craft_recipe/floor/dark/danger
	name = "dark danger tile"
	result = /obj/item/stack/tile/floor/dark/danger

/datum/craft_recipe/floor/dark/golden
	name = "dark golden tile"
	result = /obj/item/stack/tile/floor/dark/golden

/datum/craft_recipe/floor/dark/bluecorner
	name = "dark blue corner tile"
	result = /obj/item/stack/tile/floor/dark/bluecorner

/datum/craft_recipe/floor/dark/orangecorner
	name = "dark orange corner tile"
	result = /obj/item/stack/tile/floor/dark/orangecorner

/datum/craft_recipe/floor/dark/greencorner
	name = "dark green corner tile"
	result = /obj/item/stack/tile/floor/dark/greencorner

/datum/craft_recipe/floor/dark/violetcorener
	name = "dark violet corner tile"
	result = /obj/item/stack/tile/floor/dark/violetcorener

/datum/craft_recipe/floor/dark/cyancorner
	name = "dark cyan corner tile"
	result = /obj/item/stack/tile/floor/dark/cyancorner

/datum/craft_recipe/floor/dark/monofloor
	name = "dark mono-floor tile"
	result = /obj/item/stack/tile/floor/dark/monofloor

/datum/craft_recipe/floor/lighttile
	name = "light tile"
	icon_state = "gun"
	result = /obj/machinery/floor_light
	steps = list(
		list(CRAFT_MATERIAL, 3, MATERIAL_GLASS, "time" = 30),
		list(CRAFT_MATERIAL, 2, MATERIAL_ALUMINIUM, "time" = 10),
		list(QUALITY_SCREW_DRIVING, 10, 80),
		list(/obj/item/stack/cable_coil, 5, "time" = 20),
		list(QUALITY_PULSING, 30, 80)
	)
