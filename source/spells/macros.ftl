<#-- vim: set syntax=ftl: -->
<#include "variables.ftl">
<#include "../util/config.ftl">
<#include "../util/macros.ftl">
<#include "../util/variables.ftl">

<#macro castSpell spell target>
  <#if !spells[spell]?exists>
    <#stop "spell does not exist: " + spell />
  </#if>
  <#if spells[spell].message != 0>
    <@displayMessage "Myself" spells[spell].message />
  </#if>
  <#if target != "Myself" && (!spells[spell].type?exists || spells[spell].type != spellTypes.HEALING)>
    <@displayMessage target strings.TARGET />
  </#if>
    SetInterrupt(FALSE)
    <@resetIdleState/>
    <@setLocalTimer "SPELL_CAST" 6 />
    Spell(${target},${spell})
    SetInterrupt(TRUE)
</#macro>

<#macro canCastSpell spell>
  HaveSpell(${spell})
  <@isLocalTimerNotActive "SPELL_CAST" />
  <#if spell?starts_with("CLERIC_")>
  CheckStatLT(Myself,25,SPELLFAILUREPRIEST)
  </#if>
  <#if spell?starts_with("WIZARD_")>
  CheckStatLT(Myself,25,SPELLFAILUREMAGE)
  </#if>
</#macro>

<#macro healSpell spell target hp combat>

// ${spell} when HP < ${hp}%
IF
  <@canCastSpell spell/>
<#if !combat>
  NumCreature([ENEMY],0)
<#else>
  !HaveSpell("CLERIC_HEAL")
</#if>
  HPPercentLT(${target},${hp})
THEN
  RESPONSE #100
    <@castSpell spell=spell target=target/>
END
</#macro>
