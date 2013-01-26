<#-- vim: set syntax=ftl: -->
<#include "macros.ftl">
<#include "../util/macros.ftl">
<#include "../util/config.ftl"/>

// attack melee if player is a fighter (and not an archer)
IF
  <@isGeneralClass "Myself" "FIGHTER" />
  !Kit(Myself,FERALAN)
  Range(LastSeenBy(Myself),100)
THEN
  RESPONSE #100
    <@resetIdleState/>
    EquipMostDamagingMelee()
    AttackReevaluate(LastSeenBy(Myself),30)
END

// attack melee if enemy is within ${combat_melee_distance}
IF
  Range(LastSeenBy(Myself),${combat_melee_distance})
THEN
  RESPONSE #100
    <@resetIdleState/>
    EquipMostDamagingMelee()
    AttackReevaluate(LastSeenBy(Myself),30)
END

// ranged attack on selected target otherwise
IF
  !InParty(LastSeenBy(Myself))
THEN
  RESPONSE #100
    <@resetIdleState/>
    EquipRanged()
    AttackReevaluate(LastSeenBy(Myself),30)
END
