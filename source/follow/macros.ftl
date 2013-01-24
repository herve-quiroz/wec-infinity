<#-- vim: set syntax=ftl: -->
<#include "../util/variables.ftl"/>

<#--
 [X.Y]
         -Y
          |
  -X <== (1) ==> +X
          |
         +Y
-->

<#macro playerFormation targetPlayer player position>

// formation for player ${player} ; position = ${position}
IF
  Range(Player${player},0)
  ActionListEmpty()
  !See([ENEMY])
THEN
  RESPONSE #100
    SetGlobal("${locals.FOLLOWING}","LOCALS",1)
    Formation(Player${targetPlayer},${position})
END
</#macro>
