<#include "../util/macros.ftl">

//------------------------------------------------------------------
// bard songs
//------------------------------------------------------------------

IF
  ActionListEmpty()
  Range(Player1,0)
THEN
  RESPONSE #100
    PlayBardSong(THE_BALLAD_OF_THE_THREE_HEROES)
END

IF
  HotKey(X)
  Range(Player1,0)
THEN
  RESPONSE #100
    PlayBardSong(THE_BALLAD_OF_THE_THREE_HEROES)
END


IF
  <#-- GlobalGT("wec_combat_mode","LOCALS",0) -->
  <#-- <@idle/> -->
  ActionListEmpty()
  Class(Myself,BARD)
  !ModalState(Myself,BATTLESONG)
THEN
  RESPONSE #100
    <@resetIdleState/>
    SetGlobal("wec_bard_song","LOCALS",1)
    PlayBardSong(THE_BALLAD_OF_THE_THREE_HEROES)
END
