<#-- vim: set syntax=ftl: -->
<#include "../util/config.ftl"/>

<#if supported_classes?seq_contains("cleric")
  || supported_classes?seq_contains("druid")
  || supported_classes?seq_contains("paladin")
  || supported_classes?seq_contains("ranger")
>

//------------------------------------------------------------------
// healing (not in combat)
//------------------------------------------------------------------

<#list ["LIGHT", "MODERATE", "SERIOUS", "CRITICAL"] as spell>
  <@healSpell spell="CLERIC_CURE_"+spell+"_WOUNDS" target="MostDamagedOf([PC])" hp=70 combat=false/>
</#list>

<#if supported_classes?seq_contains("paladin")>
  <@healSpell spell="PALADIN_LAY_ON_HANDS" target="MostDamagedOf([PC])" hp=70 combat=true/>
</#if>

</#if>
