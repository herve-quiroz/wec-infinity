<#-- vim: set syntax=ftl: -->
<#include "variables.ftl"/>
<#include "config.ftl"/>

<#macro setGlobal name value>
    SetGlobal("${globals[name]}","GLOBAL",${value})
</#macro>

<#macro setLocal name value>
    SetGlobal("${locals[name]}","LOCALS",${value})
</#macro>

<#macro isGlobal name value>
  Global("${globals[name]}","GLOBAL",${value})
</#macro>

<#macro isNotGlobal name value>
  !Global("${globals[name]}","GLOBAL",${value})
</#macro>

<#macro isLocal name value>
  Global("${locals[name]}","LOCALS",${value})
</#macro>

<#macro isNotLocal name value>
  !Global("${locals[name]}","LOCALS",${value})
</#macro>

<#macro isLocalGreatherThan name value>GlobalGT("${name}","LOCALS",${value})</#macro>

<#macro isLocalAtLeast name value>
<#if value == 0>
<#stop "value is already 0">
</#if><@isLocalGreatherThan name=name value=value-1/></#macro>

<#macro isLocalTimerNotActive name>
  <#if !localTimers[name]?exists>
    <#stop "unknown local timer: " + name />
  </#if>
  <#if useLightWeightTimers>
  TimerExpired(${localTimers[name]})
  <#else>
  !GlobalTimerNotExpired("${name}","LOCALS")
  </#if>
</#macro>

<#macro setLocalTimer name value>
  <#if !localTimers[name]?exists>
    <#stop "unknown local timer: " + name />
  </#if>
  <#if useLightWeightTimers>
    StartTimer(${localTimers[name]},${value})
  <#else>
    SetGlobalTimer("${name}","LOCALS",${value})
  </#if>
</#macro>

<#macro isGlobalTimerActive name>
  <#if !globalTimers[name]?exists>
    <#stop "unknown global timer: " + name />
  </#if>
  GlobalTimerNotExpired("${globalTimers[name]}","GLOBAL")
</#macro>

<#macro isGlobalTimerNotActive name>
  <#if !globalTimers[name]?exists>
    <#stop "unknown global timer: " + name />
  </#if>
  !GlobalTimerNotExpired("${globalTimers[name]}","GLOBAL")
</#macro>

<#macro setGlobalTimer name value>
    SetGlobalTimer("${globalTimers[name]}","GLOBAL",${value})
</#macro>

<#macro idle>
  Or(2)
    ActionListEmpty()
    Global("${locals.FOLLOWING}","LOCALS",1)
</#macro>

<#macro resetIdleState>
<#--
    SetGlobal("${locals.FOLLOWING}","LOCALS",0)
-->
</#macro>

<#macro isEveryoneInRange range>
  <#list 1..numberOfPlayers as player>
  Range(Player${player},${range})
  </#list>
</#macro>

<#macro isAnyoneInRange range>
  Or(${numberOfPayers})
  <#list 1..numberOfPlayers as player>
    Range(Player${player},${range})
  </#list>
</#macro>

<#macro seeAllPlayers>
  Or(${numberOfPlayers})
  <#list 1..numberOfPlayers as player>
    See(Player${player})
  </#list>
</#macro>

<#macro isGeneralClass target class>
  <#if game = "iwd">
  ClassEX(${target},${class})
  <#elseif game = "bg2">
  Class(${target},${class}_ALL)
  <#else>
    <#stop "game not supported: " + game />
  </#if>
</#macro>

<#macro isNotGeneralClass target class>
  <#if game = "iwd">
  !ClassEX(${target},${class})
  <#elseif game = "bg2">
  !Class(${target},${class}_ALL)
  <#else>
    <#stop "game not supported: " + game />
  </#if>
</#macro>

<#macro logMessage target message>
    DisplayString(${target},${message})
</#macro>

<#macro displayMessage target message>
  <#if game = "iwd">
    FloatMessage(${target},${message})
  <#elseif game = "bg2">
    DisplayStringHead(${target},${message})
  </#if>
</#macro>

<#macro isImmuneToNormalWeapons target>
  Or(3)
  <#list 1..3 as power>
    HasItemEquiped("IMMUNE${power}",${target})
  </#list>
</#macro>

<#macro section title>
//------------------------------------------------------------------
// ${title}
//------------------------------------------------------------------
</#macro>
