/datum/perk/oddity
	gain_text = "You feel different. Exposure to oddities has changed you. Now you can't go back."



/datum/perk/oddity/terrible_fate
	name = "Terrible Fate"
	desc = "You realize the painful truth of death. You don't want to die and despise death - dying is a unmistakable horror to you. \
			Anyone who is around you at the moment of your death must roll a Willpower sanity check. If they fail, their sanity will instantly be dropped to 0."
	icon_state = "terrible_fate" // https://game-icons.net/1x1/lorc/death-zone.html

/datum/perk/oddity/toxic_revenger //this will likely become an disease in another system.
	name = "Fungal Host"
	desc = "A small hostile fungal spores were on the oddity, hijacking your lungs and forcing them to emit toxins harmful to everyone around you every half hour. It will be a long time before your body can fight this off..."
	gain_text = "You feel a terrible aching pain in your lungs - an anomalous fungus on the oddity has infused your body!"
	icon_state = "bad_breath" // https://game-icons.net
	var/cooldown = 30 MINUTES
	var/initial_time

/datum/perk/oddity/toxic_revenger/assign(mob/living/carbon/human/H)
	..()
	initial_time = world.time
	H.learnt_tasks.attempt_add_task_mastery(/datum/task_master/task/poors, "POORS", skill_gained = 1, learner = H)

/datum/perk/oddity/toxic_revenger/on_process()
	if(!..())
		return
	if(holder.species.flags & NO_BREATHE || holder.internal)
		return
	if(world.time < initial_time + cooldown)
		return
	initial_time = world.time
	for(var/mob/living/carbon/human/H in viewers(5, holder))
		if(H.stat == DEAD || H.internal || H.stats.getPerk(PERK_TOXIC_REVENGER) || H.species.flags & NO_BREATHE)
			continue
		if(H.head?.item_flags & BLOCK_GAS_SMOKE_EFFECT || H.wear_mask?.item_flags & BLOCK_GAS_SMOKE_EFFECT || BP_IS_ROBOTIC(H.get_organ(BP_CHEST)))
			continue

		H.reagents?.add_reagent("toxin", 5)
		H.emote("cough")
		to_chat(H, SPAN_WARNING("[holder] emits a strange smell."))

/datum/perk/oddity/gunslinger
	name = "Gunslinger"
	desc = "The latent effects of an oddity have granted you an insight into firing bullets faster than anyone else; a shame it doesn't make you immune to recoil."
	gain_text = "Your trigger finger feels more relaxed than ever..."
	icon_state = "gunslinger" // https://game-icons.net/1x1/delapouite/reload-gun-barrel.html

/datum/perk/oddity/balls_of_steel
	name = "True Grit"
	desc = "Pain comes and goes, you feel as though can withstand far worse than ever before."
	gain_text = "Pain is merely weakness leaving the body."
	icon_state = "golem" // https://game-icons.net

/datum/perk/oddity/fast_walker
	name = "Springheel"
	desc = "You're sure of your movements now, slow and steady may win the race but you can prove them wrong."
	gain_text = "You feel your pace quickening, your thoughts barely catching up with your stride..."
	icon_state = "sprint" // https://game-icons.net/1x1/lorc/sprint.html

/datum/perk/oddity/fast_walker/assign(mob/living/carbon/human/H)
	..()
	if(holder.stats.getPerk(PERK_FAST_WALKER)) // Prevents stacking the same perk over and over for Emperor spider levels of speed. - Seb
		return FALSE

/datum/perk/oddity/harden
	name = "Natural Armor"
	desc = "Your skin has become harder, more durable, able to accept blunt force and endure."
	gain_text = "After all you've endured, you can't help but feel tougher than normal, your skin feels like iron."
	icon_state = "armor" // This one is good enough. Abs of aluminium.

/datum/perk/oddity/harden/assign(mob/living/carbon/human/H)
	..()
	holder.brute_mod_perk -= 0.1 // One third of subdermal armor
	holder.mob_bomb_defense += 5
	holder.falls_mod -= 0.2

/datum/perk/oddity/harden/remove()
	holder.brute_mod_perk += 0.1
	holder.mob_bomb_defense -= 5
	holder.falls_mod += 0.2
	..()

/datum/perk/oddity/thin_skin
	name = "Thin Skin"
	desc = "The anomaly has weakened your skin, making you less resistant to blunt trauma."
	gain_text = "You feel yourself growing softer...Did everything always hurt this much?"
	icon_state = "broken" // https://game-icons.net/1x1/lorc/broken-shield.html

/datum/perk/oddity/thin_skin/assign(mob/living/carbon/human/H)
	..()
	holder.brute_mod_perk += 0.1
	holder.mob_bomb_defense -= 5
	holder.falls_mod += 0.2
	H.learnt_tasks.attempt_add_task_mastery(/datum/task_master/task/poors, "POORS", skill_gained = 1, learner = H)


/datum/perk/oddity/thin_skin/remove()
	holder.brute_mod_perk -= 0.1 // One third of subdermal armor
	holder.mob_bomb_defense += 5
	holder.falls_mod -= 0.2
	..()

/datum/perk/oddity/better_toxins
	name = "Toxic Resistance"
	desc = "You've been exposed to something toxic, yet your body fought it off and is now strengthened against poisoning as a result."
	gain_text = "What doesn't kill you, helps you survive it better."
	icon_state = "toxins" // https://game-icons.net/1x1/delapouite/hazmat-suit.html

/datum/perk/oddity/better_toxins/assign(mob/living/carbon/human/H)
	..()
	holder.toxin_mod_perk -= 0.1 //Might be to high...

/datum/perk/oddity/better_toxins/remove()
	holder.toxin_mod_perk += 0.1
	..()

/datum/perk/oddity/shell_shock
	name = "Shell Shock"
	desc = "Why are you not getting better at fighting? Why do mere roaches keep tumbling you down? Your body is weakened by self doubt and despair..."
	gain_text = "Things just get harder and harder..."
	icon_state = "shellshock" // https://game-icons.net/1x1/lorc/tear-tracks.html

/datum/perk/oddity/shell_shock/assign(mob/living/carbon/human/H)
	..()
	holder.stats.changeStat(STAT_ROB, -15)
	holder.stats.changeStat(STAT_TGH, -15)
	holder.stats.changeStat(STAT_VIG, -15)
	H.learnt_tasks.attempt_add_task_mastery(/datum/task_master/task/poors, "POORS", skill_gained = 1, learner = H)


/datum/perk/oddity/shell_shock/remove()
	holder.stats.changeStat(STAT_ROB, 15)
	holder.stats.changeStat(STAT_TGH, 15)
	holder.stats.changeStat(STAT_VIG, 15)
	..()

/datum/perk/oddity/failing_mind
	name = "Failing Mind"
	desc = "The mind fogs, blanking out, always distracted. Did that anomaly make you dumber, or where you always like this?"
	gain_text = "The world is not as clear as it once was."
	icon_state = "dumbness" // https://game-icons.net/1x1/delapouite/brain-dump.html

/datum/perk/oddity/failing_mind/assign(mob/living/carbon/human/H)
	..()
	holder.stats.changeStat(STAT_COG, -15)
	holder.stats.changeStat(STAT_MEC, -15)
	holder.stats.changeStat(STAT_BIO, -15)
	H.learnt_tasks.attempt_add_task_mastery(/datum/task_master/task/poors, "POORS", skill_gained = 1, learner = H)


/datum/perk/oddity/failing_mind/remove()
	holder.stats.changeStat(STAT_COG, 15)
	holder.stats.changeStat(STAT_MEC, 15)
	holder.stats.changeStat(STAT_BIO, 15)
	..()

/datum/perk/oddity/snackivore
	name = "Snackivore"
	desc = "The secret of the lounge lizards! Your body adapts to eating the worse kind of food in existence, allowing you to draw an exceptional amount of nutrition from snack foods. More so \
	it passively heals you like tricord, with pure toxins healing you the most. Rejoice trash mammals!"
	passivePerk = TRUE
	icon_state = "snack"

/datum/perk/oddity/sharp_mind
	name = "Sharpened Mind"
	desc = "Narrowing in and extrapolating the inner workings of the world has never felt so much easier."
	gain_text = "The mind can over come any puzzle thrown at it!"
	icon_state = "brain_up" // Modified version of https://game-icons.net/1x1/delapouite/brain-dump.html

/datum/perk/oddity/sharp_mind/assign(mob/living/carbon/human/H)
	..()
	holder.stats.changeStat(STAT_COG, 15)
	holder.stats.changeStat(STAT_MEC, 15)
	holder.stats.changeStat(STAT_BIO, 15)

/datum/perk/oddity/sharp_mind/remove()
	holder.stats.changeStat(STAT_COG, -15)
	holder.stats.changeStat(STAT_MEC, -15)
	holder.stats.changeStat(STAT_BIO, -15)
	..()

/datum/perk/oddity/strangth
	name = "Inner Strength"
	desc = "You're more keenly aware of your own abilities for combat. You feel more confident on your punches thrown, a bit tougher against those thrown at you, and you're starting to get the hang of shooting that one bulky gun..."
	gain_text = "The blood pumps, the muscles harden, and your trigger finger feels easier than ever..."
	icon_state = "strong" // https://game-icons.net/1x1/lorc/strong.html

/datum/perk/oddity/strangth/assign(mob/living/carbon/human/H)
	..()
	holder.stats.changeStat(STAT_ROB, 15)
	holder.stats.changeStat(STAT_TGH, 15)
	holder.stats.changeStat(STAT_VIG, 15)

/datum/perk/oddity/strangth/remove()
	holder.stats.changeStat(STAT_ROB, -15)
	holder.stats.changeStat(STAT_TGH, -15)
	holder.stats.changeStat(STAT_VIG, -15)
	..()

/datum/perk/oddity/iron_will
	name = "Will of Iron"
	desc = "The body is able to succumb to many negative affects but the mind can simply ignore them. Getting addicted to things is much harder and you can stomach more chemicals."
	icon_state = "sharp_mind" // https://game-icons.net/1x1/lorc/spiked-halo.html

/datum/perk/oddity/iron_will/assign(mob/living/carbon/human/H)
	..()
	holder.metabolism_effects.addiction_chance_multiplier = 0.2
	holder.metabolism_effects.nsa_bonus += 20
	holder.metabolism_effects.calculate_nsa()

/datum/perk/oddity/iron_will/remove()
	holder.metabolism_effects.addiction_chance_multiplier = 1
	holder.metabolism_effects.nsa_bonus -= 20
	holder.metabolism_effects.calculate_nsa()
	..()

/datum/perk/oddity/mind_of_matter
	name = "Will to Power"
	desc = "The mind protects the body by imposing limits to prevent severe harm to the self. With enough focus, you can push yourself past that limit."
	icon_state = "generic" // https://game-icons.net/1x1/lorc/underdose.html

/datum/perk/oddity/mind_of_matter/assign(mob/living/carbon/human/H)
	..()
	holder.maxHealth += 20
	holder.health += 20

/datum/perk/oddity/mind_of_matter/remove()
	holder.maxHealth -= 20
	holder.health -= 20
	..()

/datum/perk/oddity/blood_of_lead
	name = "Lead Blood"
	desc = "Maybe you grew up on a world with a toxic atmosphere, maybe solar radiation was common, or maybe its just genetics but you're adapted well to dealing with toxins."
	icon_state = "liver" // https://game-icons.net

/datum/perk/oddity/sure_step
	name = "Sure Step"
	desc = "Years spent in hazardous areas have made you sure on your footing, you are more likely to avoid traps and less likely to trip while running on under-plating."
	icon_state = "mantrap"

/datum/perk/oddity/lungs_of_iron
	name = "Lungs of Iron"
	desc = "For whatever reason, be it natural evolution or simply spending too much time in space or low oxygen worlds your lungs are adapted to surviving with less oxygen."
	icon_state = "lungs" // https://game-icons.net/1x1/lorc/one-eyed.html

/datum/perk/oddity/nightcrawler
	name = "Nightcrawler"
	desc = "Having lived in a light-deprived enviroment for most of your life has honed your vision more than the average person.\nYour accelerated dark adaptation has also made you more photosensitive to sudden bright lights and flashes."
	var/init_sight
	var/init_flash
	var/obj/screen/lightOverlay = null
	icon_state = "nightvision" // https://game-icons.net/1x1/delapouite/night-vision.html

/datum/perk/oddity/nightcrawler/assign(mob/living/carbon/human/H)
	..()
	init_sight = holder.additional_darksight
	init_flash = holder.flash_mod
	holder.additional_darksight = 8
	holder.flash_mod += 2

/datum/perk/oddity/nightcrawler/remove()
	holder.additional_darksight = init_sight
	holder.flash_mod = init_flash
	..()

/datum/perk/oddity/fast_fingers
	name = "Fast Fingers"
	desc = "Nothing is safe around your hands. You are a true kleptomaniac. Taking items off others makes no sound or prompts, provided its in their pockets, hands, or their ears. \
	It's also quicker and you can slip pills into drinks unnoticed."
	icon_state = "robber_hand" // https://game-icons.net/1x1/darkzaitzev/robber-hand.html

/datum/perk/oddity/ass_of_concrete
	name = "Immovable Object"
	desc = "Your intense training has perfected your footing, and you're an expert at holding the line. Few things can knock you off balance or push you around."
	icon_state = "muscular" // https://game-icons.net

/datum/perk/oddity/ass_of_concrete/assign(mob/living/carbon/human/H)
	..()
	holder.mob_bump_flag = HEAVY

/datum/perk/oddity/ass_of_concrete/remove()
	holder.mob_bump_flag = ~HEAVY
	..()

/datum/perk/oddity/side_loading
	name = "Side Loading"
	desc = "Guns that can be side-loaded will tell you when examined. \
	When onehanding most some guns, you will automatically reload them if in your offhand you hold additional shells."
	gain_text = "Reloading with a simple mind is almost second nature..."
	lose_text = "The reloading from the side is more complicated..."
	icon_state = "plus_one" // https://game-icons.net/1x1/lorc/gears.html

/datum/perk/oddity/side_loading/assign(mob/living/carbon/human/H)
	..()
	holder.stats.changeStat(STAT_COG, -5)
	holder.stats.changeStat(STAT_VIG, 5)

/datum/perk/oddity/side_loading/remove()
	holder.stats.changeStat(STAT_COG, 5)
	holder.stats.changeStat(STAT_VIG, -5)
	..()


///////////////////////////////////////
//////// JOB ODDITYS PERKS ////////////
///////////////////////////////////////

/datum/perk/bluespace
	name = "Bluespace Alignement"
	desc = "The Tuning Device is taxing on the mind but rewarding... Along with some other side affects..."
	gain_text = "Having stared too much into the abyss that is Bluespace itself, you can't help but feel its gaze staring back at you."
	lose_text = "The death heat of the universe strays further away... for now."
	icon_state = "deepconnection" // - No icon, suggestion, vortex?
	var/initial_time

/datum/perk/bluespace/assign(mob/living/carbon/human/H)
	..()
	initial_time = world.time
	cooldown_time = world.time + rand(20, 60) MINUTES
	holder.stats.changeStat(STAT_COG, 5) //We keep this 5 per use
	if(!H.stats?.getPerk(PERK_SCIENCE) && prob(60))
		GLOB.bluespace_entropy += rand(80, 150) //You done fucked it up.
	if(H.stats?.getPerk(PERK_SCIENCE) && prob(50))
		GLOB.bluespace_entropy -= rand(20, 30) //High odds to do even better!
	GLOB.bluespace_entropy -= rand(30, 50)

/datum/perk/bluespace/remove(mob/living/carbon/human/H)
	if(!H.stats?.getPerk(PERK_SCIENCE) && prob(30))
		GLOB.bluespace_entropy += rand(80, 150)
	if(H.stats?.getPerk(PERK_SCIENCE) && prob(50))
		GLOB.bluespace_entropy -= rand(20, 30)
	GLOB.bluespace_entropy += rand(30, 50)
	..()

/datum/perk/bluespace/on_process()
	if(!..())
		return
	if(cooldown_time <= world.time)
		holder.stats.removePerk(type)
		to_chat(holder, SPAN_NOTICE("[lose_text]"))
		return
	if(holder.buckled)
		cooldown_time -= 5 SECONDS //Resting grately speeds this up

/datum/perk/guild/blackbox_insight
	name = "Blackbox Tinkering"
	desc = "It's sleek contours, the expert craftsmanship... The best of hand-made mechanical genius."
	gain_text = "What wondrous possibilities..."
	icon_state = "blackbox_tinker" // https://game-icons.net/1x1/lorc/gears.html

/datum/perk/guild/blackbox_insight/assign(mob/living/carbon/human/H)
	..()
	holder.stats.changeStat(STAT_COG, 15)
	holder.stats.changeStat(STAT_MEC, 15)

/datum/perk/guild/blackbox_insight/remove()
	holder.stats.changeStat(STAT_COG, -10) //we keep 5 of each
	holder.stats.changeStat(STAT_MEC, -10)
	..()
