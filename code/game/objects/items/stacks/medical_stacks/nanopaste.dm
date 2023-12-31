/obj/item/stack/nanopaste
	name = "nanopaste"
	singular_name = "nanite swarm"
	desc = "A tube of paste containing swarms of repair nanites. Very effective in repairing mechanical bodyparts, organs, and smart purging of toxic buildup."
	icon = 'icons/obj/stack/items.dmi'
	icon_state = "nanopaste"
	matter = list(MATERIAL_PLASTIC = 1, MATERIAL_INDSTEEL = 0.2, MATERIAL_ALUMINIUM = 1)
	preloaded_reagents = list("nanites" = 1)
	origin_tech = list(TECH_MATERIAL = 4, TECH_ENGINEERING = 3)
	amount = 5
	consumable = FALSE
	splittable = FALSE // With this it becomes the same as an ATK
	w_class = ITEM_SIZE_SMALL //just so you can place same places that a brute pack would be
	price_tag = 80

/obj/item/stack/nanopaste/Initialize()
	. = ..()
	update_icon()

/obj/item/stack/nanopaste/attack(mob/living/M as mob, mob/user as mob)
	if(..())
		return 1
	if (!istype(M) || !istype(user))
		return 0
	if (isrobot(M))	//Repairing cyborgs
		var/mob/living/silicon/robot/R = M
		if (R.getBruteLoss() || R.getFireLoss() )
			user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
			R.adjustBruteLoss(-15)
			R.adjustFireLoss(-15)
			R.updatehealth()
			use(1)
			user.visible_message(SPAN_NOTICE("\The [user] applied some [src] at [R]'s damaged areas."),\
				SPAN_NOTICE("You apply some [src] at [R]'s damaged areas."))
			update_icon()
		else
			to_chat(user, SPAN_NOTICE("All [R]'s systems are nominal."))

	if (ishuman(M))		//Repairing robolimbs
		var/mob/living/carbon/human/H = M
		var/obj/item/organ/external/S = H.get_organ(user.targeted_organ)

		if(S && S.open == 1)
			if(BP_IS_ROBOTIC(S))
				if(S.get_damage())
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					S.heal_damage(15, 15, TRUE)
					H.updatehealth()
					use(1)
					user.visible_message(
						"<span class='notice'>\The [user] applies some nanite paste at[user != M ? " \the [M]'s" : " \the"][S.name] with \the [src].</span>",
						"<span class='notice'>You apply some nanite paste at [user == M ? "your" : "[M]'s"] [S.name].</span>"
					)
					update_icon()
				else
					to_chat(user, SPAN_NOTICE("Nothing to fix here."))
		else
			if (can_operate(H, user))        //Checks if mob is lying down on table for surgery
				if (do_surgery(H,user,src))
					update_icon()
					return
			else
				to_chat(user, SPAN_NOTICE("Nothing to fix in here.")) //back to the original

/obj/item/stack/nanopaste/update_icon()
	icon_state = "nanopaste_[amount]"
	..()
