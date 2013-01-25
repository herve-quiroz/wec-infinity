<#-- vim: set syntax=ftl: -->

<#assign
  supported_classes = [
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

<#assign number_of_players = 5 />

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
