<#-- vim: set syntax=ftl: -->
<#include "../util/config.ftl"/>

<#if supportedClasses?seq_contains("cleric")
  || supportedClasses?seq_contains("druid")
  || supportedClasses?seq_contains("paladin")
  || supportedClasses?seq_contains("ranger")
>

//------------------------------------------------------------------
// healing (not in combat)
//------------------------------------------------------------------

<#list ["LIGHT", "MODERATE", "SERIOUS", "CRITICAL"] as spell>
  <@healSpell spell="CLERIC_CURE_"+spell+"_WOUNDS" target="MostDamagedOf([PC])" hp=70 combat=false/>
</#list>

<#if supportedClasses?seq_contains("paladin")>
  <@healSpell spell="PALADIN_LAY_ON_HANDS" target="MostDamagedOf([PC])" hp=70 combat=true/>
</#if>

</#if>
