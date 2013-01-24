<#-- vim: set syntax=ftl: -->
<#include "macros.ftl">
<#include "../util/macros.ftl">
<#include "../util/config.ftl"/>

<#if supportedCombatModes?seq_contains("support")>
//------------------------------------------------------------------
// combat for support team
//------------------------------------------------------------------

// attack melee if enemy is within ${combatModes.support.rangedDistance}'
IF
<#list 1..6 as player>
  <#if playerCombat["Player" + player].mode != "support">
  !Range(Player${player},0)
  </#if>
</#list>
  Range(NearestEnemyOf(Myself),${combatModes.support.rangedDistance})
THEN
  RESPONSE #100
    <@resetIdleState/>
    EquipMostDamagingMelee()
    AttackReevaluate(NearestEnemyOf(Myself),30)
END

// abort if mage dagger equiped (we don't want to switch to another weapon)
IF
  Or(4)
<#list [ "UDAGG2B", "UDAGG3B", "UDAGG4B", "UDAGG5A" ] as item>
    HasItem("${item}",Myself)
</#list>
THEN
  RESPONSE #100
    // do nothing
END

// abort if target is immune to normal damage
IF
<#list 1..6 as player>
  <#if playerCombat["Player" + player].mode != "support">
  !Range(Player${player},0)
  </#if>
</#list>
  Or(3)
<#list 1..3 as power>
    HasItemEquiped("IMMUNE${power}",LastSeenBy(Myself))
</#list>
THEN
  RESPONSE #100
    // shortcut
END

// attack ranged otherwise
IF
<#list 1..6 as player>
  <#if playerCombat["Player" + player].mode != "support">
  !Range(Player${player},0)
  </#if>
</#list>
THEN
  RESPONSE #100
    <@resetIdleState/>
    EquipRanged()
    AttackReevaluate(LastSeenBy(Myself),30)
END

</#if>
