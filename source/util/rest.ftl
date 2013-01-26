<#-- vim: set syntax=ftl: -->
<#include "hot-keys.ftl" />

// Force rest
IF
  HotKey(${hotKeys.rest})
THEN
  RESPONSE #100
  <#if game = "iwd">
  RestUntilHealed()
  <#else>
  Rest()  
  </#if>
END
