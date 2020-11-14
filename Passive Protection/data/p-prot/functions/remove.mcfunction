#Removes all traces of the datapack (I must kill all the invulnerable (pAI) mobs as well; however since some may not be in loaded chunks, remove function may not always work)
tellraw @a [{"text":"removed - "},{"text":"Passive Protection","color":"green","bold":true},{"text":" - ","color":"white","bold":false},{"text":"by Bzlbzlbzl","color":"light_purple"}]

team remove p-prot
scoreboard objectives remove p_prot_id
scoreboard objectives remove p_sneak
scoreboard objectives remove p_last
scoreboard objectives remove p_mod
scoreboard objectives remove p_pos
scoreboard objectives remove p_dpos

execute as @e[type=cat,tag=pAI] run data merge entity @s {Owner:[I; 0, 0, 0, 0]}
execute as @e[tag=pAI] at @s run tp @s ~ -5 ~
kill @e[tag=pAI]

datapack disable "file/Passive Protection"