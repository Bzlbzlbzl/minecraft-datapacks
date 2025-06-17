# Spawn skeleton (run by skeleton)
scoreboard players set %skeletons crazy_spawns 80

execute unless entity @s[type=stray] unless entity @s[type=bogged] at @s run summon skeleton ~ ~ ~ {Tags:["crazySkeleton","csProcessed"],equipment:{mainhand:{id:"minecraft:bow",count:1}}}
execute if entity @s[type=stray] at @s run summon stray ~ ~ ~ {Tags:["crazySkeleton","csProcessed"],equipment:{mainhand:{id:"minecraft:bow",count:1}}}
execute if entity @s[type=bogged] at @s run summon bogged ~ ~ ~ {Tags:["crazySkeleton","csProcessed"],equipment:{mainhand:{id:"minecraft:bow",count:1}}}
