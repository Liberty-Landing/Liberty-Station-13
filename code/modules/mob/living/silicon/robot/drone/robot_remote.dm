//Placed next to the drone remote for reference.
/mob/living/silicon/ai
	var/mob/living/silicon/robot/controlling_synthetic

/mob/living/silicon/robot
	var/mob/living/silicon/ai/controlling_ai
	var/obj/item/device/radio/drone_silicon_radio

/mob/living/silicon/robot/attack_ai(var/mob/living/silicon/ai/user)

	if(!istype(user) || controlling_ai || !config.allow_drone_spawn)
		return

	if(client || key)
		to_chat(user, "<span class='warning'>You cannot take control of an autonomous, active shell.</span>")
		return

	if(health < -35 || HasTrait(CYBORG_TRAIT_EMAGGED))
		to_chat(user, "<span class='notice'><b>WARNING:</b> connection timed out.</span>")
		return

	assume_control(user)

/mob/living/silicon/robot/proc/assume_control(var/mob/living/silicon/ai/user)
	user.controlling_synthetic = src
	controlling_ai = user
	verbs += /mob/living/silicon/robot/proc/release_ai_control_verb
	local_transmit = FALSE
	languages = controlling_ai.languages.Copy()

	//give controlled drone access to AI radio
	drone_silicon_radio = silicon_radio
	silicon_radio = new /obj/item/device/radio/headset/heads/ai_integrated(src)
	//silicon_radio.recalculateChannels()

	default_language = controlling_ai.default_language

	stat = CONSCIOUS
	if(user.mind)
		user.mind.transfer_to(src)
	else
		key = user.key
	real_name = "remote shell ([controlling_ai.name])"
	name = real_name
	to_chat(src, "<span class='notice'><b>You have shunted your primary control loop into \a [initial(name)].</b> Use the <b>Release Control</b> verb to return to your core.</span>")

/obj/machinery/drone_fabricator/attack_ai(var/mob/living/silicon/ai/user)
	if(!istype(user) || user.controlling_synthetic || !config.allow_drone_spawn)
		return

	if(stat & NOPOWER)
		to_chat(user, "<span class='warning'>\The [src] is unpowered.</span>")
		return

	if(!produce_drones)
		to_chat(user, "<span class='warning'>\The [src] is disabled.</span>")
		return

	if(drone_progress < 100)
		to_chat(user, "<span class='warning'>\The [src] is not ready to produce a new drone.</span>")
		return

	if(count_drones() >= config.max_maint_drones)
		to_chat(user, "<span class='warning'>The drone control subsystems are tasked to capacity; they cannot support any more drones.</span>")
		return

	var/mob/living/silicon/robot/new_drone = new drone_type(get_turf(src))
	new_drone.assume_control(user)

/obj/machinery/drone_fabricator/AICtrlClick(var/mob/living/silicon/ai/user)
	if(!istype(user) || user.controlling_synthetic || !config.allow_drone_spawn)
		return

	if(stat & NOPOWER)
		to_chat(user, "<span class='warning'>\The [src] is unpowered.</span>")
		return

	if(!produce_drones)
		to_chat(user, "<span class='warning'>\The [src] is disabled.</span>")
		return

	if(drone_progress < 100)
		to_chat(user, "<span class='warning'>\The [src] is not ready to produce a new shell.</span>")
		return

	var/mob/living/silicon/robot/new_drone = new /mob/living/silicon/robot(get_turf(src))
	new_drone.assume_control(user)

/mob/living/silicon/robot/death(gibbed)
	if(controlling_ai)
		release_ai_control("<b>WARNING: Remote system failure.</b> Connection timed out.")
	drone_silicon_radio = null
	. = ..(gibbed)

/mob/living/silicon/ai/death(gibbed)
	if(controlling_synthetic)
		controlling_synthetic.release_ai_control("<b>WARNING: Primary control loop failure.</b> Session terminated.")
	. = ..(gibbed)

/mob/living/silicon/ai/Life()
	. = ..()
	if(controlling_synthetic && stat != CONSCIOUS)
		controlling_synthetic.release_ai_control("<b>WARNING: Primary control loop failure.</b> Session terminated.")

/mob/living/silicon/robot/proc/release_ai_control_verb()
	set name = "Release Control"
	set desc = "Release control of a remote shell."
	set category = "Silicon Commands"

	release_ai_control("Remote session terminated.")

/mob/living/silicon/robot/proc/release_ai_control(var/message = "Connection terminated.")

	if(controlling_ai)
		if(mind)
			mind.transfer_to(controlling_ai)
		else
			controlling_ai.key = key
		to_chat(controlling_ai, "<span class='notice'>[message]</span>")
		controlling_ai.controlling_synthetic = null
		controlling_ai = null
	//releases controlled drone access to AI radio
	QDEL_NULL(silicon_radio)
	silicon_radio = drone_silicon_radio
	drone_silicon_radio = null

	verbs -= /mob/living/silicon/robot/proc/release_ai_control_verb
	full_law_reset()
	real_name = "empty remote shell"
	name = real_name
