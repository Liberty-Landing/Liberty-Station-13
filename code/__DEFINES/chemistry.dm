#define DEFAULT_HUNGER_FACTOR 0.2 // Factor of how fast mob nutrition decreases

#define REM 0.2 // Means 'Reagent Effect Multiplier'. This is how many units of reagent are consumed per tick

#define CHEM_TOUCH		1	// splashing
#define CHEM_INGEST		2	// ingestion
#define CHEM_BLOOD		3	// injection

// Atom reagent_flags
#define INJECTABLE		(1<<0)	// Makes it possible to add reagents through droppers and syringes.
#define DRAWABLE		(1<<1)	// Makes it possible to remove reagents through syringes.

#define REFILLABLE		(1<<2)	// Makes it possible to add reagents through any reagent container.
#define DRAINABLE		(1<<3)	// Makes it possible to remove reagents through any reagent container.

#define TRANSPARENT		(1<<4)	// For containers with fully visible reagents.
#define AMOUNT_VISIBLE	(1<<5)	// For non-transparent containers that still have the general amount of reagents in them visible.

#define NO_REACT        (1<<6)  // Applied to a reagent holder, the contents will not react with each other.


// Is an open container for all intents and purposes.
#define OPENCONTAINER 	(REFILLABLE | DRAINABLE | TRANSPARENT)


#define MINIMUM_CHEMICAL_VOLUME 0.01

#define SOLID			1
#define LIQUID			2
#define GAS				3

#define REAGENTS_OVERDOSE 30

#define REAGENTS_MIN_EFFECT_MULTIPLIER 0.2
#define REAGENTS_MAX_EFFECT_MULTIPLIER 2.5

#define CHEM_SYNTH_ENERGY 3000 // How much energy does it take to synthesize 1 unit of chemical, in Joules.

// Some on_mob_life() procs check for alien races.
#define IS_XENOS   1
#define IS_CHTMANT 2
#define IS_SYNTHETIC 3
#define IS_SLIME 4
#define IS_MARQUA 5
#define IS_KRIOSAN 6
#define IS_AKULA 7
#define IS_CINDERITE 8

#define CE_STABLE			"stable" // Stabilizes the body in many things, preventing death in many scenarios
#define CE_ANTIBIOTIC		"antibiotic" // Halts the stages of infection and decreases germ count, eventually eliminating infections
#define CE_BLOODRESTORE		"bloodrestore" // Enhanced blood restoration over time
#define CE_PAINKILLER		"painkiller" // The higher the value, the more damage you can sustain without slowdown or stuttering penalties.
#define CE_ALCOHOL			"alcohol" // Liver filtering
#define CE_ALCOHOL_TOXIC	"alcotoxic" // Liver damage
#define CE_SPEEDBOOST 		"gofast" // Makes you go faster
#define CE_SLOWDOWN 		"goslower" // Makes you go slower
#define CE_PULSE      		"xcardic" // Increases or decreases heart rate. Additive with PULSE_ definitions on mobs.dm defines.
#define CE_NOPULSE    		"heartstop" // Stops heartbeat, fake death or otherwise.
#define CE_MIND    		 	"mindbending"  // Stabilizes or wrecks mind. Used for hallucinations
#define CE_ANTITOX       	"antitox"      // Used for treating wounds of toxic nature and halting the side effects of certain toxins
#define CE_TOXIN         	"toxins"       // Generic toxins, stops autoheal.
#define CE_SPEECH_VOLUME	"speech_volume"    // speech volume multiplier , default volume is integer and equals 2
#define CE_BLOODCLOT		"bloodclot"	// Promote healing but thickens blood, slows and stops bleeding (range 0 - 1)
#define CE_OXYGENATED		"oxygen"       // Prevents suffocation damage by certain critical conditions
#define CE_PURGER			"purger"	// Stops addictions from progressing, temporarily purging them, also treats severe poisoning
#define CE_NOWITHDRAW		"no_withdrawal"
#define CE_VOICEMIMIC		"voice_mimic"
#define CE_DYNAMICFINGERS	"dynfingers" // Hides your fingerprints
#define CE_BONE_MEND		"bone mending"   	// Helps with restoring certain bone wounds
#define CE_ONCOCIDAL        "anticancer" // Helps fight radiation-induced internal wounds
#define CE_DARKSIGHT 		"darksight"	//Vision methods built into a mob.

// Chem effects for robotic/assisted organs
#define CE_MECH_STABLE 		"cooling"
#define CE_MECH_ACID 		"acid"
#define CE_MECH_LUBE		"lubrication"       // Unused
#define CE_MECH_REPAIR 		"nanite repair"     // Repair damage
#define CE_MECH_REPLENISH 	"nanite replenish"  // Replenish fluid, unused

// Reagent specific heat is not yet implemented, this is here for compatibility reasons
#define SPECIFIC_HEAT_DEFAULT			200
