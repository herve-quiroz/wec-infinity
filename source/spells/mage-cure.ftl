<#-- vim: set syntax=ftl: -->
<#include "macros.ftl"/>
<#include "../util/macros.ftl"/>
<#include "../util/config.ftl"/>

<#if supported_classes?seq_contains("mage")>
<#if modes?seq_contains("combat")>

//------------------------------------------------------------------
// mage spells: cure
//------------------------------------------------------------------

// vocalize
IF
  <@canCastSpell "WIZARD_VOCALIZE"/>
  See([PC])
  StateCheck(LastSeenBy(Myself),STATE_SILENCED)
THEN
  RESPONSE #100
    <@castSpell spell="WIZARD_VOCALIZE" target="LastSeenBy(Myself)"/>
END

</#if>
</#if>
