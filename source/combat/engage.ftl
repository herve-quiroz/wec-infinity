<#-- vim: set syntax=ftl: -->
<#include "macros.ftl">
<#include "../util/macros.ftl">
<#include "../util/variables.ftl">
<#include "../util/config.ftl">

<#if modes?seq_contains("combat")>

//------------------------------------------------------------------
// force combat
//------------------------------------------------------------------

// force melee attack
IF
  !ClassEX(Myself,MAGE)
  <@idle/>
  GlobalTimerNotExpired("${globalTimers.FORCE_MELEE_ATTACK}","GLOBAL")
  See(NearestEnemyOf(Myself))
  !StateCheck(NearestEnemyOf(Myself),STATE_PANIC)
  !StateCheck(NearestEnemyOf(Myself),STATE_CHARMED)
  !InParty(NearestEnemyOf(Myself))
THEN
  RESPONSE #100
    FloatMessage(Myself,${strings.ENGAGE})
    <@resetIdleState/>
    SetBestWeapon(NearestEnemyOf(Myself),30)
    AttackOneRound(NearestEnemyOf(Myself))
END
</#if>
