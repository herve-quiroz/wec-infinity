<#-- vim: set syntax=ftl: -->
<#include "../util/config.ftl"/>

<#--
<#macro checkDistanceToPlayer1 class>
  <#if maximumDistanceToPlayer1[class]?exists>
    <#assign maximumDistance = maximumDistanceToPlayer1[class] />
  <#else>
    <#assign maximumDistance = maximumDistanceToPlayer1.DEFAULT />
  </#if>
  <#if maximumDistance &lt; 100>
  Range(Player1,${maximumDistance})
  </#if>
</#macro>
-->

<#macro enemies size level>
  <#local orSize = 2 />
  <#if level &gt; 0>
    <#if enemyGroupSizes[size] &lt; 10>
      <#local orSize = orSize + enemyGroupSizes[size] - 1 />
    <#else>
      <#local orSize = orSize + 10 />
    </#if>
  </#if>
  Or(${orSize})
    GlobalTimerNotExpired("${globalTimers.FORCE_COMBAT_MODE}","GLOBAL")
    // at least ${enemyGroupSizes[size]} enemies
    NumCreatureGT([ENEMY],${enemyGroupSizes[size] - 1})
  <#if level &gt; 0 && level &lt; strongEnemyLevels?size>
    <#local i = 0>
    // at least one enemy of minimum level ${strongEnemyLevels[level]}
    <#list ranksToTenth as rank>
      <#local i = i + 1>
      <#if enemyGroupSizes[size] &lt; 10 && enemyGroupSizes[size] &gt; i>
    CheckStatGT(${rank}NearestEnemyOf(Myself),${strongEnemyLevels[level] - 1},LEVEL)
      </#if>
    </#list>
    <#--
    <#list 1..3 as power>
    HasItemEquiped("IMMUNE${power}",LastSeenBy(Myself))
    </#list>
    -->
  </#if>
</#macro>

<#macro threatLevel level>
  Or(${6 + spellcasterExtendedClasses?size})
    // force combat mode
    GlobalTimerNotExpired("${globalTimers.FORCE_COMBAT_MODE}","GLOBAL")
    // at least ${enemyGroupSizes[level - 1]} enemies
    NumCreatureGT([ENEMY],${enemyGroupSizes[level - 1] - 1})
    // target is immune to weapon damage
  <#list 1..3 as power>
    HasItemEquiped("IMMUNE${power}",LastSeenBy(Myself))
  </#list>
    // most damaged player is under ${hitPointsThreatLevels[level - 1]}%
    HPPercentLT(MostDamagedOf([PC]),${hitPointsThreatLevels[level - 1]})
    // target is a spellcaster
  <#list spellcasterExtendedClasses as class>
    <@isGeneralClass "LastSeenBy(Myself)" class/>
  </#list>
</#macro>
