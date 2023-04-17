/obj/item/organ/internal/voicebox
	name = "vocal chords"
	icon_state = "voicebox"
	parent_organ_base = BP_CHEST
	organ_tag = BP_VOICE
	var/list/assists_languages

/obj/item/organ/internal/voicebox/Initialize()
	. = ..()
	var/list/language_datums = list()
	if(LAZYLEN(assists_languages))
		for(var/L in assists_languages)
			var/lang = all_languages[L]
			if(lang) language_datums[lang] = TRUE
	assists_languages = language_datums

/obj/item/organ/internal/voicebox/opifex
	name = "opifex vocal synthesiser"
	nature = MODIFICATION_SILICON //We robot
	assists_languages = list(LANGUAGE_COMMON, LANGUAGE_SYNTHETIC)
