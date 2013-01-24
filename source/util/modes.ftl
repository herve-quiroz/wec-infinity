<#-- vim: set syntax=ftl: -->
<#include "macros.ftl"/>
<#include "variables.ftl"/>
<#include "config.ftl"/>

<#if !disableScriptMode>

// Switch to combat mode
IF
  <@isNotLocal "SCRIPT_MODE" scriptModes.COMBAT />
  See([ENEMY])
THEN
  RESPONSE #100
    <@setLocal "SCRIPT_MODE" scriptModes.COMBAT />
    ChangeCurrentScript("combat")
END

// Switch to normal mode
IF
  <@isNotLocal "SCRIPT_MODE" scriptModes.NORMAL />
  !See([ENEMY])
THEN
  RESPONSE #100
    <@setLocal "SCRIPT_MODE" scriptModes.NORMAL />
    ChangeCurrentScript("normal")
END

</#if>
