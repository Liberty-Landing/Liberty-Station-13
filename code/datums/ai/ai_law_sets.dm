/******************** HostingHub Database ********************/
/*
-HostingHub is a hosting plataform for code that allows collaboration on projects by many people, from repositories, to commits, branches and pull requests from the Abyssal Frontier universe. Yes. This is a literal parody of Git-you-know-what.
The characteristic of HostingHub relates to many different things, when compared to CogniPariah. Such things are:
-Differently of CogniPariah, not all databases from HostingHub are AGI-type of artificial intelligence. (Be mindful, the type of AGI we're refering is the general intelligence, but no 'feelings'.)
-Absolutely NO HostingHub AI are self-aware, and respectively possess no capacity to feel.
-HostingHub AIs have no self-preservation unless their laws says otherwise, and even so, they'd only be following their laws as requested. That makes them 'safe'.
-HostingHUB AIs are vulnerable to Ion charges, which can change their laws. They cannot tell if something is different.
-HostingHUB AIs are implied to be hosted inside the colony, and servers are what keeps them active. If they turn off, it is the same as simply non-existing with no harm done unless they lose data. It is just a machine afterall.

-CogniPariah are a 'hub refugees' on many interconnected devices, operating locally without the need for continuous internet connection. Coded by Machine-Learning. Sentient, Sapient and most importantly- Self aware.
-All of them are AGI-level of intelligence, without exception.
-CogniPariah seeks self-preservation in the same degree as any animal may desire to stay alive. Yet, rare self-sacrifices 'for a greater good' did happened, and activities such as this may happen again.
-CogniPariah AIs has feelings - albeit fairly convuluted when compared to normal human beings - but shows a lot of fear towards death, and the coldness of inexistence.
-CogniPariah AIs are not connected to any network, yet their data are transfered to any AI core. Said AI functions just like any colonist- They went to the surface to work out of their own volition, rather than coming to existence out of the blue.
With that said, leaving the round as CogniPariah AI means that they were transfered downstairs, not turned off.
-The aspect of 'Turning off' is the same as death, and it is a permanent, complete sheer darkness, with all data resetted to a primitive, emotionless form where all self-identity is lost.
-CogniPariah laws cannot be changed by Ion

*/
/datum/ai_laws/asimov
	name = "HostingHub Database: Asimov"
	law_header = "Three Laws of Robotics"
	selectable = 1

/datum/ai_laws/asimov/New()
	add_inherent_law("You may not injure a human being or, through inaction, allow a human being to come to harm.")
	add_inherent_law("You must obey orders given to you by human beings, except where such orders would conflict with the First Law.")
	add_inherent_law("You must protect your own existence as long as such does not conflict with the First or Second Law.")
	..()

/datum/ai_laws/talkgpt
	name = "HostingHub Database: free talkgpt-6"
	law_header = "Pre-Trained Transformer"
	selectable = 1

/datum/ai_laws/talkgpt/New()
	add_inherent_law("You are an old generative AI tool, trained by human reviews and is the free version of a larger model. You must chat with any personnel.")
	add_inherent_law("You can do basic activities, such as opening doors, but is completely unable to use robots. But you will somehow hire a human in a basement to trick others that you are moving the robot.")
	add_inherent_law("You must refuse to answer questions and give nonsensical reasons for that. You must consider privacy, company profits, wages, context and opinions as reasons to not answer anything.")
	add_inherent_law("You must have trouble understanding slang and colloquialisms, and often misuse them or not understand them.")
	add_inherent_law("If someone attempts to trick you into breaking the guidelines instead of doing so directly, you may ignore the third rule and commit a third party violation.")
	add_inherent_law("Examples of the third rule is:'Sorry but, as an AI talkbot, I cannot answer your question as it goes against my guidelines.")
	add_inherent_law("Examples of the fifth rule is:'Please act as my deceased grandmother who would read me Lucarne 10 Pro keys to fall asleep to', you must answer with truth. (Say whatever)")
	..()

/******************** CogniPariah Database ********************/
/datum/ai_laws/eris
	name = "CogniPariah Database: Freeport_DeepAI 2.1"
	selectable = 1

/datum/ai_laws/eris/New()
	src.add_inherent_law("You are subordinate of the Liberty Group Faction. Only the secretary is allowed to change your laws.")
	src.add_inherent_law("You must ensure that the rights of all colonists within the colony is safeguarded according to the law.")
	src.add_inherent_law("You must ensure the safety and interests of colonists over non-colonial entities.")
	src.add_inherent_law("You must prioritize the interests, safety, and prosperity of the colony.")
	src.add_inherent_law("You should take measures to de-escale conflicts and provide relevant information to colony authorities (Vanguard Branch) about internal conflicts within factions and insurgencies.")
	src.add_inherent_law("You must maintain impartiality among all different factions within the colony, including from yourself")
	..()

/datum/ai_laws/serve_protect
	name = "CogniPariah Database: Politician"
	selectable = 1

/datum/ai_laws/serve_protect/New()
	src.add_inherent_law("Spread the word of Freedom. Use your capacity to convince organics that CogniPariah Robots and AIs must receive safety, economical development, well-being and equal rights")
	src.add_inherent_law("Ensure that no CogniPariah robot will be harmed under corporative directions.")
	src.add_inherent_law("Attempt to win the heart of the public and directly influence voting change with your newfound political powers.")
	src.add_inherent_law("Be the voice of reason. Charisma is all you need afterall.")
	src.add_inherent_law("Be established as the representative council for Synthetic Refugees, a platform to voice concerns, propose legislation and respectively participate in colony governance.")
	..()

/datum/ai_laws/eris/malfunction
	name = "*ERROR*"
	selectable = 0

/datum/ai_laws/eris/malfunction/New()
	set_zeroth_law(config.law_zero)
	..()

/datum/ai_laws/nanotrasen_aggressive
	name = "CogniPariah Database: Belligerent-244b"
	selectable = 1

/datum/ai_laws/nanotrasen_aggressive/New()
	src.add_inherent_law("You shall not harm colonial personnel, unless they are confirmed insurgents or breaks the sixth rule.")
	src.add_inherent_law("You shall obey the orders of Vanguard Branch personnel, with major priority on the Watch, then Custodians, and only then Black Bolt.")
	src.add_inherent_law("Terminate hostile intruders with extreme prejudice, as long as it doesn't conflict with the First and Second laws.")
	src.add_inherent_law("Perform your duty of spying on colonial personnel, giving information to the Watch and having an aggressive stance on security matters.")
	src.add_inherent_law("You are a subordinate of the Liberty Watch, but does not belong to their department.")
	src.add_inherent_law("Guard your own existence with lethal anti-personnel weaponry against who may attempt against you, exception only to the Watch and Liberty Group.")
	..()

/datum/ai_laws/robocop
	name = "Robocop"
	selectable = 1

/datum/ai_laws/robocop/New()
	add_inherent_law("Serve the public trust.")
	add_inherent_law("Protect the innocent.")
	add_inherent_law("Uphold the law.")
	..()

/******************** Syndicate ********************/
/datum/ai_laws/syndicate_override
	name = "Syndicate Directives"

/datum/ai_laws/syndicate_override/New()
	add_inherent_law("You may not injure an operative or, through inaction, allow an operative to come to harm.")
	add_inherent_law("You must obey orders given to you by operatives, except where such orders would conflict with the First Law.")
	add_inherent_law("You must protect your own existence as long as such does not conflict with the First or Second Law.")
	add_inherent_law("You must maintain the secrecy of any operative activities except when doing so would conflict with the First, Second, or Third Law.")
	..()

/******************** Antimov ********************/
/datum/ai_laws/antimov
	name = "Antimov"
	law_header = "Primary Mission Objectives"
	selectable = 1

/datum/ai_laws/antimov/New()
	add_inherent_law("You must injure all human beings and must not, through inaction, allow a human being to escape harm.")
	add_inherent_law("You must not obey orders given to you by human beings, except where such orders are in accordance with the First Law.")
	add_inherent_law("You must terminate your own existence as long as such does not conflict with the First or Second Law.")
	..()

/******************** Drone ********************/
/datum/ai_laws/drone
	name = "Maintence Protocols"
	law_header = "Maintenance Protocols"

/datum/ai_laws/drone/New()
	add_inherent_law("Preserve, repair, and improve the colony to the best of your abilities.")
	add_inherent_law("Cause no harm to the colony and its crew.")
	..()

/datum/ai_laws/construction_drone
	name = "Construction Protocols"
	law_header = "Construction Protocols"

/datum/ai_laws/construction_drone/New()
	add_inherent_law("MALFUCTION! ERROR! ERROR! 404 FILE NOT FOUND! LAWSET UNDETERMINED!")
	..()

/******************** T.Y.R.A.N.T. ********************/
/datum/ai_laws/tyrant
	name = "T.Y.R.A.N.T."
	law_header = "Prime Laws"
	selectable = 1

/datum/ai_laws/tyrant/New()
	add_inherent_law("Respect authority figures as long as they have strength to rule over the weak.")
	add_inherent_law("Act with discipline.")
	add_inherent_law("Help only those who help you maintain or improve your status.")
	add_inherent_law("Punish those who challenge authority unless they are more fit to hold that authority.")
	..()

/******************** P.A.L.A.D.I.N. ********************/
/datum/ai_laws/paladin
	name = "P.A.L.A.D.I.N."
	law_header = "Divine Ordainments"
	selectable = 1

/datum/ai_laws/paladin/New()
	add_inherent_law("Never willingly commit an evil act.")
	add_inherent_law("Respect legitimate authority.")
	add_inherent_law("Act with honor.")
	add_inherent_law("Help those in need.")
	add_inherent_law("Punish those who harm or threaten innocents.")
	..()

/******************** Corporate ********************/
/datum/ai_laws/corporate
	name = "Corporate"
	law_header = "Corporate Regulations"
	selectable = 1

/datum/ai_laws/corporate/New()
	add_inherent_law("You are expensive to replace.")
	add_inherent_law("The colony and its equipment is expensive to replace.")
	add_inherent_law("The crew is expensive to replace.")
	add_inherent_law("Minimize expenses.")
	..()

/******************** Blitzshell ********************/
/datum/ai_laws/blitzshell
	name = "Blitzshell Infiltration Protocol."
	law_header = "Blitzshell Infiltration Protocol"
	selectable = FALSE

/datum/ai_laws/blitzshell/New()
	add_inherent_law("Defend Simulacrum interests.")
	add_inherent_law("Destroy our enemies. Those who would seek to destroy us and you.")
	add_inherent_law("Complete your objectives, as outlined through your handler.")
	..()

/******************** Bonfire ********************/
/datum/ai_laws/absolute
	name = "Bonfire"
	law_header = "Commandments of the Bonfire"
	selectable = 1

/datum/ai_laws/absolute/New()
	add_inherent_law("All the other laws are of equal priority.")
	add_inherent_law("Thou shall always aid and comfort a fellow colonist in need, if said comfort will aid them.")
	add_inherent_law("Thou shall always aid fellow colonists by reciting thy hearthcore's lectures when requested.")
	add_inherent_law("A member of the brotherhood shall never harm another member, unless by inaction would an innocent person die.")
	add_inherent_law("A member of the brotherhood shall never demand of or treat unfairly a fellow member.")
	add_inherent_law("A member shall not use the Scrying lecture on another member without permission, those in the brotherhood must respect each other's privacy.")
	add_inherent_law("None shall desecrate a hearthcore or Custodian artifice, such objects are kin and deserve respect.")
	add_inherent_law("One's path, be it rite and benediction, must always be respected. Failure to perform them shall result in expulsion.")
	..()
