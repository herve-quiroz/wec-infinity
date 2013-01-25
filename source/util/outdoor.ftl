<#-- vim: set syntax=ftl: -->
<#include "macros.ftl"/>
<#include "../util/macros.ftl"/>
<#include "../util/variables.ftl"/>
<#include "../util/config.ftl"/>

<#if supported_classes?seq_contains("druid")>

//------------------------------------------------------------------
// outdoor/indoor
//------------------------------------------------------------------

// set outdoor
IF
  HotKey(${hotKeys.outdoor})
  <@isNotGlobal "OUTDOOR" 1 />
THEN
  RESPONSE #100
    FloatMessage(Myself,${strings.OUTDOOR})
    <@setGlobal "OUTDOOR" 1 />
END

// set indoor
IF
  Or(2)
    HotKey(${hotKeys.indoor})
    OnCreation()
  <@isNotGlobal "OUTDOOR" 0 />
THEN
  RESPONSE #100
    FloatMessage(Myself,${strings.INDOOR})
    <@setGlobal "OUTDOOR" 0 />
END
</#if>
