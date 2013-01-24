<#-- vim: set syntax=ftl: -->
<#include "macros.ftl">
<#include "../util/macros.ftl">
<#include "../util/variables.ftl">
<#include "../util/config.ftl">

<@section "combat" />

<#if game = "iwd" >

// force melee attack up to 6' if not immune to normal weapons
IF
<#list 1..3 as power>
  !HasItemEquiped("IMMUNE${power}",LastSeenBy(Myself))
</#list>
THEN
  RESPONSE #100
    <@resetIdleState/>
    SetBestWeapon(LastSeenBy(Myself),20)
    AttackReevaluate(LastSeenBy(Myself),30)
END

// force melee attack up to 30'
IF
  True()
THEN
  RESPONSE #100
    <@resetIdleState/>
    SetBestWeapon(LastSeenBy(Myself),30)
    AttackReevaluate(LastSeenBy(Myself),30)
END

<#elseif game = "bg2">

// force melee attack if in 6' range or immune to normal weapons
IF
<#list 1..3 as power>
  !HasItemEquiped("IMMUNE${power}",LastSeenBy(Myself))
</#list>
  !Range(LastSeenBy(Myself),6)
THEN
  RESPONSE #100
    <@resetIdleState/>
    EquipMostDamagingMelee()
    EquipRanged()
    AttackReevaluate(LastSeenBy(Myself),30)
END

// force melee attack otherwise
IF
  True()
THEN
  RESPONSE #100
    <@resetIdleState/>
    EquipRanged()
    EquipMostDamagingMelee()
    AttackReevaluate(LastSeenBy(Myself),30)
END

</#if>
