<#-- vim: set syntax=ftl: -->
<#include "../util/macros.ftl"/>
<#include "../util/config.ftl"/>

//------------------------------------------------------------------
// follow
//------------------------------------------------------------------

<#list 2..6 as player>

// start following (player ${player})
IF
  <@idle/>
  <@isLocal "FOLLOW" 1/>
  <@isNotLocal "FOLLOWING" 1/>
  !Range(Player1,${maximumDistanceToPlayer1})
  Range(Player${player},0)
THEN
  RESPONSE #100
    <@setLocal "FOLLOWING" 1 />
    MoveToObject(Player1)
END
</#list>

// stop following
IF
  <@isLocal "FOLLOWING" 1/>
  Range(Player1,10)
  !Range(Player1,0)
THEN
  RESPONSE #100
    <@setLocal "FOLLOWING" 0 />
    NoAction()
END

