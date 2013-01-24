<#-- vim: set syntax=ftl: -->
<#include "../util/macros.ftl"/>
<#include "../util/variables.ftl"/>
<#include "../util/hot-keys.ftl"/>

//------------------------------------------------------------------
// spells hot keys
//------------------------------------------------------------------

// force area of effect spells
IF
  HotKey(${hotKeys.forceAoeSpells})
  <@isGlobalTimerNotActive "FORCE_AOE_SPELLS"/>
THEN
  RESPONSE #100
    <@displayMessage "Myself" strings.FORCE_AOE_SPELLS />
    <@setGlobalTimer "FORCE_AOE_SPELLS" "ONE_ROUND" />
    //Continue()
END
