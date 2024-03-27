/obj/item/projectile/beam/nacre
	name = "nacre"
	icon_state = "xray"
	mob_hit_sound = list('sound/effects/gore/sear.ogg')
	hitsound_wall = 'sound/weapons/guns/misc/laser_searwall.ogg'
	damage_types = list(BURN  = 40) // 20 more damage than the Cog
	irradiate = 25
	armor_penetration = 15 // 5 less AP than the Cog
	check_armour = ARMOR_ENERGY
	hitscan = TRUE
	invisibility = 101	//beam projectiles are invisible as they are rendered by the effect engine
	muzzle_type = /obj/effect/projectile/nacre/muzzle
	tracer_type = /obj/effect/projectile/nacre/tracer
	impact_type = /obj/effect/projectile/nacre/impact
	kill_count = 15 // How long until they disapear
	affective_damage_range = 2
	affective_ap_range = 2

/obj/item/projectile/nacre_shard
	name = "nacre shard"
	damage_types = list(BRUTE = 21) //Were a bit better then 10mm HP to stay competitive
	irradiate = 10
	armor_penetration = 10
	check_armour = ARMOR_MELEE //We throw a rock not a bullet (makes riot/miner armor valueable)
	embed = TRUE
	shrapnel_type = /obj/item/material/shard/nacre
	affective_damage_range = 2
	affective_ap_range = 2

/obj/item/projectile/nacre_shard/golem/attack_mob(mob/living/target_mob, distance, miss_modifier=0)
	if(target_mob.faction == "nacre")
		return FALSE
	else
		return ..()
