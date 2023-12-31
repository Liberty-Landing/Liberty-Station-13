/obj/item/gun/projectile/revolver
	name = "Debug revolver"
	desc = "You shouldn't find this. Tell us if you do. Master-path of revolvers for testing purposes."			// This exists solely to set revolvers up to work with spinning, cylander, etc.
	icon = 'icons/obj/guns/projectile/ranger.dmi'
	icon_state = "ranger"
	item_state = "ranger"
	caliber = CAL_MAGNUM
	force = WEAPON_FORCE_NORMAL
	can_dual = TRUE
	origin_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 2)
	handle_casings = CYCLE_CASINGS
	max_shells = 7
	ammo_type = /obj/item/ammo_casing/magnum_40
	unload_sound = 'sound/weapons/guns/interact/rev_magout.ogg'
	reload_sound = 'sound/weapons/guns/interact/rev_magin.ogg'
	cocked_sound = 'sound/weapons/guns/interact/rev_cock.ogg'
	fire_sound = 'sound/weapons/guns/fire/revolver_fire.ogg'
	matter = list(MATERIAL_INDSTEEL = 15, MATERIAL_PLASTIC = 8)
	fire_delay = 3 //all revolvers can fire faster, but have huge recoil
	init_recoil = HANDGUN_RECOIL(1.2)
	var/drawChargeMeter = TRUE
	var/chamber_offset = 0 //how many empty chambers in the cylinder until you hit a round

//Style code - currently no use. Someday (tm)
/*/obj/item/gun/projectile/revolver/pickup(mob/user)
	. = ..()
	if(ishuman(user))
		var/mob/living/carbon/human/stylish = user
		if(stylish.style > 4)
			style_damage_multiplier = stylish.style / 4 // this is so two stylish users that both shoot each other once at full slickness
			to_chat(user, SPAN_NOTICE("You feel more confident with a revolver in your hand.")) // ends with the more stylish being the winner, commonly known as High Noon
		else
			style_damage_multiplier = 1
			to_chat(user, SPAN_WARNING("You don't feel stylish enough to use a revolver properly."))
*/

/obj/item/gun/projectile/revolver/verb/spin_cylinder()
	set name = "Spin revolver"
	set desc = "Fun when you're bored out of your skull."
	set category = "Object"

	chamber_offset = 0
	visible_message(SPAN_WARNING("\The [usr] spins \the [src]!"), \
	SPAN_NOTICE("You hear something metallic spin and click."))
	playsound(src.loc, 'sound/weapons/revolver_spin.ogg', 100, 1)
	loaded = shuffle(loaded)
	if(rand(1,max_shells) > loaded.len)
		chamber_offset = rand(0,max_shells - loaded.len)
	icon_state = "[icon_state]_spin"
	spawn(10)
		icon_state = "[initial(icon_state)]"

/obj/item/gun/projectile/revolver/consume_next_projectile()
	if(chamber_offset)
		chamber_offset--
		return
	return ..()

/obj/item/gun/projectile/revolver/load_ammo(var/obj/item/A, mob/user)
	chamber_offset = 0
	return ..()

/obj/item/gun/projectile/revolver/proc/update_charge()
	if(!drawChargeMeter)
		return
	cut_overlays()
	if(loaded.len==0)
		add_overlay("[icon_state]_off")
	else
		add_overlay("[icon_state]_on")

/obj/item/gun/projectile/revolver/Initialize()
	. = ..()
	update_icon()
