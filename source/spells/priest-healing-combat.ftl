<#-- vim: set syntax=ftl: -->
<#include "../util/config.ftl"/>

<#if supportedClasses?seq_contains("cleric")
  || supportedClasses?seq_contains("druid")
  || supportedClasses?seq_contains("paladin")
  || supportedClasses?seq_contains("ranger")
>

//------------------------------------------------------------------
// healing (in combat)
//------------------------------------------------------------------

<#if supportedClasses?seq_contains("paladin")>
  <@healSpell spell="PALADIN_LAY_ON_HANDS" target="MostDamagedOf([PC])" hp=50 combat=true/>
</#if>

<#if supportedClasses?seq_contains("cleric")>
// heal
IF
  <@canCastSpell "CLERIC_HEAL"/>
  HPPercentLT(MostDamagedOf([PC]),50)
  NumCreatureGT([ENEMY],0)
  <@isGlobalTimerNotActive "CLERIC_HEAL"/>
THEN
  RESPONSE #100
    <@setGlobalTimer "CLERIC_HEAL" "ONE_ROUND" />
    <@castSpell "CLERIC_HEAL" "MostDamagedOf([PC])" />
END
</#if>

<#list ["CRITICAL", "SERIOUS", "MODERATE", "LIGHT"] as spell>
  <@healSpell spell="CLERIC_CURE_"+spell+"_WOUNDS" target="MostDamagedOf([PC])" hp=50 combat=true/>
</#list>

</#if>
