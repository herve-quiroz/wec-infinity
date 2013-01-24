<#-- vim: set syntax=ftl: -->

<#assign
  supportedClasses = [
    "fighter",
    "mage",
    "cleric",
    "thief"
  ]
/>

<#assign
  alignments = [
    "good",
    "neutral"
  ]
/>

<#assign numberOfPlayers = 5 />

<#assign
  playerFollow = {
    "Player2": { "mode":"follow-formation-player1", "position":"[0.-7]", "minimumDistance":10, "maximumDistance":10 },
    "Player3": { "mode":"follow-formation-player1", "position":"[6.-3]", "minimumDistance":15, "maximumDistance":15 },
    "Player4": { "mode":"follow-formation-player1", "position":"[3.6]", "minimumDistance":15, "maximumDistance":15 },
    "Player5": { "mode":"follow-formation-player1", "position":"[-3.6]", "minimumDistance":15, "maximumDistance":15 },
    "Player6": { "mode":"follow-formation-player1", "position":"[-6.-3]", "minimumDistance":10, "maximumDistance":15 }
  }
/>

<#assign
  rangedClasses = [
    "MAGE"
  ]
/>

<#include "main.ftl">
