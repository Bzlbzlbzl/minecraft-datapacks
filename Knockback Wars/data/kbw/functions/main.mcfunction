# # # Knockback Wars Datapack - Bzlbzlbzl # # #

#Always Effects and Kit Effects; weather clear; bye bye ground arrows
weather clear
effect give @a minecraft:resistance 100000 4 true
effect give @a minecraft:regeneration 100000 1 true
effect give @a minecraft:saturation 100000 0 true
kill @e[type=minecraft:arrow,nbt={inGround:1b}]
effect give @a[team=Ghost] minecraft:invisibility 1 0 true
effect give @a[team=Pyromaniac] minecraft:fire_resistance 1 0 true
effect give @a[team=Assassin] minecraft:speed 1 0 true
effect give @a[team=Knight] minecraft:slowness 1 0 true

#Holding The Stik effects; Witch hold wand particles
effect give @a[team=Knight,nbt={SelectedItem:{id:"minecraft:wooden_sword",tag:{display:{Name:'{"text":"The Stik","color":"dark_red","italic":false}',Lore:['{"text":"A legendary rod which"}','{"text":"hits with great force."}']},Unbreakable:1b,Enchantments:[{id:"minecraft:knockback",lvl:10s}]}}}] minecraft:slowness 1 1 true
effect give @a[team=!Knight,nbt={SelectedItem:{id:"minecraft:wooden_sword",tag:{display:{Name:'{"text":"The Stik","color":"dark_red","italic":false}',Lore:['{"text":"A legendary rod which"}','{"text":"hits with great force."}']},Unbreakable:1b,Enchantments:[{id:"minecraft:knockback",lvl:10s}]}}}] minecraft:slowness 1 9 true
effect give @a[team=!Knight,nbt={SelectedItem:{id:"minecraft:wooden_sword",tag:{display:{Name:'{"text":"The Stik","color":"red","italic":false}',Lore:['{"text":"This hefty rod is"}','{"text":"really hard to wield."}']},Enchantments:[{id:"minecraft:knockback",lvl:10s}]}}}] minecraft:slowness 1 9 true
execute if score %game wins matches 1 if score %timer wins matches 10 as @a[team=Witch,nbt={SelectedItem:{id:"minecraft:stick",tag:{display:{Name:'{"text":"Magic Wand","color":"dark_purple","italic":false}',Lore:['{"text":"It leaves behind"}','{"text":"a sparkly trail."}']},HideFlags:60,Enchantments:[{id:"minecraft:knockback",lvl:3s}]}}}] at @s run particle minecraft:witch ~ ~0.1 ~ 0 0 0 0 1

#Getting count of players with %count
execute store result score %count wins if entity @a[scores={queue=1}]

#Starting the game based on the %countdown; first countdown, when finally 0 then runs start function
# NOTE: Command "execute if score %game wins matches 0 if score %count wins matches 2.. run scoreboard players set %countdown wins 60" run from elsewhere required to start this
execute if score %countdown wins matches 60 run tellraw @a ["",{"text":"Starting in "},{"text":"3","bold":true,"color":"dark_green"},{"text":"..."}]
execute if score %countdown wins matches 40 run tellraw @a ["",{"text":"Starting in "},{"text":"2","bold":true,"color":"gold"},{"text":"..."}]
execute if score %countdown wins matches 20 run tellraw @a ["",{"text":"Starting in "},{"text":"1","bold":true,"color":"dark_red"},{"text":"..."}]
execute if score %countdown wins matches 0 run tellraw @a {"text":"START!","bold":true,"color":"blue"}
execute if score %countdown wins matches 0 run function kbw:scripts/start

#Ghost head mechanics
replaceitem entity @a[team=Ghost,nbt=!{Inventory:[{Slot:103b,id:"minecraft:jack_o_lantern"}]}] armor.head jack_o_lantern{display:{Name:'{"text":"Possessed Mask","color":"gray","italic":"false"}',Lore:['{"text":"Even with a physical head,"}','{"text":"attacks just seem to pass"}','{"text":"right through you."}']},HideFlags:61,Enchantments:[{id:"minecraft:binding_curse",lvl:1s}],AttributeModifiers:[{AttributeName:"generic.knockback_resistance",Name:"generic.knockback_resistance",Amount:0.25,Operation:0,UUID:[I;1095820967,317080703,-2066589546,346890519],Slot:"head"}]}
clear @a[team=!Ghost] jack_o_lantern{display:{Name:'{"text":"Possessed Mask","color":"gray","italic":"false"}',Lore:['{"text":"Even with a physical head,"}','{"text":"attacks just seem to pass"}','{"text":"right through you."}']},HideFlags:61,Enchantments:[{id:"minecraft:binding_curse",lvl:1s}],AttributeModifiers:[{AttributeName:"generic.knockback_resistance",Name:"generic.knockback_resistance",Amount:0.25,Operation:0,UUID:[I;1095820967,317080703,-2066589546,346890519],Slot:"head"}]}

#Archer trap mechanics; turtle spawn; particles; function kbw:scripts/ensnare
execute as @e[type=minecraft:turtle,tag=archerTrap] at @s run summon minecraft:armor_stand ~ ~ ~ {Marker:1b,Invisible:1b,Tags:["archerTrap"]}
execute as @e[type=minecraft:turtle,tag=archerTrap] at @s run tp @s ~ -1 ~
execute as @e[type=minecraft:turtle,tag=archerTrap] at @s run kill @s
execute at @e[tag=archerTrap,type=minecraft:armor_stand] run particle minecraft:totem_of_undying ~ ~0.1 ~ 0.4 0 0.4 0 3 normal @a[team=Archer]
execute as @e[tag=archerTrap,type=minecraft:armor_stand] at @s if entity @a[team=!Archer,distance=..0.7] run function kbw:scripts/ensnare

#Ending game if not enough players; message and set %game to 0
execute if score %game wins matches 1 unless entity @a[tag=inGame] run tellraw @a {"text":"The game ended with no winner.","bold":true,"color":"gray"}
execute if score %game wins matches 1 unless entity @a[tag=inGame] run function kbw:scripts/end

#Ending game if someone reaches a score of 100
execute as @a[tag=inGame,scores={score=100..}] run tellraw @a ["",{"selector":"@s","bold":true},{"text":" has won the game!","bold":true,"color":"gold"}]
scoreboard players add @a[tag=inGame,scores={score=100..}] wins 1
execute if entity @a[tag=inGame,scores={score=100..}] run function kbw:scripts/end

#Incrementing %timer by 1 every tick, updates score of players (if game is running)
execute if score %game wins matches 1 run scoreboard players add %timer wins 1
execute if score %timer wins matches 20 run scoreboard players set %timer wins 0
execute if score %game wins matches 1 if score %timer wins matches 0 positioned 0.5 64 0.5 run scoreboard players add @a[distance=..9.2,tag=inGame] score 1
execute if score %game wins matches 1 if score %timer wins matches 0 positioned 0.5 64 0.5 run scoreboard players add @a[distance=..3.2,tag=inGame] score 1

#Removes 1 from %countdown every tick if its greater than 0 (it's counting down)
execute if score %countdown wins matches 0.. run scoreboard players remove %countdown wins 1