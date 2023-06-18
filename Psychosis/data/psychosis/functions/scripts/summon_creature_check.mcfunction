#Summons psychosis creatures first check RUN BY PLAYER
summon area_effect_cloud ~ ~4 ~ {Tags:["psyMarker"]}
scoreboard players set %crash_check psychosis 0
function psychosis:scripts/spread_far

execute if score %crash_check psychosis matches 10.. run scoreboard players set @s psy_check -200
execute if score %crash_check psychosis matches 10.. run tag @s remove psychosis

execute unless score %crash_check psychosis matches 10.. run function psychosis:scripts/summon_creature

kill @e[tag=psyMarker]
