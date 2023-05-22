/*
///////////////////////////////////
/  =---------------------------=  /
/  == Facial Hair Definitions ==  /
/  =---------------------------=  /
///////////////////////////////////
*/

/datum/sprite_accessory/facial_hair
	icon = 'icons/mob/human_races/species/human/facial.dmi'
	gender = MALE // barf (unless you're a dorf, dorfs dig chix /w beards :P)
	species_allowed = list(
		SPECIES_HUMAN,
		FORM_MARQUA,
		FORM_SABLEKYNE,
		FORM_KRIOSAN,
		FORM_AKULA,
		FORM_CHTMANT,
		FORM_CINDAR,
		FORM_NARAMAD,
		FORM_OPIFEX,
		FORM_SYNTH
		)

/datum/sprite_accessory/facial_hair/shaved
	name = "Shaved"
	icon_state = "shaved"
	gender = NEUTER

/datum/sprite_accessory/facial_hair/hogan
	name = "Hulk Hogan Mustache"
	icon_state = "hogan" //-Neek

/datum/sprite_accessory/facial_hair/selleck
	name = "Selleck Mustache"
	icon_state = "selleck"

/datum/sprite_accessory/facial_hair/chaplin
	name = "Square Mustache"
	icon_state = "chaplin"

/datum/sprite_accessory/facial_hair/vandyke
	name = "Van Dyke Mustache"
	icon_state = "vandyke"

/datum/sprite_accessory/facial_hair/walrus
	name = "Walrus Moustache"
	icon_state = "walrus"

/datum/sprite_accessory/facial_hair/watson
	name = "Watson Mustache"
	icon_state = "watson"

/datum/sprite_accessory/facial_hair/abe
	name = "Abraham Lincoln Beard"
	icon_state = "abe"

/datum/sprite_accessory/facial_hair/braid
	name = "Braided Beard"
	icon_state = "braided"

/datum/sprite_accessory/facial_hair/brokenman
	name = "Broken Man"
	icon_state = "facial_brokenman"

/datum/sprite_accessory/facial_hair/gt
	name = "Circle Beard" // Its true name, this is not a goatee.
	icon_state = "gt"

/datum/sprite_accessory/facial_hair/chinless
	name = "Chinless Beard"
	icon_state = "chinlessbeard"

/datum/sprite_accessory/facial_hair/chinstrap
	name = "Chinstrap"
	icon_state = "chin"

/datum/sprite_accessory/facial_hair/dali
	name = "Dali Moustache"
	icon_state = "dali"

/datum/sprite_accessory/facial_hair/dwarf
	name = "Dwarf Beard"
	icon_state = "dwarf"

/datum/sprite_accessory/facial_hair/elvis
	name = "Elvis Sideburns"
	icon_state = "elvis"

/datum/sprite_accessory/facial_hair/gp
	name = "Goatee"
	icon_state = "gp" // Goat patch, a true goatee

/datum/sprite_accessory/facial_hair/guyfawkes
	name = "Guy Fawkes"
	icon_state = "vendetta"

/datum/sprite_accessory/facial_hair/fullbeard
	name = "Full Beard"
	icon_state = "fullbeard"

/datum/sprite_accessory/facial_hair/fb_ml
	name = "Full Beard (Moustacheless)"
	icon_state = "fullbeard_ml"

/datum/sprite_accessory/facial_hair/croppedbeard
	name = "Full Cropped Beard"
	icon_state = "croppedfullbeard"

/datum/sprite_accessory/facial_hair/hip
	name = "Hipster Beard"
	icon_state = "hip"

/datum/sprite_accessory/facial_hair/jensen
	name = "Jensen Beard"
	icon_state = "jensen"

/datum/sprite_accessory/facial_hair/longbeard
	name = "Long Beard"
	icon_state = "longbeard"

/datum/sprite_accessory/facial_hair/lb_ml
	name = "Long Beard (Moustacheless)"
	icon_state = "longbeard_ml"

/datum/sprite_accessory/facial_hair/lumberjack
	name = "Lumberjack Beard"
	icon_state = "lumberjack"

/datum/sprite_accessory/facial_hair/martial
	name = "Martial Artist Beard"
	icon_state = "martialartist"

/datum/sprite_accessory/facial_hair/moonshiner
	name = "Moonshiner Beard"
	icon_state = "moonshiner"

/datum/sprite_accessory/facial_hair/mutton
	name = "Mutton Chops"
	icon_state = "mutton"

/datum/sprite_accessory/facial_hair/muttonmu
	name = "Mutton Chops and Moustache"
	icon_state = "muttonmu"

/datum/sprite_accessory/facial_hair/neckbeard
	name = "Neckbeard"
	icon_state = "neckbeard"

/datum/sprite_accessory/facial_hair/robotnik // PRRRRRRRROMOTION!
	name = "Robotnik Moustache"
	icon_state = "mostachon"

/datum/sprite_accessory/facial_hair/seadog
	name = "Sea Dog Beard"
	icon_state = "seadog"

/datum/sprite_accessory/facial_hair/shaggy
	name = "Shaggy"
	icon_state = "shag"
	gender = NEUTER

/datum/sprite_accessory/facial_hair/tribeard
	name = "Tribeard"
	icon_state = "tribeard"

/datum/sprite_accessory/facial_hair/vlongbeard
	name = "Very Long Beard"
	icon_state = "wise"

/datum/sprite_accessory/facial_hair/volaju
	name = "Volaju Beard"
	icon_state = "volaju"

/datum/sprite_accessory/facial_hair/threeOclock
	name = "3 O'Clock Shadow"
	icon_state = "3oclock"

/datum/sprite_accessory/facial_hair/threeOclockstache
	name = "3 O'Clock Shadow and Moustache"
	icon_state = "3oclockmoustache"

/datum/sprite_accessory/facial_hair/fiveOclock
	name = "5 O'Clock Shadow"
	icon_state = "5oclock"

/datum/sprite_accessory/facial_hair/fiveOclockstache
	name = "5 O'Clock Shadow and Moustache"
	icon_state = "5oclockmoustache"

/datum/sprite_accessory/facial_hair/sevenOclock
	name = "7 O'Clock Shadow"
	icon_state = "7oclock"

/datum/sprite_accessory/facial_hair/sevenOclockstache
	name = "7 O'clock Shadow and Moustache"
	icon_state = "7oclockmoustache"

/datum/sprite_accessory/facial_hair/una_chinhorn
	name = "Cindarite Chin Horn"
	icon_state = "facial_chinhorns_s"
	gender = NEUTER
/* Does not properly work. Probably broken icon state or something. Commented out due to being worthless. -Intense Skies
/datum/sprite_accessory/facial_hair/una_hornadorns
	name = "Cindarite Horn Adorns"
	icon_state = "facial_hornadorns_s"
	gender = NEUTER
*/
/datum/sprite_accessory/facial_hair/una_spinespikes
	name = "Cindarite Spine Spikes"
	icon_state = "facial_spikes_s"
	gender = NEUTER

/datum/sprite_accessory/facial_hair/una_dorsalfrill
	name = "Cindarite Dorsal Frill"
	icon_state = "facial_dorsalfrill_s"
	gender = NEUTER

/datum/sprite_accessory/facial_hair/neck_fluff
	name = "Neck Fluff"
	icon_state = "neckfluff"
	gender = NEUTER

/datum/sprite_accessory/facial_hair/neck_fluffie
	name = "Neck Fluff 2"
	icon_state = "neck_fluffies"
	gender = NEUTER
