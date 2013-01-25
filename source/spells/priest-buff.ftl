<#-- vim: set syntax=ftl: -->
<#include "macros.ftl"/>
<#include "../combat/macros.ftl"/>
<#include "../util/macros.ftl"/>
<#include "../util/config.ftl"/>

<#if supported_classes?seq_contains("cleric")
  || supported_classes?seq_contains("druid")
  || supported_classes?seq_contains("paladin")
  || supported_classes?seq_contains("ranger")
>

//------------------------------------------------------------------
// priest spells: buff
//------------------------------------------------------------------

<#--
<#if supported_classes?seq_contains("cleric")>
// entropy shield
IF
  <@canCastSpell "CLERIC_ENTROPY_SHIELD"/>
  <@threatLevel 3 />
  !GlobalTimerNotExpired("wec_entropy_shield","LOCALS")
THEN
  RESPONSE #100
    SetGlobalTimer("wec_entropy_shield","LOCALS",THREE_TURNS)
    <@castSpell spell="CLERIC_ENTROPY_SHIELD" target="Myself" />
END
</#if>
-->

<#--
<#if supported_classes?seq_contains("cleric")>
// chaotic commands
IF
  <@canCastSpell "CLERIC_CHAOTIC_COMMANDS"/>
  <@threatLevel 3 />
  Or(${mageClasses?size + 2})
  <#list mageClasses as class>
    See([ENEMY.0.0.${class}])
  </#list>
    See([ENEMY.0.UMBERHULK.0])
    See([ENEMY.0.MYCONID.0])
  !StateCheck(LastSeenBy(Myself),STATE_SILENCED)
  !GlobalTimerNotExpired("wec_chaotic_commands","LOCALS")
THEN
  RESPONSE #100
    SetGlobalTimer("wec_chaotic_commands","LOCALS",NINE_TURNS)
    <@castSpell spell="CLERIC_CHAOTIC_COMMANDS" target="Myself"/>
END
</#if>

<#if supported_classes?seq_contains("cleric")>
// defensive harmony (6 rounds)
IF
  <@canCastSpell "CLERIC_DEFENSIVE_HARMONY"/>
  <@threatLevel 3 />
  <@isLocalTimerNotActive "DEFENSIVE_HARMONY"/>
  <@isEveryoneInRange 10/>
THEN
  RESPONSE #100
    <@setLocalTimer "DEFENSIVE_HARMONY" "SIX_ROUNDS"/>
    <@castSpell spell="CLERIC_DEFENSIVE_HARMONY" target="Myself"/>
END
</#if>
-->

<#if game = "iwd">
<#if supported_classes?seq_contains("cleric")>
// greater shield of lathander
IF
  <@canCastSpell "CLERIC_GREATER_SHIELD_OF_LATHANDER"/>
  <@isLocalTimerNotActive "CLERIC_GREATER_SHIELD_OF_LATHANDER"/>
  <@threatLevel 3 />
THEN
  RESPONSE #100
    <@setLocalTimer "CLERIC_GREATER_SHIELD_OF_LATHANDER" "THREE_ROUNDS"/>
    <@castSpell "CLERIC_GREATER_SHIELD_OF_LATHANDER" "Myself" />
END
</#if>
</#if>

<#if game = "iwd">
<#if supported_classes?seq_contains("cleric")>
// righteous wrath of the faithful
IF
  <@canCastSpell "CLERIC_RIGHTEOUS_WRATH_OF_THE_FAITHFUL"/>
  <@isGlobalTimerNotActive "CLERIC_RIGHTEOUS_WRATH_OF_THE_FAITHFUL"/>
  <@threatLevel 3 />
  <@isEveryoneInRange 30/>
THEN
  RESPONSE #100
    <@setGlobalTimer "CLERIC_RIGHTEOUS_WRATH_OF_THE_FAITHFUL" "THREE_TURNS"/>
    <@castSpell "CLERIC_RIGHTEOUS_WRATH_OF_THE_FAITHFUL" "Myself"/>
END
</#if>
</#if>

<#if game = "iwd">
<#if supported_classes?seq_contains("cleric")
  || supported_classes?seq_contains("paladin")>
// recitation
IF
  <@canCastSpell "CLERIC_RECITATION"/>
  !ExtendedStateCheck(Myself,STATE_RECITATION)
  <@isGlobalTimerNotActive "CLERIC_RECITATION"/>
  <@threatLevel 2 />
  <@isEveryoneInRange 30/>
THEN
  RESPONSE #100
    <@setGlobalTimer "CLERIC_RECITATION" "8"/>
    <@castSpell spell="CLERIC_RECITATION" target="Myself"/>
END
</#if>
</#if>

<#if supported_classes?seq_contains("cleric")
  || supported_classes?seq_contains("paladin")>
// prayer
IF
  <@canCastSpell "CLERIC_PRAYER"/>
  <@isGlobalTimerNotActive "CLERIC_PRAYER"/>
  <@threatLevel 2 />
  <@isEveryoneInRange 30/>
THEN
  RESPONSE #100
    <@setGlobalTimer "CLERIC_PRAYER" "ONE_TURN"/>
    <@castSpell spell="CLERIC_PRAYER" target="Myself"/>
END
</#if>

<#--
<#if supported_classes?seq_contains("cleric")>
// chant
IF
  <@canCastSpell "CLERIC_CHANT"/>
  <@threatLevel 2 />
  !StateCheck(Myself,STATE_CHANT)
  <@isEveryoneInRange 30/>
THEN
  RESPONSE #100
    <@castSpell spell="CLERIC_CHANT" target="Myself"/>
END
</#if>
-->

<#if supported_classes?seq_contains("cleric")
  || supported_classes?seq_contains("paladin")>
// bless
IF
  <@canCastSpell "CLERIC_BLESS"/>
  !StateCheck(Myself,STATE_BLESS)
  <@isGlobalTimerNotActive "CLERIC_BLESS"/>
  <@threatLevel 2 />
  <@isEveryoneInRange 20/>
THEN
  RESPONSE #100
    <@setGlobalTimer "CLERIC_BLESS" "8"/>
    <@castSpell spell="CLERIC_BLESS" target="Myself"/>
END
</#if>

<#--
<#if supported_classes?seq_contains("cleric")>
// draw upon holy might (10 rounds)
IF
  <@canCastSpell "CLERIC_DRAW_UPON_HOLY_MIGHT"/>
  <@threatLevel 3 />
  !StateCheck(Myself,STATE_DRAWUPONHOLYMIGHT)
THEN
  RESPONSE #100
    <@castSpell spell="CLERIC_DRAW_UPON_HOLY_MIGHT" target="Myself"/>
END
</#if>
-->

<#if supported_classes?seq_contains("cleric")>
// protection from evil 10' radius
IF
  <@canCastSpell "CLERIC_PROTECTION_FROM_EVIL_10_RADIUS"/>
  <@isGlobalTimerNotActive "CLERIC_PROTECTION_FROM_EVIL_10_RADIUS"/>
  <@threatLevel 2 />
  <@isEveryoneInRange 10/>
THEN
  RESPONSE #100
    <@setGlobalTimer "CLERIC_PROTECTION_FROM_EVIL_10_RADIUS" "SEVEN_TURNS"/>
    <@castSpell spell="CLERIC_PROTECTION_FROM_EVIL_10_RADIUS" target="Myself"/>
END
</#if>

<#if supported_classes?seq_contains("paladin")>
// protection from evil (self)
IF
  <@canCastSpell "PALADIN_PROTECTION_FROM_EVIL"/>
  <@threatLevel 2 />
THEN
  RESPONSE #100
    <@castSpell spell="PALADIN_PROTECTION_FROM_EVIL" target="Myself"/>
END
</#if>

</#if>
