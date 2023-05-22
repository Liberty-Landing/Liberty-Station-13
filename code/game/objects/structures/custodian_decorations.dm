
//putting all custodian decorative items here

/obj/structure/decor_spark_statue
	name = "Spark Liekki statue"
	desc = "A statue of Spark Liekki, a prominent member in Custodian history."
	icon = 'icons/obj/structures/custodian_decorations.dmi'
	icon_state = "decor_spark_liekki"
	density = TRUE
	anchored = TRUE

/obj/structure/decor_edvard_statue
	name = "Edvard Livonen statue"
	desc = "A statue of Edvard Iivonen, a prominent member in Custodian history."
	icon = 'icons/obj/structures/custodian_decorations.dmi'
	icon_state = "decor_edvard_iivonen"
	density = TRUE
	anchored = TRUE

/obj/structure/decor_fireholder
	name = "fireholder"
	desc = "A small container for fire, this one looks unusable."
	icon = 'icons/obj/structures/custodian_decorations.dmi'
	icon_state = "decor_fireholder"
	density = TRUE
	anchored = TRUE

/obj/structure/decor_perfect_pillar
	name = "perfect pillar"
	desc = "An utterly perfect pillar, the craftsmanship is obvious."
	icon = 'icons/obj/structures/custodian_decorations.dmi'
	icon_state = "decor_perfect_pillar"
	density = TRUE
	anchored = TRUE

/obj/structure/decor_gazer
	name = "gazer"
	desc = "A menacing looking wall decoration that seems to keep you in its sight, no matter where you move."
	icon = 'icons/obj/structures/custodian_decorations.dmi'
	icon_state = "decor_gazer"
	anchored = TRUE
	layer = ABOVE_MOB_LAYER

/obj/structure/decor_inloved_1
	name = "the inloved"
	desc = "An statue reflecting Elohopean literature centered around strong emotional attachment. Love is portrayed both as a poison and as the fuel of life itself."
	icon = 'icons/obj/structures/64x64_decorations.dmi'
	icon_state = "decor_the_inloved"
	density = TRUE
	anchored = TRUE
	layer = ABOVE_MOB_LAYER

/obj/structure/decor_inloved_2
	name = "the inloved"
	desc = "An statue reflecting Elohopean literature centered around strong emotional attachment. Love is portrayed both as a poison and as the fuel of life itself."
	icon = 'icons/obj/structures/64x64_decorations.dmi'
	icon_state = "decor_the_inloved2"
	density = TRUE
	anchored = TRUE
	layer = ABOVE_MOB_LAYER

/obj/structure/decor_headless_1
	name = "the headless"
	desc = "A statue reflecting the change of power. Previously, these statues portrayed the holder of a chief position within the Stronghold leadership, but ever since the advent of the Oathpledge's rotational leadership, these statues have been left headless."
	icon = 'icons/obj/structures/64x64_decorations.dmi'
	icon_state = "decor_the_headless"
	density = TRUE
	anchored = TRUE
	layer = ABOVE_MOB_LAYER

/obj/structure/decor_headless_2
	name = "the headless"
	desc = "A statue reflecting the change of power. Previously, these statues portrayed the holder of a chief position within the Stronghold leadership, but ever since the advent of the Oathpledge's rotational leadership, these statues have been left headless."
	icon = 'icons/obj/structures/64x64_decorations.dmi'
	icon_state = "decor_the_headless2"
	density = TRUE
	anchored = TRUE
	layer = ABOVE_MOB_LAYER

/obj/structure/decor_headless_3
	name = "the headless"
	desc = "A statue reflecting the change of power. Previously, these statues portrayed the holder of a chief position within the Stronghold leadership, but ever since the advent of the Oathpledge's rotational leadership, these statues have been left headless."
	icon = 'icons/obj/structures/64x64_decorations.dmi'
	icon_state = "decor_the_headless3"
	density = TRUE
	anchored = TRUE
	layer = ABOVE_MOB_LAYER

/obj/structure/decor_the_twins
	name = "the twins"
	desc = "This statue portrays the sense of unity in ancient Elohopean literature. No matter how different two Custodians may be, they could always rely on each other for safety."
	icon = 'icons/obj/structures/64x64_decorations.dmi'
	icon_state = "decor_the_twins"
	density = TRUE
	anchored = TRUE
	layer = ABOVE_MOB_LAYER

/obj/structure/decor_the_purifier
	name = "the purifier"
	desc = "This statue portrays an old hero of the War of Elohopea - a relatively controversial figure known for granting no mercy during their many debt-slave freeing campaigns. All while using a metallic bat as a weapon rather than a blade."
	icon = 'icons/obj/structures/64x64_decorations.dmi'
	icon_state = "decor_the_purifier"
	density = TRUE
	anchored = TRUE
	layer = ABOVE_MOB_LAYER

/obj/structure/decor_light
	name = "decor light base item"
	desc = "Must not appear in-game."
	icon = 'icons/obj/structures/custodian_decorations.dmi'
	icon_state = "decor_pyre"
	density = TRUE
	anchored = TRUE
	var/active = TRUE
	var/brightness = 3
	var/last_time_used = 0

/obj/structure/decor_light/New()
	..()
	update_icon()

/obj/structure/decor_light/attack_hand(mob/user)
	if(world.time >= last_time_used + 2 SECONDS)
		last_time_used = world.time
		active = !active
		to_chat(user, SPAN_NOTICE("You [active ? "turn [src] on" : "turn [src] off"]."))
		update_icon()

/obj/structure/decor_light/update_icon()
	if(active)
		icon_state = "[initial(icon_state)]_on"
		set_light(brightness)
	else
		icon_state = "[initial(icon_state)]"
		set_light(0)

/obj/structure/decor_light/pyre
	name = "pyre"
	desc = "A Custodian decorative pyre."
	icon_state = "decor_pyre"
	brightness = 4

/obj/structure/decor_light/beacon
	name = "beacon"
	desc = "A Custodian decorative beacon."
	icon_state = "decor_beacon"

/obj/structure/decor_light/wallcandle
	name = "wall candle"
	desc = "A wall candle emitting a faint light."
	icon_state = "decor_wallcandle"
	density = FALSE
	brightness = 2
