<#-- vim: set syntax=ftl: -->
<#include "macros.ftl"/>
<#include "variables.ftl"/>
<#include "../combat/macros.ftl"/>
<#include "../util/macros.ftl"/>
<#include "../util/config.ftl"/>

<#if supported_classes?seq_contains("mage")>
<#if modes?seq_contains("combat")>

//------------------------------------------------------------------
// mage spells: against trolls
//------------------------------------------------------------------

// WIZARD_SHROUD_OF_FLAME for dying trolls
IF
  <@canCastSpell "WIZARD_SHROUD_OF_FLAME"/>
  <@isGlobalTimerNotActive "KILL_TROLL"/>
  See([EVILCUTOFF.0.TROLL])
  HPLT(LastSeenBy(Myself),10)
THEN
  RESPONSE #100
    <@setGlobalTimer "KILL_TROLL" "ONE_ROUND"/>
    <@castSpell spell="WIZARD_SHROUD_OF_FLAME" target="LastSeenBy(Myself)"/>
END

// melf acid arrow for dying trolls
IF
  <@canCastSpell "WIZARD_MELFS_ACID_ARROW"/>
  <@isGlobalTimerNotActive "KILL_TROLL"/>
  See([EVILCUTOFF.0.TROLL])
  HPLT(LastSeenBy(Myself),10)
THEN
  RESPONSE #100
    <@setGlobalTimer "KILL_TROLL" "ONE_ROUND"/>
    <@castSpell spell="WIZARD_MELFS_ACID_ARROW" target="LastSeenBy(Myself)"/>
END

</#if>
</#if>
