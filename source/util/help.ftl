<#-- vim: set syntax=ftl: -->
<#include "variables.ftl" />

// bad states
IF
  Or(${badStates?size})
<#list badStates as state>
    StateCheck(Myself,${state})
</#list>
THEN
  RESPONSE #100
    Help()
    Continue()
END

// hold conditions
IF
  Or(${holdConditions?size})
  <#list holdConditions as condition>
    CheckStatGT(Myself,0,${condition})
  </#list>
THEN
  RESPONSE #100
    Help()
    Continue()
END
