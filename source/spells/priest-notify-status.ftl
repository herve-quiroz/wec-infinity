<#-- vim: set syntax=ftl: -->
<#include "../util/variables.ftl"/>
<#include "../util/macros.ftl"/>
<#include "../util/config.ftl"/>

<#if supported_classes?seq_contains("cleric")>

//------------------------------------------------------------------
// notify status (cleric)
//------------------------------------------------------------------

// cure spells
IF
  Delay(30)
  Or(2)
    <@isGeneralClass "Myself" "CLERIC"/>
    <@isGeneralClass "Myself" "DRUID"/>
  !HaveSpell(CLERIC_CURE_LIGHT_WOUNDS)
  !HaveSpell(CLERIC_CURE_MODERATE_WOUNDS)
  !HaveSpell(CLERIC_CURE_SERIOUS_WOUNDS)
  !HaveSpell(CLERIC_CURE_CRITICAL_WOUNDS)
  !HaveSpell(CLERIC_HEAL)
THEN
  RESPONSE #100
    <@displayMessage "Myself" strings.NO_MORE_CLERIC_SPELLS />
    Continue()
END

</#if>
