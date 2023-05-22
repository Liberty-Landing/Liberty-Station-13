#define STAT_VALUE_DEFAULT	0
#define STAT_VALUE_MAXIMUM 150

#define STAT_WIL			"Willpower"
#define STAT_COG			"Cognition"
#define STAT_BIO			"Biology"
#define STAT_MEC			"Mechanical"
#define STAT_ROB			"Robustness"
#define STAT_TGH			"Toughness"
#define STAT_END			"Endurance"
#define STAT_VIG			"Vigilance"


#define ALL_STATS	list(STAT_WIL,STAT_COG,STAT_BIO,STAT_MEC,STAT_ROB,STAT_TGH,STAT_END,STAT_VIG)
#define ALL_STATS_LEVEL list(STAT_WIL,STAT_COG,STAT_BIO,STAT_MEC,STAT_ROB,STAT_TGH,STAT_VIG)
#define ALL_STATS_TO_IMPRINT list(STAT_COG,STAT_BIO,STAT_MEC,STAT_ROB,STAT_VIG) //So that people stop memeing the imprinter

#define STAT_LEVEL_NONE     0
#define STAT_LEVEL_BASIC    15
#define STAT_LEVEL_ADEPT    25
#define STAT_LEVEL_EXPERT   40
#define STAT_LEVEL_PROF     60
#define STAT_LEVEL_GODLIKE	80

#define STAT_LEVEL_MIN      0 // Min stat value selectable
#define STAT_LEVEL_MAX      60 // Max stat value selectable

/// Bitflag for shared perk abilities
#define PERK_SHARED_SEE_REAGENTS 0x1
#define PERK_SHARED_SEE_COMMON_REAGENTS 0x2
#define PERK_SHARED_SEE_ILLEGAL_REAGENTS 0x3

