<#-- vim: set syntax=ftl: -->
<#include "../combat/macros.ftl"/>
<#include "../util/variables.ftl"/>
<#include "../util/config.ftl"/>

<#if supportedClasses?seq_contains("cleric")
  || supportedClasses?seq_contains("druid")
  || supportedClasses?seq_contains("paladin")
  || supportedClasses?seq_contains("ranger")
>

//------------------------------------------------------------------
// priest spells: debuff
//------------------------------------------------------------------

<#if supportedClasses?seq_contains("cleric")>
// curse
IF
  <@canCastSpell "CLERIC_CURSE"/>
  <@threatLevel 2 />
  !StateCheck(NearestEnemyOf(Myself),STATE_CHANTBAD)
  <@isLocalTimerNotActive "CURSE"/>
THEN
  RESPONSE #100
    <@setLocalTimer "CURSE" "ONE_TURN"/>
    <@castSpell spell="CLERIC_CURSE" target="NearestEnemyOf(Myself)"/>
END
</#if>

<#--
<#if supportedClasses?seq_contains("cleric")>
// miscast magic
IF
  <@canCastSpell "CLERIC_MISCAST_MAGIC"/>
  Or(${mageClasses?size})
  <#list mageClasses as class>
    See([ENEMY.0.0.${class}])
  </#list>
  !StateCheck(LastSeenBy(Myself),STATE_SILENCED)
THEN
  RESPONSE #100
    <@castSpell spell="CLERIC_MISCAST_MAGIC" target="LastSeenBy(Myself)"/>
END
</#if>
-->

<#--
<#if supportedClasses?seq_contains("cleric")>
// invisibility purge
IF
  <@canCastSpell "CLERIC_INVISIBILITY_PURGE"/>
  Or(${ranksToFifth?size * 2})
  <#list ranksToFifth as rank>
    StateCheck(${rank}NearestEnemyOf(Myself),STATE_INVISIBLE)
    StateCheck(${rank}NearestEnemyOf(Myself),STATE_IMPROVEDINVISIBILITY)
  </#list>
THEN
  RESPONSE #100
    <@castSpell spell="CLERIC_INVISIBILITY_PURGE" target="NearestEnemyOf(Myself)"/>
END
</#if>
-->

</#if>
