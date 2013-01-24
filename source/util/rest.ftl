<#-- vim: set syntax=ftl: -->
<#include "hot-keys.ftl" />

// Force rest
IF
  HotKey(${hotKeys.rest})
THEN
  RESPONSE #100
  <#if game = "iwd">
  RestUntilHealed()
  <#elseif game = "bg2">
  Rest()  
  </#if>
END
