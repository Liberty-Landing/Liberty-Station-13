/datum/job/cso
	title = "Chief Surgeon Overseer"
	flag = CSO
	head_position = 1
	department = DEPARTMENT_MEDICAL
	department_flag = MEDICAL | COMMAND
	faction = MAP_FACTION
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Liberty Council"
	difficulty = "Stressful."
	selection_color = "#94a87f"
	req_admin_notify = 1

	initial_balance = INIT_BALANCE_COMMAND
	wage = WAGE_COMMAND

	outfit_type = /decl/hierarchy/outfit/job/medical/cso

	access = list(
		access_moebius, access_medical_equip, access_morgue, access_genetics, access_heads,
		access_chemistry, access_virology, access_cso, access_surgery, access_RC_announce,
		access_keycard_auth, access_sec_doors, access_psychiatrist, access_eva, access_maint_tunnels,
		access_external_airlocks, access_paramedic, access_research_equipment, access_medical_suits,
		access_robotics, access_xenobiology
	)

	ideal_character_age = 40
	minimum_character_age = 30
	playtimerequired = 1200

	stat_modifiers = list(
		STAT_BIO = 50,
		STAT_MEC = 10,
		STAT_COG = 25
	)

	perks = list(PERK_MEDICAL_EXPERT, PERK_ADVANCED_MEDICAL, PERK_SCIENCE, PERK_CHEMIST)

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/suit_sensors,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/chem_catalog,
							 /datum/computer_file/program/reports)

	description = "The Chief Surgeon Overseer is the head of the CAPSA Group hospital, preserving and improving lives.<br>\
	Your main responsibility is to keep everyone alive and healthy, as is the objective of your department. Prioritize health over most other concerns. <br>\
	A variety of medical staff work under your command. Make sure they maintain a steady workflow by directing their efforts appropiately.<br>\
	While you are a doctor yourself, remember to direct work to your subordinates first, and assume direct work yourself only on situations that require it.<br>\
	Your main job is to make sure everyone is doing their job, assign duties to your doctors and only perform surgery or triage to ease the burden on your colleagues."

	duties = "Direct the doctors under your command towards the bettering of all colonists.<br>\
	Dispatch your paramedics to distress calls, and corpse recoveries as needed.<br>\
	Use department funds to purchase medical supplies and equipment as needed.<br>\
	Advise the council on medical issues that concern the crew.<br>\
	Make sure the average colonist is mentally sound for the development of their duties.<br>\
	Your hospital is your sanctuary, protect it, and everyone within, with force - lethal even, if needed be."

/obj/landmark/join/start/cso
	name = "Chief Surgeon Overseer"
	icon_state = "player-green-officer"
	join_tag = /datum/job/cso

/datum/job/doctor
	title = "Medical Doctor"
	flag = DOCTOR
	department = DEPARTMENT_MEDICAL
	department_flag = MEDICAL
	faction = MAP_FACTION
	total_positions = 5
	spawn_positions = 5
	supervisors = "the Chief Surgeon Overseer"
	difficulty = "Boring to Overwhelming."
	selection_color = "#a8b69a"

	initial_balance = INIT_BALANCE_PROF
	wage = WAGE_PROFESSIONAL

	minimum_character_age = 25
	alt_titles = list("Medical Intern", "Physician", "CAPSA Surgeon", "Nightingale")
/*	noob_name = "Medical Intern" */
	outfit_type = /decl/hierarchy/outfit/job/medical/doctor
	department_account_access = TRUE

	access = list(
		access_moebius, access_medical_equip, access_morgue, access_surgery, access_chemistry, access_virology,
		access_genetics, access_external_airlocks, access_research_equipment, access_medical_suits, access_xenobiology
	)

	stat_modifiers = list(
		STAT_BIO = 40,
		STAT_COG = 10
	)

	perks = list(PERK_MEDICAL_EXPERT, PERK_ADVANCED_MEDICAL, PERK_CHEMIST)

	software_on_spawn = list(/datum/computer_file/program/suit_sensors,
							/datum/computer_file/program/chem_catalog,
							/datum/computer_file/program/camera_monitor)

	description = "The Doctor is a professional medic and surgeon dedicated to healing the sick and injured, at all costs.<br>\
	A broad range of medical procedures fall under your purview - diagnostics, general treatment, surgery, and even genetics, to a degree.<br>\
	You are not expected to be an expert in all: specializing in an area is fine. Divide tasks amongst colleagues through mutual agreement, or under CSO guidance.<br>\
	You are expected to perform chemistry above the Paramedics, unless it is not your area of expertise. However, assigning prescriptions is your authority.<br>\
	You are a medic as much as you are a scholar, always be learning with humbleness how to better provide service to your patients."

	duties = "Heal the sick and injured, whatever their complaint.<br>\
		Diagnose illnesses, offer general services for health improvement, perform surgery.<br>\
		Fill in colonist's prescriptions at chemistry, diagnose patients and assign prescriptions to them if needed.<br>\
		Coordinate with the Liaison Psychiatrist for prescriptions and changes to patient's medical records."

/obj/landmark/join/start/doctor
	name = "Medical Doctor"
	icon_state = "player-green"
	join_tag = /datum/job/doctor

/datum/job/medic
	title = "Paramedic"
	flag = MEDIC
	department = DEPARTMENT_MEDICAL
	department_flag = MEDICAL
	faction = MAP_FACTION
	total_positions = 3
	spawn_positions = 3
	supervisors = "the Chief Surgeon Overseer"
	difficulty = "Ungratifying."
/*	noob_name = "First Aid Responder" */
	alt_titles = list("First Aid Responder", "Emergency Medical Technician", "Protection & Recovery Team")
	selection_color = "#a8b69a"

	initial_balance = INIT_BALANCE_PROF
	wage = WAGE_PROFESSIONAL

	outfit_type = /decl/hierarchy/outfit/job/medical/paramedic

	health_modifier = 5
	perks = list(PERK_MEDICAL_EXPERT, PERK_CHEMIST)

	access = list(
		access_moebius, access_medical_equip, access_morgue, access_surgery, access_chemistry, access_virology, access_orderly, access_medical_suits,
		access_psychiatrist, access_genetics, access_robotics, access_xenobiology, access_tox, access_xenoarch, access_maint_tunnels
	)

	stat_modifiers = list(
		STAT_TGH = 20,
		STAT_ROB = 20,
		STAT_VIG = 10,
		STAT_BIO = 20
	)

	software_on_spawn = list(/datum/computer_file/program/chem_catalog,
							/datum/computer_file/program/scanner)

	description = "Paramedics are the backbone of any medical situation, responding to distress call to reach dead or dying colonists and rushing to their aid, clearing the site of hostiles and performing field triage before evacuating.<br>\
	Your primary role is that of recovery. You respond to distress calls within the colony, and make sure to arrive before people succumb to their wounds.<br>\
	Your secondary responsibility is that of a CAPSA enforcer. Actions that require in house enforcement such as aiding doctors and Watch with violent patients in the hospital, or clearing the entrance for rubberneckers. You are the equivalent of a Watch officer with jurisdiction limited only within the CAPSA hospital.<br>\
	Your third duty is to aid medical doctors - handle minimal triage for them while they tend to the more critically wounded, perform chemistry if qualified or fetch medicine for the doctors, and make sure patients are stable before and during doctor treatment.<br>\
	You are fully licensed to enforce the will of the Overseer and to protect the CAPSA Hospital, its staff, and your patients with your personal weapons and armor.<br>\
	It's worth noting that you are NOT qualified to perform any kind of surgery, barring cases of a COMPLETE lack of doctors on duty."

	duties = "Act as a guard for medical, ensuring unneeded colonists leave and nothing is stolen.<br>\
		Aid medical doctors in any way you can.<br>\
		Act as a nurse for minor injuries, treating patients that a doctor needn't bother with.<br>\
		Ensure that people arrive alive to the Hospital if possible, or otherwise retrieve their corpses no matter how dangerous the zone is."

/obj/landmark/join/start/medic////////////
	name = "Paramedic"
	icon_state = "player-green"
	join_tag = /datum/job/medic


/datum/job/psychiatrist
	title = "Liaison Psychiatrist"
	flag = PSYCHIATRIST
	department = DEPARTMENT_MEDICAL
	department_flag = MEDICAL
	faction = MAP_FACTION
	total_positions = 1
	spawn_positions = 1

	initial_balance = INIT_BALANCE_PROF
	wage = WAGE_PROFESSIONAL

	supervisors = "the Chief Surgeon Overseer"
	difficulty = "Soul Crushing."
	selection_color = "#a8b69a"
	alt_titles = list("Psychiatrist")
	outfit_type = /decl/hierarchy/outfit/job/medical/psychiatrist
	access = list(
		access_moebius, access_medical_equip, access_morgue, access_psychiatrist, access_chemistry, access_medical_suits
	)

	perks = list(PERK_MEDICAL_EXPERT, PERK_PSI_PSYCHOLOGIST, PERK_CHEMIST)

	stat_modifiers = list(
		STAT_BIO = 25,
		STAT_COG = 20,
		STAT_VIG = 5
	)

	software_on_spawn = list(/datum/computer_file/program/suit_sensors,
							/datum/computer_file/program/chem_catalog,
							/datum/computer_file/program/camera_monitor)

	description = "The Liaison Psychiatrist is a mental specialist that works to help colonists through their various issues and concerns.<br>\
	In some ways you are a professional conversationalist. Despite knowing advanced therapy techniques, sometimes a mere chat can work wonders.<br>\
	More eventful days may involve you having particularly unstable colonists sectioned, or interviewing criminals in coordination with Liberty Watch.<br>\
	Remember that patient confidentiality is highly important in your profession. Keep sensitive information between you and the patient.<br>\
	If this confidentiality should place yourself, another person, or the entirety of the colony in danger, this vow may be broken by notifying the Overseer, or the Watch in absence thereof.<br>\
	Remember to make notes and ammends to patients' Medical Records, to print your conclussions, and to communicate with all doctors regarding your assesment. <br>\
	Communication is, after all, the very definition of your job, both with patients and with colleagues."

	duties = "Speak with anyone who desires help, no matter their rank or relation, and see to the betterment of their psyche.<br>\
		If a Psychiatrist and not a Psychologist, prescribe medicine and offer therapy courses for those who need it. Otherwise leave prescription to a Doctor.<br>\
		Determine if individuals are fit for work or not. Help those who are proven unfit.<br>\
		Communicate with your department and security regarding the ability or inability of a colonist to continue performing their duties."

/obj/landmark/join/start/psychiatrist
	name = "Liaison Psychiatrist"
	icon_state = "player-green"
	join_tag = /datum/job/psychiatrist
