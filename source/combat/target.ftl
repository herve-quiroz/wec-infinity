<#-- vim: set syntax=ftl: -->
<#include "../util/macros.ftl">
<#include "../util/config.ftl">
<#include "../util/variables.ftl">

<@section "targeting" />

<#list 2..number_of_players as player>
<#assign distance = combatModes[playerCombat["Player" + player].mode].maximumDistanceToGroup />

// player ${player}: abort targeting if not in range ${distance} of player 1
IF
  Range(Player${player},0)
  !Range(Player1,${distance})
THEN
  RESPONSE #100
    // abort script
END
</#list>

<#if supportedCombatModes?seq_contains("support")>
// target for support players
// shortcut: select a target enemy ; abort script if no enemy found
IF
<#list 1..6 as player>
  <#if playerCombat["Player" + player].mode != "support">
  !Range(Player${player},0)
  </#if>
</#list>
<#list spellcasters as class>
  !See([ENEMY.0.0.${class}])
</#list>
  !See(NearestEnemyOf(MostDamagedOf([PC])))
<#list 1..6 as player>
  !See(NearestEnemyOf(Player${player}))
</#list>
  !See(NearestEnemyOf(Myself))
THEN
  RESPONSE #100
    // abort script
END
</#if>

<#if supportedCombatModes?seq_contains("tank")>
// target for tank players
// shortcut: select a target enemy ; abort script if no enemy found
IF
<#list 1..6 as player>
  <#if playerCombat["Player" + player].mode != "tank">
  !Range(Player${player},0)
  </#if>
</#list>
  !See(NearestEnemyOf(Myself))
THEN
  RESPONSE #100
    // abort script
END
</#if>

// select other target when current is a dying troll
IF
<#list ranksToTenth as rank>
  Race(LastSeenBy(Myself),TROLL)
  HPLT(LastSeenBy(Myself),10)
  See(${rank}NearestEnemyOf(Myself))
</#list>
  Race(LastSeenBy(Myself),TROLL)
  HPLT(LastSeenBy(Myself),10)
THEN
  RESPONSE #100
    // abort script
<#--
    // move to player 1
    FollowObjectFormation(Player1,11,1)
-->
END

// shortcut: abort script when selected target is a player
IF
  InParty(LastSeenBy(Myself))
<#--
<#list ranksToTenth as rank>
  See(${rank}NearestEnemyOf(Myself))
  InParty(LastSeenBy(Myself))
</#list>
-->
THEN
  RESPONSE #100
    // abort script
    DisplayString(Myself,${strings.FRIENDLY_FIRE})
    DisplayString(LastSeenBy(Myself),${strings.TARGET})
<#--
    // try and avoid the charmed player
    FollowObjectFormation(LastSeenBy(Myself),11,5)
-->
END
