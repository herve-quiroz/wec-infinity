<#-- vim: set syntax=ftl: -->
<#include "macros.ftl"/>
<#include "../util/macros.ftl"/>
<#include "../util/variables.ftl"/>
<#include "../util/config.ftl"/>

<#if supported_classes?seq_contains("cleric")
  || supported_classes?seq_contains("druid")
  || supported_classes?seq_contains("paladin")
  || supported_classes?seq_contains("ranger")
>

//------------------------------------------------------------------
// priest spells: cure
//------------------------------------------------------------------

<#if supported_classes?seq_contains("paladin")>
// cure disease (paladin)
IF
  <@canCastSpell "PALADIN_CURE_DISEASE"/>
  See([PC])
  StateCheck(LastSeenBy(Myself),STATE_DISEASED)
  <@isGlobalTimerNotActive "CLERIC_CURE_DISEASE"/>
THEN
  RESPONSE #100
    <@setGlobalTimer "CLERIC_CURE_DISEASE" "8" />
    <@castSpell spell="PALADIN_CURE_DISEASE" target="LastSeenBy(Myself)"/>
END
</#if>

<#if supported_classes?seq_contains("cleric")>
// remove fear
IF
  <@canCastSpell "CLERIC_REMOVE_FEAR"/>
  See([PC])
  StateCheck(LastSeenBy(Myself),STATE_PANIC)
  <@isGlobalTimerNotActive "CLERIC_REMOVE_FEAR"/>
THEN
  RESPONSE #100
    <@setGlobalTimer "CLERIC_REMOVE_FEAR" "ONE_ROUND" />
    <@castSpell spell="CLERIC_REMOVE_FEAR" target="LastSeenBy(Myself)"/>
END
</#if>

<#if supported_classes?seq_contains("cleric")>
// neutralize poison
IF
  <@canCastSpell "CLERIC_NEUTRALIZE_POISON"/>
  See([PC])
  StateCheck(LastSeenBy(Myself),STATE_POISONED)
  <@isGlobalTimerNotActive "CLERIC_NEUTRALIZE_POISON"/>
THEN
  RESPONSE #100
    <@setGlobalTimer "CLERIC_NEUTRALIZE_POISON" "ONE_ROUND" />
    <@castSpell spell="CLERIC_NEUTRALIZE_POISON" target="LastSeenBy(Myself)"/>
END
</#if>

<#--
<#if supported_classes?seq_contains("cleric")>
// slow poison
IF
  <@canCastSpell "CLERIC_SLOW_POISON"/>
  See([PC])
  StateCheck(LastSeenBy(Myself),STATE_POISONED)
  <@isLocalTimerNotActive "CLERIC_SLOW_POISON"/>
THEN
  RESPONSE #100
    <@setLocalTimer "CLERIC_SLOW_POISON" "THREE_ROUNDS"/>
    <@castSpell spell="CLERIC_SLOW_POISON" target="LastSeenBy(Myself)"/>
END
</#if>
-->

<#if supported_classes?seq_contains("cleric")>
// cure disease
IF
  <@canCastSpell "CLERIC_CURE_DISEASE"/>
  See([PC])
  StateCheck(LastSeenBy(Myself),STATE_DISEASED)
  <@isGlobalTimerNotActive "CLERIC_CURE_DISEASE"/>
THEN
  RESPONSE #100
    <@setGlobalTimer "CLERIC_CURE_DISEASE" "8" />
    <@castSpell spell="CLERIC_CURE_DISEASE" target="LastSeenBy(Myself)"/>
END
</#if>

<#if supported_classes?seq_contains("cleric")>
// remove paralysis
IF
  <@canCastSpell "CLERIC_REMOVE_PARALYSIS"/>
  See([PC])
  StateCheck(LastSeenBy(Myself),STATE_STUNNED)
  <@isGlobalTimerNotActive "CLERIC_REMOVE_PARALYSIS"/>
THEN
  RESPONSE #100
    <@setGlobalTimer "CLERIC_REMOVE_PARALYSIS" "ONE_ROUND" />
    <@castSpell spell="CLERIC_REMOVE_PARALYSIS" target="LastSeenBy(Myself)"/>
END
</#if>

<#if supported_classes?seq_contains("cleric")>
// exaltation
IF
  <@canCastSpell "CLERIC_EXALTATION"/>
  See([PC])
  Or(6)
    StateCheck(LastSeenBy(Myself),STATE_FEEBLEMINDED)
    StateCheck(LastSeenBy(Myself),STATE_SLEEPING)
    StateCheck(LastSeenBy(Myself),STATE_CONFUSED)
    StateCheck(LastSeenBy(Myself),STATE_PANIC)
    StateCheck(LastSeenBy(Myself),STATE_BERSERK)
    StateCheck(LastSeenBy(Myself),STATE_SLOWED)
  <@isGlobalTimerNotActive "CLERIC_EXALTATION"/>
THEN
  RESPONSE #100
    <@setGlobalTimer "CLERIC_EXALTATION" "ONE_ROUND" />
    <@castSpell spell="CLERIC_EXALTATION" target="LastSeenBy(Myself)"/>
END
</#if>

<#if supported_classes?seq_contains("cleric")>
// free action
IF
  <@canCastSpell "CLERIC_FREE_ACTION"/>
  See([PC])
  Or(${holdConditions?size})
  <#list holdConditions as condition>
    CheckStatGT(LastSeenBy(Myself),0,${condition})
  </#list>
  <@isGlobalTimerNotActive "CLERIC_FREE_ACTION"/>
THEN
  RESPONSE #100
    <@setGlobalTimer "CLERIC_FREE_ACTION" "ONE_ROUND" />
    <@castSpell spell="CLERIC_FREE_ACTION" target="LastSeenBy(Myself)"/>
END
</#if>

</#if>
