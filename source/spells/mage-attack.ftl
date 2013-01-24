<#-- vim: set syntax=ftl: -->
<#include "macros.ftl"/>
<#include "variables.ftl"/>
<#include "../combat/macros.ftl"/>
<#include "../util/macros.ftl"/>
<#include "../util/config.ftl"/>

<#if supportedClasses?seq_contains("mage")>
<#if modes?seq_contains("combat")>

//------------------------------------------------------------------
// mage spells: attack
//------------------------------------------------------------------

<#--
<#list [ 15 ] as range>

// fireball (${spells["WIZARD_FIREBALL"].aoe}' radius) when all PCs in range ${range}
IF
  <@canCastSpell "WIZARD_FIREBALL"/>
  NumCreatureGT([ENEMY],4)
  !Range(TenthNearestEnemyOf(Myself),${range + spells["WIZARD_FIREBALL"].aoe / 2})
  <@isEveryoneInRange range/>
THEN
  RESPONSE #100
    <@castSpell spell="WIZARD_FIREBALL" target="TenthNearestEnemyOf(Myself)"/>
END
</#list>

<#list [ 15 ] as range>

// skull trap (${spells["WIZARD_SKULL_TRAP"].aoe}' radius) when all PCs in range ${range}
IF
  <@canCastSpell "WIZARD_SKULL_TRAP"/>
  <@enemies 2 2/>
  !Range(TenthNearestEnemyOf(Myself),${range + spells["WIZARD_SKULL_TRAP"].aoe / 2})
  <@isEveryoneInRange range/>
THEN
  RESPONSE #100
    <@castSpell spell="WIZARD_SKULL_TRAP" target="TenthNearestEnemyOf(Myself)"/>
END
</#list>
-->

// fireball (${spells["WIZARD_FIREBALL"].aoe}' radius)
IF
  <@canCastSpell "WIZARD_FIREBALL"/>
  Or(2)
    <@isGlobalTimerActive "FORCE_AOE_SPELLS"/>
    NumCreatureGT([ENEMY],6)
  !Range(TenthNearestEnemyOf(Myself),10)
  <#-- <@isGlobalTimerNotActive "WIZARD_FIREBALL"/> -->
THEN
  RESPONSE #100
    <#-- <@setGlobalTimer "WIZARD_FIREBALL" "ONE_ROUND"/> -->
    <@castSpell spell="WIZARD_FIREBALL" target="TenthNearestEnemyOf(Myself)"/>
END

<#if game = "iwd">
// sunfire (${spells["WIZARD_SUNFIRE"].aoe}' radius)
IF
  <@canCastSpell "WIZARD_SUNFIRE"/>
  NumCreatureGT([ENEMY],4)
  Range(FifthNearestEnemyOf(Myself),${spells["WIZARD_SUNFIRE"].aoe / 2})
  HPGT(MostDamagedOf([PC]),30)
THEN
  RESPONSE #100
    <@castSpell spell="WIZARD_SUNFIRE" target="Myself"/>
END
</#if>

// power word kill
IF
  <@canCastSpell "WIZARD_POWER_WORD_KILL"/>
  <@threatLevel 3 />
  HPLT(LastSeenBy(Myself),60)
  CheckStatLT(LastSeenBy(Myself),25,RESISTMAGIC)
THEN
  RESPONSE #100
    <@castSpell spell="WIZARD_POWER_WORD_KILL" target="LastSeenBy(Myself)"/>
END

// power word blind
IF
  <@canCastSpell "WIZARD_POWER_WORD_BLIND"/>
  <@threatLevel 3 />
  !StateCheck(LastSeenBy(Myself),STATE_BLIND)
  CheckStatLT(LastSeenBy(Myself),25,RESISTMAGIC)
THEN
  RESPONSE #100
    <@castSpell spell="WIZARD_POWER_WORD_BLIND" target="LastSeenBy(Myself)"/>
END

// finger of death
IF
  <@canCastSpell "WIZARD_FINGER_OF_DEATH"/>
  <@threatLevel 3 />
  HPGT(LastSeenBy(Myself),40)
  CheckStatLT(LastSeenBy(Myself),25,RESISTMAGIC)
THEN
  RESPONSE #100
    <@castSpell spell="WIZARD_FINGER_OF_DEATH" target="LastSeenBy(Myself)"/>
END

// disintegrate
IF
  <@canCastSpell "WIZARD_DISINTEGRATE"/>
  <@threatLevel 3 />
  HPGT(LastSeenBy(Myself),40)
  CheckStatLT(LastSeenBy(Myself),25,RESISTMAGIC)
THEN
  RESPONSE #100
    <@castSpell spell="WIZARD_DISINTEGRATE" target="LastSeenBy(Myself)"/>
END

<#if game = "bg2">
// greater malison
IF
  <@canCastSpell "WIZARD_GREATER_MALISON"/>
  <@threatLevel 3 />
  CheckStatLT(LastSeenBy(Myself),25,RESISTMAGIC)
THEN
  RESPONSE #100
    <@castSpell spell="WIZARD_GREATER_MALISON" target="LastSeenBy(Myself)"/>
END
</#if>

<#if game = "iwd">
// hold monster
IF
  <@canCastSpell "WIZARD_HOLD_MONSTER"/>
  <@threatLevel 2 />
  <#list holdConditions as condition>
  !CheckStatGT(LastSeenBy(Myself),0,${condition})
  </#list>
  CheckStatLT(LastSeenBy(Myself),25,RESISTMAGIC)
THEN
  RESPONSE #100
    <@castSpell spell="WIZARD_HOLD_MONSTER" target="LastSeenBy(Myself)"/>
END
</#if>

<#if game = "iwd">
<#list [ 15 ] as range>

// Mordenkainen’s Force Missiles
IF
  <@canCastSpell "WIZARD_MORDENKAINENS_FORCE_MISSILES"/>
  <@threatLevel 2 />
<#list [ "WIZARD_FLAME_ARROW", "WIZARD_MAGIC_MISSILE", "WIZARD_MELFS_ACID_ARROW" ] as spell>
  Or(2)
    HPGT(LastSeenBy(Myself),40)
    !HaveSpell("${spell}")
</#list>
  CheckStatLT(LastSeenBy(Myself),25,RESISTMAGIC)
  !Range(TenthNearestEnemyOf(Myself),${range + spells["WIZARD_MORDENKAINENS_FORCE_MISSILES"].aoe / 2})
  <@isEveryoneInRange range/>
THEN
  RESPONSE #100
    <@castSpell spell="WIZARD_MORDENKAINENS_FORCE_MISSILES" target="TenthNearestEnemyOf(Myself)"/>
END
</#list>
</#if>

// flame arrow
IF
  <@canCastSpell "WIZARD_FLAME_ARROW"/>
  <@threatLevel 2 />
<#list [ "WIZARD_MAGIC_MISSILE", "WIZARD_MELFS_ACID_ARROW" ] as spell>
  Or(2)
    HPGT(LastSeenBy(Myself),40)
    !HaveSpell("${spell}")
</#list>
  CheckStatLT(LastSeenBy(Myself),25,RESISTFIRE)
  CheckStatLT(LastSeenBy(Myself),25,RESISTMAGIC)
THEN
  RESPONSE #100
    <@castSpell spell="WIZARD_FLAME_ARROW" target="LastSeenBy(Myself)"/>
END

<#if game = "iwd">
// ice lance
IF
  <@canCastSpell "WIZARD_ICELANCE"/>
  <@threatLevel 2 />
  CheckStatLT(LastSeenBy(Myself),25,RESISTCOLD)
  CheckStatLT(LastSeenBy(Myself),25,RESISTMAGIC)
THEN
  RESPONSE #100
    <@castSpell spell="WIZARD_ICELANCE" target="LastSeenBy(Myself)"/>
END
</#if>

// magic missile
IF
  <@canCastSpell "WIZARD_MAGIC_MISSILE"/>
  <@threatLevel 2 />
  CheckStatLT(LastSeenBy(Myself),25,RESISTMAGIC)
THEN
  RESPONSE #100
    <@castSpell spell="WIZARD_MAGIC_MISSILE" target="LastSeenBy(Myself)"/>
END

// melf acid arrow
IF
  <@canCastSpell "WIZARD_MELFS_ACID_ARROW"/>
  <@threatLevel 2 />
  CheckStatLT(LastSeenBy(Myself),25,RESISTACID)
  CheckStatLT(LastSeenBy(Myself),25,RESISTMAGIC)
  !Race(LastSeenBy(Myself),TROLL)
THEN
  RESPONSE #100
    <@castSpell spell="WIZARD_MELFS_ACID_ARROW" target="LastSeenBy(Myself)"/>
END

</#if>
</#if>
