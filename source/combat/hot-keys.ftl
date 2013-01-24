<#-- vim: set syntax=ftl: -->
<#include "../util/macros.ftl"/>
<#include "../util/variables.ftl"/>
<#include "../util/hot-keys.ftl"/>

//------------------------------------------------------------------
// combat hot keys
//------------------------------------------------------------------

// force combat mode
IF
  HotKey(${hotKeys.forceCombatMode3})
  <@isGlobalTimerNotActive "FORCE_COMBAT_MODE"/>
THEN
  RESPONSE #100
    <@displayMessage "Myself" strings.ALERT />
    <@setGlobalTimer "FORCE_COMBAT_MODE" "THREE_ROUNDS" />
    //Continue()
END
