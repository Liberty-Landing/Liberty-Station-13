/obj/machinery/power/sentinel
	name = "sentinel"
	desc = "A towering behemoth sculpted by the Custodians, when filled with biosilk as fuel, it lashes out at nearby foes."
	icon = 'icons/obj/64_custodian.dmi'
	icon_state = "sentinel"

	density = TRUE
	anchored = TRUE
	layer = ABOVE_MOB_LAYER

	use_power = IDLE_POWER_USE
	idle_power_usage = 30
	active_power_usage = 300

	var/active = TRUE //Were always active

	var/area_radius = 7
	var/damage = 120
	var/max_targets = 3

	var/biomatter_ammo = 10 //We attack 10 times before running out on map spawn
	var/biomatter_use_per_shot = 1 //Modular way of making it so admins can tweak this mid round

/obj/machinery/power/sentinel/New()
	update_icon()
	..()

/obj/machinery/power/sentinel/update_icon()
	if(biomatter_ammo)
		icon_state = initial(icon_state) + "_activate"
	else
		icon_state = initial(icon_state)

/obj/machinery/power/sentinel/attack_hand(mob/user)
	return

/obj/machinery/power/sentinel/examine(mob/user)
	..()
	to_chat(user, "<span class='info'>Level of stored biosilk: [biomatter_ammo]</span>")

/obj/machinery/power/sentinel/attackby(obj/item/I, mob/user as mob)
	if (istype(I, /obj/item/stack/material/biopolymer_silk))
		var/obj/item/stack/material/biopolymer_silk/B = I
		if (B.amount)
			var/sheets_amount_to_transphere = input(user, "How many spindles you want to load?", "Sentinel fueling", 1) as num
			if (sheets_amount_to_transphere > B.amount ) //No cheating!
				to_chat(user, SPAN_WARNING("You don't have that many [B.name]"))
				return
			if(sheets_amount_to_transphere)
				B.use(sheets_amount_to_transphere)
				biomatter_ammo += sheets_amount_to_transphere
				user.visible_message(
									"[user.name] inserts \the [B.name]'s sheets in \the [name].",
									"You inserted \the [B.name] in \the [name]. \
									After that you see how the counter on \the [name] is incremented by [sheets_amount_to_transphere]."
									)
				update_icon()
				ping()
			else
				to_chat(user, SPAN_WARNING("You can't insert [sheets_amount_to_transphere] in \the [name]."))
			return

/obj/machinery/power/sentinel/Process()
	..()
	if(stat)
		return
	var/list/affected = hearers(area_radius, src)
	if(!active)
		use_power = IDLE_POWER_USE
		return
	else
		use_power = 2

		var/to_fire = max_targets
		for(var/mob/living/carbon/superior_animal/superior_mob in affected)
			var/mob/living/carbon/superior_animal/animal = superior_mob
			if(animal.stat != DEAD &! animal.colony_friend && biomatter_ammo >= biomatter_use_per_shot) //got roach, spider, xenos, but not colony pets
				animal.take_overall_damage(damage)
				biomatter_ammo -= biomatter_use_per_shot
				update_icon()
				if(!--to_fire)
					return
		for(var/mob/living/simple_animal/hostile/simple_h in affected)
			var/mob/living/simple_animal/hostile/animal = simple_h
			if(animal.stat != DEAD &! animal.colony_friend && biomatter_ammo >= biomatter_use_per_shot) //got misc things like tango, voild wolfs but not colony pets
				animal.take_overall_damage(damage)
				biomatter_ammo -= biomatter_use_per_shot
				update_icon()
				if(!--to_fire)
					return

