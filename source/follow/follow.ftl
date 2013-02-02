<#-- vim: set syntax=ftl: -->
<#include "macros.ftl"/>
<#include "../util/macros.ftl"/>
<#include "../util/config.ftl"/>

//------------------------------------------------------------------
// follow
//------------------------------------------------------------------

<#list 2..number_of_players as player>

<#assign playerName = "Player" + player />

<#if follow_mode = "follow-previous">

// start following (player ${player} -> ${player - 1})
IF
  Range(Player${player},0)
  ActionListEmpty()
  !Range(Player${player - 1},${follow_distance_maximum})
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
  Range(Player${player - 1},${follow_distance_minimum})
THEN
  RESPONSE #100
    SetGlobal("${locals.FOLLOWING}","LOCALS",0)
    NoAction()
END

<#elseif follow_mode = "protect">

// start protecting (player ${player} -> ${player - 1})
IF
  Range(Player${player},0)
  ActionListEmpty()
  !See([ENEMY])
  !Range(Player1,${follow_distance_maximum})
THEN
  RESPONSE #100
    SetGlobal("${locals.FOLLOWING}","LOCALS",1)
    //ProtectObject(Player${player - 1},${follow_distance_maximum})
    ProtectObject(Player${player - 1},5)
END

<#elseif follow_mode = "force-regroup">

IF
  !Range(Player1,0)
  ActionListEmpty()
  !See([ENEMY])
  !Range(Player1,${follow_distance_maximum})
THEN
  RESPONSE #100
    MoveToObject(Player1)
END

<#elseif follow_mode = "pack">

<#assign distance_increment = (follow_distance_maximum - follow_distance_minimum) / (number_of_players - 2) />
<#assign distance = follow_distance_minimum + (player - 2) * distance_increment />
<#assign distance = distance?round />
// start following ${player} -> 1
// distance ${distance}
IF
  Range(Player${player},0)
  ActionListEmpty()
  !Range(Player1,${distance})
  !See([ENEMY])
THEN
  RESPONSE #100
    SetGlobal("${locals.FOLLOWING}","LOCALS",1)
    MoveToObject(Player1)
END

// stop following ${player} -> 1
// distance ${distance}
IF
  Range(Player${player},0)
  Global("${locals.FOLLOWING}","LOCALS",1)
  Range(Player1,${distance})
THEN
  RESPONSE #100
    SetGlobal("${locals.FOLLOWING}","LOCALS",0)
    NoAction()
END

<#elseif follow_mode = "move-follow">

// follow ${player} -> ${player - 1}
// if too far from player 1
IF
  Range(Player${player},0)
  ActionListEmpty()
  !See(NearestEnemyOf(Myself))
  !Range(Player1,${follow_distance_maximum})
THEN
  RESPONSE #100
    SetGlobal("${locals.FOLLOWING}","LOCALS",1)
    MoveToObjectFollow(Player${player - 1})
END

<#else>

<#stop "follow_mode not supported: " + follow_mode />

</#if>

</#list>
