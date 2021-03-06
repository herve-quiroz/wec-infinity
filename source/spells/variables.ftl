<#-- vim: set syntax=ftl: -->
<#-- Casting times for all spells -->

<#assign
  spellTypes = {
    "ATTACK":"attack",
    "BUFF":"buff",
    "CURE":"cure",
    "DEBUFF":"debuff",
    "HEALING":"healing"
  }
/>

<#assign
  spells = {
    "CLERIC_AID": { "castingTime":12, "message":0 },
    "CLERIC_ALICORN_LANCE": { "castingTime":5, "message":21421 },
    "CLERIC_ANIMAL_SUMMONING_I": { "castingTime":12, "message":0 },
    "CLERIC_ANIMAL_SUMMONING_II": { "castingTime":12, "message":0 },
    "CLERIC_ANIMAL_SUMMONING_III": { "castingTime":12, "message":0 },
    "CLERIC_ANIMATE_DEAD": { "castingTime":12, "message":0 },
    "CLERIC_BARKSKIN": { "castingTime":12, "message":0 },
    "CLERIC_BLADE_BARRIER": { "castingTime":9, "message":14262 },
    "CLERIC_BLESS": { "castingTime":"ONE_ROUND", "message":12089, "duration":"SIX_ROUNDS", "aoe":25 },
    "CLERIC_CALL_LIGHTNING": { "castingTime":"ONE_ROUND", "message":12124 },
    "CLERIC_CHAMPIONS_STRENGTH": { "castingTime":12, "message":0 },
    "CLERIC_CHANT": { "castingTime":"ONE_ROUND", "message":9186, "duration":"ONE_TURN", "aoe":30 },
    "CLERIC_CHAOTIC_COMMANDS": { "castingTime":3, "message":0 },
    "CLERIC_CHARM_PERSON_OR_MAMMAL": { "castingTime":12, "message":0 },
    "CLERIC_CIRCLE_OF_BONES": { "castingTime":3, "message":21417 },
    "CLERIC_CLOAK_OF_FEAR": { "castingTime":12, "message":0 },
    "CLERIC_COMMAND": { "castingTime":12, "message":0 },
    "CLERIC_CONFUSION": { "castingTime":12, "message":0 },
    "CLERIC_CONJURE_EARTH_ELEMENTAL": { "castingTime":12, "message":0 },
    "CLERIC_CONJURE_FIRE_ELEMENTAL": { "castingTime":12, "message":0 },
    "CLERIC_CREEPING_DOOM": { "castingTime":12, "message":0 },
    "CLERIC_CURE_CRITICAL_WOUNDS": { "castingTime":6, "message":12116, "type":spellTypes.HEALING },
    "CLERIC_CURE_DISEASE": { "castingTime":"ONE_ROUND", "message":6312 },
    "CLERIC_CURE_LIGHT_WOUNDS": { "castingTime":5, "message":6620, "type":spellTypes.HEALING },
    "CLERIC_CURE_MODERATE_WOUNDS": { "castingTime":6, "message":895, "type":spellTypes.HEALING },
    "CLERIC_CURE_SERIOUS_WOUNDS": { "castingTime":6, "message":12114, "type":spellTypes.HEALING },
    "CLERIC_CURSE": { "castingTime":"ONE_ROUND", "message":757, "duration":"SIX_ROUNDS" },
    "CLERIC_DEFENSIVE_HARMONY": { "castingTime":1, "message":22829, "duration":"SIX_ROUNDS", "aoe":10 },
    "CLERIC_DESTRUCTION": { "castingTime":"ONE_ROUND", "message":21393 },
    "CLERIC_DETECT_EVIL": { "castingTime":12, "message":0 },
    "CLERIC_DISPEL_MAGIC": { "castingTime":12, "message":0 },
    "CLERIC_DRAW_UPON_HOLY_MIGHT": { "castingTime":2, "message":12108, "duration":"ONE_TURN" },
    "CLERIC_EARTHQUAKE": { "castingTime":"ONE_ROUND", "message":21395 },
    "CLERIC_ENTANGLE": { "castingTime":12, "message":0 },
    "CLERIC_ENTROPY_SHIELD": { "castingTime":12, "message":0 },
    "CLERIC_EXALTATION": { "castingTime":"ONE_ROUND", "message":21414, "duration":"ONE_ROUND" },
    "CLERIC_FIND_TRAPS": { "castingTime":12, "message":0 },
    "CLERIC_FIRE_SEEDS": { "castingTime":12, "message":0 },
    "CLERIC_FIRE_STORM": { "castingTime":12, "message":0 },
    "CLERIC_FLAME_BLADE": { "castingTime":12, "message":0 },
    "CLERIC_FLAME_STRIKE": { "castingTime":8, "message":3236, "aoe":5 },
    "CLERIC_FREE_ACTION": { "castingTime":7, "message":12102 },
    "CLERIC_GIANT_INSECT": { "castingTime":12, "message":0 },
    "CLERIC_GLYPH_OF_WARDING": { "castingTime":12, "message":0 },
    "CLERIC_GOODBERRY": { "castingTime":12, "message":0 },
    "CLERIC_GREATER_SHIELD_OF_LATHANDER": { "castingTime":12, "message":21394 },
    "CLERIC_HARM": { "castingTime":"ONE_ROUND", "message":11205 },
    "CLERIC_HEAL": { "castingTime":"ONE_ROUND", "message":8786, "type":spellTypes.HEALING },
    "CLERIC_HOLD_ANIMAL": { "castingTime":12, "message":0 },
    "CLERIC_HOLD_PERSON": { "castingTime":3, "message":0 },
    "CLERIC_HOLY_SMITE": { "castingTime":3, "message":0, "aoe":20 },
    "CLERIC_IMPERVIOUS_SANCTITY_OF_MIND": { "castingTime":12, "message":0 },
    "CLERIC_INSECT_PLAGUE": { "castingTime":12, "message":0 },
    "CLERIC_INVISIBILITY_PURGE": { "castingTime":8, "message":12095 },
    "CLERIC_KNOW_ALIGNMENT": { "castingTime":12, "message":0 },
    "CLERIC_MAGICAL_STONE": { "castingTime":12, "message":0 },
    "CLERIC_MENTAL_DOMINATION": { "castingTime":12, "message":0 },
    "CLERIC_MISCAST_MAGIC": { "castingTime":5, "message":12103, "duration":"ONE_TURN" },
    "CLERIC_NEUTRALIZE_POISON": { "castingTime":12, "message":12115 },
    "CLERIC_PHYSICAL_MIRROR": { "castingTime":12, "message":0 },
    "CLERIC_PRAYER": { "castingTime":6, "message":1417, "aoe":30 },
    "CLERIC_PRODUCE_FIRE": { "castingTime":12, "message":0 },
    "CLERIC_PROTECTION_FROM_EVIL": { "castingTime":12, "message":0 },
    "CLERIC_PROTECTION_FROM_EVIL_10_RADIUS": { "castingTime":7, "message":12014, "duration":"SEVEN_TURNS", "aoe":10 },
    "CLERIC_PROTECTION_FROM_FIRE": { "castingTime":12, "message":0 },
    "CLERIC_PROTECTION_FROM_LIGHTNING": { "castingTime":12, "message":0 },
    "CLERIC_RAISE_DEAD": { "castingTime":12, "message":0 },
    "CLERIC_RECITATION": { "castingTime":7, "message":1914, "duration":"ONE_TURN", "aoe":30 },
    "CLERIC_REMOVE_CURSE": { "castingTime":12, "message":0 },
    "CLERIC_REMOVE_FEAR": { "castingTime":1, "message":9180, "duration":"ONE_TURN", "aoe":30 },
    "CLERIC_REMOVE_PARALYSIS": { "castingTime":6, "message":9191 },
    "CLERIC_RESIST_FIRE_AND_COLD": { "castingTime":12, "message":0 },
    "CLERIC_RESURRECTION": { "castingTime":12, "message":0 },
    "CLERIC_RIGHTEOUS_WRATH_OF_THE_FAITHFUL": { "castingTime":12, "message":2812 },
    "CLERIC_RIGID_THINKING": { "castingTime":12, "message":0 },
    "CLERIC_SANCUTARY": { "castingTime":12, "message":0 },
    "CLERIC_SHILLELAGH": { "castingTime":12, "message":0 },
    "CLERIC_SILENCE_15_RADIUS": { "castingTime":12, "message":0 },
    "CLERIC_SLAY_LIVING": { "castingTime":"ONE_ROUND", "message":6928 },
    "CLERIC_SLOW_POISON": { "castingTime":12, "message":9188 },
    "CLERIC_SOLS_SEARING_ORB": { "castingTime":6, "message":2840 },
    "CLERIC_SPIKE_STONES": { "castingTime":12, "message":0 },
    "CLERIC_SPIRITUAL_HAMMER": { "castingTime":12, "message":0 },
    "CLERIC_STATIC_CHARGE": { "castingTime":"ONE_ROUND", "message":1902 },
    "CLERIC_STRENGTH_OF_ONE": { "castingTime":12, "message":0 },
    "CLERIC_SUNRAY": { "castingTime":12, "message":0 },
    "CLERIC_SUNSCORCH": { "castingTime":4, "message":21425 },
    "CLERIC_SYMBOL_OF_HOPELESSNESS": { "castingTime":12, "message":0 },
    "CLERIC_SYMBOL_OF_PAIN": { "castingTime":12, "message":0 },
    "CLERIC_HEAVENLY_INFERNO": { "castingTime":12, "message":0 },
    "PALADIN_CURE_DISEASE": { "castingTime":0, "message":6312 },
    "PALADIN_LAY_ON_HANDS": { "castingTime":0, "message":12032 },
    "PALADIN_PROTECTION_FROM_EVIL": { "castingTime":0, "message":12023 },
    "PALADIN_SMITE_EVIL": { "castingTime":0, "message":26267 },
    "WIZARD_ABI_DALZIMS_HORRID_WILTING": { "castingTime":8, "message":7679, "aoe":30 },
    "WIZARD_ACID_STORM": { "castingTime":12, "message":0 },
    "WIZARD_AGANNAZAR_SCORCHER": { "castingTime":12, "message":0 },
    "WIZARD_ANIMATE_DEAD": { "castingTime":12, "message":0 },
    "WIZARD_ANIMATE_DEAD_LICH": { "castingTime":12, "message":0 },
    "WIZARD_ANTIMAGIC_SHELL": { "castingTime":12, "message":0 },
    "WIZARD_ARMOR": { "castingTime":"ONE_ROUND", "message":11997 },
    "WIZARD_BELTYNS_BURNING_BLOOD": { "castingTime":12, "message":0 },
    "WIZARD_BLINDNESS": { "castingTime":12, "message":0 },
    "WIZARD_BLUR": { "castingTime":12, "message":0 },
    "WIZARD_BURNING_HANDS": { "castingTime":1, "message":12074 },
    "WIZARD_CHAIN_LIGHTNING": { "castingTime":5, "message":7541 },
    "WIZARD_CHAOS": { "castingTime":12, "message":0 },
    "WIZARD_CHARM_PERSON": { "castingTime":12, "message":0 },
    "WIZARD_CHILL_TOUCH": { "castingTime":12, "message":0 },
    "WIZARD_CHROMATIC_ORB": { "castingTime":12, "message":0 },
    "WIZARD_CLOUDKILL": { "castingTime":12, "message":0 },
    "WIZARD_COLOR_SPRAY": { "castingTime":12, "message":0 },
    "WIZARD_CONE_OF_COLD": { "castingTime":12, "message":0 },
    "WIZARD_CONFUSION": { "castingTime":12, "message":0 },
    "WIZARD_CONJURE_EARTH_ELEMENTAL": { "castingTime":12, "message":0 },
    "WIZARD_CONJURE_FIRE_ELEMENTAL": { "castingTime":12, "message":0 },
    "WIZARD_CONJURE_WATER_ELEMENTAL": { "castingTime":12, "message":0 },
    "WIZARD_DEATH_FOG": { "castingTime":12, "message":0 },
    "WIZARD_DEATH_SPELL": { "castingTime":12, "message":0 },
    "WIZARD_DECASTAVE": { "castingTime":12, "message":0 },
    "WIZARD_DEMI_SHADOW_MONSTERS": { "castingTime":12, "message":0 },
    "WIZARD_DETECT_EVIL": { "castingTime":12, "message":0 },
    "WIZARD_DETECT_INVISIBILITY": { "castingTime":12, "message":0 },
    "WIZARD_DIMENSION_DOOR": { "castingTime":12, "message":0 },
    "WIZARD_DIRE_CHARM": { "castingTime":12, "message":0 },
    "WIZARD_DISINTEGRATE": { "castingTime":6, "message":2628 },
    "WIZARD_DISPEL_MAGIC": { "castingTime":12, "message":0 },
    "WIZARD_DOMINATION": { "castingTime":12, "message":0 },
    "WIZARD_EMOTION_COURAGE": { "castingTime":12, "message":0 },
    "WIZARD_EMOTION_FEAR": { "castingTime":12, "message":0 },
    "WIZARD_EMOTION_HOPE": { "castingTime":12, "message":0 },
    "WIZARD_EMOTION_HOPELESSNESS": { "castingTime":12, "message":0 },
    "WIZARD_FEEBLEMIND": { "castingTime":12, "message":0 },
    "WIZARD_FINGER_OF_DEATH": { "castingTime":5, "message":7559 },
    "WIZARD_FIREBALL": { "castingTime":3, "message":12059, "aoe":20 },
    "WIZARD_FLAME_ARROW": { "castingTime":3, "message":12034 },
    "WIZARD_FLESH_TO_STONE": { "castingTime":12, "message":0 },
    "WIZARD_FRIENDS": { "castingTime":12, "message":0 },
    "WIZARD_GHOST_ARMOR": { "castingTime":12, "message":0 },
    "WIZARD_GHOUL_TOUCH": { "castingTime":12, "message":0 },
    "WIZARD_GLOBE_OF_INVULNERABILITY": { "castingTime":12, "message":0 },
    "WIZARD_GREASE": { "castingTime":12, "message":0 },
    "WIZARD_GREATER_MALISON": { "castingTime":12, "message":0 },
    "WIZARD_HASTE": { "castingTime":3, "message":12080, "aoe":20 },
    "WIZARD_HOLD_MONSTER": { "castingTime":12, "message":0 },
    "WIZARD_HOLD_PERSON": { "castingTime":12, "message":0 },
    "WIZARD_HORROR": { "castingTime":12, "message":0 },
    "WIZARD_ICELANCE": { "castingTime":12, "message":0 },
    "WIZARD_ICE_STORM": { "castingTime":4, "message":6400, "aoe":20 },
    "WIZARD_IDENTIFY": { "castingTime":12, "message":0 },
    "WIZARD_IMPROVED_INVISIBILITY": { "castingTime":12, "message":0 },
    "WIZARD_INCENDIARY_CLOUD": { "castingTime":12, "message":0 },
    "WIZARD_INFRAVISION": { "castingTime":12, "message":0 },
    "WIZARD_INVISIBILITY": { "castingTime":12, "message":0 },
    "WIZARD_INVISIBLE_STALKER": { "castingTime":12, "message":0 },
    "WIZARD_KNOCK": { "castingTime":12, "message":0 },
    "WIZARD_KNOW_ALIGNMENT": { "castingTime":12, "message":0 },
    "WIZARD_LARLOCHS_MINOR_DRAIN": { "castingTime":12, "message":0 },
    "WIZARD_LICH_TOUCH": { "castingTime":12, "message":0 },
    "WIZARD_LIGHTNING_BOLT": { "castingTime":12, "message":0 },
    "WIZARD_LUCK": { "castingTime":12, "message":0 },
    "WIZARD_MAGIC_MISSILE": { "castingTime":1, "message":2968 },
    "WIZARD_MALAVONS_CORROSIVE_FOG": { "castingTime":12, "message":0 },
    "WIZARD_MALAVONS_RAGE": { "castingTime":12, "message":0 },
    "WIZARD_MASS_INVISIBILITY": { "castingTime":12, "message":0 },
    "WIZARD_MELFS_ACID_ARROW": { "castingTime":2, "message":12033 },
    "WIZARD_MIND_BLANK": { "castingTime":12, "message":0 },
    "WIZARD_MINOR_GLOBE_OF_INVULNERABILITY": { "castingTime":12, "message":0 },
    "WIZARD_MIRROR_IMAGE": { "castingTime":12, "message":0 },
    "WIZARD_MONSTER_SUMMONING_I": { "castingTime":12, "message":0 },
    "WIZARD_MONSTER_SUMMONING_II": { "castingTime":12, "message":0 },
    "WIZARD_MONSTER_SUMMONING_III": { "castingTime":12, "message":0 },
    "WIZARD_MONSTER_SUMMONING_IV": { "castingTime":12, "message":0 },
    "WIZARD_MONSTER_SUMMONING_V": { "castingTime":12, "message":0 },
    "WIZARD_MONSTER_SUMMONING_VI": { "castingTime":12, "message":0 },
    "WIZARD_MONSTER_SUMMONING_VII": { "castingTime":12, "message":0 },
    "WIZARD_MORDENKAINENS_FORCE_MISSILES": { "castingTime":4, "message":21435, "aoe":5 },
    "WIZARD_MORDENKAINENS_SWORD": { "castingTime":12, "message":0 },
    "WIZARD_NON_DETECTION": { "castingTime":12, "message":0 },
    "WIZARD_OTILUKES_FREEZING_SPHERE": { "castingTime":12, "message":0 },
    "WIZARD_OTILUKES_RESILIENT_SPHERE": { "castingTime":12, "message":0 },
    "WIZARD_POWER_WORD_BLIND": { "castingTime":1, "message":22144, "aoe":10 },
    "WIZARD_POWER_WORD_KILL": { "castingTime":1, "message":7587, "aoe":10 },
    "WIZARD_POWER_WORD_SILENCE": { "castingTime":12, "message":0 },
    "WIZARD_POWER_WORD_STUN": { "castingTime":12, "message":0 },
    "WIZARD_PRISMATIC_SPRAY": { "castingTime":12, "message":0 },
    "WIZARD_PROTECTION_FROM_EVIL": { "castingTime":12, "message":0 },
    "WIZARD_PROTECTION_FROM_NORMAL_MISSILES": { "castingTime":12, "message":0 },
    "WIZARD_PROTECTION_FROM_PETRIFICATION": { "castingTime":12, "message":0 },
    "WIZARD_REMOVE_CURSE": { "castingTime":12, "message":0 },
    "WIZARD_RESIST_FEAR": { "castingTime":12, "message":0 },
    "WIZARD_SHADES": { "castingTime":12, "message":0 },
    "WIZARD_SHADOW_MONSTERS": { "castingTime":12, "message":0 },
    "WIZARD_SHIELD": { "castingTime":12, "message":0 },
    "WIZARD_SHOCKING_GRASP": { "castingTime":12, "message":0 },
    "WIZARD_SHROUD_OF_FLAME": { "castingTime":5, "message":0, "duration":"ONE_TURN", "aoe":10 },
    "WIZARD_SKULL_TRAP": { "castingTime":3, "message":12072, "aoe":10 },
    "WIZARD_SLEEP": { "castingTime":12, "message":0 },
    "WIZARD_SLOW": { "castingTime":12, "message":0 },
    "WIZARD_SNILLOCS_SNOWBALL_SWARM": { "castingTime":12, "message":0 },
    "WIZARD_SPIRIT_ARMOR": { "castingTime":12, "message":0 },
    "WIZARD_STINKING_CLOUD": { "castingTime":12, "message":0 },
    "WIZARD_STONESKIN": { "castingTime":12, "message":0 },
    "WIZARD_STONE_TO_FLESH": { "castingTime":12, "message":0 },
    "WIZARD_STRENGTH": { "castingTime":12, "message":0 },
    "WIZARD_SUMMON_SHADOW": { "castingTime":12, "message":0 },
    "WIZARD_SUNFIRE": { "castingTime":3, "message":24733, "aoe":30 },
    "WIZARD_TENSERS_TRANSFORMATION": { "castingTime":12, "message":0 },
    "WIZARD_VAMPIRIC_TOUCH": { "castingTime":12, "message":0 },
    "WIZARD_VOCALIZE": { "castingTime":2, "message":12079 },
    "WIZARD_WEB": { "castingTime":12, "message":0 }
  }
>
