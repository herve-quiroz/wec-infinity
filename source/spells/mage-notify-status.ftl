<#-- vim: set syntax=ftl: -->
<#include "../util/variables.ftl"/>
<#include "../util/config.ftl"/>

<#if supportedClasses?seq_contains("mage")>

//------------------------------------------------------------------
// mage notify status
//------------------------------------------------------------------

// any spells
IF
  Delay(30)
  <@isGeneralClass "Myself" "MAGE"/>
  !HaveAnySpells()
THEN
  RESPONSE #100
    <@displayMessage "Myself" strings.NO_MORE_MAGE_SPELLS />
    Continue()
END

</#if>
