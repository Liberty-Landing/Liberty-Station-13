//Heavily inspired by Proto23 created by Croc
//Power creep but for random tasks and unsorted things to help push players into doing activities for miner gains
//Code is HEAVILLY reused and stolen from Hex's Genetics with miner tweaks

/datum/task_master/task

	//Reference to the containing labourer
	var/datum/task_master/labourer/worker

	//Pulled up from worker for easyer refencing and debugging
	var/mob/living/carbon/human/forwards_refence


	//Name of the Task
	var/name = "Unknown Task"

	var/desc = "A task unable to be known"

	//The key of the object, used to search for it easily. Often matches the Macro text.
	var/key = "DEFAULT"


	//Used for some tasks to gain levels for said task
	var/value = 0

	//Weather or not the first level is gives you its activation affects
	var/unlocked = FALSE

	//Current level has has to do with value
	var/level = 0

	//For weather we level up this task or not
	var/level_threshholds = 10

	//For when we want to scale are level_threshholds at a different rate
	var/alt_scaling_number = 0

	//The text displayed to a player when they gain a learnt task.
	var/gain_text


/datum/task_master/task/self_value
	name = "Self Motivation"
	key = "MASTER_QUEST_COMPLETER"
	desc = "Completing your own set goals inspirers you to continue your self improvement."
	gain_text = "Setting your own missions is rewarding."
	level_threshholds = 5 //Rewarding people that do their personal objectives with some reason to do this

/datum/task_master/task/self_value/activate_affect()
	//log_debug("[forwards_refence] Has gained additonal insight.")
	forwards_refence.sanity.give_insight(level + 3)
	forwards_refence.sanity.give_insight_rest(level + 3)
//	forwards_refence.sanity.resting += level //This was to powerful


/datum/task_master/task/clay_thumb
	name = "Potted Plant Maintainer"
	key = "CLAY_THUMB_CONISOUR"
	desc = "Thanks to regularly maintaining small potted plants, your knowledge of biodiversity grows!"
	gain_text = "Keeping potted plants alive sure is rewarding labour!"
	level_threshholds = 10 //What looks like a low value is rather high, as this only gains bio on the second+ level up i.e first 10 points are wasted

/datum/task_master/task/clay_thumb/activate_affect()
	forwards_refence.stats.changeStat(STAT_BIO, 2) //so its accully vauleable

/datum/task_master/task/vender_e_shopper
	name = "Vender Point Shopper"
	key = "VENDER_E_SHOPPER"
	desc = "Paper bills, coins they all suck! The Card with your bank account attached to it is clearly the best way to shop!"
	gain_text = "Shopping with an E-card sure is the way to go."
	level_threshholds = 10 //So people dont game this as easy

/datum/task_master/task/vender_e_shopper/activate_affect()
	forwards_refence.stats.changeStat(STAT_COG, 2) //so its accully vauleable

//Restlessness... Nawing hunger...
/datum/task_master/task/return_to_sender
	name = "Return To Sender"
	key = "RETURN_TO_SENDER"
	desc = "I was dead! But now I'm pulled back? Returned to this place, this life?!"
	gain_text = "Walking again?"
	level_threshholds = 1
	unlocked = TRUE //Morality

/datum/task_master/task/return_to_sender/activate_affect()
	forwards_refence.max_nutrition += (level * 15) //415 level 1 -> 445 level 2 -> 490 level 3 ect ect
	forwards_refence.stats.changeStat(STAT_WIL, (level + 2)) //Exstreamly miner: 3 level 1 -> 7 level 2 -> 13 level 3 ect ect

//Huskification
/datum/task_master/task/rebound_case
	name = "Rebound Case"
	key = "REBOUND_CASE"
	desc = "Alive, dead, alive again. Put back together time and time again..."
	gain_text = "Back again."
	level_threshholds = 2
	unlocked = TRUE //Immorality

/datum/task_master/task/rebound_case/activate_affect()
	forwards_refence.stats.changeStat(STAT_COG, -5) //Yes this is infact a bad thing
	forwards_refence.vessel.maximum_volume  += 10 //Increases maxium blood do to your shock/recovering body panicing or something like that
	forwards_refence.maxHealth += 5 //Scars and battle wounds heal back stronger.
	forwards_refence.health += 5 //Scars and battle wounds heal back stronger.

//Gym buff
/datum/task_master/task/gym_goer
	name = "Body Builder"
	key = "GYM_GOER"
	desc = "Nothing beats hitting the gym."
	gain_text = "Feels great to be fit."
	level_threshholds = 2 //Gym has long cooldowns and costs a bit

/datum/task_master/task/gym_goer/activate_affect()
	forwards_refence.stats.changeStat(STAT_WIL, (level + 2))
	forwards_refence.max_nutrition += (level * 5) //405 level 1 -> 415 level 2 -> 430 level 3 ect ect
	forwards_refence.vessel.maximum_volume  += 5 //Blood flow is being aided

//Floor/Wallet Pill buff
/datum/task_master/task/dr_floor
	name = "Dr. Floor"
	key = "DR_FLOOR"
	desc = "Either due to overcoming drug withdrawal, or still lingering addiction, it's hard to deny your bad habits at least help build up character."
	gain_text = "Self prescription..."
	level_threshholds = 5 //Tons of wallet/floor pills

/datum/task_master/task/dr_floor/activate_affect()
	forwards_refence.stats.changeStat(STAT_WIL, (level + 2))

//For Shoveling AND THEN welding/hammering a crack
/datum/task_master/task/proper_sealer
	name = "Proper Sealer"
	key = "PROPER_SEALER"
	desc = "Properly sealing burrows with a trusty shovel and hammering away those cracks makes for tougher and more tool-savvy hands."
	gain_text = "Making the colony a safer place sure is fulfilling work."
	level_threshholds = 5 //Theirs so many burrows...

/datum/task_master/task/proper_sealer/activate_affect()
	forwards_refence.stats.changeStat(STAT_MEC, (level + 1))
	forwards_refence.stats.changeStat(STAT_TGH, (level + 1))

//This happens every time a tool breaks on someone
/datum/task_master/task/tool_breaker
	name = "Tool Consumer"
	key = "TOOL_BREAKER"
	desc = "Sometimes things just break. At lest, it's a good learning experience on tool maintenance..."
	gain_text = "Oops."
	level_threshholds = 2 //This unlike most stat is meant to be leveled up a bit to shine

/datum/task_master/task/proper_sealer/activate_affect()
	forwards_refence.stats.changeStat(STAT_MEC, (level + 1))

/datum/task_master/task/proper_area_smoker
	name = "Smoking Area"
	key = "PROPER_AREA_SMOKER"
	desc = "Smoking on designated areas makes you feel more connected to the community."
	gain_text = "Smoking in a proper area is rather soothing."
	level_threshholds = 10

/datum/task_master/task/proper_area_smoker/activate_affect()
	forwards_refence.sanity.change_max_level(level)

//Taking bad perks should not be all bad!
/datum/task_master/task/poors
	name = "When it rains..."
	key = "POORS"
	desc = "...it pours. You seem to have really bad luck when reflecting upon oddities, but you can pretend at least one never happened to you..."
	gain_text = "Unlucky day huh..."
	level_threshholds = 1
	alt_scaling_number = 2 // 1 2 4 8 ect,
	unlocked = TRUE

/datum/task_master/task/poors/activate_affect()
	forwards_refence.stats.addPerk(PERK_FORCEFUL_REJECTION)

// Training melee with dummies makes you stronger!

/datum/task_master/task/martial_prowess
	name = "Martial Prowess"
	key = "MARTIAL_ARTS"
	desc = "Fear not the combatant who has mastered 300 punches once, but the one that mastered one punch 300 times."
	gain_text = "Carry on training and perfect yourself through the art, no matter the obstacle."
	level_threshholds = 50 // Fifty punches to a training dummy per level might seem like not enough, but it has increased punch cooldown.
	unlocked = TRUE // Let's not make the first fifty punches do nothing, it's a lot of exercise.

/datum/task_master/task/martial_prowess/activate_affect()
	forwards_refence.stats.changeStat(STAT_ROB, (level + 2))
	forwards_refence.stats.changeStat(STAT_TGH, (level + 2)) // So that it's worth sitting there repeatedly clicking on a dummy.
	forwards_refence.stats.changeStat(STAT_WIL, (level + 2)) // Body and mind.


//Monochrome Cheap Diseases system
/*
/datum/task_master/task/mycosis/cryospore
	name = "Cryospore Mycosis Advancement"
	key = "CRYOSPORE"
	desc = "'Cryospore Mycosis' is a virulent alien infection triggered by exposure to extreme cold. It rapidly colonizes the body with fungal spores, \
	spreading through the bloodstream and infiltrating organs. It takes advantage of the user's weakened immunological system by extreme cold before setting in. \
	The spores relies on warmth and the victim's celullar metabolism to make energy for itself, even if heat is what tends to kill it.  \
	Symptoms include severe respiratory distress, coughing fits expelling icy spores, and frostbite-like wounds. Common in Cryochambers patients." \
	gain_text = "You cough - and you see your hands now covered in blue smear. this is not normal."
	level_threshholds = 100

/datum/task_master/task/mycosis/cryospore/activate_affect()
	if(!user.stats.getPerk(PERK_CRYOSPORE_INFECTION1) && !user.stats.getPerk(PERK_CRYOSPORE_INFECTION2) && !user.stats.getPerk(PERK_CRYOSPORE_INFECTION3))
		forwards_refence.stats.addPerk(PERK_CRYOSPORE_INFECTION1)
		to_chat(src, "<span class='warning'>Your breathing becomes slightly labored, as if each inhale brings a faint whisper of frost into your lungs.</span>")
		else(isSynthetic)
			to_chat(src, "<span class='warning'>robot text here.</span>")
	else if(user.stats.getPerk(PERK_CRYOSPORE_INFECTION1) && !user.stats.getPerk(PERK_CRYOSPORE_INFECTION2))
		user.stats.addPerk(PERK_CRYOSPORE_INFECTION2)
		to_chat(src, "<span class='warning'>The persistent cough sends a sharp pang of coldness through your chest. Small patches of your skin feel unnaturally cold. Your limbs feel sluggish, as if encased in icy shackles.</span>")
		user.stats.removePerk(PERK_CRYOSPORE_INFECTION1)
	else if(user.stats.getPerk(PERK_CRYOSPORE_INFECTION2) && !user.stats.getPerk(PERK_CRYOSPORE_INFECTION3))
		user.stats.addPerk(PERK_CRYOSPORE_INFECTION3)
		to_chat(src, "<span class='warning'>The cold is intense, spreading like tendrils of frost through your veins. Frostbite-like lesions cover your skin, numbness and pain coming in equal measure, slowly being consumed by the relentless onslaught of your sickness.</span>")
		user.stats.removePerk(PERK_CRYOSPORE_INFECTION2)

/datum/task_master/task/mycosis/neurophyta
	name = "Neurophyta Mycosis Advancement"
	key = "NEUROPHYTA"
	desc = "'Neurophyta' is a exotic microorganism with an amoebic/fungae-like infection, targeting the brain - organic or synthetic - instead of conventional flesh. It plants tendrils in neural pathways, \
	controlling thoughts and behavior. As it advances, it spreads plant-like growths from the body, releasing spores through yellow flowers that pops out of the skin pores. \
	These beautiful blooms hijacks the brain to believe it is a natural body performace, as its sinister spread reaches other victims, posing a threat to individuals and communities anywhere. \
	This disease has boundaries with the Circhosian Cult, and people believes that Neurophyta has been made in the past by the Precursors, before it was implemented on other planets, such as Elohopea. \
	It has been show to be very weak against fire and intense heat, just like most fungis. Silver can slow its advancement, but never cure it."
	level_threshholds = 30

/datum/task_master/task/mycosis/neurophyta/activate_affect()
	if(!user.stats.getPerk(PERK_NEUROPHYTA_INFECTION1) && !user.stats.getPerk(PERK_NEUROPHYTA_INFECTION2) && !user.stats.getPerk(PERK_NEUROPHYTA_INFECTION3))
		forwards_refence.stats.addPerk(PERK_NEUROPHYTA_INFECTION1)
			to_chat(src, "<span class='warning'>You begin to feel a subtle unease, a vague discomfort that linger just beneath the surface of your body. It's as if something foreign has taken roots within you, a quiet presence that you can't quite put your finger on.</span>")
			else(isSynthetic())
				to_chat(src, "<span class='warning'>robot text here.</span>")
	else if(user.stats.getPerk(PERK_NEUROPHYTA_INFECTION1) && !user.stats.getPerk(PERK_NEUROPHYTA_INFECTION2))
		user.stats.addPerk(PERK_NEUROPHYTA_INFECTION2)
		to_chat(src, "<span class='warning'>You notice a growing sense of fatigue weighing you down, accompanied by occasional bouts of dizziness and nausea. An lingering sensation of pressure beneath the skin. You can feel something scratching inside your skull, yet you are sure it is not your brain.</span>")
		user.stats.removePerk(PERK_NEUROPHYTA_INFECTION1)
	else if(user.stats.getPerk(PERK_NEUROPHYTA_INFECTION2) && !user.stats.getPerk(PERK_NEUROPHYTA_INFECTION3)) //Kill the player, spawn an 'Human' Neurophyta NPC mob with their body stored within.
		user.stats.addPerk(PERK_NEUROPHYTA_INFECTION3)
		to_chat(src, "<span class='warning'>Now engulfed by an overwhelming sense of malaise, your body wracked with pain as the disease asserts its dominance. Creeping vines, something stirring within you- a malevolent force lurks upon your organs, playing with it like toys. You will not survive this.</span>")
		user.stats.removePerk(PERK_NEUROPHYTA_INFECTION2)

/datum/task_master/task/virus/ixovirus
	name = "Ixovirus Pathogen Advancement"
	key = "NEUROPHYTA"
	desc = "'Neurophyta' is a exotic microorganism with an amoebic/fungae-like infection, targeting the brain - organic or synthetic - instead of conventional flesh. It plants tendrils in neural pathways, \
	controlling thoughts and behavior. As it advances, it spreads plant-like growths from the body, releasing spores through yellow flowers that pops out of the skin pores. \
	These beautiful blooms hijacks the brain to believe it is a natural body performace, as its sinister spread reaches other victims, posing a threat to individuals and communities anywhere. \
	This disease has boundaries with the Circhosian Cult, and people believes that Neurophyta has been made in the past by the Precursors, before it was implemented on other planets, such as Elohopea. \
	It has been show to be very weak against fire and intense heat, just like most fungis. Silver can slow its advancement, but never cure it."
	level_threshholds = 30

/datum/task_master/task/mycosis/neurophyta/activate_affect()
	if(!user.stats.getPerk(PERK_NEUROPHYTA_INFECTION1) && !user.stats.getPerk(PERK_NEUROPHYTA_INFECTION2) && !user.stats.getPerk(PERK_NEUROPHYTA_INFECTION3))
		forwards_refence.stats.addPerk(PERK_NEUROPHYTA_INFECTION1)
			to_chat(src, "<span class='warning'>You begin to feel a subtle unease, a vague discomfort that linger just beneath the surface of your body. It's as if something foreign has taken roots within you, a quiet presence that you can't quite put your finger on.</span>")
			else(isSynthetic())
				to_chat(src, "<span class='warning'>robot text here.</span>")
	else if(user.stats.getPerk(PERK_NEUROPHYTA_INFECTION1) && !user.stats.getPerk(PERK_NEUROPHYTA_INFECTION2))
		user.stats.addPerk(PERK_NEUROPHYTA_INFECTION2)
		to_chat(src, "<span class='warning'>You notice a growing sense of fatigue weighing you down, accompanied by occasional bouts of dizziness and nausea. An lingering sensation of pressure beneath the skin. You can feel something scratching inside your skull, yet you are sure it is not your brain.</span>")
		user.stats.removePerk(PERK_NEUROPHYTA_INFECTION1)
	else if(user.stats.getPerk(PERK_NEUROPHYTA_INFECTION2) && !user.stats.getPerk(PERK_NEUROPHYTA_INFECTION3)) //Kill the player, spawn an 'Human' Neurophyta NPC mob with their body stored within.
		user.stats.addPerk(PERK_NEUROPHYTA_INFECTION3)
		to_chat(src, "<span class='warning'>Now engulfed by an overwhelming sense of malaise, your body wracked with pain as the disease asserts its dominance. Creeping vines, something stirring within you- a malevolent force lurks upon your organs, playing with it like toys. You will not survive this.</span>")
		user.stats.removePerk(PERK_NEUROPHYTA_INFECTION2)


//Monochrome Cheap Cure System

/datum/task_master/task/cure/fungal
	name = "Antifungal Treatment"
	key = "ANTIFUNGAL"
	desc = "Specialized antifungal medications capable of penetrating deep into tissues, thermal therapy with heating pads or full-body thermal chambers,\
	enough to raise body's temperature to levels inhospitable to Phokorus mycosis and Immunomodulators can either disrupt fungal growths or \
	enhance the immune system's ability to identify and destroy fungal invaders."
	gain_text = "With such heat, you are finally starting to feel better."
	level_threshholds = 100

/datum/task_master/task/cure/fungal/activate_affect()
	if(user.stats.getPerk(PERK_CRYOSPORE_INFECTION1))
		to_chat(src, "<span class='warning'>Having endured the initial stages of the mycosis, relief sets in as symptoms subside. The chill dissipates, breathing returns to normal, and the body's warmth feels more comforting, akin to a maternal embrace.</span>")
		user.stats.removePerk(PERK_CRYOSPORE_INFECTION1)

	else if(user.stats.getPerk(PERK_CRYOSPORE_INFECTION2))
		to_chat(src, "<span class='warning'>Despite hopes that the worst was over, a creeping unease lingers as symptoms resurface. Occasional shivers and labored breathing persist, akin to inhaling whispers of frost into your lungs. A sobering reminder that the battle rages on.</span>")
		user.stats.removePerk(PERK_CRYOSPORE_INFECTION2)
		user.stats.getPerk(PERK_CRYOSPORE_INFECTION1)

	else if(user.stats.getPerk(PERK_CRYOSPORE_INFECTION3))
		to_chat(src, "<span class='warning'>With treatment, you briefly find relief from the icy grip, only to return to familiar territory as the intense cold persists, accompanied by coughing. The disease maintains its hold, ensnaring you in its cold embrace.</span>")
		user.stats.removePerk(PERK_CRYOSPORE_INFECTION3)
		user.stats.getPerk(PERK_CRYOSPORE_INFECTION2)

	else if(user.stats.getPerk(PERK_NEUROPHYTA_INFECTION1))
		to_chat(src, "<span class='As symptons subsides and the sense of relief sets in, you find yourself in control of your thoughts and actions. The Neurophyta's influence wanes, replaced by freedom and fast acting muscles, no longer a possible zombie in the near future.'>text.</span>")
		user.stats.removePerk(PERK_NEUROPHYTA_INFECTION1)

	else if(user.stats.getPerk(PERK_NEUROPHYTA_INFECTION2))
		to_chat(src, "<span class='warning'>The creeping unease persists despite treatment efforts, as it resurfaces by controlling your emotions and thoughts, even if not yet controlling your actions and individuality. Everything still feels foreign, as if your tact remains internal - feeling how your heart beat.</span>")
		user.stats.removePerk(PERK_NEUROPHYTA_INFECTION2)
		user.stats.getPerk(PERK_NEUROPHYTA_INFECTION1)

	else if(user.stats.getPerk(PERK_NEUROPHYTA_INFECTION3))
		to_chat(src, "<span class='warning'>Despite undergroing treatment, you still find yourself ensnared by Neurophyta's invasive tendrils on your internal organs. Thoughts and emotions shifts on and on under its influence, and actions feels foreign, controlled by an unseen force. A miracle managed to survive their control, as you basically had no chance.</span>")
		user.stats.removePerk(PERK_NEUROPHYTA_INFECTION3)
		user.stats.getPerk(PERK_NEUROPHYTA_INFECTION2)

/datum/task_master/task/cure/viral
	name = "Antiviral Treatment"
	key = "ANTIVIRAL"
	desc = "."
	level_threshholds = 100

	/datum/task_master/task/cure/antibiotics
	name = "Antibiotical Treatment"
	key = "ANTIBIOTIC"
	desc = "."
	level_threshholds = 100
*/
