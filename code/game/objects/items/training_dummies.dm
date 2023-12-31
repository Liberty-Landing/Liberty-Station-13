/********************/
/* TRAINING DUMMIES */
/********************/

// These are items that need to be used in-hand to be emplaced on the ground
// becoming some sort of melee practicing dummy with seemingly unlimited health

// First is the item path. We use this in hand to deploy the actual structure we'll be punching.
/obj/item/training_dummy
	name = "deployable training dummy"
	desc = "Meant to be emplaced on the floor to use for martial practice."
	icon = 'icons/obj/trainingdummies.dmi'
	icon_state = "dummy_item"
	w_class = ITEM_SIZE_HUGE // Not putting this on backpacks, need both hands to carry, big and bulky.
	matter = list(MATERIAL_WOOD = 20)
	var/deployed_state = /obj/structure/training_dummy // The modular kind of dummy we'll deploy when used in-hand

/obj/item/training_dummy/examine(mob/user)
	..()
	to_chat(user, "<span class='info'>Use in-hand to plant it on the ground for use.</span>")

/obj/item/training_dummy/proc/emplace(var/mob/user)
	var/turf/T = get_turf(src)  // So that this cannot be deployed in space tiles.
	if(istype(T))
		// This effectively resets structure health because it spawns a new one.
		var/obj/structure/training_dummy/TD = new deployed_state(user.loc)
		usr.visible_message(SPAN_WARNING("[usr] has emplaced \the [src] to the ground."), SPAN_WARNING("You place \the [src] firmly on the ground."))
		TD.add_fingerprint(user)
		qdel(src)

/obj/item/training_dummy/attack_self(mob/user)
	emplace(user)

// Variations, for flavor mostly.
/obj/item/training_dummy/wingchun
	name = "deployable wooden dummy"
	desc = "Meant to be emplaced on the floor. Looks like a trunk with a lot of sticks poking out."
	icon_state = "dummy_wingchun_item"
	deployed_state = /obj/structure/training_dummy/wingchun

/obj/item/training_dummy/cultist
	desc = "Meant to be emplaced on the floor to use for martial practice. This one looks armored."
	icon_state = "dummy_cult_item"
	matter = list(MATERIAL_WOOD = 20, MATERIAL_ALUMINIUM = 10)
	deployed_state = /obj/structure/training_dummy/cultist


/obj/item/training_dummy/merc
	desc = "Meant to be emplaced on the floor to use for martial practice. This one looks armored."
	icon_state = "dummy_merc_item"
	matter = list(MATERIAL_WOOD = 20, MATERIAL_ALUMINIUM = 10)
	deployed_state = /obj/structure/training_dummy/merc

// Structure training dummies
// These are the ones we will punch or attack to gain melee proficiency and stats through a task.

/obj/structure/training_dummy
	name = "training dummy"
	desc = "A target dummy emplaced on the ground, meant to be used to practice martial proficiency with melee weapons."
	icon = 'icons/obj/trainingdummies.dmi'
	icon_state = "dummy_wood"
	matter = list(MATERIAL_WOOD = 20)
	density = TRUE
	anchored = TRUE // Ain't moving from the spot it's placed on.
	maxHealth = 1000 // Supposedly immortal with how much punishment we're gonna give it, but high enough so that bullets can destroy it
	health = 1000
	var/dummy_sound = 'sound/weapons/wood_hit.ogg' // The sound we do when hit, change this for armored ones.
	var/item_form = /obj/item/training_dummy // The modular transportable item we'll retrieve for reposition or stashing out

/obj/structure/training_dummy/examine(mob/user)
	..()
	to_chat(user, "<span class='info'>\The [src] can be taken down by clicking on it while holding Ctrl + Shift. Repair with a welding tool regularly to prevent them from being destroyed.</span>")

/obj/structure/training_dummy/proc/take_damage(amount)
	health -= amount
	if(health <= 0)
		visible_message(SPAN_WARNING("\The [src] breaks down!"))
		playsound(get_turf(src), 'sound/weapons/shield/shielddestroy.ogg', 85, 1)
		drop_materials(drop_location())
		qdel(src)

// Sanity option, so that people don't go using these as bullet stopping juggernauts.
/obj/structure/training_dummy/bullet_act(var/obj/item/projectile/Proj)
	var/damage = Proj.get_structure_damage() * 2 // It's never gonna break unless we bump this number.
	if(!(Proj.testing))
		take_damage(damage)
	return PROJECTILE_CONTINUE // It goes through the dummy as much as it does with targets. Prevents using them as bullet stoppers.

/obj/structure/training_dummy/verb/take_down()
	set src in oview(1)
	set category = "Object"
	set name = "Uproot"

	if(usr.stat || usr.restrained() || (!in_range(src, usr)))
		return

	usr.visible_message(SPAN_NOTICE("[usr] firmly grasps \the [src], attempting to pull it from the ground..."), SPAN_WARNING("You get a firm grab on \the [src] from the ground."))

	if(do_after(usr, 30, src) && usr.Adjacent(src))
		usr.visible_message(SPAN_WARNING("[usr] has uprooted \the [src] from the ground."), SPAN_WARNING("You uproot \the [src] from the ground."))
		var/obj/item/training_dummy/TD = new item_form(get_turf(src))
		TD.add_fingerprint(usr) // DETECTABLE CRIME!!!!
		qdel(src)

// Ease of access to the verb for quick taking down.
/obj/structure/training_dummy/CtrlShiftClick(mob/user, params)
	take_down()

// Much of this code is adapted from unarmed actions on human_attackhand.dm
// This is done on parent so that you can still do unarmed against every single one
/obj/structure/training_dummy/attack_hand(mob/living/carbon/human/user as mob)
	var/obj/item/organ/external/temp = user.organs_by_name[BP_R_ARM]
	if(user.hand)
		temp = user.organs_by_name[BP_L_ARM]
	if(temp && !temp.is_usable())
		to_chat(user, SPAN_WARNING("You can't use your [temp.name]"))
		return
	if(user.a_intent == I_HURT && user.Adjacent(src))
		var/hit_zone = user.targeted_organ
		var/datum/unarmed_attack/attack = user.get_unarmed_attack(src, hit_zone)
		if(prob(40 + user.stats.getStat(STAT_ROB))) // Yes we can totally fail an attack on a stationary dummy. Balance purposes too.
				// UNARMED ATTACK DAMAGE CALCULATION START //
			var/stat_damage = 3
			if (user.stats.getStat(STAT_ROB) >= 80)
				var/softcap = user.stats.getStat(STAT_ROB) / 10
				var/newrob = (72 + softcap) / 10
				stat_damage = 3 + max(0, newrob)
			else
				stat_damage = 3 + max(0, (user.stats.getStat(STAT_ROB) / 10))
			var/real_damage = stat_damage
			real_damage += attack.get_unarmed_damage(user)
			real_damage *= user.damage_multiplier
			real_damage += user.punch_damage_increase
			stat_damage *= user.damage_multiplier
			if(HULK in user.mutations)
				real_damage *= 2
				stat_damage *= 2
			real_damage = rand(1, real_damage) // Randomizing so that it doesn't break as easily
				// UNARMED ATTACK DAMAGE CALCULATION END //
			user.do_attack_animation(src)
			playsound(src, dummy_sound, 85, 1)
			user.visible_message(SPAN_NOTICE("[user] has [pick("punched", "kicked")] \the [src]!"), SPAN_NOTICE("You landed \a [pick("punch", "kick")] on \the [src]."), "You hear bashing.")
			if(user && user.stats)
				user.learnt_tasks.attempt_add_task_mastery(/datum/task_master/task/martial_prowess, "MARTIAL_ARTS", skill_gained = 1, learner = user)
			take_damage(real_damage)
			user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN + 2) // Empty hands move faster
		else
			user.visible_message(SPAN_NOTICE("[user] has whiffed their blow on \the [src]."), SPAN_NOTICE("You whiffed your hit on \the [src]. Focus and try again."), "You hear the wind being cut.")
			playsound(src, 'sound/weapons/punchmiss.ogg', 50, 1) // Morrowind melee moment
			user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN * 1.5) // Slower to recover from a miss.
			return
	return

/obj/structure/training_dummy/attackby(obj/item/I as obj, mob/living/user as mob)
	if(!user.a_intent == I_HELP && user.Adjacent(src)) // Makes disarm intent practice with practice weapons possible.
		if(!I.force <= WEAPON_FORCE_NORMAL || !(I.flags & NOBLUDGEON)) // Prevents using stupid things to train with it
			if(prob(40 + user.stats.getStat(STAT_ROB))) // Yes we can totally fail an attack on a stationary dummy. Balance purposes too.
				user.do_attack_animation(src)
				var/damage = rand(1, I.force * I.structure_damage_factor) // Making it semi-impossible to break
				playsound(src, dummy_sound, 60, 1) // Prevents sounds that have blood splashes, etc
				user.visible_message(SPAN_NOTICE("[user] has landed a blow on \the [src] with [I]!"), SPAN_NOTICE("You landed a blow on \the [src] with [I]."), "You hear bashing.")
				if(user && user.stats) // Sanity. Prevents statless mobs from runtiming when adding the task for stats.
					user.learnt_tasks.attempt_add_task_mastery(/datum/task_master/task/martial_prowess, "MARTIAL_ARTS", skill_gained = 1, learner = user)
				take_damage(damage)
				user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN * 1.5) // Prevents spam and learning the task too fast
			else // Keep trying. You'll hit it, eventually.
				user.visible_message(SPAN_NOTICE("[user] has whiffed their blow on \the [src]."), SPAN_NOTICE("You whiffed your hit on \the [src]. Focus and try again."), "You hear the wind being cut.")
				playsound(src, 'sound/weapons/punchmiss.ogg', 50, 1) // Morrowind melee moment
				user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN * 1.5)
				return
	else if(user.a_intent == I_HELP && user.Adjacent(src))
		if(QUALITY_WELDING in I.tool_qualities)
			if(health >= maxHealth)
				to_chat(user, SPAN_NOTICE("Nothing to fix!"))
				return
			if(I.use_tool(user, src, WORKTIME_NORMAL, QUALITY_WELDING, FAILCHANCE_VERY_EASY, required_stat = STAT_MEC))
				to_chat(user, SPAN_NOTICE("You fix the damage done to the training dummy."))
				health = maxHealth
				return

// Dummy variant structures
/obj/structure/training_dummy/cultist
	desc = "A target dummy emplaced on the ground, meant to be used to practice martial proficiency with melee weapons. \
			This one looks like a worshipper of some obscure intergalactic religion or something."
	icon_state = "dummy_cult"
	maxHealth = 1200 // Sturdier because it's plated with metal
	health = 1200
	matter = list(MATERIAL_WOOD = 20, MATERIAL_ALUMINIUM = 10)
	item_form = /obj/item/training_dummy/cultist
	dummy_sound = 'sound/weapons/sword_clash.ogg'

/obj/structure/training_dummy/merc
	desc = "A target dummy emplaced on the ground, meant to be used to practice martial proficiency with melee weapons. \
			This one bears a fake, painted over mercenary armor over it."
	icon_state = "dummy_mercenary"
	maxHealth = 1200 // Sturdier because it's plated with metal
	health = 1200
	matter = list(MATERIAL_WOOD = 20, MATERIAL_ALUMINIUM = 10)
	item_form = /obj/item/training_dummy/merc
	dummy_sound = 'sound/weapons/sword_clash.ogg'

// Snowflake unarmed training exclusive variant below

/obj/structure/training_dummy/wingchun
	name = "\proper Wing Chung training dummy"
	desc = "A strange wooden block with proturding sticks to act as arms. Used exclusively in unarmed training."
	icon_state = "dummy_wingchun"
	item_form = /obj/item/training_dummy/wingchun

// Do nothing unless we're attacked by unarmed people (or bullets)
/obj/structure/training_dummy/wingchun/attackby(obj/item/I as obj, mob/living/user as mob)
	// At least make it able to be fixed!
	if(user.a_intent == I_HELP && user.Adjacent(src))
		if(QUALITY_WELDING in I.tool_qualities)
			if(health >= maxHealth)
				to_chat(user, SPAN_NOTICE("Nothing to fix!"))
				return
			if(I.use_tool(user, src, WORKTIME_NORMAL, QUALITY_WELDING, FAILCHANCE_VERY_EASY, required_stat = STAT_MEC))
				to_chat(user, SPAN_NOTICE("You fix the damage done to the training dummy."))
				health = maxHealth
				return
	else
		to_chat(user, SPAN_WARNING("This training dummy is for unarmed combat only. It would be dishonorable to hit it with something other than your limbs."))
		return
