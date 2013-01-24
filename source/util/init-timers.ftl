<#-- vim: set syntax=ftl: -->
<#include "variables.ftl" />

<#if useLightWeightTimers>

// initialize timers
IF
  OnCreation()
THEN
  RESPONSE #100
<#list localTimers?keys as timer>
    StartTimer(${localTimers[timer]},1)
</#list>
END
</#if>
