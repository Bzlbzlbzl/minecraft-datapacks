# # # Vector Space Visualizer - Bzlbzlbzl # # #

#Summons the menu llama for anyone who triggered _menu, and teleports it in front of them
execute as @a[scores={_menu=1..}] run tellraw @s {"text":"Fetching Menu... ","color":"green"}
execute as @a[scores={_menu=1..}] run function vsv:scripts/llama/invisi_spawn
execute as @a[scores={_menu=..-1}] run function vsv:scripts/llama/position_menu
execute as @e[type=llama,tag=vsvMenu,tag=!vsvTaken] run tag @s add toKill
execute as @e[type=llama,tag=vsvMenu,tag=vsvTaken] run tag @s remove vsvTaken

#Llama menu inventory stuff (crafting, block replacement, info)
clear @a gold_block{vsv:0}
clear @a crafting_table{vsv:0}
execute as @e[type=minecraft:llama,tag=vsvMenu] unless data entity @s Items[{Slot: 2b, tag: {vsv:0}}] run data merge entity @s {Items:[{Slot: 2b, id: "minecraft:gold_block", Count: 1b, tag: {display:{Name:'{"translate":"Matrix Editor","color":"gold","bold":true,"italic":false}',Lore:['{"translate":"Replace center with colored wool","color":"light_purple","bold":false,"italic":true}','{"text":"to modify the transformation matrix. ","color":"light_purple","bold":false,"italic":true}','{"text":"Leave empty for no change. ","color":"light_purple","bold":false,"italic":true}']},HideFlags:127,vsv:0,Enchantments:[{}]}}]}
#MAKE SURe to make llama CHECKS
execute as @e[type=minecraft:llama,tag=vsvMenu] unless data entity @s Items[{Slot: 11b, tag: {vsv:0}}] run function vsv:scripts/llama/craft_num
execute as @e[type=minecraft:llama,tag=vsvMenu] unless data entity @s Items[{Slot: 11b, tag: {vsv:0}}] run data merge entity @s {Items:[{Slot: 11b, id: "minecraft:crafting_table", Count: 1b, tag: {display:{Name:'{"translate":"Number Crafter","color":"gold","bold":true,"italic":false}',Lore:['{"translate":"Fill top and bottom slots with numbers","color":"light_purple","bold":false,"italic":true}','{"text":"to craft a new number. ","color":"light_purple","bold":false,"italic":true}']},HideFlags:127,vsv:0,Enchantments:[{}]}}]}


#Centers origin on player position when triggered and summons axis depending on value. Animation follows
execute as @a[scores={center=1},limit=1] run tellraw @a [{"text":"Generating Axis... ","color":"green"},{"text":"Glowing: ","color":"white"},{"text":"False","color":"yellow"}]
execute as @a[scores={center=2},limit=1] run tellraw @a [{"text":"Generating Axis... ","color":"green"},{"text":"Glowing: ","color":"white"},{"text":"True","color":"yellow"}]
execute as @a[scores={center=3..},limit=1] run tellraw @a [{"text":"Generating Axis... ","color":"green"},{"text":"None","color":"red"}]
execute as @a[scores={center=1..},limit=1] run function vsv:scripts/center/create_center
execute as @e[type=armor_stand,limit=1,tag=vsvOrigin,scores={values=1}] run function vsv:scripts/animation/animation_delay_axis
execute as @e[type=armor_stand,limit=1,tag=vsvOrigin,scores={values=1..}] run scoreboard players remove @s values 1

#Vector generation animation delay stuff (ONLY FOR GENERATION)
execute as @e[type=block_display,tag=vsvVector,scores={values=1}] run function vsv:scripts/animation/animation_delay_vector
execute as @e[type=block_display,tag=vsvVector,scores={values=1..}] run scoreboard players remove @s values 1

#Vector trigger summon vector as player
execute as @a[scores={vector=1..}] run tellraw @a [{"text":"Generating Vector... ","color":"green"},{"text":"Size Set: ","color":"light_purple"},{"score":{"name":"@s","objective":"vector"},"color":"gold"},{"text":", ","color":"light_purple"},{"text":"Glowing: ","color":"white"},{"text":"False","color":"yellow"}]
execute as @a[scores={vector=1..}] at @s run function vsv:scripts/vector/create_vector
execute as @a[scores={vector=..-1}] run scoreboard players operation %text values = @s vector
execute as @a[scores={vector=..-1}] run scoreboard players operation %text values *= %-1 values
execute as @a[scores={vector=..-1}] run tellraw @a [{"text":"Generating Vector... ","color":"green"},{"text":"Size Set: ","color":"light_purple"},{"score":{"name":"%text","objective":"values"},"color":"gold"},{"text":", ","color":"light_purple"},{"text":"Glowing: ","color":"white"},{"text":"True","color":"yellow"}]
execute as @a[scores={vector=..-1}] at @s run function vsv:scripts/vector/create_vector

#Detects if player riding llama, adds toKill. If toKill, then updates score values
execute as @a[nbt={RootVehicle:{Entity:{Tags:["vsvMenu"]}}}] on vehicle run tag @s add toKill

#First teleports the player off, then updates and kills all toKill llama menus
execute as @a[predicate=vsv:riding_death] run tellraw @s {"text":"Saving Data... ","color":"green"}
execute as @a[predicate=vsv:riding_death] run clear @s #minecraft:wool{vsv:1}
execute as @a[predicate=vsv:riding_death] run clear @s #minecraft:wool{vsv:2}
execute as @a[predicate=vsv:riding_death] run kill @e[type=item,nbt={Item:{tag:{vsv:1}}}]
execute as @a[predicate=vsv:riding_death] run kill @e[type=item,nbt={Item:{tag:{vsv:2}}}]
execute as @a[predicate=vsv:riding_death] at @s run tp @s ~ ~ ~
execute as @e[type=llama,tag=vsvMenu,tag=toKill] run function vsv:scripts/llama/llama_update
execute as @e[type=llama,tag=vsvMenu,tag=toKill] at @s run tp @s ~ -72 ~
kill @e[type=llama,tag=vsvMenu,tag=toKill]

#Vector space trigger mechanics
execute if score %space_trigger values matches 2 as @a[scores={space=1..},limit=1] run tellraw @a [{"text":"Space Size Set: ","color":"light_purple"},{"score":{"name":"@s","objective":"space"},"color":"gold"},{"text":", ","color":"light_purple"},{"text":"Glowing: ","color":"white"},{"text":"False","color":"yellow"}]
execute if score %space_trigger values matches 2 as @a[scores={space=1..},limit=1] run tellraw @a {"text":"Starting Space Generation...","color":"green"}
execute if score %space_trigger values matches 2 as @a[scores={space=1..},limit=1] run scoreboard players operation %vector_size values = @s space
execute if score %space_trigger values matches 2 as @a[scores={space=1..},limit=1] as @e[tag=vsvOrigin] at @s run function vsv:scripts/center/prepare_sphere
execute if score %space_trigger values matches 2 as @a[scores={space=1..},limit=1] run scoreboard players set %space_trigger values -1

execute if score %space_trigger values matches 2 as @a[scores={space=..-1},limit=1] run scoreboard players operation %text values = @s space
execute if score %space_trigger values matches 2 as @a[scores={space=..-1},limit=1] run scoreboard players operation %text values *= %-1 values
execute if score %space_trigger values matches 2 as @a[scores={space=..-1},limit=1] run tellraw @a [{"text":"Space Size Set: ","color":"light_purple"},{"score":{"name":"%text","objective":"values"},"color":"gold"},{"text":", ","color":"light_purple"},{"text":"Glowing: ","color":"white"},{"text":"True","color":"yellow"}]
execute if score %space_trigger values matches 2 as @a[scores={space=..-1},limit=1] run tellraw @a {"text":"Starting Space Generation...","color":"green"}
execute if score %space_trigger values matches 2 as @a[scores={space=..-1},limit=1] run scoreboard players operation %vector_size values = @s space
execute if score %space_trigger values matches 2 as @a[scores={space=..-1},limit=1] as @e[tag=vsvOrigin] at @s run function vsv:scripts/center/prepare_sphere
execute if score %space_trigger values matches 2 as @a[scores={space=..-1},limit=1] run scoreboard players set %space_trigger values -1

execute if score %space_trigger values matches 1 as @a[scores={space=1..},limit=1] run tellraw @a [{"text":"Space Increment Set: ","color":"light_purple"},{"score":{"name":"@s","objective":"space"},"color":"gold"}]
execute if score %space_trigger values matches 1 as @a[scores={space=1..},limit=1] run scoreboard players operation %space_incr values = @s space
execute if score %space_trigger values matches 1 as @a[scores={space=1..},limit=1] run scoreboard players set %space_trigger values 2

execute if score %space_trigger values matches 0 as @a[scores={space=1..},limit=1] run tellraw @a [{"text":"Space Distance Set: ","color":"light_purple"},{"score":{"name":"@s","objective":"space"},"color":"gold"}]
execute if score %space_trigger values matches 0 as @a[scores={space=1..},limit=1] run scoreboard players operation %space_dist values = @s space
execute if score %space_trigger values matches 0 as @a[scores={space=1..},limit=1] run scoreboard players set %space_trigger values 1

execute if score %space_trigger values matches 0..1 as @a[scores={space=..-1},limit=1] run tellraw @a {"text":"Reset Space Generation","color":"dark_red"}
execute if score %space_trigger values matches 0..1 as @a[scores={space=..-1},limit=1] run scoreboard players set %space_trigger values 0
execute if score %space_trigger values matches -1 run scoreboard players set %space_trigger values 0

#Vector space generation iterations
execute unless score %circle_count values matches 1.. if score %sphere_count values matches 1.. as @e[type=armor_stand,tag=vsvOrigin] at @s run function vsv:scripts/center/draw_sphere
execute if score %circle_count values matches 1.. as @e[type=armor_stand,tag=vsvOrigin] at @s run function vsv:scripts/center/draw_circles
#Need to run this because of some glitch, not exactly sure why
execute if score %circle_count values matches 0 if score %sphere_count values matches 0 as @e[type=armor_stand,tag=vsvOrigin] at @s run function vsv:scripts/center/draw_circles
#Finally to top off the top bottom
execute if score %circle_count values matches -1 if score %sphere_count values matches 0 as @e[type=armor_stand,tag=vsvOrigin] at @s rotated 0 90 run function vsv:scripts/center/draw_circles

#Transfroms every tick
execute if score %transformation values matches 1.. as @e[tag=vsvVector,type=block_display] at @s run function vsv:scripts/center/transform
execute if score %transformation values matches 0 as @e[tag=vsvVector,type=block_display] at @s run function vsv:scripts/center/transform_final
execute if score %transformation values matches 0.. run scoreboard players remove %transformation values 1
#Transform trigger mechanics
execute as @a[scores={_transform=..-1},limit=1] run tellraw @a {"text":"Canceling Transformation...","color":"dark_red"}
execute as @a[scores={_transform=..-1},limit=1] run scoreboard players set %transformation values -1
execute as @a[scores={_transform=1..},limit=1] run tellraw @a {"text":"Executing Transformation...","color":"green"}
execute as @a[scores={_transform=1..},limit=1] run scoreboard players operation %transform_speed values = @s _transform
execute as @a[scores={_transform=1..},limit=1] run function vsv:scripts/center/transform_setup

#Animation trigger (for fun)
execute as @a[scores={animate=1},limit=1] run tellraw @a {"text":"Beginning Bouncy Animation...","color":"green"}
execute as @a[scores={animate=1},limit=1] run scoreboard players set %animate values 1
execute as @a[scores={animate=1},limit=1] run scoreboard players set %animation_count values 0
execute as @a[scores={animate=..-1},limit=1] run tellraw @a {"text":"Stopping Animations...","color":"dark_red"}
execute as @a[scores={animate=..-1},limit=1] run scoreboard players set %animate values 0
execute as @a[scores={animate=..-1},limit=1] run scoreboard players set %animation_count values 0
#Animate loop per tick
execute if score %animate values matches 1 if score %animation_count values matches 0 run scoreboard players set %animation_count values 20

execute if score %animate values matches 1 if score %animation_count values matches 20 run function vsv:scripts/animation/animate_bouncing_expand
execute if score %animate values matches 1 if score %animation_count values matches 10 run function vsv:scripts/animation/animate_bouncing_squish

execute if score %animate values matches 1 if score %animation_count values matches 1.. as @e[tag=vsvVector,type=block_display] at @s run function vsv:scripts/center/transform
execute if score %animate values matches 1 if score %animation_count values matches 1.. run scoreboard players remove %animation_count values 1

#Scoreboard trigger reset (This should be at end)
execute as @a unless score @s _menu matches 0 at @s positioned ^ ^ ^2 positioned ~ ~-1 ~ unless entity @e[type=llama,tag=vsvMenu,distance=..3] run scoreboard players enable @s _menu
execute as @a unless score @s _menu matches 0 at @s positioned ^ ^ ^2 positioned ~ ~-1 ~ unless entity @e[type=llama,tag=vsvMenu,distance=..3] run scoreboard players set @s _menu 0
execute as @a unless score @s center matches 0 run scoreboard players enable @a center
execute as @a unless score @s center matches 0 run scoreboard players set @s center 0
execute as @a unless score @s vector matches 0 run scoreboard players enable @a vector
execute as @a unless score @s vector matches 0 run scoreboard players set @s vector 0
execute as @a unless score @s space matches 0 run scoreboard players enable @a space
execute as @a unless score @s space matches 0 run scoreboard players set @s space 0
execute as @a unless score @s _transform matches 0 run scoreboard players enable @a _transform
execute as @a unless score @s _transform matches 0 run scoreboard players set @s _transform 0
execute as @a unless score @s animate matches 0 run scoreboard players enable @a animate
execute as @a unless score @s animate matches 0 run scoreboard players set @s animate 0
