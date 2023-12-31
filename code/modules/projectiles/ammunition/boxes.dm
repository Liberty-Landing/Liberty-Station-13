/*This code for boxes with ammo, you cant use them as magazines, but should be able to fill magazines with them.*/
/obj/item/ammo_magazine/ammobox	//Should not be used by its own
	name = "ammunition box"
	desc = "Gun ammunition stored in a shiny new box. You can see caliber information on the label."
	mag_type = SPEEDLOADER	//To prevent load in magazine filled guns
	icon = 'icons/obj/ammo.dmi'
	multiple_sprites = 1
	reload_delay = 30
	ammo_mag = "box"

/obj/item/ammo_magazine/ammobox/resolve_attackby(atom/A, mob/user)
	if(isturf(A) && locate(/obj/item/ammo_casing) in A || istype(A, /obj/item/ammo_casing))
		if(!do_after(user, src.reload_delay, src))
			to_chat(user, SPAN_WARNING("You stoped scooping ammo into [src]."))
			return
		if(collectAmmo(get_turf(A), user))
			return TRUE
	..()

/obj/item/ammo_magazine/ammobox/proc/collectAmmo(var/turf/target, var/mob/user)
	ASSERT(istype(target))
	. = FALSE
	for(var/obj/item/ammo_casing/I in target)
		if(stored_ammo.len >= max_ammo)
			break
		if(I.caliber == src.caliber)
			for(var/j = 1 to I.amount)
				if(stored_ammo.len >= max_ammo)
					break
				. |= TRUE
				insertCasing(I)
	if(user)
		if(.)
			user.visible_message(SPAN_NOTICE("[user] scoopes some ammo in [src]."),SPAN_NOTICE("You scoop some ammo in [src]."),SPAN_NOTICE("You hear metal clanging."))
		else
			to_chat(user, SPAN_NOTICE("You fail to pick anything up with \the [src]."))
	update_icon()

//// 9mm ////

/obj/item/ammo_magazine/ammobox/pistol_35
	name = "ammunition packet (9mm)"
	icon_state = "pistol"
	matter = list(MATERIAL_CARDBOARD = 1)
	caliber = CAL_PISTOL
	ammo_type = /obj/item/ammo_casing/pistol_35
	max_ammo = 30

/obj/item/ammo_magazine/ammobox/pistol_35/scrap
	name = "ammunition packet (old 9mm)"
	icon_state = "pistol_s"
	ammo_type = /obj/item/ammo_casing/pistol_35/scrap

/obj/item/ammo_magazine/ammobox/pistol_35/practice
	name = "ammunition packet (9mm practice)"
	icon_state = "pistol_p"
	ammo_type = /obj/item/ammo_casing/pistol_35/practice

/obj/item/ammo_magazine/ammobox/pistol_35/hv
	name = "ammunition packet (9mm high-velocity)"
	icon_state = "pistol_hv"
	ammo_type = /obj/item/ammo_casing/pistol_35/hv

/obj/item/ammo_magazine/ammobox/pistol_35/rubber
	name = "ammunition packet (9mm rubber)"
	icon_state = "pistol_r"
	ammo_type = /obj/item/ammo_casing/pistol_35/rubber

/obj/item/ammo_magazine/ammobox/pistol_35/rubber/pepperball
	name = "ammunition packet (9mm pepperball)"
	desc = "A box of police grade 9mm pepperball type rounds; complete with CO2 cartriage casings."
	icon_state = "pistol_pepper"
	ammo_type = /obj/item/ammo_casing/pistol_35/rubber/pepperball

/obj/item/ammo_magazine/ammobox/pistol_35/lethal
	name = "ammunition packet (9mm hollow-point)"
	desc = "A box of self-defense grade 9mm hollow-points."
	icon_state = "pistol_l"
	ammo_type = /obj/item/ammo_casing/pistol_35/lethal

/obj/item/ammo_magazine/ammobox/pistol_35/laser
	name = "ammunition packet (9mm laser)"
	icon_state = "pistol_si"
	ammo_type = /obj/item/ammo_casing/pistol_35/laser

/obj/item/ammo_magazine/ammobox/pistol_35/biomatter
	name = "ammunition packet (9mm Caustic)"
	desc = "A box of caustic caseless 9mm."
	icon_state = "pistol_bio"
	ammo_type = /obj/item/ammo_casing/pistol_35/biomatter

// 9mm BIG BAWKS
/obj/item/ammo_magazine/ammobox/pistol_35/large
	name = "ammunition box (9mm)"
	desc = "A large box of police grade 9mm."
	matter = list(MATERIAL_ALUMINIUM = 15)
	w_class = ITEM_SIZE_BULKY
	max_ammo = 200
	icon_state = "pistol_large"

/obj/item/ammo_magazine/ammobox/pistol_35/large/lethal
	name = "ammunition box (9mm hollow-point)"
	desc = "A large box of self defense grade 9mm hollow-point rounds."
	ammo_type = /obj/item/ammo_casing/pistol_35/lethal
	icon_state = "pistol_large_hp"

/obj/item/ammo_magazine/ammobox/pistol_35/large/rubber
	name = "ammunition box (9mm rubber)"
	desc = "A large box of police grade 9mm rubber rounds."
	ammo_type = /obj/item/ammo_casing/pistol_35/rubber
	icon_state = "pistol_large_rubber"

/obj/item/ammo_magazine/ammobox/pistol_35/large/hv
	name = "ammunition box (9mm high-velocity)"
	desc = "A large box of high velocity 9mm rounds"
	ammo_type = /obj/item/ammo_casing/pistol_35/hv
	icon_state = "pistol_large_hv"

//// 10mm ////

/obj/item/ammo_magazine/ammobox/magnum_40
	name = "ammunition packet (10mm Magnum)"
	icon_state = "magnum"
	matter = list(MATERIAL_CARDBOARD = 1)
	caliber = CAL_MAGNUM
	ammo_type = /obj/item/ammo_casing/magnum_40
	max_ammo = 30

/obj/item/ammo_magazine/ammobox/magnum_40/scrap
	name = "ammunition packet (old 10mm Magnum)"
	icon_state = "magnum_s"
	ammo_type = /obj/item/ammo_casing/magnum_40/scrap

/obj/item/ammo_magazine/ammobox/magnum_40/practice
	name = "ammunition packet (10mm Magnum practice)"
	icon_state = "magnum_p"
	ammo_type = /obj/item/ammo_casing/magnum_40/practice

/obj/item/ammo_magazine/ammobox/magnum_40/hv
	name = "ammunition packet (10mm Magnum high-velocity)"
	icon_state = "magnum_hv"
	ammo_type = /obj/item/ammo_casing/magnum_40/hv

/obj/item/ammo_magazine/ammobox/magnum_40/rubber
	name = "ammunition packet (10mm Magnum rubber)"
	icon_state = "magnum_r"
	ammo_type = /obj/item/ammo_casing/magnum_40/rubber

/obj/item/ammo_magazine/ammobox/magnum_40/rubber/pepperball
	name = "ammunition packet (10mm Magnum pepperball)"
	desc = "A box of police grade 10mm pepperball type rounds; complete with CO2 cartraiges."
	icon_state = "magnum_pepper"
	ammo_type = /obj/item/ammo_casing/magnum_40/rubber/pepperball

/obj/item/ammo_magazine/ammobox/magnum_40/lethal
	name = "ammunition packet (10mm Magnum hollow-point)"
	desc = "A box of self-defense grade 10mm Auto-Mag hollow-points."
	icon_state = "magnum_l"
	ammo_type = /obj/item/ammo_casing/magnum_40/lethal

/obj/item/ammo_magazine/ammobox/magnum_40/laser
	name = "ammunition packet (10mm Magnum Laser)"
	icon_state = "magnum_si"
	ammo_type = /obj/item/ammo_casing/magnum_40/laser

/obj/item/ammo_magazine/ammobox/magnum_40/biomatter
	name = "ammunition packet (10mm Magnum Caustic)"
	desc = "A box of caustic caseless 10mm Magnum."
	icon_state = "magnum_bio"
	ammo_type = /obj/item/ammo_casing/magnum_40/biomatter

//10mm big boxes
/obj/item/ammo_magazine/ammobox/magnum_40/large
	name = "ammunition box (10mm Magnum)"
	icon_state = "magbox"
	matter = list(MATERIAL_ALUMINIUM = 15)
	w_class = ITEM_SIZE_BULKY
	caliber = CAL_MAGNUM
	ammo_type = /obj/item/ammo_casing/magnum_40
	max_ammo = 150

/obj/item/ammo_magazine/ammobox/magnum_40/large/lethal
	name = "ammunition box (10mm Magnum hollow-point)"
	icon_state = "magboxhp"
	ammo_type = /obj/item/ammo_casing/magnum_40/lethal

/obj/item/ammo_magazine/ammobox/magnum_40/large/rubber
	name = "ammunition box (10mm Magnum rubber)"
	icon_state = "magboxrubber"
	ammo_type = /obj/item/ammo_casing/magnum_40/rubber

/obj/item/ammo_magazine/ammobox/magnum_40/large/hv
	name = "ammunition box (10mm Magnum high-velocity)"
	icon_state = "magboxhv"
	ammo_type = /obj/item/ammo_casing/magnum_40/hv


//// 6.5 carbine ////

/obj/item/ammo_magazine/ammobox/light_rifle_257
	name = "ammunition box (6.5mm Carbine FMJ)"
	icon_state = "box_lrifle"
	matter = list(MATERIAL_ALUMINIUM = 10)
	w_class = ITEM_SIZE_BULKY
	mag_type = MAGAZINE
	mag_well = MAG_WELL_BOX
	caliber = CAL_SRIFLE
	ammo_type = /obj/item/ammo_casing/light_rifle_257
	max_ammo = 200

/obj/item/ammo_magazine/ammobox/light_rifle_257/pickup(mob/user)
	..()
	playsound(src,'sound/weapons/guns/interact/magmove.ogg',60,3)

/obj/item/ammo_magazine/ammobox/light_rifle_257/dropped(mob/user)
	..()
	playsound(src,'sound/weapons/guns/interact/ammomove.ogg',60,3)

/obj/item/ammo_magazine/ammobox/light_rifle_257/rubber
	name = "ammunition box (6.5mm Carbine rubber)"
	icon_state = "box_lrifle_r"
	ammo_type = /obj/item/ammo_casing/light_rifle_257/rubber

/obj/item/ammo_magazine/ammobox/light_rifle_257/practice
	name = "ammunition box (6.5mm Carbine practice)"
	icon_state = "box_lrifle_p"
	ammo_type = /obj/item/ammo_casing/light_rifle_257/practice

/obj/item/ammo_magazine/ammobox/light_rifle_257/lethal
	name = "ammunition box (6.5mm Carbine hollow-point)"
	icon_state = "box_clrifle_l"
	ammo_type = /obj/item/ammo_casing/light_rifle_257/lethal

/obj/item/ammo_magazine/ammobox/light_rifle_257/highvelocity
	name = "ammunition box (6.5mm Carbine high-velocity)"
	icon_state = "box_lrifle_p"
	ammo_type = /obj/item/ammo_casing/light_rifle_257/hv

// 6.5mm Packets
/obj/item/ammo_magazine/ammobox/light_rifle_257_small
	name = "ammunition packet (6.5mm Carbine FMJ)"
	icon_state = "lrifle"
	matter = list(MATERIAL_CARDBOARD = 1)
	caliber = CAL_SRIFLE
	ammo_type = /obj/item/ammo_casing/light_rifle_257
	max_ammo = 60

/obj/item/ammo_magazine/ammobox/light_rifle_257_small/practice
	name = "ammunition packet (6.5mm Carbine practice)"
	icon_state = "lrifle_p"
	ammo_type = /obj/item/ammo_casing/light_rifle_257/practice

/obj/item/ammo_magazine/ammobox/light_rifle_257_small/hv
	name = "ammunition packet (6.5mm Carbine high-velocity)"
	icon_state = "lrifle_hv"
	ammo_type = /obj/item/ammo_casing/light_rifle_257/hv

/obj/item/ammo_magazine/ammobox/light_rifle_257_small/rubber
	name = "ammunition packet (6.5mm Carbine rubber)"
	icon_state = "lrifle_r"
	ammo_type = /obj/item/ammo_casing/light_rifle_257/rubber

/obj/item/ammo_magazine/ammobox/light_rifle_257_small/rubber/pepperball
	name = "ammunition packet (6.5mm Carbine pepperball)"
	desc = "A box of police grade 6.5mm pepperball type rounds; complete with CO2 cartriage casings."
	icon_state = "lrifle_pepper"
	ammo_type = /obj/item/ammo_casing/light_rifle_257/rubber/pepperball

/obj/item/ammo_magazine/ammobox/light_rifle_257_small/lethal
	name = "ammunition packet (6.5mm Carbine hollow-point)"
	icon_state = "lrifle_l"
	ammo_type = /obj/item/ammo_casing/light_rifle_257/lethal

/obj/item/ammo_magazine/ammobox/light_rifle_257_small/incend
	name = "ammunition packet (6.5mm Carbine incendiary)"
	icon_state = "lrifle_l"
	ammo_type = /obj/item/ammo_casing/light_rifle_257/incend

/obj/item/ammo_magazine/ammobox/light_rifle_257_small/laser
	name = "ammunition packet (6.5mm Carbine laser)"
	icon_state = "clrifle_si"
	ammo_type = /obj/item/ammo_casing/light_rifle_257/laser

/obj/item/ammo_magazine/ammobox/light_rifle_257/scrap
	name = "ammunition packet (old 6.5mm Carbine)"
	icon_state = "clrifle_s"
	ammo_type = /obj/item/ammo_casing/light_rifle_257/scrap
	w_class = ITEM_SIZE_NORMAL
	max_ammo = 30

////7.62mm Rifle////

/obj/item/ammo_magazine/ammobox/rifle_75
	name = "ammunition box (7.62mm Rifle ball)"
	icon_state = "boxhrifle"
	desc = "A box of 7.62mm rifle ammunition. 180ct, Full Metal Jacket rounds."
	matter = list(MATERIAL_ALUMINIUM = 10)
	w_class = ITEM_SIZE_BULKY
	caliber = CAL_RIFLE
	mag_type = MAGAZINE
	mag_well = MAG_WELL_BOX
	ammo_type = /obj/item/ammo_casing/rifle_75
	mag_type = SPEEDLOADER | MAGAZINE
	max_ammo = 180

/obj/item/ammo_magazine/ammobox/rifle_75/pickup(mob/user)
	..()
	playsound(src,'sound/weapons/guns/interact/magmove.ogg',60,3)

/obj/item/ammo_magazine/ammobox/rifle_75/dropped(mob/user)
	..()
	playsound(src,'sound/weapons/guns/interact/ammomove.ogg',60,3)

/obj/item/ammo_magazine/ammobox/rifle_75/rubber
	name = "ammunition box (7.62mm Rifle rubber)"
	icon_state = "boxhrifle-rubber"
	desc = "A box of 7.62mm rifle ammunition. 180ct, deforming traumatic rounds."
	ammo_type = /obj/item/ammo_casing/rifle_75/rubber

/obj/item/ammo_magazine/ammobox/rifle_75/practice
	name = "ammunition box (7.62mm Rifle practice)"
	icon_state = "boxhrifle-practice"
	desc = "A box of 7.62mm rifle ammunition. 180ct, frangible training rounds."
	ammo_type = /obj/item/ammo_casing/rifle_75/practice

/obj/item/ammo_magazine/ammobox/rifle_75/lethal
	name = "ammunition box (7.62mm Rifle Hollow Point)"
	icon_state = "boxhrifle-lethal"
	desc = "A box of 7.62mm rifle ammunition. 180ct, hollow-point rounds."
	ammo_type = /obj/item/ammo_casing/rifle_75/lethal

/obj/item/ammo_magazine/ammobox/rifle_75/hv
	name = "ammunition box (7.62mm Rifle High-Velocity)"
	icon_state = "boxhrifle-hv"
	desc = "A box of 7.62mm rifle ammunition. 180ct, high-velocity rounds."
	ammo_type = /obj/item/ammo_casing/rifle_75/hv

/obj/item/ammo_magazine/ammobox/rifle_75_small
	name = "ammunition packet (7.62mm Rifle ball)"
	icon_state = "lrifle"
	matter = list(MATERIAL_CARDBOARD = 1)
	caliber = CAL_RIFLE
	ammo_type = /obj/item/ammo_casing/rifle_75
	max_ammo = 30

/obj/item/ammo_magazine/ammobox/rifle_75_small/rubber
	name = "ammunition packet (7.62mm Rifle rubber)"
	icon_state = "rifle_r"
	ammo_type = /obj/item/ammo_casing/rifle_75/rubber

/obj/item/ammo_magazine/ammobox/rifle_75_small/practice
	name = "ammunition packet (7.62mm Rifle practice)"
	icon_state = "rifle_p"
	ammo_type = /obj/item/ammo_casing/rifle_75/practice

/obj/item/ammo_magazine/ammobox/rifle_75_small/hv
	name = "ammunition packet (7.62mm Rifle high-velocity)"
	icon_state = "rifle_hv"
	ammo_type = /obj/item/ammo_casing/rifle_75/hv

/obj/item/ammo_magazine/ammobox/rifle_75_small/lethal
	name = "ammunition packet (7.62mm Rifle hollow-point)"
	icon_state = "rifle_l"
	ammo_type = /obj/item/ammo_casing/rifle_75/lethal

/obj/item/ammo_magazine/ammobox/rifle_75_small/incend
	name = "ammunition packet (7.62mm Rifle incendiary)"
	icon_state = "rifle_l"
	ammo_type = /obj/item/ammo_casing/rifle_75/incend

/obj/item/ammo_magazine/ammobox/rifle_75_small/scrap
	name = "ammunition packet (old 7.62mm Rifle)"
	icon_state = "srifle_s"
	ammo_type = /obj/item/ammo_casing/rifle_75/scrap

/obj/item/ammo_magazine/ammobox/rifle_75_small/laser
	name = "ammunition packet (7.62mm Rifle laser)"
	icon_state = "srifle_si"
	ammo_type = /obj/item/ammo_casing/rifle_75/laser


////snowflake 10x24////

/obj/item/ammo_magazine/ammobox/cl7mm
	name = "ammunition box (7mm caseless)"
	icon_state = "box10x24"
	desc = "A box of 10mm caseless round, how odd."
	matter = list(MATERIAL_CARDBOARD = 1)
	caliber = CAL_CLRIFLE
	ammo_type = /obj/item/ammo_casing/cl7mm
	max_ammo = 200

/obj/item/ammo_magazine/ammobox/cl7mm_small
	name = "ammunition packet (7mm caseless)"
	icon_state = "box10mm"
	desc = "A box of 10mm caseless round, how odd."
	matter = list(MATERIAL_CARDBOARD = 1)
	caliber = CAL_CLRIFLE
	ammo_type = /obj/item/ammo_casing/cl7mm
	max_ammo = 80 //6.6 reloads of the SWAT, 2 of the bond, almost 1 full pulse mag

//// 14.5×114mm ////

/obj/item/ammo_magazine/ammobox/antim
	name = "ammunition box (14.5mm AP)"
	icon_state = "antim" // Sprites by Skyfire
	desc = "A box of large 14.5×114mm antimateriel rounds."
	matter = list(MATERIAL_CARDBOARD = 1)
	w_class = ITEM_SIZE_BULKY
	caliber = CAL_ANTIM
	ammo_type = /obj/item/ammo_casing/antim
	max_ammo = 30

/obj/item/ammo_magazine/ammobox/antim_small
	name = "ammunition packet (14.5mm AP)"
	icon_state = "60-06sm"
	matter = list(MATERIAL_CARDBOARD = 1)
	caliber = CAL_ANTIM
	w_class = ITEM_SIZE_NORMAL
	ammo_type = /obj/item/ammo_casing/antim
	max_ammo = 15

/obj/item/ammo_magazine/ammobox/antim_small/incend
	name = "ammunition packet (14.5mm Incendiary)"
	icon_state = "60-06sm"
	matter = list(MATERIAL_CARDBOARD = 1)
	caliber = CAL_ANTIM
	w_class = ITEM_SIZE_NORMAL
	ammo_type = /obj/item/ammo_casing/antim/incend
	max_ammo = 15

/obj/item/ammo_magazine/ammobox/antim/scrap
	name = "ammunition box (old 14.5mm Anti Materiel)"
	icon_state = "antim_s" // Sprites by Skyfire
	ammo_type = /obj/item/ammo_casing/antim/scrap
	max_ammo = 5

// Shotgun boxes

/obj/item/ammo_magazine/ammobox/shotgun
	name = "ammunition packet (20mm Slug)"
	icon_state = "slug"
	matter = list(MATERIAL_CARDBOARD = 1) // should be 35 aluminium, but for balance its not
	caliber = CAL_SHOTGUN
	w_class = ITEM_SIZE_NORMAL //so we dont magiclly shrink
	ammo_type = /obj/item/ammo_casing/shotgun
	max_ammo = 35

/obj/item/ammo_magazine/ammobox/shotgun/update_icon()
	var/iconstring = initial(icon_state)

	if (stored_ammo.len == 0)
		iconstring += "-0"

	icon_state = iconstring
//	return

/obj/item/ammo_magazine/ammobox/shotgun/ceramic
	name = "ammunition packet (20mm Ceramic)"
	icon_state = "ceramic"
	ammo_type = /obj/item/ammo_casing/shotgun/ceramic

/obj/item/ammo_magazine/ammobox/shotgun/blanks
	name = "ammunition packet (20mm Blank)"
	icon_state = "practice"
	ammo_type = /obj/item/ammo_casing/shotgun/blank

/obj/item/ammo_magazine/ammobox/shotgun/practiceshells
	name = "ammunition packet (20mm Practice Shells)"
	icon_state = "practice"
	ammo_type = /obj/item/ammo_casing/shotgun/practice

/obj/item/ammo_magazine/ammobox/shotgun/beanbags
	name = "ammunition packet (20mm beanbags)"
	icon_state = "bean"
	ammo_type = /obj/item/ammo_casing/shotgun/beanbag

/obj/item/ammo_magazine/ammobox/shotgun/beanbags/pepperball
	name = "ammunition packet (20mm pepperball)"
	desc = "A box of police grade 20mm pepperball type rounds; complete with CO2 cartriage casings."
	icon_state = "pepper"
	ammo_type = /obj/item/ammo_casing/shotgun/beanbag/pepperball

/obj/item/ammo_magazine/ammobox/shotgun/buckshot
	name = "ammunition packet (20mm Buckshot)"
	icon_state = "buckshot"
	ammo_type = /obj/item/ammo_casing/shotgun/pellet

//used in mapping only cases
/obj/item/ammo_magazine/ammobox/shotgun/flashshells
	name = "signaling ammunition packet (20mm Illumination)"
	icon_state = "illum"
	matter = list(MATERIAL_CARDBOARD = 2)
	w_class = ITEM_SIZE_BULKY
	ammo_type = /obj/item/ammo_casing/shotgun/illumination
	max_ammo = 70 //2x the ammo for being map spawned

/obj/item/ammo_magazine/ammobox/shotgun/flash
	name = "ammunition packet (20mm Illumination)"
	icon_state = "illum"
	ammo_type = /obj/item/ammo_casing/shotgun/illumination

/obj/item/ammo_magazine/ammobox/shotgun/stunshells
	name = "ammunition packet (20mm Stun Shells)"
	icon_state = "stunslug"
	ammo_type = /obj/item/ammo_casing/shotgun/stunshell

/obj/item/ammo_magazine/ammobox/shotgun/payload
	name = "ammunition packet (20mm Explosive Shells)"
	icon_state = "explosive"
	ammo_type = /obj/item/ammo_casing/shotgun/payload

/obj/item/ammo_magazine/ammobox/shotgun/incendiary
	name = "ammunition packet (20mm Incendiary)"
	icon_state = "incendiary"
	ammo_type = /obj/item/ammo_casing/shotgun/incendiary

/obj/item/ammo_magazine/ammobox/shotgun/scrap_beanbag
	name = "old ammunition packet (20mm Beanbag)"
	icon_state = "shot_rs"
	ammo_type = /obj/item/ammo_casing/shotgun/beanbag/scrap

/obj/item/ammo_magazine/ammobox/shotgun/scrap_pellet
	name = "old ammunition packet (20mm Buckshot)"
	icon_state = "shot_scrap"
	ammo_type = /obj/item/ammo_casing/shotgun/pellet/scrap

/obj/item/ammo_magazine/ammobox/shotgun/scrap_slug
	name = "old ammunition packet (20mm Slug)"
	icon_state = "shot_ss"
	ammo_type = /obj/item/ammo_casing/shotgun/scrap

