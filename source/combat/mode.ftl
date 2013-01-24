<#include "variables.ftl">
<#include "../util/variables.ftl">
<#include "../util/config.ftl">

<#if modes?seq_contains("combat")>

//------------------------------------------------------------------
// combat mode
//------------------------------------------------------------------

// set a global as long as anyone in party sees any enemy
IF
  See([ENEMY])
  !GlobalTimerNotExpired("${globalTimers.ENGAGED_IN_COMBAT}","GLOBAL")
THEN
  RESPONSE #100
    DisplayString(Myself,${strings.SEE_ENEMY})
    SetGlobalTimer("${globalTimers.ENGAGED_IN_COMBAT}","GLOBAL",ONE_ROUND)
    Continue()
END

</#list>
