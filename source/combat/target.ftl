<#-- vim: set syntax=ftl: -->
<#include "../util/macros.ftl">
<#include "../util/config.ftl">
<#include "../util/variables.ftl">

<@section "targeting" />

// shortcut: select a target enemy ; abort script if no enemy found
IF
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
END

// shortcut: abort script when selected target is a player
IF
  InParty(LastSeenBy(Myself))
THEN
  RESPONSE #100
    // abort script
    DisplayString(Myself,${strings.FRIENDLY_FIRE})
    DisplayString(LastSeenBy(Myself),${strings.TARGET})
END
