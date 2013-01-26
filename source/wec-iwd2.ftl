<#-- vim: set syntax=ftl: -->

<#assign
  follow_mode = "move-follow"
  follow_distance_minimum = 10
  follow_distance_maximum = 20
  game = "iwd2"
  number_of_players = 6
  supported_classes = [ "cleric", "fighter", "mage" ]
/>

<#include "util/macros.ftl"/>
<#--
<#include "util/rest.ftl"/>
-->

IF
  IsPlayerNumber(Myself(),2)
  ActionListEmpty()
  !See(NearestEnemyOf(Myself),0)
  Range(LeaderOf(Myself),${follow_distance_maximum},GREATER_THAN)
THEN
  RESPONSE #100
    SetGlobal("${locals.FOLLOWING}","LOCALS",1)
    MoveToObjectFollow(LeaderOf(Myself))
END

// mage spell: armor
IF
  HaveSpell(WIZARD_ARMOR)
  Or(2)
    ActionListEmpty()
    Global("${locals.FOLLOWING}","LOCALS",1)
  !TimerActive(93)
  !GlobalTimerNotExpired("MAGE_ARMOR","GLOBAL")
  !CheckSpellState(Myself(), ARMOR)
THEN
  RESPONSE #100
    StartTimer(93,6)
    Spell(Myself(),WIZARD_ARMOR)
    SetGlobalTimer("MAGE_ARMOR","GLOBAL",3600)
    WaitAnimation(Myself,WALK)
    WaitAnimation(Myself,CONJURE)
    WaitAnimation(Myself,CAST)
END

// mage spell: shield
IF
  HaveSpell(WIZARD_SHIELD)
  Or(2)
    ActionListEmpty()
    Global("${locals.FOLLOWING}","LOCALS",1)
  !TimerActive(93)
  !CheckSpellState(Myself(),SHIELD)
  See(NearestEnemyOf(Myself))
THEN
  RESPONSE #100
    StartTimer(93,6)
    Spell(Myself(), WIZARD_SHIELD)
    WaitAnimation(Myself,WALK)
    WaitAnimation(Myself,CONJURE)
    WaitAnimation(Myself,CAST)
END

<#--
IF
  <@idle/>
  HaveSpell(WIZARD_ARMOR)
  !CheckSpellState(Myself, ARMOR)
THEN
  RESPONSE #100
    <@resetIdleState/>
    Spell(Myself, WIZARD_ARMOR)
END
-->
