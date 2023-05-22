// What is the tool powered by?
#define REQ_FUEL 1
#define REQ_CELL 2
#define REQ_FUEL_OR_CELL 4

// Aspect defines
#define UPGRADE_PRECISION "precision"
#define UPGRADE_WORKSPEED "workspeed"
#define UPGRADE_DEGRADATION_MULT "degradation_mult"
#define UPGRADE_FORCE_MULT "force_mult"
#define UPGRADE_FORCE_MOD "force_mod"
#define UPGRADE_FUELCOST_MULT "fuelcost_mult"
#define UPGRADE_POWERCOST_MULT "powercost_mult"
#define UPGRADE_BULK "bulk_mod"
#define UPGRADE_HEALTH_THRESHOLD "health_threshold_modifier"
#define UPGRADE_MAXFUEL "max_fuel"
#define UPGRADE_MAXUPGRADES "max_upgrades"

#define UPGRADE_SANCTIFY "sanctify" // For now it does not cause additional damage to mutants despite description
#define SANCTIFIED "saint" // Currently unused until ported from Eris. Would do additional damage to Carrion and players with mutations.

// Takes HEX color codes. Paints the item on color defined on toolmod.
#define UPGRADE_COLOR "color"

// Boolean
#define UPGRADE_SHARP "sharp"
#define UPGRADE_CELLPLUS "cell_hold_upgrade"
#define UPGRADE_CELLMINUS "cell_down_size"

// Adds the flag to the item. Flags defined on items_clothing.dm
#define UPGRADE_ITEMFLAGPLUS "item_flag_add"


/* ------------ SOJ ARMOR MODIFIERS START -------------- */

// Takes float values (additive)
#define UPGRADE_MELEE_ARMOR "melee"
#define UPGRADE_BALLISTIC_ARMOR "bullet"
#define UPGRADE_ENERGY_ARMOR "energy"
#define UPGRADE_BOMB_ARMOR "bomb"

// Boolean
#define UPGRADE_ALLOW_SIMULACRUM_MODS "allow_sm"
#define GUN_UPGRADE_ALLOW_SIMULACRUM_MODS "allow_sm_gun"
#define GUN_UPGRADE_CHEM "gives_bullet_chems"

// Takes reagent ID
#define GUN_UPGRADE_CHEMICAL "chemical_we_give"


/* ----------- END OF SOJ ARMOR MODIFIERS -------------- */


/*****************************/
/* CLOTHING MODIFIER DEFINES */
/*****************************/

// Takes float values (additive)
#define UPGRADE_STIFFNESS_ARMOR "stiffness" // Recoil caused by moving while shooting and wearing this
#define UPGRADE_OBSCURATION_ARMOR "obscuration" // Accuracy decreased while wearing this
#define UPGRADE_SLOWDOWN_ARMOR "slowdown" // How slower we move while wearing this. Negative values reduce slowdown.


/**************************/
/* WEAPON UPGRADE DEFINES */
/**************************/

// Takes float values (multiplicative)
#define GUN_UPGRADE_DAMAGE_MULT "damage_mult"
#define GUN_UPGRADE_PEN_MULT "penetration_mult"
#define GUN_UPGRADE_PIERC_MULT "pierce_mult"
#define GUN_UPGRADE_FIRE_DELAY_MULT "fire_delay_mult"
#define GUN_UPGRADE_MOVE_DELAY_MULT "move_delay_mult"
#define GUN_UPGRADE_RECOIL "recoil_mult"
#define GUN_UPGRADE_ONEHANDPENALTY "onehandpenalty_mult"
#define GUN_UPGRADE_MUZZLEFLASH "muzzleflash_mult"
#define GUN_UPGRADE_STEPDELAY_MULT "stepdelay_mult"
#define GUN_UPGRADE_CHARGECOST "chargecost_mult"
#define GUN_UPGRADE_OVERCHARGE_MAX "overcharge_max_mult"
#define GUN_UPGRADE_OVERCHARGE_RATE "overcharge_rate_mult"
#define GUN_UPGRADE_MELEE_DAMAGE "melee_damage"

// Takes float values (additive)
#define GUN_UPGRADE_PAIN_MULT "pain_damage_plus"
#define GUN_UPGRADE_DAMAGE_BRUTE "brute_damage"
#define GUN_UPGRADE_DAMAGE_BURN "burn_damage"
#define GUN_UPGRADE_DAMAGE_TOX "toxin_damage"
#define GUN_UPGRADE_DAMAGE_OXY "oxygen_damage"
#define GUN_UPGRADE_DAMAGE_CLONE "clone_damage"
#define GUN_UPGRADE_DAMAGE_HALLOSS "hallucination_damage"
#define GUN_UPGRADE_DAMAGE_RADIATION "radiation_damage"
#define GUN_UPGRADE_MAGUP "magazine_addition"
#define GUN_UPGRADE_OFFSET "offset" //Constant offset, in degrees
#define GUN_UPGRADE_ZOOM "zoom" // Suggested to use integers if possible.
								//See Gun.dm commentary below initial_zoom_factors var definition for guidelines.

// Boolean
#define GUN_UPGRADE_SILENCER "silencable"
#define GUN_UPGRADE_FORCESAFETY "safety force"
#define GUN_UPGRADE_HONK "why"
#define GUN_UPGRADE_FULLAUTO "full auto"
#define GUN_UPGRADE_EXPLODE "self destruct"
#define GUN_UPGRADE_RAIL "barrel rail adapter" // Unused as the rail attachment is commented out as of 4/2023
#define GUN_UPGRADE_RIGGED "rigged"
#define GUN_UPGRADE_AUTOEJECT "autoeject"
#define GUN_UPGRADE_CELLMINUS "small cell adapter"
#define GUN_UPGRADE_THERMAL "thermal scope"
#define GUN_UPGRADE_DNALOCK "biocoded"
#define GUN_UPGRADE_FOREGRIP "foregrip" // Makes a gun unable to be braced
#define GUN_UPGRADE_BIPOD "bipod"
#define GUN_UPGRADE_FLASHLIGHT "flashlight"

// Gun mods location defines

#define GUN_UNDERBARREL "underbarrel slot"
#define GUN_BARREL "barrel slot"
#define GUN_TRIGGER "trigger slot"
#define GUN_MUZZLE "muzzle slot"
#define GUN_SCOPE "scope slot"
#define GUN_MECHANISM "mechanism slot"
#define GUN_GRIP "grip slot"
#define GUN_KNIFE "knife slot"
#define GUN_MAGWELL "magwell slot"
#define GUN_SIGHT "sight slot"

// Whitelist Tag defines
#define GUN_SILENCABLE "silencable"
#define GUN_PROJECTILE "projectile firing"
#define GUN_ENERGY "energy firing"
#define GUN_LASER "laser firing"
#define GUN_REVOLVER "revolver"
#define GUN_INTERNAL_MAG "internal mag"
#define GUN_BAYONET "bayonet"
#define ARROW_FIRING "fires arrows"
#define GUN_AMR "caliber 14.5mm" // Currently unused

// Weight-based list that gets weight-picked between it, and a stash spawner through Shipbreaker perk
#define RANDOM_RARE_ITEM list(\
					/obj/random/common_oddities/always_spawn = 6,\
					/obj/random/material_rare/always_spawn = 3,\
					/obj/random/tool/advanced/always_spawn = 5,\
					/obj/item/storage/firstaid/regular = 2,\
					/obj/random/medical/always_spawn = 5,\
					/obj/random/gun_normal/always_spawn = 3,\
					/obj/random/gun_fancy/alawys_spawn = 2,\
					/obj/random/lathe_disk/advanced = 2,\
					/obj/item/cell/small/moebius/nuclear = 1,\
					/obj/item/cell/medium/moebius/hyper = 1,\
					/obj/random/rig/always_spawn = 1.5,\
					/obj/item/material/butterfly/frenchman = 0.1,/*insanely rare due to being shit in general. A butterfly with extra backstab damage.*/\
					/obj/random/rig/damaged/always_spawn = 1.5,\
					/obj/random/pouch/hardcase = 4,\
					/obj/random/voidsuit = 4,\
					/obj/random/pouch = 2,\
					/obj/random/tool_upgrade/rare/always_spawn = 4,\
					/obj/random/rig_module/rare/always_spawn = 4,\
					/obj/random/credits/c1000 = 3,\
					/obj/item/stash_spawner = 1)


GLOBAL_LIST_INIT(tool_aspects_blacklist, list(UPGRADE_COLOR, UPGRADE_ITEMFLAGPLUS, UPGRADE_CELLPLUS, UPGRADE_SHARP, UPGRADE_BULK))
GLOBAL_LIST_INIT(weapon_aspects_blacklist, list(GUN_UPGRADE_SILENCER, GUN_UPGRADE_FORCESAFETY, GUN_UPGRADE_HONK, GUN_UPGRADE_FULLAUTO,
											GUN_UPGRADE_EXPLODE, GUN_UPGRADE_RIGGED, UPGRADE_SANCTIFY, GUN_UPGRADE_AUTOEJECT))

