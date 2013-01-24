<#-- vim: set syntax=ftl: -->

<#if !supportedClasses?exists>
  <#assign
    supportedClasses = [
      "bard",
      "cleric",
      "druid",
      "fighter",
      "mage",
      "paladin",
      "thief"
    ]
  />
</#if>

<#if !alignments?exists>
  <#assign
    alignments = [
      "good",
      "neutral",
      "evil"
    ]
  />
</#if>

<#if !modes?exists>
  <#assign
    modes = [
      "combat",
      "common",
      "normal"
    ]
  />
</#if>

<#if !supportedCombatModes?exists>
  <#assign
    supportedCombatModes = [
      "tank",
      "ranged"
      "support"
    ]
  />
</#if>

<#if !numberOfPlayers?exists>
  <#assign numberOfPlayers = 6 />
</#if>

<#if !enemyGroupSizes?exists>
  <#assign enemyGroupSizes = [ 1, 4, 7, 10 ] />
</#if>

<#if !strongEnemyLevels?exists>
  <#assign strongEnemyLevels = [ 1, 4, 8, 12 ] />
</#if>

<#if !hitPointsThreatLevels?exists>
  <#assign hitPointsThreatLevels = [ 100, 60, 30 ] />
</#if>

<#if !game?exists>
  <#assign game = "iwd" />
</#if>

<#-- mode = [ formation | follow ] -->
<#-- formation: position -->
<#-- follow: minimumDistance / maximumDistance = follow range (target is player 1) -->
<#if !playerFollow?exists>
  <#assign
    playerFollow = {
      "Player2": { "mode":"formation", "position":"[0.-7]", "minimumDistance":10, "maximumDistance":15 },
      "Player3": { "mode":"formation", "position":"[6.-3]", "minimumDistance":10, "maximumDistance":15 },
      "Player4": { "mode":"formation", "position":"[3.6]", "minimumDistance":10, "maximumDistance":15 },
      "Player5": { "mode":"formation", "position":"[-3.6]", "minimumDistance":10, "maximumDistance":15 },
      "Player6": { "mode":"formation", "position":"[-6.-3]", "minimumDistance":10, "maximumDistance":15 }
    }
  />
</#if>

<#if !playerCombat?exists>
  <#assign
    playerCombat = {
      "Player1": { "mode":"tank", "maximum_melee_attack_range":10 },
      "Player2": { "mode":"tank", "maximum_melee_attack_range":10 },
      "Player3": { "mode":"support" },
      "Player4": { "mode":"support" },
      "Player5": { "mode":"support" },
      "Player6": { "mode":"support" }
    }
  />
</#if>

<#if !combatModes?exists>
  <#assign
    combatModes = {
      "tank": { "rangedDistance":20, "maximumDistanceToGroup":10 },
      "ranged": { "rangedDistance":99, "maximumDistanceToGroup":20 },
      "support": { "rangedDistance":2, "maximumDistanceToGroup":20 }
    }
  />
</#if>

<#if !useLightWeightTimers?exists>
  <#assign useLightWeightTimers = false />
</#if>

<#if !rangedClasses?exists>
  <#assign
    rangedClasses = [
      "MAGE"
    ]
  />
</#if>

<#if !maximumDistanceToGroup?exists>
  <#assign maximumDistanceToGroup = 10 />
</#if>


