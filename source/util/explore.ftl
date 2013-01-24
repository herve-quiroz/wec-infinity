<#-- vim: set syntax=ftl: -->
<#include "hot-keys.ftl" />

// Explore
IF
  HotKey(${hotKeys.explore})
THEN
  RESPONSE #100
    Explore()
END
