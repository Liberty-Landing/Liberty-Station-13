//Holds all the proj, guns and spells for the Cataphract. The Cataphract focus on defense and defending others, while making use of radiance to manifest ways to counter enemy's move in the battlefield.

	//Lecture: Summon a Stand that attacks anything around the user
	//Summon a thing that just stays there, calling attention of mobs. (done)
	//make the Cataphract summon a shield
	//Talk with trilby if we can port the Eris's lecture that allows NeoTheology guys to remove their shrapnels, or something that can help Cataphracts to "hold the line" even after being VERY punished not with damage, but with surgery-related problems


/datum/lecture/hearthcore/hussar/dummy
	name = "Assemble: Taunting Dummy"
	phrase = "Radiance, hear me. Assemble the Tauting Dummy."
	desc = "Assemble with your own radiance a thin, taunting dummy. It looks like a moving body to animalistic enemies, may not work for people. Can still be used as a living shield."
	cooldown = TRUE
	cooldown_time = 15 MINUTES
	power = 35

/datum/lecture/hearthcore/druzhina/perform(mob/living/carbon/human/lecturer, obj/item/implant/core_implant/C)
	var/rob = holder.stats.getStat(STAT_ROB)
		if(rob > 30)
			to_chat(C, "<span class='info'>You quickly deploy an radiance dummy from your bloodstream. What a sight!.</span>")
			new /mob/living/carbon/superior_animal/robot/custodians/faux_dummy
			return
		to_chat(C, "<span class='info'>It feels the same as adding a new color to the light spectrum. Your body does not have the robustness to train your silvery neurons.</span>")
		return //Not enough robustness to use this lecture.

/obj/item/shield_projector/rectangle/cataphract_personal
	name = "Cataphract personal shield"
	description_info = "A fast deploying, personal energy shield. Powered by the Hearthcore internal plasma and delivered and manifested by radiance, it ensures the protection of the user when attacked by surprise. Not the best option, but what you can have any time. \
	this allows projectiles to leave from inside but blocks projectiles from outside. Everything else can pass through the shield freely, including other people and thrown objects. \
	The shield also cannot block certain effects which \
	take place over an area, such as flashbangs or explosions."
	icon_state = "last_shelter"
	high_color = "#FFFFFF"
	shield_health = var/power
	max_shield_health = var/power
	size_x = 1
	size_y = 1

//fill the gaps
var/obj/item/implant/core_implant/hearthcore/core_implant = holder.var/power
	if(!core_implant)
		qdel()
		return
	if(core_implant.power <= 0)
		qdel()
		return
	core_implant.power = //The "number drain" is the drain that the shield receives when it gets damaged?

/obj/item/shield_projector/line/create_shields()
	if(!..())
		return FALSE

	var/turf/T = get_turf(src) // This is another 'anchor', or will be once we move away from the projector.
	for(var/i = 1 to offset_from_center)
		T = get_step(T, dir)
	if(!T) // We went off the map or something.
		return
	// We're at the right spot now.  Build the center piece.
	create_shield(T, dir)

	var/length_to_build = round( (line_length - 1) / 2)
	var/turf/temp_T = T

	// First loop, we build the left (from a north perspective) side of the line.
	for(var/i = 1 to length_to_build)
		temp_T = get_step(temp_T, turn(dir, 90) )
		if(!temp_T)
			break
		create_shield(temp_T, i == length_to_build ? turn(dir, 45) : dir)

	temp_T = T

	// Second loop, we build the right side.
	for(var/i = 1 to length_to_build)
		temp_T = get_step(temp_T, turn(dir, -90) )
		if(!temp_T)
			break
		create_shield(temp_T, i == length_to_build ? turn(dir, -45) : dir)
	// Finished.
	update_shield_colors()
	return TRUE
=======
	var/rob = lecturer.stats.getStat(STAT_ROB)
	if(rob > 30)
		to_chat(lecturer, "<span class='info'>You quickly deploy an radiance dummy from your bloodstream. What a sight!.</span>")
		new /mob/living/carbon/superior_animal/robot/custodians/faux_dummy(lecturer.loc)
		return TRUE
	to_chat(lecturer, "<span class='info'>It feels the same as adding a new color to the light spectrum. Your body does not have the robustness to train your silvery neurons.</span>")
	return FALSE//Not enough robustness to use this lecture.
>>>>>>> 3bf8964ee9623cb13753a5e041e6eb8535eba59d
