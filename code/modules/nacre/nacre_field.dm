/obj/machinery/shieldwallgen/nacre
	name = "nacre sonic fence generator"
	desc = "A sonic fence generator specially designed to contain and destroy nacre crystals."
	shield_type = /obj/machinery/shieldwall/nacre
	circuit = /obj/item/circuitboard/nacreshieldwallgen
	locked = FALSE // We do not start locked
	power_draw = 15000 // 15 kW
	req_access = list()

/obj/machinery/shieldwallgen/nacre/New()
	..()
	spawn(10)
		update_icon()

/obj/machinery/shieldwall/nacre
	name = "sonic fence"
	desc = "A sonic fence specially designed to destroy nacre crystals by targeting its resonant frequency. \
			However, any amount of interference alter the frequency and doesn't damage the crystal, thus allowing \
			people to carry them through the field."
	density = FALSE
	power_usage = 1000
	generate_power_usage = 2000

/obj/machinery/shieldwall/nacre/New()
	..()
	spawn(1)
		for(var/obj/structure/nacre_crystal/AC in get_turf(src))
			//Yes even the spirer should be destoryed
			AC.visible_message("[AC] shatter into dust under the sonic field.")
			AC.Destroy()

		for(/obj/item/stack/material/mendingnacre/A in get_turf(src))
			A.visible_message("[A] shatter into dust under the sonic field.")
			qdel(A)

		for(var/mob/living/carbon/superior_animal/nacre_golem/G in get_turf(src))
			G.drop_amount = 0 // The crystal golem is obliterated, don't drop any loot.
			G.death() // Golem die.

/obj/machinery/shieldwall/nacre/CanPass(atom/movable/mover, turf/target, height=0, air_group=0)
	return TRUE // Everything can go through, it's a sound barrier, not a physical thing

/obj/machinery/shieldwall/nacre/Crossed(atom/movable/O)
	if(istype(O, /obj/item/stack/material/mendingnacre) || istype(O, /obj/item/projectile/nacre_shard))
		O.visible_message(SPAN_NOTICE("[O] shatter into dust under the sonic field."))
		qdel(O)
		return

	if(istype(O, /mob/living/carbon/superior_animal/nacre_golem))
		var/mob/living/carbon/superior_animal/nacre_golem/G = O
		G.drop_amount = 0 // The crystal golem is obliterated, don't drop any loot.
		G.death() // Golem die.
		return