/obj/item/gunbox/heirloom
	name = "\improper Noble Bundle"
	desc = "A secure box containing a heirloom."
	icon = 'icons/obj/storage.dmi'
	icon_state = "heirloom"

/obj/item/gunbox/heirloom/attack_self(mob/living/user)
	..()
	var/stamped
	if(!stamped)
		stamped = TRUE
		var/list/options = list()
		options["Lighter"] = list(/obj/item/oddity/common/lighter)
		options["Odd Device"] = list(/obj/item/oddity/common/device)
		options["Documents"] = list(/obj/item/oddity/common/paper_bundle)
		options["Knife"] = list(/obj/item/oddity/common/old_knife)
		options["Teddy Bear"] = list(/obj/item/oddity/common/teddy)
		var/choice = input(user,"What type of equipment?") as null|anything in options
		if(src && choice)
			var/list/things_to_spawn = options[choice]
			for(var/new_type in things_to_spawn)
				var/atom/movable/AM = new new_type(get_turf(src))
				if(istype(AM, /obj/item/oddity/common/))
					to_chat(user, "You have chosen \the [AM].")
			qdel(src)
		else
			stamped = FALSE
