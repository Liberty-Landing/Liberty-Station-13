/*

// Already in /code/modules/client/preference_setup/global/preferences.dm
// This var not even used.

/client
	var/hardsuit_click_mode = MIDDLE_CLICK

/client/verb/toggle_hardsuit_mode()
	set name = "Toggle Hardsuit Activation Mode"
	set desc = "Switch between hardsuit activation modes."
	set category = "OOC"

	hardsuit_click_mode++
	if(hardsuit_click_mode > MAX_HARDSUIT_CLICK_MODE)
		hardsuit_click_mode = 0

	switch(hardsuit_click_mode)
		if(MIDDLE_CLICK)
			to_chat(src, "Hardsuit activation mode set to middle-click.")
		if(ALT_CLICK)
			to_chat(src, "Hardsuit activation mode set to alt-click.")
		if(CTRL_CLICK)
			to_chat(src, "Hardsuit activation mode set to control-click.")
		else
			// should never get here, but just in case:
			soft_assert(0, "Bad hardsuit click mode: [hardsuit_click_mode] - expected 0 to [MAX_HARDSUIT_CLICK_MODE]")
			to_chat(src, "Somehow you bugged the system. Setting your hardsuit mode to middle-click.")
			hardsuit_click_mode = MIDDLE_CLICK
*/

/mob/living/MiddleClickOn(atom/A)
	if(get_preference_value(/datum/client_preference/hardsuit_activation) == GLOB.PREF_MIDDLE_CLICK)
		if(HardsuitClickOn(A))
			return
	..()

/mob/living/AltClickOn(atom/A)
	if(get_preference_value(/datum/client_preference/hardsuit_activation) == GLOB.PREF_ALT_CLICK)
		if(HardsuitClickOn(A))
			return
	..()

/mob/living/CtrlClickOn(atom/A)
	if(get_preference_value(/datum/client_preference/hardsuit_activation) == GLOB.PREF_CTRL_CLICK)
		if(HardsuitClickOn(A))
			return
	..()

/mob/living/CtrlShiftClickOn(atom/A)
	if(get_preference_value(/datum/client_preference/hardsuit_activation) == GLOB.PREF_CTRL_SHIFT_CLICK)
		if(HardsuitClickOn(A))
			return
	..()

/mob/living/proc/can_use_rig()
	return 0

/mob/living/carbon/human/can_use_rig()
	return 1

/mob/living/carbon/brain/can_use_rig()
	return istype(loc, /obj/item/device/mmi)

/mob/living/proc/HardsuitClickOn(var/atom/A)
	if(!can_use_rig())// || !can_click())  // This check is already done in mob/proc/ClickOn()
		return 0
	var/obj/item/rig/rig = get_rig()
	if(istype(rig) && !rig.offline && rig.selected_module)
		if(src != rig.wearer)
			return 0
		rig.selected_module.engage(A)
		if(ismob(A)) // No instant mob attacking - though modules have their own cooldowns
			setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
		return 1
	return 0
