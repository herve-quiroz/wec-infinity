
//------------------------------------------------------------------
// which PCs in party?
//------------------------------------------------------------------

<#list 1..6 as player>

// player ${player}
IF
  !Global("wec_player${player}","GLOBAL",1)
  Range(Player${player},0)
THEN
  RESPONSE #100
    SetGlobal("wec_player${player}","GLOBAL",1)
    Continue()
END
</#list>
