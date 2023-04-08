// ᚁᚓᚐᚈᚆᚐ ᚐᚌᚒᚄ ᚁᚐᚄ //
/mob/living

	var/obj/item/device/radio/common_radio

	var/const/MAIN_CHANNEL = "Main Frequency"
	var/lawchannel = MAIN_CHANNEL // Default channel on which to state laws
	var/list/stating_laws = list()// Channels laws are currently being stated on

	var/mob/living/silicon/ai/connected_ai = null
	var/lawupdate = TRUE //Cyborgs will sync their laws with their AI by default

	var/obj/item/device/camera/siliconcam/aiCamera = null //photography
	var/tracking_entities = 0 //The number of known entities currently accessing the internal camera
