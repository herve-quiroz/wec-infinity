<#-- vim: set syntax=ftl: -->
<#include "macros.ftl">
<#include "variables.ftl">

// shortcut to abort script if not idle
IF
  !ActionListEmpty()
  !Global("${locals.FOLLOWING}","LOCALS",1)
THEN
  RESPONSE #100
    // abort script
END

