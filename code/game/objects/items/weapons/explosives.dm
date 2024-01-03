// Items required to craft certain explosives, for Terra Therma.

/obj/item/wp_block
	name = "white phosphorus block"
	desc = "A block of stable, oxidized white phosphorus. A staple in the manufacture of incendiary amunition and grenades."
	icon = 'icons/obj/stack/material.dmi'
	icon_state = "white_p_block"
	force = WEAPON_FORCE_HARMLESS
	w_class = ITEM_SIZE_SMALL
	price_tag = 400
	matter = list(MATERIAL_BIOMATTER = 20)
	preloaded_reagents = list("phosphorus"=40)

/obj/item/rdx_block
	name = "stick of hexogen"
	desc = "A malleable block of clay-like consistency, generally used in the making of explosives like C4. \
			Safe to store at room temperature and safer for transfer, it is resistant to even small arms fire \
			and requires a proper detonator to explode. It, however, should still be handled with care."
	icon = 'icons/obj/stack/material.dmi'
	icon_state = "rdx_block"
	w_class = ITEM_SIZE_SMALL
	force = WEAPON_FORCE_HARMLESS
	price_tag = 400
	matter = list(MATERIAL_BIOMATTER = 20)
	preloaded_reagents = list("ethanol" = 10, "microplastic" = 5, "water" = 1)

// Start of C-4 code.

/obj/item/plastique
	name = "plastic explosive"
	desc = "A breaching charge of C-4 composition explosive, shaped to contain the explosive force towards a desired point of entry."
	gender = PLURAL
	icon = 'icons/obj/assemblies.dmi'
	icon_state = "plastic-explosive0"
	item_state = "plasticx"
	flags = NOBLUDGEON
	w_class = ITEM_SIZE_SMALL
	origin_tech = list(TECH_ILLEGAL = 2)
	var/datum/wires/explosive/c4/wires = null
	var/timer = 10
	var/atom/target = null
	var/open_panel = FALSE
	var/image_overlay = null

/obj/item/plastique/New()
	wires = new(src)
	image_overlay = image('icons/obj/assemblies.dmi', "plastic-explosive2")
	..()

/obj/item/plastique/Destroy()
	qdel(wires)
	wires = null
	return ..()

/obj/item/plastique/attackby(obj/item/I, mob/user)
	if(QUALITY_SCREW_DRIVING in I.tool_qualities)
		if(I.use_tool(user, src, WORKTIME_FAST, QUALITY_SCREW_DRIVING, FAILCHANCE_EASY, required_stat = STAT_MEC))
			open_panel = !open_panel
			to_chat(user, "<span class='notice'>You [open_panel ? "close" : "open"] the wire panel.</span>")
	else if(istype(I, /obj/item/tool))
		wires.Interact(user)
	else
		..()

/obj/item/plastique/attack_self(mob/user as mob)
	var/newtime = input(usr, "Please set the timer.", "Timer", 10) as num
	if(user.get_active_hand() == src)
		newtime = CLAMP(newtime, 2, 60000)
		timer = newtime
		to_chat(user, "Timer set for [timer] seconds.")

/obj/item/plastique/afterattack(atom/movable/target, mob/user, flag)
	if (!flag)
		return
	if (ismob(target) || istype(target, /turf/unsimulated) || istype(target, /turf/simulated/shuttle) || istype(target, /obj/item/storage/) || istype(target, /obj/item/clothing/under))
		return
	to_chat(user, "Planting the explosive charge...")
	user.do_attack_animation(target)

	if(do_after(user, 2 SECONDS, target) && in_range(user, target))
		user.drop_item()
		src.target = target
		loc = null

		if (ismob(target))
			add_logs(user, target, "planted [name] on")
			user.visible_message(SPAN_DANGER("[user.name] finished planting the explosive on [target.name]!"))
			message_admins("[key_name(user, user.client)](<A HREF='?_src_=holder;adminmoreinfo=\ref[user]'>?</A>) planted [src.name] on [key_name(target)](<A HREF='?_src_=holder;adminmoreinfo=\ref[target]'>?</A>) with [timer] second fuse",0,1)
			log_game("[key_name(user)] planted [src.name] on [key_name(target)] with [timer] second fuse")

		else
			message_admins("[key_name(user, user.client)](<A HREF='?_src_=holder;adminmoreinfo=\ref[user]'>?</A>) planted [src.name] on [target.name] at ([target.x],[target.y],[target.z] - <A HREF='?_src_=holder;adminplayerobservecoodjump=1;X=[target.x];Y=[target.y];Z=[target.z]'>JMP</a>) with [timer] second fuse",0,1)
			log_game("[key_name(user)] planted [src.name] on [target.name] at ([target.x],[target.y],[target.z]) with [timer] second fuse")

		target.add_overlay(image_overlay)
		to_chat(user, "Bomb has been planted. Timer is counting down from [timer] seconds.")
		spawn(timer*10)
			explode(get_turf(target))

/obj/item/plastique/proc/explode(var/location)
	if(!target)
		target = get_atom_on_turf(src)
	if(!target)
		target = src
	if(location)
		explosion(location, 0, 0, 2, 3)

	if(target)
		if (istype(target, /turf/simulated/wall))
			var/turf/simulated/wall/W = target
			W.dismantle_wall(no_product = TRUE)
		else if(isliving(target))
			target.ex_act(2) // c4 can't gib mobs anymore.
		else
			target.ex_act(1)

	//Girders are a pain, just delete em
	//for (var/obj/structure/girder/G in loc)
	//	qdel(G)

	if(target)
		target.cut_overlay(image_overlay)
	qdel(src)

/obj/item/plastique/attack(mob/M as mob, mob/user as mob, def_zone)
	return // No slapping C4 on other people

