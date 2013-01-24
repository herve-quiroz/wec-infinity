<#-- vim: set syntax=ftl: -->
<#include "macros.ftl"/>
<#include "../util/macros.ftl"/>
<#include "../util/config.ftl"/>

//------------------------------------------------------------------
// follow
//------------------------------------------------------------------

<#list 2..numberOfPlayers as player>

<#assign playerName = "Player" + player />

<#if playerFollow[playerName].mode = "formation">

  <@playerFormation 1 player playerFollow[playerName].position />

<#elseif playerFollow[playerName].mode = "follow">

// start following (player ${player} -> 1)
IF
  Range(Player${player},0)
  ActionListEmpty()
  !Range(Player1,${playerFollow[playerName].maximumDistance})
THEN
  RESPONSE #100
    MoveToObject(Player1)
END

// stop following (player ${player})
IF
  Range(Player${player},0)
  !ActionListEmpty()
  Range(Player1,${playerFollow[playerName].minimumDistance})
THEN
  RESPONSE #100
    NoAction()
END

<#elseif playerFollow[playerName].mode = "follow-previous">

// start following (player ${player} -> ${player - 1})
IF
  Range(Player${player},0)
  ActionListEmpty()
  !Range(Player${player - 1},${playerFollow[playerName].maximumDistance})
  !See([ENEMY])
THEN
  RESPONSE #100
    SetGlobal("${locals.FOLLOWING}","LOCALS",1)
    MoveToObject(Player${player - 1})
END

// stop following (player ${player})
IF
  Range(Player${player},0)
  Global("${locals.FOLLOWING}","LOCALS",1)
  Range(Player${player - 1},${playerFollow[playerName].minimumDistance})
THEN
  RESPONSE #100
    SetGlobal("${locals.FOLLOWING}","LOCALS",0)
    NoAction()
END

<#elseif playerFollow[playerName].mode = "follow-formation">

// follow (player ${player} -> ${player - 1})
IF
  Range(Player${player},0)
  ActionListEmpty()
  !See([ENEMY])
THEN
  RESPONSE #100
    FollowObjectFormation(Player${player - 1},11,1)
END

<#if combatModes[playerCombat["Player" + (player - 1)].mode].maximumDistanceToGroup &lt; 30> 
// follow (player ${player} -> ${player - 1})
IF
  Range(Player${player},0)
  ActionListEmpty()
  !Range(Player${player - 1},${combatModes[playerCombat["Player" + (player - 1)].mode].maximumDistanceToGroup})
THEN
  RESPONSE #100
    FollowObjectFormation(Player${player - 1},11,1)
END
</#if>

<#elseif playerFollow[playerName].mode = "follow-formation-player1">

// follow (player ${player} -> 1)
IF
  Range(Player${player},0)
  ActionListEmpty()
  !See([ENEMY])
THEN
  RESPONSE #100
    FollowObjectFormation(Player1,11,3)
END

<#if combatModes[playerCombat["Player" + player].mode].maximumDistanceToGroup &lt; 30> 
// follow (player ${player} -> 1)
IF
  Range(Player${player},0)
  ActionListEmpty()
  !Range(Player${player - 1},${combatModes[playerCombat["Player" + player].mode].maximumDistanceToGroup})
THEN
  RESPONSE #100
    FollowObjectFormation(Player1,11,3)
END
</#if>

<#elseif playerFollow[playerName].mode = "protect">

// start protecting (player ${player} -> ${player - 1})
IF
  Range(Player${player},0)
  ActionListEmpty()
  !See([ENEMY])
  !Range(Player1,${playerFollow[playerName].maximumDistance})
THEN
  RESPONSE #100
    SetGlobal("${locals.FOLLOWING}","LOCALS",1)
    //ProtectObject(Player${player - 1},${playerFollow[playerName].maximumDistance})
    ProtectObject(Player${player - 1},5)
END

<#elseif playerFollow[playerName].mode = "force-regroup">

IF
  !Range(Player1,0)
  ActionListEmpty()
  !See([ENEMY])
  !Range(Player1,${playerFollow[playerName].maximum_distance})
THEN
  RESPONSE #100
    MoveToObject(Player1)
END

<#elseif playerFollow[playerName].mode = "disabled">

<#else>

  <#stop "follow mode not supported: " + playerFollow[playerName].mode />

</#if>

</#list>
