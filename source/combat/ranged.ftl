<#-- vim: set syntax=ftl: -->
<#include "macros.ftl">
<#include "../util/macros.ftl">
<#include "../util/variables.ftl">
<#include "../util/config.ftl">

<#if supportedCombatModes?seq_contains("ranged")>
<@section "combat for ranged players" />

<#list 1..number_of_players as player>
<#if playerCombat["Player" + player].mode = "ranged">

// player ${player}: force melee attack on nearest enemy when in close combat
IF
  Range(Player${player},0)
  Range(LastSeenBy(Myself),2})
THEN
  RESPONSE #100
    <@resetIdleState/>
    EquipMostDamagingMelee()
    AttackReevaluate(NearestEnemyOf(Myself),30)
END

// player ${player}: ranged attack on selected target when not in close combat
IF
  Range(Player${player},0)
  !InParty(LastSeenBy(Myself))
THEN
  RESPONSE #100
    <@resetIdleState/>
    EquipRanged()
    AttackReevaluate(LastSeenBy(Myself),30)
END
</#if>
</#list>

</#if>
