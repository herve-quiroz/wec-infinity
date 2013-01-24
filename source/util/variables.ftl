<#-- vim: set syntax=ftl: -->

<#assign
  strings = {
    "ALERT":10381,
    "Armor":11997,
    "Armor class":10339,
    "CHARGE!":11644,
    "COMBAT_MODE_0":20993,
    "COMBAT_MODE_1":73,
    "COMBAT_MODE_2":74,
    "COMBAT_MODE_3":759,
    "Enchanter":2022,
    "Enemy Sighted":23516,
    "ENEMY_SIGHTED":23516,
    "ENGAGE":11644,
    "FORCE_AOE_SPELLS":12059,
    "Follow Me!":19630,
    "FOLLOW_ME":19630,
    "FRIENDLY_FIRE":6660,
    "INDOOR":9744,
    "LARGE_ENEMY_GROUP":6640,
    "Mage":817,
    "MAGE":817,
    "MEDIUM_ENEMY_GROUP":215,
    "NEED_HEALING":2156,
    "NO_MORE_SPELLS":7707,
    "NO_MORE_MAGE_SPELLS":7707,
    "NO_MORE_CLERIC_SPELLS":7707,
    "OUTDOOR":9662,
    "Racial Enemy":15982,
    "RUN_AWAY":20192,
    "See Enemy":30973,
    "SEE_ENEMY":30973,
    "STRONG_ENEMY":15982,
    "Target":10070,
    "TARGET":10070
  }
/>

<#assign
  spellcasters = [
    "MAGE",
    "CLERIC_MAGE",
    "FIGHTER_MAGE",
    "FIGHTER_MAGE_THIEF",
    "MAGE_THIEF",
    "BARD",
    "DRUID",
    "FIGHTER_DRUID",
    "CLERIC",
    "FIGHTER_CLERIC",
    "CLERIC_RANGER",
    "CLERIC_THIEF",
    "FIGHTER_MAGE_CLERIC"
  ]
/>

<#assign
  mageClasses = [
    "MAGE",
    "FIGHTER_MAGE",
    "FIGHTER_MAGE_THIEF",
    "MAGE_THIEF",
    "CLERIC_MAGE"
  ]
/>

<#assign
  spellcasterExtendedClasses = [
    "MAGE",
    "CLERIC",
    "DRUID"
  ]
/>

<#assign
  ranksToFifth = [
    "",
    "Second",
    "Third",
    "Fourth",
    "Fifth"
  ]
/>

<#assign
  ranksToTenth = [
    "",
    "Second",
    "Third",
    "Fourth",
    "Fifth",
    "Sixth",
    "Seventh",
    "Eighth",
    "Ninth",
    "Tenth"
  ]
/>

<#assign
  thieves = [
    "THIEF",
    "FIGHTER_THIEF",
    "FIGHTER_MAGE_THIEF",
    "MAGE_THIEF",
    "CLERIC_THIEF"
  ]
/>

<#assign
  scriptModes = {
    "COMBAT":"2",
    "NORMAL":"1"
  }
/>

<#assign
  globals = {
    "FOLLOW":"wec_follow_global",
    "FORMATION":"wec_formation",
    "OUTDOOR":"wec_outdoor",
    "PLAYER":"wec_player"
  }
/>

<#assign
  locals = {
    "FOLLOW":"wec_follow",
    "SCRIPT_MODE":"wec_script_mode",
    "FOLLOWING":"wec_following"
  }
/>

<#assign
  globalTimers = {
    "CLERIC_BLESS":"CLERIC_BLESS",
    "CLERIC_CURE_DISEASE":"CLERIC_CURE_DISEASE",
    "CLERIC_EXALTATION":"CLERIC_EXALTATION",
    "CLERIC_FREE_ACTION":"CLERIC_FREE_ACTION",
    "CLERIC_HEAL":"CLERIC_HEAL",
    "CLERIC_NEUTRALIZE_POISON":"CLERIC_NEUTRALIZE_POISON",
    "CLERIC_PROTECTION_FROM_EVIL_10_RADIUS":"CLERIC_PROTECTION_FROM_EVIL_10_RADIUS",
    "CLERIC_PRAYER":"CLERIC_PRAYER",
    "CLERIC_RECITATION":"CLERIC_RECITATION",
    "CLERIC_REMOVE_FEAR":"CLERIC_REMOVE_FEAR",
    "CLERIC_REMOVE_PARALYSIS":"CLERIC_REMOVE_PARALYSIS",
    "CLERIC_RIGHTEOUS_WRATH_OF_THE_FAITHFUL":"CLERIC_RIGHTEOUS_WRATH_OF_THE_FAITHFUL",
    "FORCE_AOE_SPELLS":"FORCE_AOE_SPELLS",
    "FORCE_COMBAT_MODE":"wec_force_combat_mode",
    "FORCE_MELEE_ATTACK":"wec_force_melee_attack",
    "KILL_TROLL":"KILL_TROLL",
    "WIZARD_FIREBALL":"WIZARD_FIREBALL"
  }
/>

<#assign
  localTimers = {
    "CLERIC_SLOW_POISON":100,
    "CURSE":101,
    "DEFENSIVE_HARMONY":102,
    "CLERIC_GREATER_SHIELD_OF_LATHANDER":103,
    "PRAYER":104,
    "RECITATION":105,
    "SPELL_CAST":106
  }
/>

<#assign
  holdConditions = ["HELD", "ENTANGLE", "GREASE", "WEB"]
/>

<#assign
  badStates = [
    "STATE_BERSERK",
    "STATE_CHARMED",
    "STATE_CONFUSED",
    "STATE_DISEASED",
    "STATE_FEEBLEMINDED",
    "STATE_PANIC",
    "STATE_POISONED",
    "STATE_SILENCED",
    "STATE_SLEEPING",
    "STATE_SLOWED",
    "STATE_STUNNED"
  ]
/>
