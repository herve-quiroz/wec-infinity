<#-- vim: set syntax=ftl: -->
<#include "macros.ftl"/>
<#include "variables.ftl"/>
<#include "../util/macros.ftl"/>
<#include "../util/config.ftl"/>

<#if supportedClasses?seq_contains("mage")>

//------------------------------------------------------------------
// mage spells: buff
//------------------------------------------------------------------

<#--
// haste
IF
  <@canCastSpell "WIZARD_HASTE"/>
  <@threatLevel 3 />
  !StateCheck(Myself,STATE_HASTED)
  <@isEveryoneInRange spells["WIZARD_HASTE"].aoe/>
THEN
  RESPONSE #100
    <@castSpell spell="WIZARD_HASTE" target="Myself"/>
END
-->
</#if>
