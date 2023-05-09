# # # Vector Space Visualizer - Bzlbzlbzl # # #

#Summons the menu llama for anyone who triggered _menu, and teleports it in front of them
execute as @a[scores={_menu=1..}] run function vsv:scripts/invisi_spawn
execute as @a[scores={_menu=..-1}] run function vsv:scripts/position_menu
execute as @e[type=llama,tag=vsvMenu,tag=!vsvTaken] run tag @s add toKill
execute as @e[type=llama,tag=vsvMenu,tag=vsvTaken] run tag @s remove vsvTaken

#Llama menu inventory security
clear @a gold_block{vsv:0}
execute as @e[type=minecraft:llama,tag=vsvMenu] unless data entity @s Items[{Slot: 2b, tag: {vsv:0}}] run data merge entity @s {Items:[{Slot: 2b, id: "minecraft:gold_block", Count: 1b, tag: {display:{Name:'{"translate":"Matrix Editor","color":"gold","bold":true,"italic":false}',Lore:['{"translate":"Replace center with colored wool","color":"light_purple","bold":false,"italic":true}','{"text":"to modify the transformation matrix. ","color":"light_purple","bold":false,"italic":true}','{"text":"Leave empty for no change. ","color":"light_purple","bold":false,"italic":true}']},HideFlags:127,vsv:0,Enchantments:[{}]}}]}
execute as @e[type=minecraft:llama,tag=vsvMenu] unless data entity @s Items[{Slot: 6b, tag: {vsv:0}}] run data merge entity @s {Items:[{Slot: 6b, id: "minecraft:gold_block", Count: 1b, tag: {display:{Name:'{"translate":"Matrix Editor","color":"gold","bold":true,"italic":false}',Lore:['{"translate":"Replace center with colored wool","color":"light_purple","bold":false,"italic":true}','{"text":"to modify the transformation matrix. ","color":"light_purple","bold":false,"italic":true}','{"text":"Leave empty for no change. ","color":"light_purple","bold":false,"italic":true}']},HideFlags:127,vsv:0,Enchantments:[{}]}}]}
execute as @e[type=minecraft:llama,tag=vsvMenu] unless data entity @s Items[{Slot: 7b, tag: {vsv:0}}] run data merge entity @s {Items:[{Slot: 7b, id: "minecraft:gold_block", Count: 1b, tag: {display:{Name:'{"translate":"Matrix Editor","color":"gold","bold":true,"italic":false}',Lore:['{"translate":"Replace center with colored wool","color":"light_purple","bold":false,"italic":true}','{"text":"to modify the transformation matrix. ","color":"light_purple","bold":false,"italic":true}','{"text":"Leave empty for no change. ","color":"light_purple","bold":false,"italic":true}']},HideFlags:127,vsv:0,Enchantments:[{}]}}]}
execute as @e[type=minecraft:llama,tag=vsvMenu] unless data entity @s Items[{Slot: 11b, tag: {vsv:0}}] run data merge entity @s {Items:[{Slot: 11b, id: "minecraft:gold_block", Count: 1b, tag: {display:{Name:'{"translate":"Matrix Editor","color":"gold","bold":true,"italic":false}',Lore:['{"translate":"Replace center with colored wool","color":"light_purple","bold":false,"italic":true}','{"text":"to modify the transformation matrix. ","color":"light_purple","bold":false,"italic":true}','{"text":"Leave empty for no change. ","color":"light_purple","bold":false,"italic":true}']},HideFlags:127,vsv:0,Enchantments:[{}]}}]}
execute as @e[type=minecraft:llama,tag=vsvMenu] unless data entity @s Items[{Slot: 12b, tag: {vsv:0}}] run data merge entity @s {Items:[{Slot: 12b, id: "minecraft:gold_block", Count: 1b, tag: {display:{Name:'{"translate":"Matrix Editor","color":"gold","bold":true,"italic":false}',Lore:['{"translate":"Replace center with colored wool","color":"light_purple","bold":false,"italic":true}','{"text":"to modify the transformation matrix. ","color":"light_purple","bold":false,"italic":true}','{"text":"Leave empty for no change. ","color":"light_purple","bold":false,"italic":true}']},HideFlags:127,vsv:0,Enchantments:[{}]}}]}
execute as @e[type=minecraft:llama,tag=vsvMenu] unless data entity @s Items[{Slot: 16b, tag: {vsv:0}}] run data merge entity @s {Items:[{Slot: 16b, id: "minecraft:gold_block", Count: 1b, tag: {display:{Name:'{"translate":"Matrix Editor","color":"gold","bold":true,"italic":false}',Lore:['{"translate":"Replace center with colored wool","color":"light_purple","bold":false,"italic":true}','{"text":"to modify the transformation matrix. ","color":"light_purple","bold":false,"italic":true}','{"text":"Leave empty for no change. ","color":"light_purple","bold":false,"italic":true}']},HideFlags:127,vsv:0,Enchantments:[{}]}}]}

#Centers origin on player position when triggered and summons axis depending on value. Animation follows
execute as @a[scores={center=1..},limit=1] run function vsv:scripts/create_center
execute as @e[type=armor_stand,limit=1,tag=vsvOrigin,scores={values=1}] run function vsv:scripts/animation_delay_axis
execute as @e[type=armor_stand,limit=1,tag=vsvOrigin,scores={values=1..}] run scoreboard players remove @s values 1

#Vector generation animation delay stuff (ONLY FOR GENERATION)
execute as @e[type=block_display,tag=vsvVectorTip,scores={values=1}] run function vsv:scripts/animation_delay_vector_tip
execute as @e[type=block_display,tag=vsvVectorTail,scores={values=1}] run function vsv:scripts/animation_delay_vector_tail
execute as @e[type=block_display,tag=vsvVectorTip,scores={values=1..}] run scoreboard players remove @s values 1
execute as @e[type=block_display,tag=vsvVectorTail,scores={values=1..}] run scoreboard players remove @s values 1

#Detects if player riding llama, adds toKill. If toKill, then updates score values
execute as @a[nbt={RootVehicle:{Entity:{Tags:["vsvMenu"]}}}] on vehicle run tag @s add toKill

#First teleports the player off, then updates and kills all toKill llama menus
execute as @a[predicate=vsv:riding_death] run clear @s #minecraft:wool{vsv:1}
execute as @a[predicate=vsv:riding_death] run clear @s minecraft:sheep_spawn_egg{vsv:1}
execute as @a[predicate=vsv:riding_death] run kill @e[type=item,nbt={Item:{tag:{vsv:1}}}]
execute as @a[predicate=vsv:riding_death] at @s run tp @s ~ ~ ~
execute as @e[type=llama,tag=vsvMenu,tag=toKill] run function vsv:scripts/llama_update
execute as @e[type=llama,tag=vsvMenu,tag=toKill] at @s run tp @s ~ -72 ~
kill @e[type=llama,tag=vsvMenu,tag=toKill]

#Scoreboard trigger reset (This should be at end)
execute as @a unless score @s _menu matches 0 at @s positioned ^ ^ ^2 positioned ~ ~-1 ~ unless entity @e[type=llama,tag=vsvMenu,distance=..3] run scoreboard players enable @s _menu
execute as @a unless score @s _menu matches 0 at @s positioned ^ ^ ^2 positioned ~ ~-1 ~ unless entity @e[type=llama,tag=vsvMenu,distance=..3] run scoreboard players set @s _menu 0
execute as @a unless score @s center matches 0 run scoreboard players enable @a center
execute as @a unless score @s center matches 0 run scoreboard players set @s center 0
