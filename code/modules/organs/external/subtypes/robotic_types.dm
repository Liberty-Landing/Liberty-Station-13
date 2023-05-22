///////////////////////
/* General FBP limbs */
///////////////////////

// Junktech - Full Body
/obj/item/organ/external/robotic/junktech
	name = "\"Junktech\""
	desc = "Custom tooled and held together by hope and duct tape."
	force_icon = 'icons/mob/human_races/cyberlimbs/advanced_ghetto.dmi' //Sprites were done by Kirov on request
	model = "ghetto"
	armor_list = list(melee = 10, bullet = 10, energy = 10, bomb = -5, bio = 100, rad = 100)
	matter = list(MATERIAL_STEEL = 3, MATERIAL_PLASTIC = 1)
	min_broken_damage = 30
	min_malfunction_damage = 15
	price_tag = 100

/obj/item/organ/external/robotic/junktech/l_arm
	default_description = /datum/organ_description/arm/left

/obj/item/organ/external/robotic/junktech/r_arm
	default_description = /datum/organ_description/arm/right

/obj/item/organ/external/robotic/junktech/l_leg
	default_description = /datum/organ_description/leg/left

/obj/item/organ/external/robotic/junktech/r_leg
	default_description = /datum/organ_description/leg/right

/obj/item/organ/external/robotic/junktech/groin
	default_description = /datum/organ_description/groin

/obj/item/organ/external/robotic/junktech/chest
	default_description = /datum/organ_description/chest

/obj/item/organ/external/robotic/junktech/head
	default_description = /datum/organ_description/head

//Generic #1 - Full Body
/obj/item/organ/external/robotic/asters
	name = "\"Movement Lock\""
	desc = "A generic gray prostesis for everyday use."
	force_icon = 'icons/mob/human_races/cyberlimbs/asters.dmi' //Sprites were done by Kirov on request
	model = "asters"
	price_tag = 300

//Generic #2 - Full Body
/obj/item/organ/external/robotic/serbian
	name = "\"Voidwolf Arms\""
	desc = "A battle hardened green and brown prosthesis rebranded several times."
	force_icon = 'icons/mob/human_races/cyberlimbs/serbian.dmi' //Sprites were done by Kirov on request
	model = "serbian"
	price_tag = 400

//Generic #3 - Limbs
/obj/item/organ/external/robotic/frozen_star
	name = "\"HexaOptimum Augments\"" //We got no frozen star boyo
	desc = "A tactical \"Citadel\" blue and gray prosthesis for dangerous environment."
	force_icon = 'icons/mob/human_races/cyberlimbs/frozen_star.dmi'
	model = "frozen_star"

/obj/item/organ/external/robotic/frozen_star/l_arm
	default_description = /datum/organ_description/arm/left

/obj/item/organ/external/robotic/frozen_star/r_arm
	default_description = /datum/organ_description/arm/right

/obj/item/organ/external/robotic/frozen_star/l_leg
	default_description = /datum/organ_description/leg/left

/obj/item/organ/external/robotic/frozen_star/r_leg
	default_description = /datum/organ_description/leg/right

//Generic #4 - Full Body
/obj/item/organ/external/robotic/synthskin
	name = "\"Martin-Huell Synthskin\""
	desc = "A high grade Martin-Huell prosthetic feeling almost like the real thing."
	force_icon = 'icons/mob/human_races/cyberlimbs/fbp.dmi'
	model = "martin_huell"

/obj/item/organ/external/robotic/synthskin/l_arm
	default_description = /datum/organ_description/arm/left

/obj/item/organ/external/robotic/synthskin/r_arm
	default_description = /datum/organ_description/arm/right

/obj/item/organ/external/robotic/synthskin/l_leg
	default_description = /datum/organ_description/leg/left

/obj/item/organ/external/robotic/synthskin/r_leg
	default_description = /datum/organ_description/leg/right

/obj/item/organ/external/robotic/synthskin/groin
	default_description = /datum/organ_description/groin

/obj/item/organ/external/robotic/synthskin/chest
	default_description = /datum/organ_description/chest

/obj/item/organ/external/robotic/synthskin/head
	default_description = /datum/organ_description/head

//Generic #5 - Full Body
/obj/item/organ/external/robotic/spirit
	name = "\"Spirit Bear\""
	desc = "A white and pink chassis suited for low gravity work conditions."
	force_icon = 'icons/mob/human_races/cyberlimbs/spirit.dmi'
	model = "spirit"
	price_tag = 400

//Generic #6 - Full Body
/obj/item/organ/external/robotic/ward
	name = "\"Ward-Takahashi\""
	desc = "A cheap alternative to many of the other brands."
	force_icon = 'icons/mob/human_races/cyberlimbs/ward.dmi'
	model = "ward"
	price_tag = 400

//Astrakhan - Full Body
/obj/item/organ/external/robotic/excelsior
	name = "\"Astrakhan T-70\""
	desc = "A heavy duty combat prosthetic made only for the most loyal citizens."
	force_icon = 'icons/mob/human_races/cyberlimbs/excelsior.dmi'
	model = "excelsior"

/obj/item/organ/external/robotic/excelsior/l_arm
	default_description = /datum/organ_description/arm/left

/obj/item/organ/external/robotic/excelsior/r_arm
	default_description = /datum/organ_description/arm/right

/obj/item/organ/external/robotic/excelsior/l_leg
	default_description = /datum/organ_description/leg/left

/obj/item/organ/external/robotic/excelsior/r_leg
	default_description = /datum/organ_description/leg/right

/obj/item/organ/external/robotic/excelsior/groin
	default_description = /datum/organ_description/groin

/obj/item/organ/external/robotic/excelsior/chest
	default_description = /datum/organ_description/chest

/obj/item/organ/external/robotic/excelsior/head
	default_description = /datum/organ_description/head

////////////////////////////
/* Departmental FBP limbs */
////////////////////////////

//Martian Logistics - Full Body
/obj/item/organ/external/robotic/watch
	name = "\"Sentry\""
	desc = "A Liberty Watch prosthesis based upon the Martian Logistics model."
	force_icon = 'icons/mob/human_races/cyberlimbs/watch.dmi'
	model = "watch"
	max_damage = 60
	min_broken_damage = 40
	min_malfunction_damage = 30
	price_tag = 400

// Terra-Therma Worker's Union - Full Body
/obj/item/organ/external/robotic/technomancer
	name = "\"Homebrew\""
	desc = "Terra-Therma Worker's Union \"branded\" \"functional\" prosthesis."
	force_icon = 'icons/mob/human_races/cyberlimbs/technomancer.dmi' //Sprites were done by Kirov on request
	model = "technomancer"
	max_damage = 60
	min_broken_damage = 40
	min_malfunction_damage = 30
	price_tag = 300

/obj/item/organ/external/robotic/technomancer/l_arm
	default_description = /datum/organ_description/arm/left

/obj/item/organ/external/robotic/technomancer/r_arm
	default_description = /datum/organ_description/arm/right

/obj/item/organ/external/robotic/technomancer/l_leg
	default_description = /datum/organ_description/leg/left

/obj/item/organ/external/robotic/technomancer/r_leg
	default_description = /datum/organ_description/leg/right

/obj/item/organ/external/robotic/technomancer/groin
	default_description = /datum/organ_description/groin

/obj/item/organ/external/robotic/technomancer/chest
	default_description = /datum/organ_description/chest

/obj/item/organ/external/robotic/technomancer/head
	default_description = /datum/organ_description/head

// PIRS - Full Body
/obj/item/organ/external/robotic/moebius
	name = "\"PIRS\""
	desc = "A reinforced purple and white prosthesis designed for space exploration and light combat."
	force_icon = 'icons/mob/human_races/cyberlimbs/moebius.dmi'
	model = "moebius"
	matter = list(MATERIAL_STEEL = 2, MATERIAL_PLASTIC = 2, MATERIAL_PLASTEEL = 1)
	max_damage = 60
	min_broken_damage = 40
	min_malfunction_damage = 30
	price_tag = 700

/obj/item/organ/external/robotic/moebius/l_arm
	default_description = /datum/organ_description/arm/left

/obj/item/organ/external/robotic/moebius/r_arm
	default_description = /datum/organ_description/arm/right

/obj/item/organ/external/robotic/moebius/l_leg
	default_description = /datum/organ_description/leg/left

/obj/item/organ/external/robotic/moebius/r_leg
	default_description = /datum/organ_description/leg/right

/obj/item/organ/external/robotic/moebius/groin
	default_description = /datum/organ_description/groin

/obj/item/organ/external/robotic/moebius/chest
	default_description = /datum/organ_description/chest

/obj/item/organ/external/robotic/moebius/head
	default_description = /datum/organ_description/head

// Custodians of the Bonfire - Full Body
/obj/item/organ/external/robotic/church
	name = "\"Emberblaze\""
	desc = "Gold and black prosthetics designed by the Church of the Bonfire."
	force_icon = 'icons/mob/human_races/cyberlimbs/church.dmi'
	model = "church"
	matter = list(MATERIAL_STEEL = 15, MATERIAL_PLASTIC = 5, MATERIAL_BIOMATTER = 30)
	armor_list = list(melee = 30, bullet = 30, energy = 30, bomb = 30, bio = 100, rad = 100)
	max_damage = 60
	min_broken_damage = 40
	min_malfunction_damage = 30
	price_tag = 400

/obj/item/organ/external/robotic/church/l_arm
	default_description = /datum/organ_description/arm/left

/obj/item/organ/external/robotic/church/r_arm
	default_description = /datum/organ_description/arm/right

/obj/item/organ/external/robotic/church/l_leg
	default_description = /datum/organ_description/leg/left

/obj/item/organ/external/robotic/church/r_leg
	default_description = /datum/organ_description/leg/right

/obj/item/organ/external/robotic/church/groin
	default_description = /datum/organ_description/groin

/obj/item/organ/external/robotic/church/chest
	default_description = /datum/organ_description/chest

/obj/item/organ/external/robotic/church/head
	default_description = /datum/organ_description/head

/////////////////////////
/* Lootable Prosthetsis*/
/////////////////////////

// Similacrum - Only limbs
/obj/item/organ/external/robotic/one_star
	name = "\"Similacrum\""
	desc = "Advanced, extremely resilient and mobile prosthetic. Inscribed with \"Made in\" followed by gibberish, must have been lost to time."
	force_icon = 'icons/mob/human_races/cyberlimbs/one_star.dmi'
	model = "one_star"
	armor_list = list(melee = 65, bullet = 65, energy = 65, bomb = 65, bio = 0, rad = 100)
	matter = list(MATERIAL_STEEL = 1, MATERIAL_PLASTIC = 4, MATERIAL_PLATINUM = 2)
	max_damage = 70
	min_broken_damage = 50
	price_tag = 1200

/obj/item/organ/external/robotic/one_star/l_arm
	default_description = /datum/organ_description/arm/left

/obj/item/organ/external/robotic/one_star/r_arm
	default_description = /datum/organ_description/arm/right

/obj/item/organ/external/robotic/one_star/l_leg
	default_description = /datum/organ_description/leg/left

/obj/item/organ/external/robotic/one_star/r_leg
	default_description = /datum/organ_description/leg/right
