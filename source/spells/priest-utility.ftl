<#-- vim: set syntax=ftl: -->
<#include "macros.ftl"/>
<#include "../util/hot-keys.ftl"/>
<#include "../util/config.ftl"/>

<#if supportedClasses?seq_contains("cleric")>

//------------------------------------------------------------------
// priest spells: utility
//------------------------------------------------------------------

// find traps
IF
  HotKey(${hotKeys.findTraps})
  <@canCastSpell "CLERIC_FIND_TRAPS"/>
THEN
  RESPONSE #100
    <@castSpell spell="CLERIC_FIND_TRAPS" target="Myself"/>
END

</#if>
