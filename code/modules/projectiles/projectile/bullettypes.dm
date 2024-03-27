//There are important things regarding this file:
//Rubbers are non sharp, embed capable objects, with non existing armor penetration. Their agony damage is generally lower then actual one.
//The caliber amount was lowered for a reason, don't add more bloat. If you need different values, use gun vars.
//HV exist as antag option for better ammo.
//* Step delays - default value is 1. Lower value makes bullet go faster, higher value makes bullet go slower.

//Low-caliber pistols and SMGs
//*********************************//
///9mm///
/obj/item/projectile/bullet/pistol_35
	damage_types = list(BRUTE = 15)
	armor_penetration = 5
	step_delay = 0.65
	can_ricochet = TRUE

	affective_damage_range = 3
	affective_ap_range = 3
	recoil = 3

/obj/item/projectile/bullet/pistol_35/hv
	damage_types = list(BRUTE = 10)
	armor_penetration = 20
	step_delay = 0.5
	affective_damage_range = 4
	affective_ap_range = 4
	can_ricochet = TRUE
	recoil = 5

/obj/item/projectile/bullet/pistol_35/practice
	name = "practice bullet"
	damage_types = list(BRUTE = 2)
	agony = 3
	armor_penetration = 0
	embed = FALSE
	sharp = FALSE
	step_delay = 0.75
	can_ricochet = FALSE
	recoil = 2

/obj/item/projectile/bullet/pistol_35/lethal
	name = "hollow-point bullet"
	damage_types = list(BRUTE = 17)
	agony = 6
	post_penetration_dammult = 2
	armor_penetration = 0
	penetrating = 0
	can_ricochet = FALSE
	embed = TRUE
	sharp = TRUE
	step_delay = 0.65
	recoil = 2

/obj/item/projectile/bullet/pistol_35/rubber
	name = "rubber bullet"
	icon_state = "rubber"
	damage_types = list(BRUTE = 10)
	agony = 22
	armor_penetration = 0
	embed = FALSE	//Prob should have a chance to embed, but makes close to no sense to do this for 9mm at least.
	sharp = FALSE
	can_ricochet = TRUE
	recoil = 2

/obj/item/projectile/bullet/pistol_35/rubber/soporific
	name = "soporific coated rubber bullet"
	damage_types = list(BRUTE = 0)
	agony = 25
	var/spray = "stoxin"
	can_ricochet = FALSE
	armor_penetration = 0

/obj/item/projectile/bullet/pistol_35/rubber/soporific/New()
	..()
	if (!testing)
		reagents.add_reagent(spray, 2)

/obj/item/projectile/bullet/pistol_35/rubber/soporific/on_hit(atom/target, def_zone = null)
	if(isliving(target))
		var/mob/living/L = target
		if(istype(L) && L.reagents)
			reagents.trans_to_mob(L, 2, CHEM_TOUCH, copy = FALSE)

/obj/item/projectile/bullet/pistol_35/rubber/soporific/cbo
	name = "soporific condensed plastic bullet"
	agony = 30
	can_ricochet = FALSE
	armor_penetration = 0

/obj/item/projectile/bullet/pistol_35/rubber/soporific/cbo/on_hit(atom/target, def_zone = null)
	if(isliving(target))
		var/mob/living/L = target
		if(istype(L) && L.reagents)
			L.reagents.add_reagent("stoxin", 5)

/obj/item/projectile/bullet/pistol_35/rubber/pepperball
	name = "pepperball"
	damage_types = list(BRUTE = 2)	//Pepperballs disipate upon impact. They'll sting like shit, but won't do much in a low-velocity round.
	agony = 22
	step_delay = 0.6 //a little slower than rubber rounds - these are just pepperspray balls
	armor_penetration = 0
	var/spray = "condensedcapsaicin"
	embed = FALSE
	can_ricochet = FALSE

/obj/item/projectile/bullet/pistol_35/rubber/pepperball/New()
	..()
	if (!testing)
		reagents.add_reagent(spray, 3)

/obj/item/projectile/bullet/pistol_35/rubber/pepperball/on_hit(atom/target, def_zone = null)
	if(isliving(target))
		var/mob/living/L = target
		if(istype(L) && L.reagents && !testing)
			reagents.trans_to_mob(L, 3, CHEM_TOUCH, copy = FALSE)

/obj/item/projectile/bullet/pistol_35/scrap
	damage_types = list(BRUTE = 12)
	armor_penetration = 0

	affective_damage_range = 1
	affective_ap_range = 1
	recoil = 1

/obj/item/projectile/bullet/pistol_35/biomatter
	name = "biomatter bullet"
	damage_types = list(TOX = 15)
	agony = 20
	armor_penetration = 0
	penetrating = 0
	can_ricochet = FALSE
	embed = FALSE
	sharp = FALSE
	step_delay = 0.65
	check_armour = ARMOR_BIO
	recoil = 1

//For Nanoforge pistol
/obj/item/projectile/bullet/pistol_35/nano
	damage_types = list(BURN = 8, BRUTE = 8)//half melted proyectile go zooink!
	armor_penetration = 10
	step_delay = 0.6
	nocap_structures = TRUE //Door breaching
	affective_damage_range = 5
	affective_ap_range = 5
	can_ricochet = TRUE
	recoil = 4

//Revolvers and high-caliber pistols
//*********************************//
/// 10mm Magnum ///

/obj/item/projectile/bullet/magnum_40
	icon_state = "bullet_magnum"
	damage_types = list(BRUTE = 19)
	armor_penetration = 10
	can_ricochet = TRUE
	step_delay = 0.4

	affective_damage_range = 3
	affective_ap_range = 3
	recoil = 5

/obj/item/projectile/bullet/magnum_40/practice
	name = "practice bullet"
	damage_types = list(BRUTE = 2)
	agony = 4
	armor_penetration = 0
	embed = FALSE
	sharp = FALSE
	can_ricochet = FALSE
	step_delay = 0.4
	recoil = 2

/obj/item/projectile/bullet/magnum_40/hv
	damage_types = list(BRUTE = 16)
	armor_penetration = 33
	penetrating = 1
	step_delay = 0.25
	nocap_structures = TRUE //Door breaching
	affective_damage_range = 4
	affective_ap_range = 4
	recoil = 7

/obj/item/projectile/bullet/magnum_40/lethal
	name = "hollow-point bullet"
	damage_types = list(BRUTE = 19)
	agony = 11
	armor_penetration = 0
	post_penetration_dammult = 2
	penetrating = 0
	can_ricochet = FALSE
	embed = TRUE
	sharp = TRUE
	step_delay = 0.5
	recoil = 5

/obj/item/projectile/bullet/magnum_40/rubber
	name = "rubber bullet"
	icon_state = "rubber"
	damage_types = list(BRUTE = 14)	//Basically a lower-damage HP but with more agony damage to it. Technically LTL - but not really ideal for it. Crowd-suppression.
	agony = 30
	armor_penetration = 10
	embed = TRUE	//If you shoot someone with a rubber, it will take out an eye - or require surgery if it's high-velocity. Anything over 9mm should, realistically, fuck you up.
	sharp = FALSE
	can_ricochet = TRUE
	step_delay = 0.5
	recoil = 4

/obj/item/projectile/bullet/magnum_40/rubber/pepperball
	name = "pepperball"
	damage_types = list(BRUTE = 4)	//Pepperballs disipate upon impact. They'll sting like shit, but won't do much in a low-velocity round.
	agony = 30
	step_delay = 0.6 //a little slower than rubber rounds - these are just pepperspray balls
	armor_penetration = 0
	var/spray = "condensedcapsaicin"
	embed = FALSE
	can_ricochet = FALSE	//breaks upon impact; impossible.

/obj/item/projectile/bullet/magnum_40/rubber/pepperball/New()
	..()
	if (!testing)
		reagents.add_reagent(spray, 5)

/obj/item/projectile/bullet/magnum_40/rubber/pepperball/on_hit(atom/target, def_zone = null)
	if(isliving(target))
		var/mob/living/L = target
		if(istype(L) && L.reagents && !testing)
			reagents.trans_to_mob(L, 5, CHEM_TOUCH, copy = FALSE)

/obj/item/projectile/bullet/magnum_40/rubber/soporific
	name = "soporific coated rubber bullet"
	damage_types = list(BRUTE = 0)
	agony = 35
	armor_penetration = 0
	var/spray = "stoxin"
	can_ricochet = FALSE
	embed = FALSE

/obj/item/projectile/bullet/magnum_40/rubber/soporific/New()
	..()
	if (!testing)
		reagents.add_reagent(spray, 3)

/obj/item/projectile/bullet/magnum_40/rubber/soporific/on_hit(atom/target, def_zone = null)
	if(isliving(target))
		var/mob/living/L = target
		if(istype(L) && L.reagents && !testing)
			reagents.trans_to_mob(L, 3, CHEM_TOUCH, copy = FALSE)

/obj/item/projectile/bullet/magnum_40/scrap
	damage_types = list(BRUTE = 16)
	armor_penetration = 5
	affective_damage_range = 1
	affective_ap_range = 1
	recoil = 4

/obj/item/projectile/bullet/magnum_40/biomatter
	name = "biomatter bullet"
	damage_types = list(TOX = 20)
	agony = 32
	armor_penetration = 0
	penetrating = 0
	can_ricochet = FALSE
	embed = FALSE
	sharp = FALSE
	step_delay = 0.65
	check_armour = ARMOR_BIO
	recoil = 4

/// 12mm Heavy Pistol ///
/obj/item/projectile/bullet/kurtz_50
	icon_state = "bullet_krutz"
	damage_types = list(BRUTE = 23.5)
	armor_penetration = 15
	can_ricochet = TRUE
	embed = TRUE
	step_delay = 0.65
	affective_damage_range = 3
	affective_ap_range = 3
	recoil = 10

/obj/item/projectile/bullet/kurtz_50/rubber
	name = "rubber bullet"
	icon_state = "rubber"
	damage_types = list(BRUTE = 15)
	agony = 35
	check_armour = ARMOR_MELEE
	armor_penetration = 10
	can_ricochet = TRUE
	step_delay = 0.7
	recoil = 7

/obj/item/projectile/bullet/kurtz_50/rubber/pepperball
	name = "pepperball"
	damage_types = list(BRUTE = 6)	//Pepperballs disipate upon impact. They'll sting like shit, but won't do much in a low-velocity round.
	agony = 35
	step_delay = 0.75 //a little slower than rubber rounds - these are just pepperspray balls
	armor_penetration = 0
	var/spray = "condensedcapsaicin"
	embed = FALSE
	can_ricochet = FALSE	//breaks upon impact; impossible.

/obj/item/projectile/bullet/kurtz_50/rubber/pepperball/New()
	..()
	if (!testing)
		reagents.add_reagent(spray, 8)

/obj/item/projectile/bullet/kurtz_50/rubber/pepperball/on_hit(atom/target, def_zone = null)
	if(isliving(target))
		var/mob/living/L = target
		if(istype(L) && L.reagents && !testing)
			reagents.trans_to_mob(L, 8, CHEM_TOUCH, copy = FALSE)

/obj/item/projectile/bullet/kurtz_50/practice
	name = "practice bullet"
	damage_types = list(BRUTE = 2)
	agony = 3
	armor_penetration = 0
	embed = FALSE
	can_ricochet = FALSE
	step_delay = 0.75
	recoil = 6

/obj/item/projectile/bullet/kurtz_50/lethal
	name = "hollow-point bullet"
	damage_types = list(BRUTE = 20)
	agony = 12
	post_penetration_dammult = 2
	armor_penetration = 0
	penetrating = 0
	can_ricochet = FALSE
	step_delay = 0.8
	recoil = 12

/obj/item/projectile/bullet/kurtz_50/hv
	name = "AV bullet"
	damage_types = list(BRUTE = 20)
	armor_penetration = 35
	penetrating = 2
	can_ricochet = FALSE
	step_delay = 0.45
	affective_damage_range = 4
	affective_ap_range = 4
	nocap_structures = TRUE //We can breach doors rather well
	recoil = 14


//Carbines and rifles
//*********************************//

/// 6.5x39mm Carbine///

/obj/item/projectile/bullet/light_rifle_257
	icon_state = "bullet_carbine"
	damage_types = list(BRUTE = 14)
	armor_penetration = 15
	penetrating = 1
	can_ricochet = TRUE
	step_delay = 0.3
	affective_damage_range = 7
	affective_ap_range = 7
	recoil = 3

/obj/item/projectile/bullet/light_rifle_257/practice
	name = "practice bullet"
	damage_types = list(BRUTE = 2)
	agony = 2
	armor_penetration = 0
	embed = FALSE
	sharp = FALSE
	can_ricochet = FALSE
	step_delay = 0.5
	recoil = 2

/obj/item/projectile/bullet/light_rifle_257/hv
	damage_types = list(BRUTE = 13)
	armor_penetration = 30
	penetrating = 2
	hitscan = TRUE
	affective_damage_range = 8 //Can snipe
	affective_ap_range = 8
	nocap_structures = TRUE //RATARATARAT down a door
	recoil = 5

/obj/item/projectile/bullet/light_rifle_257/rubber
	name = "rubber bullet"
	icon_state = "rubber"
	damage_types = list(BRUTE = 10)
	agony = 20
	check_armour = ARMOR_MELEE
	armor_penetration = 10
	embed = TRUE	//Imagine being shot with a high velocity .223/5.56 rubber bullet - that shit could easily kill you - or at least would act like a normal bullet.
	sharp = TRUE	//There is no-way this round is not acting like a regular high-velocity round at this point.
	can_ricochet = TRUE
	step_delay = 0.9
	recoil = 2

/obj/item/projectile/bullet/light_rifle_257/rubber/pepperball
	name = "pepperball"
	damage_types = list(BRUTE = 4)	//Pepperballs disipate upon impact. They'll sting like shit, but won't do much in a low-velocity round.
	agony = 20
	step_delay = 1.0 //a little slower than rubber rounds - these are just pepperspray balls
	armor_penetration = 0
	var/spray = "condensedcapsaicin"
	embed = FALSE
	can_ricochet = FALSE	//breaks upon impact; impossible.

/obj/item/projectile/bullet/light_rifle_257/rubber/pepperball/New()
	..()
	if (!testing)
		reagents.add_reagent(spray, 5)

/obj/item/projectile/bullet/light_rifle_257/rubber/pepperball/on_hit(atom/target, def_zone = null)
	if(isliving(target))
		var/mob/living/L = target
		if(istype(L) && L.reagents && !testing)
			reagents.trans_to_mob(L, 5, CHEM_TOUCH, copy = FALSE)

/obj/item/projectile/bullet/light_rifle_257/lethal
	name = "hollow-point bullet"
	damage_types = list(BRUTE = 12)
	agony = 6
	post_penetration_dammult = 2
	armor_penetration = 0
	penetrating = 0
	can_ricochet = FALSE
	embed = TRUE
	sharp = TRUE
	step_delay = 0.6
	recoil = 4

/obj/item/projectile/bullet/light_rifle_257/incend
	name = "incendiary bullet"
	damage_types = list(BURN = 10) //We deal most of are damage with fire stacks
	fire_stacks = 1
	armor_penetration = 0
	penetrating = 0
	can_ricochet = FALSE
	embed = FALSE
	sharp = FALSE
	step_delay = 0.7
	recoil = 5

/obj/item/projectile/bullet/light_rifle_257/scrap
	damage_types = list(BRUTE = 12)
	armor_penetration = 7
	affective_damage_range = 4
	affective_ap_range = 4
	recoil = 4

/obj/item/projectile/bullet/light_rifle_257/nomuzzle
	muzzle_type = null

/// 7.62x39mm Rifle ///

/obj/item/projectile/bullet/rifle_75
	damage_types = list(BRUTE = 15.5)
	armor_penetration = 20
	penetrating = 1
	can_ricochet = TRUE
	step_delay = 0.3
	affective_damage_range = 7
	affective_ap_range = 7
	recoil = 8

/obj/item/projectile/bullet/rifle_75/hv
	damage_types = list(BRUTE = 14)
	armor_penetration = 36
	penetrating = 2
	hitscan = TRUE
	affective_damage_range = 8
	affective_ap_range = 8
	nocap_structures = TRUE //Helps against walls and doors
	recoil = 12

/obj/item/projectile/bullet/rifle_75/practice
	name = "practice bullet"
	damage_types = list(BRUTE = 2)
	agony = 2
	armor_penetration = 0
	embed = FALSE
	sharp = FALSE
	can_ricochet = FALSE
	recoil = 4

/obj/item/projectile/bullet/rifle_75/rubber
	name = "rubber bullet"
	icon_state = "rubber"
	damage_types = list(BRUTE = 12)
	agony = 26
	check_armour = ARMOR_MELEE
	armor_penetration = 15
	embed = TRUE	//literally imagine a 7.62 rubber bullet hitting you - holy shit.
	sharp = TRUE	//there is literally no-fucking-way this would not act like a regular sharp round at this point.
	can_ricochet = TRUE
	step_delay = 0.9
	recoil = 4

/obj/item/projectile/bullet/rifle_75/lethal
	name = "hollow-point bullet"
	damage_types = list(BRUTE = 15)
	agony = 9
	armor_penetration = 0
	penetrating = 0
	can_ricochet = FALSE
	embed = TRUE
	sharp = TRUE
	step_delay = 0.8
	recoil = 6

/obj/item/projectile/bullet/rifle_75/incend
	name = "incendiary bullet"
	damage_types = list(BURN = 12) //We deal most of are damage with fire stacks
	fire_stacks = 2
	armor_penetration = 0
	penetrating = 0
	can_ricochet = FALSE
	embed = FALSE
	sharp = FALSE
	step_delay = 0.8
	recoil = 7

/obj/item/projectile/bullet/rifle_75/scrap
	damage_types = list(BRUTE = 14)
	armor_penetration = 10
	affective_damage_range = 3
	affective_ap_range = 3
	recoil = 3

/// 8.6x70mm Heavy Rifle ///

/obj/item/projectile/bullet/heavy_rifle_408
	icon_state = "bullet_heavy"
	damage_types = list(BRUTE = 20)
	armor_penetration = 25
	penetrating = 2
	can_ricochet = TRUE
	step_delay = 0.3
	affective_damage_range = 8
	affective_ap_range = 8
	recoil = 12

/obj/item/projectile/bullet/heavy_rifle_408/rubber
	name = "rubber bullet"
	icon_state = "rubber"
	damage_types = list(BRUTE = 17)
	armor_penetration = 20
	agony = 32
	check_armour = ARMOR_MELEE
	embed = TRUE	//imagine an effectively smaller .50 Cal marksman round hitting you. holy shit.
	sharp = TRUE	//there is literally no-fucking-way this would not act like a regular sharp round at this point.
	can_ricochet = TRUE
	step_delay = 0.9
	recoil = 8

/obj/item/projectile/bullet/heavy_rifle_408/practice
	name = "practice bullet"
	damage_types = list(BRUTE = 2)
	agony = 2
	armor_penetration = 0
	embed = FALSE
	sharp = FALSE
	can_ricochet = FALSE
	step_delay = 0.5
	recoil = 7

/obj/item/projectile/bullet/heavy_rifle_408/hv
	name = "sabot penetrator"
	damage_types = list(BRUTE = 16)
	armor_penetration = 46
	penetrating = 3
	hitscan = TRUE
	affective_damage_range = 9 //Sniping cal
	affective_ap_range = 9
	nocap_structures = TRUE //anit-wall/door
	recoil = 16

/obj/item/projectile/bullet/heavy_rifle_408/lethal
	name = "hollow-point bullet"
	damage_types = list(BRUTE = 25)
	agony = 14
	post_penetration_dammult = 2
	armor_penetration = 0 //Half of normal
	penetrating = 0
	can_ricochet = FALSE
	embed = TRUE
	sharp = TRUE
	step_delay = 0.5
	recoil = 10

/obj/item/projectile/bullet/heavy_rifle_408/incend
	name = "incendiary bullet"
	damage_types = list(BURN = 15) //We deal most of are damage with fire stacks
	fire_stacks = 3
	armor_penetration = 0
	penetrating = 0
	can_ricochet = FALSE
	embed = FALSE
	sharp = FALSE
	step_delay = 0.8
	recoil = 11

/obj/item/projectile/bullet/heavy_rifle_408/scrap
	damage_types = list(BRUTE = 15)
	armor_penetration = 15 //half  of normal
	affective_damage_range = 4
	affective_ap_range = 4
	recoil = 8

///Snowflake  ///

/obj/item/projectile/bullet/cl7mm
	damage_types = list(BRUTE = 19)
	armor_penetration = 18
	penetrating = 2
	can_ricochet = TRUE
	sharp = TRUE
	step_delay = 0.3
	affective_damage_range = 9
	affective_ap_range = 9
	recoil = 7

/obj/item/projectile/bullet/auto_460
	damage_types = list(BRUTE = 30)
	armor_penetration = 25
	penetrating = 2
	can_ricochet = TRUE
	step_delay = 0.3
	affective_damage_range = 8
	affective_ap_range = 8
	recoil = 12

/obj/item/projectile/bullet/auto_460/scrap
	damage_types = list(BRUTE = 17.5)
	armor_penetration = 15
	penetrating = 1
	can_ricochet = TRUE
	step_delay = 0.3
	affective_damage_range = 5
	affective_ap_range = 5
	recoil = 10

//// 14.5×114mm Anti-Materiel Rifle Rounds ////
/obj/item/projectile/bullet/antim
	damage_types = list(BRUTE = 60)
	armor_penetration = 100
	nocap_structures = TRUE
	//stun = 5
	//weaken = 10
	penetrating = 5
	hitscan = TRUE //so the PTR isn't useless as a sniper weapon
	affective_damage_range = 10
	affective_ap_range = 10
	recoil = 40

/obj/item/projectile/bullet/antim/lethal
	damage_types = list(BRUTE = 45)
	embed = TRUE
	armor_penetration = 60
	agony = 100
	penetrating = 2
	affective_damage_range = 9
	affective_ap_range = 9
	penetrating = -5
	recoil = 20

/obj/item/projectile/bullet/antim/incend
	damage_types = list(BURN = 45)
	embed = FALSE
	fire_stacks = 5	//BURN, BABY! BUUURN!!
	armor_penetration = 20
	penetrating = 2
	affective_damage_range = 10
	affective_ap_range = 10
	penetrating = -5
	recoil = 40

/obj/item/projectile/bullet/antim/scrap
	damage_types = list(BRUTE = 41.5)
	armor_penetration = 50
	affective_damage_range = 8
	affective_ap_range = 8
	recoil = 30

/obj/item/projectile/bullet/antim/ion
	damage_types = list(BRUTE = 25)
	armor_penetration = 40
	recoil = 15

/obj/item/projectile/bullet/antim/ion/on_impact(atom/target, blocked = FALSE)
	. = ..()
	if (!testing)
		empulse(target, 1, 3)

//smoothbore rifles
/obj/item/projectile/bullet/ball
	nocap_structures = TRUE
	damage_types = list(BRUTE = 40) //Grab me musket as the founding fathers intended
	armor_penetration = 250 //It's a little jenk, but this makes it super effective against mobs while only middle against players given its slow shot pattern. -Kaz
	agony = 60
	penetrating = 2
	hitscan = TRUE //It's a bullet, but its hitscan as its only used by snipers.
	affective_damage_range = 12
	affective_ap_range = 12 //Good rifling!
	recoil = 35

//Mech
/obj/item/projectile/bullet/mech_coilgun //Industrial Coilgun
	name = "coilgun round"
	icon_state = null
	damage_types = list(BRUTE = 26)
	armor_penetration = 20
	penetrating = 1

	can_ricochet = FALSE
	embed = FALSE //Goes right through
	affective_damage_range = 9
	affective_ap_range = 7

	recoil = 2

/obj/item/projectile/bullet/pellet/mech_flak //Flak Cannon
	name = "flak shrapnel"
	icon_state = "l_birdshot-4"
	damage_types = list(BRUTE = 11)
	armor_penetration = 22
	penetrating = 0

	pellets = 4			//number of pellets
	range_step = 4		//projectile will lose a fragment each time it travels this distance.
	base_spread = 15	//lower means the pellets spread more across body parts.
	spread_step = 5	//higher means the pellets spread more across body parts with distance

	can_ricochet = FALSE
	embed = TRUE
	sharp = FALSE

	affective_damage_range = 8
	affective_ap_range = 9 //Anti-Air
	recoil = 2

/obj/item/projectile/bullet/pellet/mech_flak/military //Scatter-Shot Autocannon
	range_step = 8		//projectile will lose a fragment each time it travels this distance.
	base_spread = 90	//lower means the pellets spread more across body parts.
	spread_step = 1	//higher means the pellets spread more across body parts with distance

	affective_damage_range = 11
	affective_ap_range = 11  //Anti-Air

/obj/item/projectile/bullet/mech_machinegun //Heavy Machinegun
	name = "large caliber bullet"
	icon_state = "bullet_heavy"
	damage_types = list(BRUTE = 13)
	armor_penetration = 15 //To keep it somewhat fair towards the handhelds considering it has higher ammo capacity
	penetrating = 1

	can_ricochet = TRUE

	affective_damage_range = 6
	affective_ap_range = 6 //Blarge rifle caliber
	recoil = 8

/obj/item/projectile/bullet/mech_autocannon //Autocannon
	name = "gigantic round"
	icon_state = "slug"
	damage_types = list(BRUTE = 56)
	armor_penetration = 50 //Tally ho
	penetrating = 3 //tank sized round

	can_ricochet = FALSE

	affective_damage_range = 8
	affective_ap_range = 8 //Heavy blarge caliber meaning bit less range
	recoil = 2

/obj/item/projectile/bullet/mech_burstcannon //Burst-Fire Autocannon
	name = "humongous round"
	icon_state = "bullet_kurtz"
	damage_types = list(BRUTE = 26)
	armor_penetration = 43 //This fires 2 in a row so keep that in mind
	penetrating = 3 //tank sized round

	can_ricochet = FALSE

	affective_damage_range = 10
	affective_ap_range = 10 //Heavy blarge caliber but not as much as regular
	recoil = 2

//Shotguns
//*********************************//

/obj/item/projectile/bullet/shotgun
	name = "slug"
	icon_state = "slug"
	damage_types = list(BRUTE = 37)
	armor_penetration = 25
	knockback = 0 //Bug doups hits
	step_delay = 0.9
	//Slugs are meant for long range shooting
	affective_damage_range = 5
	affective_ap_range = 8
	recoil = 16

/obj/item/projectile/bullet/shotgun/ceramic
	name = "ceramic slug"
	icon_state = "slug"
	damage_types = list(BRUTE = 30)
	armor_penetration = 10
	knockback = 1 //KER-BLAM!!!!
	affective_damage_range = 4
	affective_ap_range = 4
	recoil = 20

/obj/item/projectile/bullet/shotgun/beanbag
	name = "beanbag"
	icon_state = "rubber"
	damage_types = list(BRUTE = 15)
	agony = 60
	armor_penetration = 0
	embed = FALSE
	sharp = FALSE
	step_delay = 1.65
	affective_damage_range = 5
	affective_ap_range = 2
	recoil = 8

/obj/item/projectile/bullet/shotgun/beanbag/pepperball
	name = "pepperball slug"
	damage_types = list(BRUTE = 6)	//Pepperballs disipate upon impact. They'll sting like shit, but won't do much in a low-velocity round.
	agony = 50
	step_delay = 2 //Slower than a beanbag due to it being STRONG as fuck.
	armor_penetration = 0
	var/spray = "condensedcapsaicin"
	embed = FALSE
	can_ricochet = FALSE	//breaks upon impact; impossible.

/obj/item/projectile/bullet/shotgun/beanbag/pepperball/New()
	..()
	if (!testing)
		reagents.add_reagent(spray, 10)

/obj/item/projectile/bullet/shotgun/beanbag/on_hit(atom/target, def_zone = null)
	if(isliving(target))
		var/mob/living/L = target
		if(istype(L) && L.reagents && !testing)
			reagents.trans_to_mob(L, 10, CHEM_TOUCH, copy = FALSE)

/obj/item/projectile/bullet/shotgun/beanbag/soporific
	name = "soporific coated beanbag"
	damage_types = list(BRUTE = 10) // They still hurt!
	agony = 65
	var/spray = "stoxin"

/obj/item/projectile/bullet/shotgun/beanbag/soporific/New()
	..()
	if (!testing)
		reagents.add_reagent(spray, 5)

/obj/item/projectile/bullet/shotgun/beanbag/soporific/on_hit(atom/target, def_zone = null)
	if(isliving(target))
		var/mob/living/L = target
		if(istype(L) && L.reagents && !testing)
			reagents.trans_to_mob(L, 5, CHEM_TOUCH, copy = FALSE)


/obj/item/projectile/bullet/shotgun/practice
	name = "practice slug"
	damage_types = list(BRUTE = 4)
	agony = 5
	armor_penetration = 0
	embed = FALSE
	affective_damage_range = 1
	affective_ap_range = 1
	recoil = 5

/obj/item/projectile/bullet/shotgun/incendiary
	//This is the best ammo for pvp in a shotgun, beating the stunshell with its pain and cooks anyone in any armor!
	damage_types = list(BURN = 22.5) //We deal most of are damage with fire stacks
	fire_stacks = 4 //40 pain a fire proc through ALL armor!
	recoil = 38

/obj/item/projectile/bullet/shotgun/scrap
	damage_types = list(BRUTE = 27)
	armor_penetration = 5
	affective_damage_range = 3
	affective_ap_range = 4
	recoil = 8

/obj/item/projectile/bullet/shotgun/beanbag/scrap
	damage_types = list(BRUTE = 13)
	agony = 55
	affective_damage_range = 1
	affective_ap_range = 1
	recoil = 6

/obj/item/projectile/bullet/pellet/shotgun/scrap
	damage_types = list(BRUTE = 4)
	base_spread = 90
	agony = 3
	pellets = 6
	range_step = 5//more range for the pellets so they can bonk more enemies that travel in straight lines (becomes good against plagues)
	spread_step = 10
	knockback = 0 //We do not knockback do to issues with bullet douping
	step_delay = 0.9
	affective_damage_range = 5
	affective_ap_range = 5
	recoil = 11

//Railgun
/obj/item/projectile/bullet/shotgun/railgun
	nocap_structures = TRUE
	hitscan = TRUE
	can_ricochet = FALSE
	affective_damage_range = 10
	affective_ap_range = 10
	recoil = 16

/obj/item/projectile/bullet/shotgun/beanbag/railgun
	hitscan = TRUE
	can_ricochet = FALSE
	affective_damage_range = 10
	affective_ap_range = 10
	recoil = 12

/obj/item/projectile/bullet/shotgun/incendiary/railgun
	hitscan = TRUE
	can_ricochet = FALSE
	affective_damage_range = 10
	affective_ap_range = 10
	recoil = 18

/obj/item/projectile/bullet/kurtz_50/railgun
	nocap_structures = TRUE
	hitscan = TRUE
	can_ricochet = FALSE
	recoil = 11

/obj/item/projectile/bullet/kurtz_50/rubber/railgun
	hitscan = TRUE
	can_ricochet = FALSE
	recoil = 7

/obj/item/projectile/bullet/kurtz_50/incendiary
	damage_types = list(BRUTE = 5)
	agony = 5
	armor_penetration = 0
	embed = FALSE
	can_ricochet = FALSE
	knockback = 0
	fire_stacks = 4
	recoil = 17

/obj/item/projectile/bullet/heavy_rifle_408/railgun
	can_ricochet = FALSE
	icon_state = "toxin"
	recoil = 21

/obj/item/projectile/bullet/lrifle/incendiary
	icon_state = "fireball"
	damage_types = list(BURN = 3.5)
	agony = 5
	armor_penetration = 0
	embed = FALSE
	can_ricochet = FALSE
	knockback = 0
	recoil = 18
	fire_stacks = 4
/*
/obj/item/projectile/bullet/lrifle/incendiary/on_hit(atom/target, blocked = FALSE)
	. = ..()
	if(iscarbon(target) && !testing)
		var/mob/living/carbon/M = target
		M.adjust_fire_stacks(fire_stacks)
		M.IgniteMob()
*/
//Gauss rifle
/obj/item/projectile/bullet/gauss
	name = "gauss"
	icon_state = "gauss"
	mob_hit_sound = list('sound/effects/gore/sear.ogg')
	hitsound_wall = 'sound/weapons/guns/misc/ric4.ogg'
	damage_types = list(BRUTE = 34)
	armor_penetration = 40
	check_armour = ARMOR_BULLET
	embed = FALSE
	can_ricochet = FALSE
	sharp = FALSE
	affective_damage_range = 12
	affective_ap_range = 12
	hitscan = TRUE
	recoil = 38

//Should do about 68 damage at 1 tile distance (adjacent), and 40 damage at 3 tiles distance.
//Overall less damage than slugs in exchange for more damage at very close range and more embedding//now should work like an weak 9mm being shot 6 times, the old damage type was never used by the players
/obj/item/projectile/bullet/pellet/shotgun
	name = "shrapnel"
	icon_state = "buckshot"//changed the sprite for a different one
	damage_types = list(BRUTE = 6.5)
	base_spread = 90
	agony = 3
	pellets = 6
	range_step = 1
	spread_step = 10
	knockback = 0 //We do not knockback do to issues with bullet douping
	step_delay = 0.9
	affective_damage_range = 5
	affective_ap_range = 5
	recoil = 11

/obj/item/projectile/bullet/pellet/shotgun/Initialize()
	. = ..()
	icon_state = "buckshot"//changed for a test of performance

/obj/item/projectile/bullet/pellet/shotgun/scattershot //VERY dangerous, the weapon has a low refire rate for a reason. DO NOT use this for non exo weapons without tweaking.
	name = "heavy shrapnel"
	damage_types = list(BRUTE = 8) //We hit slightly softer than buckshot
	agony = 0 //No.
	pellets = 6 // but more times
	range_step = 2 //and at longer range
	step_delay = 1.1 //we travel a bit slower
	recoil = 13

//'Laser' buckshot. Effectively just burn buckshot used for the Abdication.
/obj/item/projectile/bullet/pellet/shotgun/energy
	name = "Unstable energy bolt"
	icon_state = "l_birdshot-1"
	damage_types = list(BURN = 11.5) //slightly less than buck, but FAR more painful
	armor_penetration = 15 //heated shot melt armor.
	embed = FALSE
	can_ricochet = FALSE
	sharp = FALSE
	muzzle_type = /obj/effect/projectile/plasma/muzzle/red
	check_armour = ARMOR_ENERGY
	recoil = 7

//For the love of God don't make this common.
/obj/item/projectile/bullet/shotgun/payload
	name = "explosive bolt"
	icon_state = "bolter"
	damage_types = list(BRUTE = 15)
	agony = 5
	knockback = 1
	fire_stacks = 2
	armor_penetration = 10
	nocap_structures = TRUE
	check_armour = ARMOR_BOMB
	sharp = TRUE
	edge = TRUE
	step_delay = 0.9
	recoil = 25

/obj/item/projectile/bullet/shotgun/payload/on_impact(atom/target)
	if (!testing)
		explosion(target, 0, 0, 3)
	return TRUE

//Miscellaneous
/obj/item/projectile/bullet/blank
	invisibility = 101
	damage_types = list(BRUTE = 1)
	embed = FALSE
	recoil = 2

/obj/item/projectile/bullet/cap
	name = "cap"
	damage_types = list(HALLOS = 0)
	nodamage = TRUE
	embed = FALSE
	sharp = FALSE
	recoil = 1

/obj/item/projectile/bullet/crossbow_bolt
	name = "bolt"
	icon_state = "bolt"
	damage_types = list(BRUTE = 30)
	armor_penetration = 20
	knockback = 0 //Bug doups hits
	step_delay = 0.9
	affective_damage_range = 7
	affective_ap_range = 7
	recoil = 2

/obj/item/projectile/bullet/crossbow_bolt/lethal
	name = "bolt"
	icon_state = "bolt"
	damage_types = list(BRUTE = 45)
	agony = 29
	armor_penetration = 5
	step_delay = 0.9
	recoil = 1

/obj/item/projectile/bullet/crossbow_bolt/hv
	name = "bolt"
	icon_state = "bolt"
	damage_types = list(BRUTE = 25)
	armor_penetration = 55
	penetrating = 3
	hitscan = TRUE
	affective_damage_range = 9
	affective_ap_range = 9
	nocap_structures = TRUE //Can do well againt walls and doors
	recoil = 5

// Reusable ammo. Ammo that can be retrieved again once fired, unless stated.
/obj/item/projectile/bullet/reusable
	var/obj/item/create_type
	muzzle_type = null

/obj/item/projectile/bullet/reusable/on_impact(atom/A)
	..()
	if(create_type && !testing)
		new create_type(get_turf(src))

// Crossbow Bolts. Higher penetration due to more tension.
/obj/item/projectile/bullet/reusable/rod_bolt
	name = "crude bolt"
	icon_state = "bolt"
	damage_types = list(BRUTE = 2) // Damage values are multiplied by tension with a max of 5, thus 5 damage.
	armor_penetration = 15
	supereffective_types = list(/mob/living/carbon/human = FALSE, /mob/living = TRUE) // Strong against everything that isn't a human. Superior than arrows in that aspect.
	supereffective_mult = 1.5 // Massive damage increase still.
	step_delay = 0.9
	embed = FALSE
	penetrating = 1
	affective_damage_range = 7
	affective_ap_range = 7
	create_type = /obj/item/ammo_casing/rod_bolt // Let's keep it the same for the sake of consistency.

/obj/item/projectile/bullet/reusable/rod_bolt/superheated
	name = "superheated metal rod"
	damage_types = list(BRUTE = 3, BURN = 1) // 30 damage, combined with the burn.
	armor_penetration = 20
	step_delay = 0.6
	embed = TRUE
	penetrating = 0
	affective_damage_range = 7
	affective_ap_range = 7
	create_type = null
	recoil = 10


/obj/item/projectile/bullet/reusable/rod_bolt/rcd
	name = "flashforged bolt"
	icon_state = "bolt"
	damage_types = list(BRUTE = 2) // Same damage, but it's faster and has higher AP.
	armor_penetration = 30
	step_delay = 0.6
	embed = FALSE
	penetrating = 1
	affective_damage_range = 7
	affective_ap_range = 7
	create_type = /obj/item/arrow/rcd
	recoil = 6 //Scrap verson
	nocap_structures = TRUE // Reflecting the fact it's made from a literal RCD

/obj/item/projectile/bullet/reusable/rod_bolt/rcd/superhot
	name = "flashforged superheated bolt"
	icon_state = "bolt"
	damage_types = list(BRUTE = 3, BURN = 2) // 40 damage. Slightly better than normal crossbow.
	armor_penetration = 30
	step_delay = 0.2
	embed = TRUE
	penetrating = 0
	affective_damage_range = 7
	affective_ap_range = 7
	create_type = null

// Arrows. Lower penetration, and good only against living creatures, but can compensate damage by special bow modifications or specialized ammo.

/obj/item/projectile/bullet/reusable/arrow
	name = "arrow"
	icon_state = "arrow"
	damage_types = list(BRUTE = 2) //Multiplied by max tension of 10 when fired, thus 20 damage ceiling.
	armor_penetration = 5
	// Good against colony mobs.
	// Drones and Xeno are there for Horizon Zero Dawn and Predator references.
	effective_faction = list("carp", "wurm", "roach", "spiders", "vox_tribe", "russian", "tengo", "xenomorph", "agape", "sargoyle", "nightmare", "malf_drone")
	damage_mult = 1.5 // Double damage to everything in the above factions
	embed = FALSE //don't want to embed and drop an arrow, that would be weird
	check_armour = ARMOR_MELEE
	step_delay = 0.9
	affective_damage_range = 6
	affective_ap_range = 6
	create_type = /obj/item/ammo_casing/arrow
	recoil = 0 //arrow moment

//Lower base damage, higher embed rate, higher AP. Arrow HV's, though not as good as the Trappers' arrows.
/obj/item/projectile/bullet/reusable/arrow/serrated
	name = "serrated arrow"
	icon_state = "arrow"
	embed = TRUE
	damage_types = list(BRUTE = 1) // 10 damage at max pull
	embed_mult = 3 //we are going to try really hard to embed
	armor_penetration = 15 // Without high pen these are worthless besides hitscan
	hitscan = TRUE // As every HV ammo
	affective_damage_range = 8
	affective_ap_range = 8
	create_type = null
	shrapnel_type = /obj/item/ammo_casing/arrow/serrated //the ENTIRE arrow!

//Very good base damage, negligible (5) AP, but no embedding. Think of this as arrow-hollowpoints.
/obj/item/projectile/bullet/reusable/arrow/broadhead
	name = "broadhead arrow"
	icon_state = "arrow-broad"
	damage_types = list(BRUTE = 3)
	post_penetration_dammult = 1.5
	embed = FALSE
	armor_penetration = 0.5
	create_type = /obj/item/ammo_casing/arrow/broadhead

// Trapper exclusive crafted arrows below. Good for the hunt.
/obj/item/projectile/bullet/reusable/arrow/hunting
	name = "hunting arrow"
	icon_state = "arrow-bone"
	damage_types = list(BRUTE = 1) //Multiplied by 10 when fired.
	effective_faction = list() // Have to null this so it doesn't become a 400 damage arrow.
	damage_mult = 0 // Same as above.
	supereffective_types = list(/mob/living/carbon/human = FALSE, /mob/living = TRUE) // Strong against everything that isn't a human, as it's a hunting arrow.
	supereffective_mult = 2 // Double damage to all that is not human
	armor_penetration = 10 // Higher ap than normal to take advantage of overpen on mobs
	step_delay = 0.7 // 20% faster than normal arrows
	affective_damage_range = 8
	affective_ap_range = 8
	create_type = /obj/item/ammo_casing/arrow/hunting

// Non-reusable high-tier Trapper arrow.
/obj/item/projectile/bullet/reusable/arrow/hunting/heavy
	name = "fragmenting hunting arrow"
	icon_state = "arrow-bone"
	damage_types = list(BRUTE = 2) //Multiplied by 10 when fired.
	embed = TRUE
	hitscan = TRUE // Sniping round, fast
	supereffective_mult = 3 // Let's not get out of hand here.
	affective_damage_range = 10 // Higher range, to synergize with the recurve bow's scope
	affective_ap_range = 10
	create_type = null // Do remember this is NOT reusable. Much like bullets.

/obj/item/projectile/bullet/reusable/arrow/reagent
	name = "chemical arrow"
	icon_state = "arrow-reagent"
	effective_faction = list()
	damage_types = list(BRUTE = 0.5) //Low damage, but chem-warfarable.
	embed = FALSE
	reagent_flags = INJECTABLE | DRAINABLE | AMOUNT_VISIBLE | REFILLABLE
	armor_penetration = 0.5
	step_delay = 1
	create_type = /obj/item/projectile/bullet/reusable/arrow/practice/payload

/obj/item/projectile/bullet/reusable/arrow/reagent/on_impact(atom/target)
	if (!testing)
		visible_message(SPAN_DANGER("The vial attached to [name] bursts, spraying [target] with its contents!"))
		reagents.splash(target, reagents.total_volume)
	return ..()

/obj/item/projectile/bullet/reusable/arrow/reagent/hypo
	name = "injector arrow"
	volume = 5 //hypo arrows only hold 5u of reagents.

/obj/item/projectile/bullet/reusable/arrow/reagent/hypo/on_impact(atom/target)
	if (!testing)
		visible_message(SPAN_DANGER("The hypo attached to [name] hits [target], injecting [target] with its contents!"))
		if(isliving(target))
			var/mob/living/injectee = target
			admin_inject_log(original_firer, target, src, reagents.log_list(), 5)
			reagents.trans_to_mob(injectee, 5, CHEM_BLOOD)
		else
			reagents.trans_to(target, 5)
	return TRUE


/obj/item/projectile/bullet/reusable/arrow/practice
	name = "training arrow"
	icon_state = "arrow-practice"
	damage_types = list(HALLOSS = 0.5)
	embed = FALSE
	nodamage = TRUE
	armor_penetration = 0
	create_type = /obj/item/ammo_casing/arrow/practice

/obj/item/projectile/bullet/reusable/arrow/practice/payload
	name = "empty payload arrow"
	step_delay = 1.1
	create_type = /obj/item/ammo_casing/arrow/empty_payload


//spolsives here

/obj/item/projectile/bullet/reusable/arrow/explosive
	name = "explosive arrow"
	desc = "Holy shit, there's a bomb taped to this arrow!"
	icon_state = "arrow-grenade"
	effective_faction = list()
	damage_types = list(HALLOSS = 1)
	embed = FALSE //impact fuze
	armor_penetration = 0
	step_delay = 1.1 //slower
	affective_damage_range = 6
	affective_ap_range = 6
	kill_count = 7 //heavy arrow, worse aerodynamics
	create_type = null

/obj/item/projectile/bullet/reusable/arrow/explosive/on_impact(atom/target)
	if (!testing)
		explosion(target, 0, 1, 3)
	return TRUE

/obj/item/projectile/bullet/reusable/arrow/explosive/frag
	name = "frag grenade arrow"
	desc = "Holy shit, there's a military-grade frag grenade taped to this arrow!"
	var/frag_type = /obj/item/projectile/bullet/pellet/fragment/strong
	var/frag_damage = 3
	var/frag_count = 75

/obj/item/projectile/bullet/reusable/arrow/explosive/frag/on_impact(atom/target)
	if (!testing)
		fragment_explosion(target, 4, frag_type, frag_count, frag_damage, 2, 100)
	return TRUE

/obj/item/projectile/bullet/reusable/arrow/explosive/frag/sting
	name = "stinger grenade arrow"
	desc = "Holy shit, there's a police-grade stinger grenade taped to this arrow!"
	frag_type = /obj/item/projectile/bullet/pellet/fragment/rubber
	frag_damage = 1
	frag_count = 50

/obj/item/projectile/bullet/reusable/arrow/explosive/frag/on_impact(atom/target)
	if (!testing)
		fragment_explosion(target, 4, frag_type, frag_count, frag_damage, 2, 100)
	return TRUE


/obj/item/projectile/bullet/reusable/arrow/explosive/emp
	name = "electromagnetic pulse grenade arrow"
	desc = "Holy shit, there's a EMP grenade taped to this arrow!"

/obj/item/projectile/bullet/reusable/arrow/explosive/emp/on_impact(atom/target)
	if (!testing)
		empulse(target, 1, 2) //fairly weak
	return TRUE

/obj/item/projectile/bullet/reusable/arrow/explosive/flashbang
	name = "flashbang arrow"
	desc = "Holy shit, there's a flashbang taped to this arrow!"

/obj/item/projectile/bullet/reusable/arrow/explosive/flashbang/on_impact(atom/target)
	if (!testing)
		for(var/mob/living/carbon/M in hear(2, get_turf(target)))
			flashbang_bang(get_turf(target), M)

		for(var/mob/living/carbon/human/thermal_user in orange(4, target))
			if(!thermal_user.glasses)
				return
			var/obj/item/clothing/glasses/potential_thermals = thermal_user.glasses
			if(potential_thermals.overlays == global_hud.thermal)
				flashbang_without_the_bang(get_turf(target), thermal_user)

		for(var/obj/effect/blob/B in hear(2,get_turf(target)))	//Blob damage here
			var/damage = round(30/(get_dist(2,get_turf(target))+1))
			B.health -= damage
			B.update_icon()

		new /obj/effect/sparks(get_turf(target))
	return TRUE

/obj/item/projectile/bullet/reusable/arrow/explosive/heatwave
	name = "heatwave arrow"
	desc = "Holy shit, there's a heatwave grenade taped to this arrow!"

/obj/item/projectile/bullet/reusable/arrow/explosive/heatwave/on_impact(atom/target)
	if (!testing)
		heatwave(target, 1, 2, 25, TRUE, 0)
	return TRUE

/obj/item/projectile/bullet/reusable/arrow/explosive/smoke
	name = "smoke grenade arrow"
	desc = "Holy shit, there's a smoke grenade taped to this arrow!"
	var/datum/effect/effect/system/smoke_spread/bad/smoke

/obj/item/projectile/bullet/reusable/arrow/explosive/smoke/Initialize()
	..()
	if (!testing)
		src.smoke = new
		src.smoke.attach(src)

/obj/item/projectile/bullet/reusable/arrow/explosive/smoke/on_impact(atom/target)
	if (!testing)
		src.smoke.set_up(10, 0, usr.loc)
		src.smoke.start()
	return TRUE

/obj/item/projectile/bullet/reusable/arrow/explosive/smoke/Destroy()
	..()
	if (smoke)
		QDEL_NULL(smoke)

/obj/item/projectile/bullet/reusable/arrow/radiant
	name = "Silvery Inferno"
	icon_state = "infernal_arrow"
	damage_types = list(BURN = 3) /*Multiplied by 10 when fired. Perhaps we will buff this depending of testing and\
	player opinion, afterall, Custodians got the "Our stuff rivals modern stuff!!!" mindset for a reason. Also used only\ 
	on a very rare, specialization bow.*/
	hitscan = TRUE // Sniping round, fast
	affective_damage_range = 10 // Higher range.
	affective_ap_range = 10
	create_type = null // Do remember this is NOT reusable. Much like bullets.
