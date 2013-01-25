<#-- vim: set syntax=ftl: -->
<#include "macros.ftl"/>
<#include "variables.ftl"/>
<#include "../util/macros.ftl"/>
<#include "../util/config.ftl"/>

<#if supported_classes?seq_contains("cleric")
  || supported_classes?seq_contains("druid")
  || supported_classes?seq_contains("paladin")
  || supported_classes?seq_contains("ranger")
>

//------------------------------------------------------------------
// priest spells: attack
//------------------------------------------------------------------

<#if supported_classes?seq_contains("druid")>
// earthquake
IF
  <@canCastSpell "CLERIC_EARTHQUAKE"/>
  NumCreatureGT([ENEMY],4)
THEN
  RESPONSE #100
    <@castSpell spell="CLERIC_EARTHQUAKE" target="Myself"/>
END
</#if>

<#if supported_classes?seq_contains("cleric")
  || supported_classes?seq_contains("druid")
>
// destruction
IF
  <@canCastSpell "CLERIC_DESTRUCTION"/>
  <@threatLevel 3 />
  Range(LastSeenBy(Myself),3)
THEN
  RESPONSE #100
    <@castSpell spell="CLERIC_DESTRUCTION" target="LastSeenBy(Myself)"/>
END
</#if>

<#if supported_classes?seq_contains("cleric")
  || supported_classes?seq_contains("druid")
>
<#if alignments?seq_contains("evil")>
// harm
IF
  <@canCastSpell "CLERIC_HARM"/>
  <@threatLevel 3 />
  Or(${mageClasses?size + 1})
    See(NearestEnemyOf(Myself))
  <#list mageClasses as class>
    See([ENEMY.0.0.${class}])
  </#list>
  Range(LastSeenBy(Myself),3)
  !General(LastSeenBy(Myself),UNDEAD)
  !Race(LastSeenBy(Myself),ELEMENTAL)
THEN
  RESPONSE #100
    <@castSpell spell="CLERIC_HARM" target="LastSeenBy(Myself)"/>
END
</#if>
</#if>

<#if supported_classes?seq_contains("cleric")
  || supported_classes?seq_contains("druid")
>
// slay living
IF
  <@canCastSpell "CLERIC_SLAY_LIVING"/>
  <@threatLevel 3 />
  Range(LastSeenBy(Myself),3)
THEN
  RESPONSE #100
    <@castSpell spell="CLERIC_SLAY_LIVING" target="LastSeenBy(Myself)"/>
END
</#if>

<#if supported_classes?seq_contains("cleric")
  || supported_classes?seq_contains("druid")
>
<#list [ 15 ] as range>

// flame strike (5' radius) when all PCs in range ${range}
IF
  <@canCastSpell "CLERIC_FLAME_STRIKE"/>
  <@threatLevel 2 />
  !Range(LastSeenBy(Myself),${range + spells["CLERIC_FLAME_STRIKE"].aoe})
  <@isEveryoneInRange range/>
THEN
  RESPONSE #100
    <@castSpell spell="CLERIC_FLAME_STRIKE" target="LastSeenBy(Myself)"/>
END
</#list>
</#if>

<#--
<#if supported_classes?seq_contains("cleric")
  || supported_classes?seq_contains("druid")
>
// blade barrier
IF
  <@threatLevel 3 />
  Range(ThirdNearestEnemyOf(Myself),3)
  NumCreatureGT([ENEMY],2)
  !GlobalTimerNotExpired("wec_blade_barrier","LOCALS")
  !<@isAnyoneInRange 3/>
  <@canCastSpell "CLERIC_BLADE_BARRIER"/>
THEN
  RESPONSE #100
    <@castSpell spell="CLERIC_BLADE_BARRIER" target="Myself"/>
END
</#if>
-->

<#--
<#if supported_classes?seq_contains("cleric")
  || supported_classes?seq_contains("druid")
>
// hold person
IF
  <@canCastSpell "CLERIC_HOLD_PERSON"/>
  <@threatLevel 2 />
  Or(${mageClasses?size + 1})
    See([ENEMY.HUMANOID])
  <#list mageClasses as class>
    See([ENEMY.HUMANOID.0.${class}])
  </#list>
  !StateCheck(LastSeenBy(Myself),STATE_HELPLESS)
THEN
  RESPONSE #100
    <@castSpell spell="CLERIC_HOLD_PERSON" target="LastSeenBy(Myself)"/>
END
</#if>
-->

<#--
<#if supported_classes?seq_contains("cleric")
  || supported_classes?seq_contains("druid")
>
// circle of bones
IF
  <@canCastSpell "CLERIC_CIRCLE_OF_BONES"/>
  <@threatLevel 2 />
  Range(SecondNearestEnemyOf(Myself),3)
  NumCreatureGT([ENEMY],1)
  !GlobalTimerNotExpired("wec_circle_of_bones","LOCALS")
  !<@isAnyoneInRange 3/>
THEN
  RESPONSE #100
    SetGlobalTimer("wec_circle_of_bones","LOCALS",THREE_ROUNDS)
    <@castSpell spell="CLERIC_CIRCLE_OF_BONES" target="Myself"/>
END
</#if>
-->

<#if supported_classes?seq_contains("cleric")
  || supported_classes?seq_contains("druid")
>
// holy smite (${spells["CLERIC_HOLY_SMITE"].aoe}' radius)
IF
  <@canCastSpell "CLERIC_HOLY_SMITE"/>
  NumCreatureGT([ENEMY],4)
<#list ranksToFifth as rank>
  Range(${rank}NearestEnemyOf(Myself),${spells["CLERIC_HOLY_SMITE"].aoe})
</#list>
THEN
  RESPONSE #100
    <@castSpell spell="CLERIC_HOLY_SMITE" target="Myself"/>
END
</#if>

<#if supported_classes?seq_contains("druid")>
// static charge
IF
  <@canCastSpell "CLERIC_STATIC_CHARGE"/>
  <@threatLevel 2 />
	CheckStatLT(LastSeenBy(Myself),26,RESISTELECTRICITY)
	CheckStatLT(LastSeenBy(Myself),26,RESISTMAGIC)
  !GlobalTimerNotExpired("wec_static_charge","LOCALS")
THEN
  RESPONSE #100
    SetGlobalTimer("wec_static_charge","LOCALS",SEVEN_TURNS)
    <@castSpell spell="CLERIC_STATIC_CHARGE" target="LastSeenBy(Myself)"/>
END
</#if>

<#if supported_classes?seq_contains("druid")>
// call lightning
IF
  <@canCastSpell "CLERIC_CALL_LIGHTNING"/>
  <@threatLevel 2 />
	CheckStatLT(LastSeenBy(Myself),26,RESISTELECTRICITY)
	CheckStatLT(LastSeenBy(Myself),26,RESISTMAGIC)
  !GlobalTimerNotExpired("wec_call_lightning","LOCALS")
  <@isGlobal "OUTDOOR" 1 />
THEN
  RESPONSE #100
    SetGlobalTimer("wec_call_lightning","LOCALS",SEVEN_TURNS)
    <@castSpell spell="CLERIC_CALL_LIGHTNING" target="LastSeenBy(Myself)"/>
END
</#if>

<#if supported_classes?seq_contains("druid")>
// sol's searing orb
IF
  <@canCastSpell "CLERIC_SOLS_SEARING_ORB"/>
  <@threatLevel 2 />
	CheckStatLT(LastSeenBy(Myself),26,RESISTMAGIC)
THEN
  RESPONSE #100
    <@castSpell spell="CLERIC_SOLS_SEARING_ORB" target="LastSeenBy(Myself)"/>
END
</#if>

<#if supported_classes?seq_contains("druid")>
// alicorn lance
IF
  <@canCastSpell "CLERIC_ALICORN_LANCE"/>
  <@threatLevel 2 />
	CheckStatLT(LastSeenBy(Myself),26,RESISTMAGIC)
THEN
  RESPONSE #100
    <@castSpell spell="CLERIC_ALICORN_LANCE" target="LastSeenBy(Myself)"/>
END
</#if>

<#if supported_classes?seq_contains("druid")>
// sunscorch
IF
  <@canCastSpell "CLERIC_SUNSCORCH"/>
  <@threatLevel 2 />
	CheckStatLT(LastSeenBy(Myself),26,RESISTMAGIC)
THEN
  RESPONSE #100
    <@castSpell spell="CLERIC_SUNSCORCH" target="LastSeenBy(Myself)"/>
END
</#if>

<#if supported_classes?seq_contains("paladin")>
// smite evil
IF
  <@canCastSpell "PALADIN_SMITE_EVIL"/>
  Alignment(LastSeenBy(Myself),MASK_EVIL)
  <@threatLevel 3 />
THEN
  RESPONSE #100
    <@castSpell spell="PALADIN_SMITE_EVIL" target="LastSeenBy(Myself)"/>
END
</#if>

</#if>
