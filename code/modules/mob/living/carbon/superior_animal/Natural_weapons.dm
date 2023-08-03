/*
// //==========//
DISCLAIMER: P.P. Plan (Personal Protection Plan)
Natural Weapons are used by superior_mobs inplace of melee_upper/lower damage variable
TLDR: They are capable of inhereting any /obj/ and /item/ proc and variable there is.
God help us.
//==========//
*/
/obj/item/natural_weapon
	name = "natural weapons"
	gender = PLURAL
	attack_verb = list("attacked")
	//Gives all mobs a randomized value between their upper-lower
	force = 0
	armor_penetration = 0	//adds monster armor_pen or grazing
	damtype = BRUTE
	sharp = FALSE
	edge = FALSE

	// Honestly, I don't know how this would conceptually work...
	// Set at your own risk.
	embed_mult = 0
	canremove = FALSE

	// These two are important
	flags = CONDUCT
	unacidable = 1
	// whether should we show up in attack message, e.g. 'urist has been bit with teeth by carp' vs 'urist has been bit by carp'
	var/show_in_message
	var/mob/living/embedded
	//Here for the sake of Stat_modifier finding it... Sure, give whatever poison now//
	var/poison_per_bite = 0
	var/poison_type = ""

	New(mob/living/user)
		var/mob/living/carbon/superior_animal/M = user
		if(M && (M == user))
			//For cleanliness, add instead of replace... Incase we make a mob without upper/lower/armor_penetration
			force += rand(M.melee_damage_lower, M.melee_damage_upper)
			armor_penetration += max(ARMOR_PEN_GRAZING, M.armor_penetration)
			// Hopefully works with stat_modifiers
			poison_per_bite += M?.poison_per_bite
			poison_type = M?.poison_type

/obj/item/natural_weapon/attack_message_name()
	return show_in_message ? ..() : FALSE

/obj/item/natural_weapon/on_embed(mob/user)
	embedded = user
	//Call first so you don't poison yourself.

/obj/item/natural_weapon/on_embed_removal(mob/living/user)
	//Call this last or so god help me.
	embedded = null
	if(!hud_actions)
		return
	for(var/action in hud_actions)
		user.client.screen -= action

/mob/living/carbon/superior_animal/UnarmedAttack(atom/A, proximity)
	. = ..()
	if(!.)
		return

	if(natural_weapon.poison_per_bite > 0)

		if(isliving(A))
			var/mob/living/L = A
			if(istype(L) && L.reagents)
				var/zone_armor =  L.getarmor(targeted_organ, ARMOR_MELEE)
				var/poison_injected = zone_armor ? natural_weapon.poison_per_bite * (-0.01 * zone_armor + 1) : natural_weapon.poison_per_bite
				L.reagents.add_reagent(natural_weapon.poison_type, poison_injected)

//SPIDERS//
/obj/item/natural_weapon/fang
	name = "fangs"
	attack_verb = list("bitten")
	hitsound = 'sound/weapons/spiderlunge.ogg'

	sharp = TRUE
//END SPIDERS

//////////

//WURM
/obj/item/natural_weapon/wurm //wurms default to low when not set
	name = "teeth"
	attack_verb = list("chomped")
	hitsound = 'sound/weapons/bite.ogg'

	sharp = TRUE
//*end wurm

//////////

//NOT-VOX
/obj/item/natural_weapon/claws
	name = "claws"
	attack_verb = list("mauled", "clawed", "slashed")

	sharp = TRUE
	edge = TRUE

//*End of NOT-VOX

//////////

//PSI-THINGS
/obj/item/natural_weapon/psi_monster
	name = "???"
	hitsound = list('sound/xenomorph/alien_claw_flesh1.ogg','sound/xenomorph/alien_claw_flesh2.ogg',
								 'sound/xenomorph/alien_claw_flesh3.ogg', 'sound/xenomorph/alien_tail_attack.ogg')
	force = 12.5

/obj/item/natural_weapon/psi_monster/ponderous
	hitsound = list(
	'sound/weapons/punch1.ogg','sound/weapons/punch2.ogg','sound/weapons/punch3.ogg','sound/weapons/punch4.ogg'
	)
	attack_verb = list("punched")

/obj/item/natural_weapon/psi_monster/memory
	//Stupid snowflake damage

/obj/item/natural_weapon/psi_monster/memory/attack(obj/item/I, mob/living/user, params)
	force = rand(12,31)
	. = ..()

/obj/item/natural_weapon/psi_monster/flesh_behemoth
	hitsound = 'sound/xenomorph/alien_footstep_charge1.ogg'
	attack_verb = list("carved")

/obj/item/natural_weapon/psi_monster/mind_gazer
	attack_verb = list("rammed")

/obj/item/natural_weapon/psi_monster/cerebral_crusher
	hitsound = 'sound/xenomorph/alien_footstep_charge1.ogg'
	attack_verb = list("slammed")

/obj/item/natural_weapon/psi_monster/wasonce
	hitsound = 'sound/xenomorph/alien_footstep_charge1.ogg'
	attack_verb = list("delivered a crushing blow to")

/obj/item/natural_weapon/psi_monster/Dreaming
	name = "???"
	hitsound = 'sound/xenomorph/alien_footstep_charge1.ogg'
	attack_verb = list("delivered a devastating blow to")

/obj/item/natural_weapon/shell_hound
	name = "sharpened bone"
	attack_verb = list("carved")
	hitsound = 'sound/weapons/bigcut.ogg'

/obj/item/natural_weapon/daskvey_follower
	name = "deepblue blade"
	hitsound = 'sound/weapons/rapidslice.ogg'
	attack_verb = list("attacked", "slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	damtype = BURN
	sharp = TRUE
	edge = TRUE
	show_in_message = FALSE

/obj/item/natural_weapon/daskvey_follower/cleaver
	name = "solar eclipse"
	hitsound = 'sound/weapons/slice.ogg'


/obj/item/natural_weapon/daskvey_follower/gunner
	name = "\"Blue Moon\" psi-plasma rifle"
	hitsound = 'sound/weapons/blunthit.ogg'
	attack_verb = list("bashes", "butts", "thwacks")
	damtype = BRUTE
	sharp = FALSE
	edge = FALSE

/obj/item/natural_weapon/daskvey_follower/shielder
	name = "daskvey shield"
	hitsound = 'sound/weapons/blunthit.ogg'
	attack_verb = list("destablizes", "ruins", "wrecks")
	damtype = BRUTE


/obj/item/natural_weapon/daskvey_follower/halberd
	name = "daskvey halberd"
	hitsound = 'sound/weapons/slice.ogg'
	damtype = BRUTE

/obj/item/natural_weapon/daskvey_follower/weakling
	name = "daskvey fists"
	hitsound = list('sound/weapons/punch1.ogg','sound/weapons/punch2.ogg','sound/weapons/punch3.ogg','sound/weapons/punch4.ogg'
					)
	sharp = FALSE
	edge = FALSE

/obj/item/natural_weapon/daskvey_follower/weakling/attack(mob/living/M, mob/living/user, target_zone)
	var/daskvey = pick(BRUTE, BURN)
	switch(daskvey)
		if(BURN)
			damtype = daskvey
			heat = force
			sharp = FALSE
		if(BRUTE)
			damtype = daskvey
			heat = 0
			sharp = TRUE
	return ..()

/obj/item/natural_weapon/daskvey
	name = "Daskvey's toe-beans"
	attack_verb = list("mauled", "clawed", "slashed", "slammed", "rended", "cleaved", "skewered")
	hitsound = 'sound/weapons/renderslash.ogg'
	sharp = TRUE
	edge = TRUE
	show_in_message = FALSE
//*end Psi-Things

//////////

/*
#define TERMITE_DMG_LOW 15
#define TERMITE_DMG_MED 25
#define TERMITE_DMG_HIGH 40
#define TERMITE_DMG_ULTRA 55
*/
//TERMITE
/obj/item/natural_weapon/termite
	name = "mandibles"
	attack_verb = list("chomped")
	hitsound = 'sound/weapons/bite.ogg'
	// Very pain, much ouch. Limbs go REEEE
	sharp = TRUE
	edge = TRUE

//*end TERMITE

//////////

//ROBOTS
/obj/item/natural_weapon/drone
	name = "sharpened leg"
	gender = NEUTER
	attack_verb = list("hit", "pierced", "sliced", "attacked")
	hitsound = 'sound/weapons/slice.ogg' //So we dont make bite sounds
	damtype = BRUTE
	sharp = TRUE
	edge = FALSE
	show_in_message = FALSE

/obj/item/natural_weapon/mining_drill
	name = "diamond-point mining drill"
	attack_verb = list("hit", "pierced", "sliced", "attacked")
	hitsound = 'sound/weapons/sharphit.ogg'
	armor_penetration = ARMOR_PEN_EXTREME
	sharp = TRUE
	edge = FALSE

/obj/item/natural_weapon/mining_drill/similacrum //mining drone's big brother
	hitsound = 'sound/mecha/mechdrill.ogg'

// Let's... Not give a custodian sharp or edge.
/obj/item/natural_weapon/similacrum/custodian
	name = "bucket"
	force = 9
	show_in_message = FALSE

/obj/item/natural_weapon/drone/allied
	name = "Problem Be-Goner"
	hitsound = 'sound/weapons/sharphit.ogg'
	edge = TRUE

/obj/item/natural_weapon/similacrum/phazon
	name = "power fist"
	attack_verb = list("slammed")
	hitsound = 'sound/xenomorph/alien_footstep_charge1.ogg'
	force = 52.5

/obj/item/natural_weapon/roomba/knife
	name = "sharp knife"
	attack_verb = list("slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	hitsound = 'sound/weapons/sharphit.ogg'
	force = 14.5
	armor_penetration = ARMOR_PEN_SHALLOW
	sharp = TRUE
	edge = TRUE
	structure_damage_factor = STRUCTURE_DAMAGE_BLADE

/obj/item/natural_weapon/roomba/baton
	name = "telescopic baton"
	attack_verb = list("smacked", "struck", "slapped")
	hitsound = 'sound/effects/woodhit.ogg'
	force = 9.5
	structure_damage_factor = STRUCTURE_DAMAGE_BLUNT

//spanish inquisition
/obj/item/natural_weapon/church/bishop //Bonk them with the scorch
	name = "staff"
	gender = NEUTER
	attack_verb = list("slapped")
	hitsound = 'sound/effects/woodhit.ogg'
	armor_penetration = ARMOR_PEN_EXTREME
	damtype = BURN
	show_in_message = TRUE

/obj/item/natural_weapon/church/knight //uses the custodian shortsword. Inherits it's AP.
	name = "ulfberht"
	gender = NEUTER
	attack_verb = list("attacked", "slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	hitsound = 'sound/weapons/bladeslice.ogg'
	armor_penetration = ARMOR_PEN_DEEP
	sharp = TRUE
	edge = TRUE
	show_in_message = TRUE

/obj/item/natural_weapon/church/pawn //knights have shortsword, so pawn has axe. Inherits it's AP.
	name = "horseman axe"
	gender = NEUTER
	attack_verb = list("attacked", "slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	hitsound = 'sound/weapons/bladeslice.ogg'
	armor_penetration = ARMOR_PEN_EXTREME
	sharp = TRUE
	edge = TRUE
	show_in_message = TRUE

/obj/item/natural_weapon/church/rook
	name = "man hands"
	attack_verb = list("slammed")
	hitsound = list('sound/weapons/genhit1.ogg', 'sound/weapons/genhit2.ogg', 'sound/weapons/genhit3.ogg')
	sharp = FALSE
	edge = FALSE
	show_in_message = FALSE

/obj/item/natural_weapon/church/rook/apply_hit_effect(mob/living/target, mob/living/user, hit_zone, var/query = null, var/accelerant = 0)
	. = ..()
	//We don't trash the dead. First hit never crunches
	if(!(query == target))
		query = target
		accelerant = 0
	if(is_dead(target))
		accelerant = 0
	accelerant++
	if(prob(accelerant*5))
		if(accelerant >= 5)
			for(var/atom/movable/AM in target.loc)
				if(AM != src)
					AM.ex_act(accelerant/2)
			target.loc.ex_act(accelerant/5)
		target.fall_impact(0, accelerant)
		playsound(user, 'sound/xenomorph/alien_bite2.ogg',65,1)
		accelerant = 0
//*end ROBOTS

//////////

//ROACHEM
/obj/item/natural_weapon/bite //sharp teeth enjoy armor
	name = "teeth"
	attack_verb = list("bitten")
	hitsound = 'sound/weapons/bite.ogg'
	sharp = TRUE
//*end roachem

//////////

//Lodge a complaint
/obj/item/natural_weapon/beak
	name = "beak"
	gender = NEUTER
	attack_verb = list("pecked", "jabbed", "poked")
	sharp = TRUE
//*end lodge

//////////

//*HOOMINS
/obj/item/natural_weapon/punch
	name = "fists"
	hitsound = list(
	'sound/weapons/punch1.ogg','sound/weapons/punch2.ogg','sound/weapons/punch3.ogg','sound/weapons/punch4.ogg'
	)
	attack_verb = list("punched")

/obj/item/natural_weapon/punch/mushroom
	name = "big fists"
	attack_verb = list("slammed")
	hitsound = 'sound/weapons/bite.ogg'


/obj/item/natural_weapon/gunner
	name = "GUN.tm"
	hitsound = 'sound/weapons/blunthit.ogg'
	attack_verb = list("bashes", "butts", "thwacks")
	damtype = BRUTE
	sharp = FALSE
	edge = FALSE

/obj/item/natural_weapon/knife
	name = "KNIFE.tm"
	attack_verb = list("attacked", "slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	hitsound = 'sound/weapons/bladeslice.ogg'
	armor_penetration = ARMOR_PEN_EXTREME
	sharp = TRUE
	edge = TRUE

/obj/item/natural_weapon/shielder
	name = "SHIELD.tm"
	hitsound = 'sound/weapons/blunthit.ogg'
	attack_verb = list("destablizes", "ruins", "wrecks")

/obj/item/natural_weapon/welder
	name = "WELDER.tm"
	hitsound = 'sound/items/Welder.ogg'
	attack_verb = list("burnt", "scorched")
	damtype = BURN


///////////////////////////////////////////////////////////////////

/obj/item/natural_weapon/claws/weak
	force = 5
	attack_verb = list("clawed", "scratched")

/obj/item/natural_weapon/hooves
	name = "hooves"
	attack_verb = list("kicked")
	force = 5

/obj/item/natural_weapon/pincers
	name = "pincers"
	force = 5
	attack_verb = list("snipped", "pinched")


