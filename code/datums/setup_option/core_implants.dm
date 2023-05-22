
/datum/category_item/setup_option/core_implant/cruciform
	name = "Hearthcore"
	desc = "The implant given to every member of the Bonfire. Uses the nanobot substance known as Radiance to perform various feats."
	implant_type = /obj/item/implant/core_implant/cruciform
	restricted_jobs = list(
		/datum/job/clubmanager,
		/datum/job/dc,
		/datum/job/shepherd,
		/datum/job/rp,
		/datum/job/cso,
		/datum/job/chief_engineer,
		/datum/job/dc,
		/datum/job/outsider,
		/datum/job/cyborg, //To stop people auto dropping these
		/datum/job/ai
		)
	allowed_depts = CHURCH
	allow_modifications = TRUE
	restricted_to_species = list(FORM_HUMAN, FORM_SABLEKYNE, FORM_KRIOSAN, FORM_AKULA, FORM_MARQUA, FORM_NARAMAD, FORM_OPIFEX, FORM_CINDAR)
/*
/datum/category_item/setup_option/core_implant/psionic_tumor
	name = "Psionic Organ"
	desc = "An unusual organ implanted by the Phokorus Institute of research or obtained through other methods. It is presently unknown what it is truly capable of and psions are entirely unknown outside of Liberty. \
	Those with this organ must maintain purity of their bodies, any implants, cruciforms, or synthetic limbs will be violently and painfully rejected while this organ exists in the body."
	implant_organ_type = "psionic tumor"
	restricted_jobs = list(
		/datum/job/outsider //Psions are only available to colonist or allies.
		)
	allow_modifications = FALSE
	restricted_to_species = list(FORM_HUMAN, FORM_SABLEKYNE, FORM_KRIOSAN, FORM_AKULA, FORM_MARQUA, FORM_NARAMAD, FORM_CINDAR, FORM_CHTMANT)

/datum/category_item/setup_option/core_implant/psionic_tumor_psychiatrist
	name = "Cultured Psionic Organ"
	desc = "An unusual organ implanted by the Phokorus Institute of research or obtained through other methods. It is presently unknown what it is truly capable of and psions are entirely unknown outside of Liberty. \
	Those with this organ must maintain purity of their bodies, any implants, cruciforms, or synthetic limbs will be violently and painfully rejected while this organ exists in the body. This \
	particular organ is the result of development while inside the brain of someone who understands the mind intimiately, offering them expanded powers and abilities when working as a CAPSA psych."
	implant_organ_type = "cultured tumor"
	restricted_jobs = list(
		/datum/job/doctor,
		/datum/job/medic,
		/datum/job/secretary,
		/datum/job/oathpledge,
		/datum/job/chief_engineer,
		/datum/job/clubmanager,
		/datum/job/rp,
		/datum/job/dc,
		/datum/job/dc,
		/datum/job/cyborg, //To stop people auto dropping these
		/datum/job/ai
	) // The way to restrict this to one job could be done cleaner but this way easier so fuck it. -Kaz
	allow_modifications = FALSE
	restricted_depts = SECURITY | PROSPECTORS | ENGINEERING | SCIENCE | CHURCH | INDEPENDENT | CIVILIAN | SERVICE
	restricted_to_species = list(FORM_HUMAN, FORM_SABLEKYNE, FORM_KRIOSAN, FORM_AKULA, FORM_MARQUA, FORM_NARAMAD, FORM_CINDAR, FORM_CHTMANT)

/datum/category_item/setup_option/core_implant/nanogate
	name = "Nanogate"
	desc = "A custom built nanogate designed from the far superior opifex blueprints. It is implanted right where the spine meets the skull and provides a wide variety of nanite based uses."
	implant_organ_type = "nanogate"
	restricted_jobs = list(
		/datum/job/outsider // Nanogates are only available to colonist or allies.
		)
	allow_modifications = TRUE
	restricted_to_species = list(FORM_HUMAN, FORM_SABLEKYNE, FORM_KRIOSAN, FORM_AKULA, FORM_MARQUA, FORM_NARAMAD, FORM_CINDAR, FORM_TERRAYNTH)

/datum/category_item/setup_option/core_implant/artificer_nanogate
	name = "Union Nanogate"
	desc = "A custom built nanogate designed from the far superior opifex blueprints. It is implanted right where the spine meets the skull and provides a wide variety of nanite based uses. This \
	particular design is made by the Terra-Therma Worker's Union, able to store more nanites for additional uses."
	implant_organ_type = "Union nanogate"
	restricted_jobs = list(
		/datum/job/outsider, // Nanogates are only available to colonist or allies.
		/datum/job/secretary,
		/datum/job/oathpledge,
		/datum/job/cso,
		/datum/job/clubmanager,
		/datum/job/rp,
		/datum/job/dc,
		/datum/job/dc,
		/datum/job/cyborg, //To stop people auto dropping these
		/datum/job/ai
		)
	allow_modifications = TRUE
	restricted_to_species = list(FORM_HUMAN, FORM_SABLEKYNE, FORM_KRIOSAN, FORM_AKULA, FORM_MARQUA, FORM_NARAMAD, FORM_CINDAR, FORM_TERRAYNTH)
	restricted_depts = SECURITY | PROSPECTORS | MEDICAL | SCIENCE | CHURCH | INDEPENDENT | CIVILIAN | SERVICE

/datum/category_item/setup_option/core_implant/opifex_nanogate
	name = "Opifex Nanogate"
	desc = "A custom built nanogate designed from the far superior opifex blueprints. It is implanted right where the spine meets the skull and provides a wide variety of nanite based uses. This \
	particular design is an opifex original and one of the best that can be found in the galaxy."
	implant_organ_type = "opifex nanogate"
	restricted_jobs = list(
		/datum/job/outsider, // Nanogates are only available to colonist or allies.
		/datum/job/cyborg, //To stop people auto dropping these
		/datum/job/ai
		)
	allow_modifications = TRUE
	restricted_to_species = list(FORM_OPIFEX) // Opifex get their own fancy nanogate
*/

