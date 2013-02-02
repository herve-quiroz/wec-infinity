<#-- vim: set syntax=ftl: -->
<#include "../util/macros.ftl">
<#include "../util/config.ftl"/>

<#if supported_classes?seq_contains("thief")>

<@section "thief abilities" />

<#--
IF
  <@isGeneralClass "Myself" "THIEF"/>
  !ModalState(Myself,STEALTH)
  CheckStatGT(Myself,50,STEALTH)
  !StateCheck(Myself,STATE_INVISIBLE)
  !StateCheck(Myself,STATE_IMPROVEDINVISIBLITY)
THEN
  RESPONSE #100
    FloatMessage(Myself,${strings.ENGAGE})
    <@resetIdleState/>
    Hide()
END
-->

IF
  <@isGeneralClass "Myself" "THIEF"/>
  ActionListEmpty()
  !Exists([EVILCUTOFF])
  !ModalState(DETECTTRAPS)
  CheckStatGT(Myself,50,TRAPS)
  !ModalState(STEALTH)
  !StateCheck(Myself,STATE_INVISIBLE)
  !StateCheck(Myself,STATE_IMPROVEDINVISIBLITY)
THEN
  RESPONSE #100
    <@resetIdleState/>
    FindTraps()
END

</#if>
