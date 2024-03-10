/datum/job/outsider
	title = "Outsider"
	total_positions = 4
	spawn_positions = 4
	flag = OUTSIDER
	faction = MAP_FACTION
	department = DEPARTMENT_INDEPENDENT
	department_flag = INDEPENDENT
	supervisors = "nobody! You're an outsider"
	selection_color = "#191919"
	account_allowed = 0
	create_record = 0
	initial_balance = INIT_BALANCE_NONE
	wage = WAGE_NONE
	//minimal_access = list(access_maint_tunnels)	- No.
	outfit_type = /decl/hierarchy/outfit/job/outsider
	difficulty = "Survive!"
	has_id = FALSE
	//playtimerequired = 1200000	- Not needed now.

	stat_modifiers = list(
		STAT_BIO = 15,
		STAT_TGH = 22,
		STAT_ROB = 16,
		STAT_VIG = 16,
		STAT_MEC = 10,
		STAT_COG = 10
	)

	description = "You stand alone, an outsider detached from the colony.  Whether you're an exile, an amnesiac, stranded spacefarer, pirate, mercenary, hermit, or simply \
	the right person in the wrong place, solitude is your constant companion. What friends you can make and rely on should be cherished, for there are other looters and outsiders there who might \
	be less than friendly short of giving out lead and ionized laser shots. You better stake your claim, fortify a safe spot, then venture out for supplies and whatever loot you can use, sell, or \
	stockpile. Remember, you are not protected by colony law, few people with care or even raise an eyebrow if you're shot to death for whatever you're carrying. \
	Albeit you may be lacking in equipments, you've survived long enough to become experienced. Differently of other outsider roles, you have all-round better stats."

	duties = "Choose between building a home or becoming completely nomadic.<br>\
		Make friends and avoid making enemies, as you're not protected like a colonist.<br>\
		Avoid dying in the dangerous wilderness alone."

/obj/landmark/join/start/outsider
	name = "Outsider"
	icon_state = "player-black"
	join_tag = /datum/job/outsider

/datum/job/tribal
	title = "Frostwalker Tribal"
	total_positions = 5
	spawn_positions = 5
	flag = OUTSIDER
	faction = MAP_FACTION
	department = DEPARTMENT_INDEPENDENT
	department_flag = INDEPENDENT
	supervisors = "The Sagamore, the most wise or old on your group."
	selection_color = "#191919"
	account_allowed = 0
	create_record = 0
	initial_balance = INIT_BALANCE_NONE
	wage = WAGE_NONE
	alt_titles = list("Sagamore", "Warrior", "Shaman", "Hunter")
	//minimal_access = list(access_maint_tunnels)	- No.
	outfit_type = /decl/hierarchy/outfit/job/tribal
	difficulty = "Survive!"
	has_id = TRUE //only a wooden dogtag showing name and your job, no access whasoever tho

	stat_modifiers = list(
		STAT_BIO = 10,
		STAT_TGH = 10,
		STAT_ROB = 10,
		STAT_COG = 5
	)

	description = "You are a Phokorus native from the Frostwalker Tribe. Your shamanistic religion declares that your forefathers has been kidnapped by the long darkness. \
	In reverence to the Abyssal Mother, named Eris, and her ethereal spirits, you embody some powers by bringing light to the long darkness - the Precursors and their filthy cultists. \
	You are peaceful, but compelled by current challenges, you are a now a reluctant warrior. Living in these cursed lands allowed you to use your unique tradition as a weapon. \
	The cannibal Mappukini Tribe harass your people, while newcomers punctures the earth and settle their greedy hands on what is holy, with little to no respect to where you thread. \
	Cultists of the Long Darkness came as they promised in the carved stones, salting the earth with its psionic presence. Now other outsiders steal and raid your settlements. \
	So, by Eris those made from the clay of this land must wield the war totems and smash the filth into mush, you may be peaceful, but never weak."

	duties = "Protect your settlement and ensure that it will not be raided. Reinforce the walls, forge duraluminium weapons and make traps, if needed. Diplomacy may suffice if not. <br>\
		Protect your fellow frostwalker natives, as these are the sons of Abyssal Mother. <br>\
		Maintain your holy grounds safe from the corporate greed of the colonies. Remember the other fallen tribes who met a cruel fate coming from them. <br>\
		Collect and bring light to precursor technology to enhance said tools with Abyssal Mother's light. <br>\
		Antagonises cultists as those are followers of Long Darkness, who salts the earth. Spit on their comparation of Abyssal Mother and 'Dissident God'"

/obj/landmark/join/start/tribal
	name = "Frostwalker"
	icon_state = "player-black"
	join_tag = /datum/job/tribal

/datum/job/cultist
	title = "Equipoise Cultist"
	total_positions = 4
	spawn_positions = 4
	flag = OUTSIDER
	faction = MAP_FACTION
	department = DEPARTMENT_INDEPENDENT
	department_flag = INDEPENDENT
	supervisors = "The Pronator, who serves as your foremost expedition leader. You adhere to the hierarchy based on the upper extremities of an arm, to the lowest."
	selection_color = "#191919"
	account_allowed = 0
	create_record = 0
	initial_balance = INIT_BALANCE_NONE
	wage = WAGE_NONE
	alt_titles = list("Pronator", "Metacarpus", "Phalange")
	//minimal_access = list(access_maint_tunnels)	- No.
	outfit_type = /decl/hierarchy/outfit/job/cultist
	difficulty = "Survive!"
	has_id = TRUE //only for name and job

	stat_modifiers = list(
		STAT_BIO = 20,
		STAT_COG = 15,
		STAT_MECH = 15
	)

	description = "You belong to a rather controversial religious movement, the Circhosian Cult. Essentially the continuation of the Precursor religion with a deep rooted origins on scientific research. \
	You have suffered the exodus from the colony years ago, and now guided by the Vanguard Codicem under the words of Lucca Argyros, your religion suffered a Schism, split between the radicals and non-radicals. \
	at least that's how you perceive it - as a member of the Equipoise Circhosian Cult, you directly antagonizes the Vehement Circhosian Cult for their degenerative rituals that leads to death and debauchery. \
	The rituals of the cult focuses on the fertility and abundance of harvest, both in plants and in people. Seeking out precursor technology is a very important aspect of your religion, and psionics is part of your powers. \
	Torture to receive adenochrome, alcohol-fueled orgies and forced brainwash and manipulation does not make part of your faith, and it is infact considered abominable, a corruption of Lucca's teachings. \
	The Equipoise Cult directly perceives Lucca Argyros as a man who has been enlightened, not a awakened divine, much less the merging of both divine entities."

	duties = "Explore the world in search of psionic essence anywhere. You can kill if you deem suitable. <br>\
		Praise Petaline and Crustor. Antagonize 'Dissident God', or 'Abyssal Mother', which are both the same divine. The rituals you make will ewmpower you. <br>\
		Create weaponries of biomatter technology and turn your fellow cultists or yourself into light-eaters. <br>\
		Albeit most of the reasons your cult has been banished comes mostly because of Vehement's cult, you are still essentially the enemy of the colony. Protect yourself from them. <br>\
		Avoid, antagonize or stay away from the Tribesmen from the Frostwalker tribe. They desire psionic essence as much as you - but with the desire to destroy what you deem holy. <br>\
		The Equipoise Cult still contains the stolen technology of the colonial departments. Perhaps keeping this a secret can help you..."

/obj/landmark/join/start/cultist
	name = "cultist"
	icon_state = "player-black"
	join_tag = /datum/job/cultist

/datum/job/insurgent
	title = "Khambataar Insurgent"
	total_positions = 5
	spawn_positions = 5
	flag = OUTSIDER
	faction = MAP_FACTION
	department = DEPARTMENT_INDEPENDENT
	department_flag = INDEPENDENT
	supervisors = "The Combat Leader - anyone who chooses such alt title. Otherwise, you are on your own."
	selection_color = "#191919"
	account_allowed = 0
	create_record = 0
	initial_balance = INIT_BALANCE_NONE
	wage = WAGE_NONE
	alt_titles = list("Patriotic Fighter", "Combat Leader", "Rebel", "Insurgent")
	//minimal_access = list(access_maint_tunnels)	- No.
	outfit_type = /decl/hierarchy/outfit/job/rebel
	difficulty = "Survive!"
	has_id = TRUE //only for name and job

	stat_modifiers = list(
		STAT_VIG = 20,
		STAT_ROB = 15,
		STAT_TGH = 15
	)

	description = "You are a rebel, one of the many populist fighters under the banner of the self-appointed General Khambataar. \
	While you embody the spirit of the underdog, your radical ideologies, ethical ambiguity, and aggressive tactics hinder broader sympathy from the population. \
	The vision of your faction for Freeport Liberty advocates for a shift towards a presidential mandate, eschewing reliance on external factions, corporate entities, and literal army from another colony. \
	You staunchly oppose Abhuman Bioaugment, viewing it as a corruption of Human geneseed with potential repercussions for other alien races, though Drifter Genemodders remain acceptable due to methodical reasons. \
	Despite losing the war in every tangible sense, you remain steadfast in spirit. The Vanguard Branch of Freeport Liberty has ruthlessly quashed your war-conquered settlement, relegating you to the sewers and isolated outposts, \
	Even if you did managed to break the early colonial army, the Iron Eagle, the victory did not last with the constant executions with fire by the Custodians of Bonfire, and the formation of the Liberty Watch just after. \
	Nevertheless, you receive clandestine financial support from a significant major power. However, you're branded as hostile and traitorous by the colony, so you may expect only bullets. "

	duties = "Keep the sewers well protected from potential attacks by the colony. This is your only home, and currently Khambataar only have a dirty hidden place to be rather than a office. <br>\
		Perform scouting duties and plant spying assets around the colony to steal information from factions. Adquiring assets for the cause is very important. <br>\
		Try to conquer the heart of those who believes in the same views as yours, of an planet lacking in wageslaves, where politics are not dependent on the rich, the military, unions or universities. <br>\
		Antagonises the colony if a radio is found, and fight only when necessary, but be wary - you are in disadvantage afterall. <br>\
		Many strategies can be done to fullfill this, and the easiest is using human rights as argument rights, your people suffered, use your pain as fuel."

/obj/landmark/join/start/insurgent
	name = "insurgent"
	icon_state = "player-black"
	join_tag = /datum/job/insurgent
