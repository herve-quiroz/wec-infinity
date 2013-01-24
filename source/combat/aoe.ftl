
//------------------------------------------------------------------
// move away from AOE
//------------------------------------------------------------------

// stinking cloud
IF
  Or(8)
    See([ENEMY])
    See(NearestEnemyOf(Myself))
    See([ENEMY.0.0.MAGE_THIEF])
    See([ENEMY.0.0.FIGHTER_MAGE_THIEF])
    See([ENEMY.0.0.FIGHTER_MAGE])
    See([ENEMY.0.0.FIGHTER_MAGE_CLERIC])
    See([ENEMY.0.0.CLERIC_MAGE])
    See([ENEMY.0.0.MAGE])
  SpellCast([ENEMY],WIZARD_STINKING_CLOUD)
  !Class(Myself,FIGHTER)
THEN
  RESPONSE #100
    ClearActions(Myself)
    SetGlobal("wec_following","LOCALS",0)
    SetGlobalTimer("wec_spell_cast_this_round","LOCALS",2)
    RunAwayFrom(LastSeenBy(Myself),30)
END

