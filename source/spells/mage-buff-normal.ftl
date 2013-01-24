<#-- vim: set syntax=ftl: -->
<#include "macros.ftl"/>
<#include "variables.ftl"/>
<#include "../util/macros.ftl"/>
<#include "../util/config.ftl"/>

<#if supportedClasses?seq_contains("mage")>

//------------------------------------------------------------------
// mage spells: buff (normal mode)
//------------------------------------------------------------------

// armor
IF
  <@canCastSpell "WIZARD_ARMOR"/>
THEN
  RESPONSE #100
    <@castSpell spell="WIZARD_ARMOR" target="Myself"/>
END

</#if>
