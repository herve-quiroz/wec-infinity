<#-- vim: set syntax=ftl: -->
<#include "macros.ftl">
<#include "../util/macros.ftl">
<#include "../util/variables.ftl">
<#include "../util/config.ftl">

<#if supportedCombatModes?seq_contains("tank")>
<@section "combat for tank team" />

<#--
// force melee attack up to ${combatModes.tank.rangedDistance}' if not immune to normal weapons
IF
<#list 1..numberOfPlayers as player>
  <#if playerCombat["Player" + player].mode != "tank">
  !Range(Player${player},0)
  </#if>
</#list>
<#list 1..3 as power>
  !HasItemEquiped("IMMUNE${power}",LastSeenBy(Myself))
</#list>
THEN
  RESPONSE #100
    <@resetIdleState/>
    SetBestWeapon(LastSeenBy(Myself),${combatModes.tank.rangedDistance})
    AttackReevaluate(LastSeenBy(Myself),30)
END

// force melee attack up to 30' if immune to normal weapons
IF
<#list 1..numberOfPlayers as player>
  <#if playerCombat["Player" + player].mode != "tank">
  !Range(Player${player},0)
  </#if>
</#list>
THEN
  RESPONSE #100
    <@resetIdleState/>
    SetBestWeapon(LastSeenBy(Myself),30)
    AttackReevaluate(LastSeenBy(Myself),30)
END
-->

<#list 1..numberOfPlayers as player>
<#if playerCombat["Player" + player].mode = "tank">
// force melee attack for player ${player}
IF
  Range(Player${player},0)
  Range(LastSeenBy(Myself),${playerCombat["Player" + player].maximum_melee_attack_range})
THEN
  RESPONSE #100
    <@resetIdleState/>
    EquipMostDamagingMelee()
    AttackReevaluate(LastSeenBy(Myself),30)
END
</#if>
</#list>

</#if>
