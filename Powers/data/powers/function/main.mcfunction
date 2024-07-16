## Powers

# Ghost
#Reset scores if not sneaking or holding stuff or if hit
execute as @a[team=ghost,scores={ghost=20..},predicate=!powers:sneaking,gamemode=!spectator] run effect clear @s darkness
execute as @a[team=ghost,scores={ghost=20..},predicate=!powers:sneaking,gamemode=!spectator] at @s run playsound minecraft:entity.warden.listening_angry master @a ~ ~ ~ 0.5 2
execute as @a[team=ghost,scores={ghost=1..},predicate=!powers:sneaking,gamemode=!spectator] run scoreboard players set @s ghost 0
execute as @a[team=ghost,scores={ghost=20..},predicate=powers:sneaking,gamemode=!spectator] unless predicate powers:ghost_item_1 unless predicate powers:ghost_item_2 run effect clear @s darkness
execute as @a[team=ghost,scores={ghost=20..},predicate=powers:sneaking,gamemode=!spectator] unless predicate powers:ghost_item_1 unless predicate powers:ghost_item_2 at @s run playsound minecraft:entity.warden.listening_angry master @a ~ ~ ~ 0.5 2
execute as @a[team=ghost,scores={ghost=1..},predicate=powers:sneaking,gamemode=!spectator] unless predicate powers:ghost_item_1 unless predicate powers:ghost_item_2 run scoreboard players set @s ghost 0
execute as @a[team=ghost,scores={ghost=20..},nbt={HurtTime:10s},gamemode=!spectator] run effect clear @s darkness
execute as @a[team=ghost,scores={ghost=20..},nbt={HurtTime:10s},gamemode=!spectator] at @s run playsound minecraft:entity.warden.listening_angry master @a ~ ~ ~ 0.5 2
execute as @a[team=ghost,scores={ghost=1..},nbt={HurtTime:10s},gamemode=!spectator] run scoreboard players set @s ghost 0

#Add score to all players sneaking and holding thing
execute as @a[team=ghost,gamemode=!spectator,predicate=powers:sneaking,predicate=powers:ghost_item_1,predicate=!powers:ghost_item_2] unless score @s ghost matches ..-1 run scoreboard players add @s ghost 1
execute as @a[team=ghost,gamemode=!spectator,predicate=powers:sneaking,predicate=!powers:ghost_item_1,predicate=powers:ghost_item_2] unless score @s ghost matches ..-1 run scoreboard players add @s ghost 1
execute as @a[team=ghost,gamemode=!spectator,predicate=powers:sneaking,predicate=powers:ghost_item_1,predicate=powers:ghost_item_2] unless score @s ghost matches ..-1 run scoreboard players add @s ghost 1

#Charging sounds and particles
execute as @a[team=ghost,scores={ghost=20},gamemode=!spectator] at @s run playsound minecraft:entity.blaze.shoot master @a ~ ~ ~ 0.7 1
execute as @a[team=ghost,scores={ghost=20},gamemode=!spectator] at @s run particle minecraft:sculk_soul ~ ~1 ~ 0.3 0.5 0.3 0.05 10 force
execute as @a[team=ghost,scores={ghost=20},gamemode=!spectator] at @s run particle minecraft:smoke ~ ~1 ~ 0.3 0.5 0.3 0 10 force
execute as @a[team=ghost,scores={ghost=20},gamemode=!spectator] run effect give @s darkness 7 0 true
execute as @a[team=ghost,scores={ghost=40},gamemode=!spectator] at @s run playsound minecraft:entity.blaze.shoot master @a ~ ~ ~ 0.6 0.8
execute as @a[team=ghost,scores={ghost=40},gamemode=!spectator] at @s run particle minecraft:sculk_soul ~ ~1 ~ 0.8 0.8 0.8 0.1 20 force
execute as @a[team=ghost,scores={ghost=40},gamemode=!spectator] at @s run particle minecraft:smoke ~ ~1 ~ 0.8 0.8 0.8 0 15 force
execute as @a[team=ghost,scores={ghost=40},gamemode=!spectator] at @s run particle minecraft:large_smoke ~ ~1 ~ 0.5 0.8 0.5 0 3 force
execute as @a[team=ghost,scores={ghost=60},gamemode=!spectator] at @s run particle minecraft:soul ~ ~1 ~ 1 1 1 0.25 5 force
execute as @a[team=ghost,scores={ghost=60},gamemode=!spectator] at @s run particle minecraft:sculk_soul ~ ~1 ~ 0.8 0.8 0.8 0.25 50 force
execute as @a[team=ghost,scores={ghost=60},gamemode=!spectator] at @s run particle minecraft:soul_fire_flame ~ ~ ~ 0.8 0.8 0.8 0.25 5 force
execute as @a[team=ghost,scores={ghost=60},gamemode=!spectator] at @s run particle minecraft:smoke ~ ~1 ~ 0.8 0.8 0.8 0 10 force
execute as @a[team=ghost,scores={ghost=60},gamemode=!spectator] at @s run particle minecraft:large_smoke ~ ~0.8 ~ 0.5 1 0.5 0 20 force
execute as @a[team=ghost,scores={ghost=60},gamemode=!spectator] at @s run function powers:scripts/fire_circle

#Ghosting mode particles
execute as @a[team=ghost,gamemode=spectator,scores={ghost=1..}] if predicate powers:50_chance at @s run particle minecraft:sculk_soul ~ ~ ~ 0.4 0.1 0.4 0 1 force
execute as @a[team=ghost,gamemode=spectator,scores={ghost=1..}] if predicate powers:50_chance at @s run particle minecraft:sculk_soul ~ ~ ~ 0.4 0.1 0.4 0 1 force

#Put player into spectator when ghost score high enough
execute as @a[team=ghost,gamemode=!spectator,scores={ghost=60..}] at @s run playsound minecraft:entity.wither.hurt master @a ~ ~ ~ 0.4 0.75
execute as @a[team=ghost,gamemode=!spectator,scores={ghost=60..}] at @s run playsound minecraft:entity.drowned.ambient ambient @a ~ ~ ~ 1 0
#execute as @a[team=ghost,gamemode=!spectator,scores={ghost=60..}] run scoreboard players set @s ghost 80
execute as @a[team=ghost,gamemode=!spectator,scores={ghost=60..}] run effect give @s slowness 4 4 true
execute as @a[team=ghost,gamemode=!spectator,scores={ghost=60..}] run gamemode spectator @s

#Put player into survival when ghost score low enough
execute as @a[team=ghost,gamemode=spectator,scores={ghost=1}] at @s run playsound minecraft:entity.blaze.shoot master @a ~ ~ ~ 0.5 0
execute as @a[team=ghost,gamemode=spectator,scores={ghost=1}] at @s run particle minecraft:sculk_soul ~ ~1 ~ 0.8 0.8 0.8 0.2 30 force
execute as @a[team=ghost,gamemode=spectator,scores={ghost=1}] at @s run particle minecraft:soul_fire_flame ~ ~ ~ 0.8 0.8 0.8 0.1 5 force
execute as @a[team=ghost,gamemode=spectator,scores={ghost=1}] at @s run particle minecraft:smoke ~ ~1 ~ 0.8 0.8 0.8 0 5 force
execute as @a[team=ghost,gamemode=spectator,scores={ghost=1}] at @s run particle minecraft:large_smoke ~ ~1 ~ 0.5 1 0.5 0 10 force
execute as @a[team=ghost,gamemode=spectator,scores={ghost=1}] at @s run function powers:scripts/fire_circle
execute as @a[team=ghost,gamemode=spectator,scores={ghost=1}] run effect clear @s slowness
execute as @a[team=ghost,gamemode=spectator,scores={ghost=1}] run gamemode survival @s
execute as @a[team=ghost,gamemode=spectator,scores={ghost=1}] run scoreboard players set @s ghost -20

#Decrease player score when ghosting
execute as @e[team=ghost,gamemode=spectator,scores={ghost=1..}] run scoreboard players remove @s ghost 1

#Increase player score on recharge
execute as @e[team=ghost,gamemode=!spectator,scores={ghost=..-1}] run scoreboard players add @s ghost 1

#Ghost mark nearest phantom membrane on drop, and cooldown
execute as @a[team=ghost,scores={ghost_drop=1..}] unless score @s ghost_cd matches 1.. at @s anchored eyes positioned ^ ^ ^ run scoreboard players set @e[type=item,nbt={Item:{id:"minecraft:phantom_membrane"},Age:0s},sort=nearest,limit=1,distance=..2] ghost_drop 1
execute as @a[team=ghost,scores={ghost_drop=1..}] unless score @s ghost_cd matches 1.. run scoreboard players set @s ghost_cd 200
execute at @a[team=ghost,scores={ghost_cd=1}] run playsound minecraft:entity.warden.attack_impact master @a ~ ~ ~ 0.6 2
scoreboard players remove @a[team=ghost,scores={ghost_cd=1..}] ghost_cd 1

#Change data of all newly dropped items
execute as @e[type=item,nbt={Item:{id:"minecraft:phantom_membrane"},Age:0s},scores={ghost_drop=1}] run data modify entity @s Glowing set value 1b
execute as @e[type=item,nbt={Item:{id:"minecraft:phantom_membrane"},Age:0s},scores={ghost_drop=1}] run data modify entity @s Item.components set value {"minecraft:enchantment_glint_override":true}
execute as @e[type=item,nbt={Item:{id:"minecraft:phantom_membrane"},Age:0s},scores={ghost_drop=1}] run data modify entity @s Invulnerable set value 1b
execute as @e[type=item,nbt={Item:{id:"minecraft:phantom_membrane"},Age:0s},scores={ghost_drop=1}] run data modify entity @s PickupDelay set value 10000s

#Constant particles and explosion after 1 second
execute as @e[type=item,nbt={Item:{id:"minecraft:phantom_membrane"}},scores={ghost_drop=1}] at @s run particle smoke ~ ~0.35 ~ 0 0 0 0 1 force
execute as @e[type=item,nbt={Item:{id:"minecraft:phantom_membrane"},Age:20s},scores={ghost_drop=1}] at @s run particle minecraft:flash ~ ~ ~ 0 0 0 0 1 force
execute as @e[type=item,nbt={Item:{id:"minecraft:phantom_membrane"},Age:20s},scores={ghost_drop=1}] at @s run particle minecraft:sculk_soul ~ ~ ~ 0 0 0 0.1 10 force
execute as @e[type=item,nbt={Item:{id:"minecraft:phantom_membrane"},Age:20s},scores={ghost_drop=1}] at @s run playsound minecraft:entity.dragon_fireball.explode master @a ~ ~ ~ 0.3 2
execute as @e[type=item,nbt={Item:{id:"minecraft:phantom_membrane"},Age:20s},scores={ghost_drop=1}] at @s run playsound minecraft:ambient.soul_sand_valley.mood master @a ~ ~ ~ 1 2
execute as @e[type=item,nbt={Item:{id:"minecraft:phantom_membrane"},Age:20s},scores={ghost_drop=1}] at @s as @e[type=#powers:hostile,distance=..20] run scoreboard players set @s ghost 100
execute as @e[type=item,nbt={Item:{id:"minecraft:phantom_membrane"},Age:20s},scores={ghost_drop=1}] at @s as @e[type=#powers:hostile,distance=..20] run team join ghost
execute as @e[type=item,nbt={Item:{id:"minecraft:phantom_membrane"},Age:20s},scores={ghost_drop=1}] at @s as @e[type=#powers:hostile,distance=..20] run effect give @s glowing 5 0 true
execute as @e[type=item,nbt={Item:{id:"minecraft:phantom_membrane"},Age:20s},scores={ghost_drop=1}] run kill @s

#Decreases and removes hostile mobs from team when time is up
team leave @e[type=#powers:hostile,team=ghost,scores={ghost=..0}]
scoreboard players remove @e[type=#powers:hostile,team=ghost,scores={ghost=1..}] ghost 1

#Resets ghost drop score
scoreboard players set @a[team=ghost,scores={ghost_drop=1..}] ghost_drop 0


# Creeper
#Playsound and charges self-destruct if self-destructing
execute as @a[team=creeper,predicate=powers:sneaking,nbt={Inventory:[{Slot:-106b,id:"minecraft:tnt"}],SelectedItem:{id:"minecraft:tnt"}},scores={creeper_boom=0}] at @s run playsound minecraft:entity.creeper.primed master @a ~ ~ ~ 2 1
execute as @a[team=creeper,predicate=powers:sneaking,nbt={Inventory:[{Slot:-106b,id:"minecraft:tnt"}],SelectedItem:{id:"minecraft:tnt"}}] unless score @s creeper_boom matches ..-1 run scoreboard players add @s creeper_boom 1
execute as @a[team=creeper,scores={creeper_boom=1..}] unless entity @s[team=creeper,predicate=powers:sneaking,nbt={Inventory:[{Slot:-106b,id:"minecraft:tnt"}],SelectedItem:{id:"minecraft:tnt"}}] run effect clear @s slowness
execute as @a[team=creeper,scores={creeper_boom=1..}] unless entity @s[team=creeper,predicate=powers:sneaking,nbt={Inventory:[{Slot:-106b,id:"minecraft:tnt"}],SelectedItem:{id:"minecraft:tnt"}}] run effect clear @s resistance
execute as @a[team=creeper,scores={creeper_boom=1..}] unless entity @s[team=creeper,predicate=powers:sneaking,nbt={Inventory:[{Slot:-106b,id:"minecraft:tnt"}],SelectedItem:{id:"minecraft:tnt"}}] run scoreboard players set @s creeper_boom -120
effect give @a[team=creeper,scores={creeper_boom=1..}] slowness 1 3 true
effect give @a[team=creeper,scores={creeper_boom=1..}] resistance 1 2 true
execute as @a[team=creeper,scores={creeper_boom=29..}] run effect give @s minecraft:poison 1 0 true
execute as @a[team=creeper,scores={creeper_boom=30..},tag=!charged] at @s run summon creeper ~ -70 ~ {Invulnerable:1b,CustomNameVisible:0b,ExplosionRadius:5b,Fuse:0,ignited:1b,Tags:["creep_boom"],Team:"creeper"}
execute as @a[team=creeper,scores={creeper_boom=30..},tag=!charged] at @s positioned ~ -70 ~ run tp @e[type=minecraft:creeper,limit=1,sort=nearest,tag=creep_boom] @s
execute as @a[team=creeper,scores={creeper_boom=30..},tag=charged] at @s run summon creeper ~ -70 ~ {Invulnerable:1b,CustomNameVisible:0b,ExplosionRadius:8b,Fuse:0,ignited:1b,Tags:["creep_boom"],Team:"creeper",powered:1b}
execute as @a[team=creeper,scores={creeper_boom=30..},tag=charged] at @s positioned ~ -70 ~ run tp @e[type=minecraft:creeper,limit=1,sort=nearest,tag=creep_boom] @s
execute as @e[type=creeper,tag=creep_boom] run function powers:scripts/set_name
execute at @a[team=creeper,scores={creeper_boom=-1}] run playsound minecraft:entity.creeper.hurt master @a ~ ~ ~ 1 1
scoreboard players add @a[team=creeper,scores={creeper_boom=..-1}] creeper_boom 1
#execute as @a[team=creeper,scores={creeper_boom=30..}] run damage @s 500 minecraft:explosion
execute as @a[team=creeper,scores={creeper_boom=30..}] at @s run particle dust{color:[1.000,0.000,0.000],scale:1.5} ~ ~ ~ 1.5 1.5 1.5 1 8 normal
execute as @a[team=creeper,scores={creeper_boom=30..}] at @s run particle minecraft:poof ~ ~ ~ 0.7 0.7 0.7 0.1 20
#execute as @a[team=creeper,scores={creeper_boom=30..}] run scoreboard players set @s creeper_die -3
execute as @a[team=creeper,scores={creeper_boom=30..}] run scoreboard players set @s creeper_boom 0

#Increase creeper_die if below 0 (delays death until after explosion)
#execute as @a[team=creeper,scores={creeper_die=-1}] run damage @s 500 minecraft:explosion
#scoreboard players set @a[team=creeper,scores={creeper_die=-1}] creeper_die 1
#scoreboard players add @a[team=creeper,scores={creeper_die=..-1}] creeper_die 1

#Charged effects and particles
effect give @a[team=creeper,tag=charged] speed infinite 0 true
effect give @a[team=creeper,tag=charged] strength infinite 0 true
effect give @a[team=creeper,tag=charged] haste infinite 0 true
execute if predicate powers:10_chance at @a[team=creeper,tag=charged] run particle minecraft:firework ~ ~1 ~ 0.4 0.8 0.4 0 1 normal
execute if predicate powers:3_chance at @a[team=creeper,tag=charged] run particle angry_villager ~ ~1 ~ 0.6 1.0 0.6 0 1 normal

#Charged getting and losing
#execute as @e[type=minecraft:lightning_bolt] at @s as @a[team=creeper,distance=..3.3,tag=!charged] run tag @s add charged
execute as @a[team=creeper,tag=charged,scores={creeper_die=1..}] run function powers:scripts/remove_charged
scoreboard players set @a[team=creeper,scores={creeper_die=1..}] creeper_die 0

#Tag nearest thrown item if thrown item
execute as @a[team=creeper,nbt={Inventory:[{Slot:-106b,id:"minecraft:tnt"}]},scores={creeper_tnt=1..}] at @s anchored eyes positioned ^ ^ ^ as @e[type=item,nbt={Item:{id:"minecraft:tnt"},Age:0s},sort=nearest,limit=1,distance=..2] if data entity @s Thrower run scoreboard players set @s creeper_drop 2
execute as @a[team=creeper,nbt={Inventory:[{Slot:-106b,id:"minecraft:tnt"}]},scores={creeper_drop=1..}] unless score @s creeper_tnt matches 1.. at @s anchored eyes positioned ^ ^ ^ as @e[type=item,nbt={Age:0s},sort=nearest,limit=1,distance=..2] if data entity @s Thrower run scoreboard players set @s creeper_drop 1
execute as @e[type=item,nbt={Age:0s},scores={creeper_drop=1..}] run data modify entity @s Item.components."minecraft:custom_data".stack set from entity @s UUID[0]
execute as @e[type=item,nbt={Age:0s},scores={creeper_drop=1..}] run data modify entity @s Invulnerable set value 1b
execute as @e[type=item,nbt={Age:0s},scores={creeper_drop=1..}] run data modify entity @s PickupDelay set value 10000s

#Dropped item displays (hardcoded cuz it might be even more inefficient to do it based on data, especially when im only hardcoding 3 seconds)
execute as @e[type=item,nbt={Age:0s},scores={creeper_drop=1..}] run data modify entity @s CustomName set value '{"text":"3.0","color":"red","bold":true}'
execute as @e[type=item,nbt={Age:0s},scores={creeper_drop=1..}] at @s run playsound minecraft:block.stone_button.click_on master @a ~ ~ ~ 1 2
execute as @e[type=item,nbt={Age:2s},scores={creeper_drop=1..}] run data modify entity @s CustomName set value '{"text":"2.9","color":"red","bold":true}'
execute as @e[type=item,nbt={Age:4s},scores={creeper_drop=1..}] run data modify entity @s CustomName set value '{"text":"2.8","color":"red","bold":true}'
execute as @e[type=item,nbt={Age:6s},scores={creeper_drop=1..}] run data modify entity @s CustomName set value '{"text":"2.7","color":"white","bold":true}'
execute as @e[type=item,nbt={Age:8s},scores={creeper_drop=1..}] run data modify entity @s CustomName set value '{"text":"2.6","color":"white","bold":true}'
execute as @e[type=item,nbt={Age:10s},scores={creeper_drop=1..}] run data modify entity @s CustomName set value '{"text":"2.5","color":"white","bold":true}'
execute as @e[type=item,nbt={Age:12s},scores={creeper_drop=1..}] run data modify entity @s CustomName set value '{"text":"2.4","color":"red","bold":true}'
execute as @e[type=item,nbt={Age:14s},scores={creeper_drop=1..}] run data modify entity @s CustomName set value '{"text":"2.3","color":"red","bold":true}'
execute as @e[type=item,nbt={Age:16s},scores={creeper_drop=1..}] run data modify entity @s CustomName set value '{"text":"2.2","color":"red","bold":true}'
execute as @e[type=item,nbt={Age:18s},scores={creeper_drop=1..}] run data modify entity @s CustomName set value '{"text":"2.1","color":"white","bold":true}'
execute as @e[type=item,nbt={Age:20s},scores={creeper_drop=1..}] run data modify entity @s CustomName set value '{"text":"2.0","color":"white","bold":true}'
execute as @e[type=item,nbt={Age:20s},scores={creeper_drop=1..}] at @s run playsound minecraft:block.stone_button.click_on master @a ~ ~ ~ 1 2
execute as @e[type=item,nbt={Age:22s},scores={creeper_drop=1..}] run data modify entity @s CustomName set value '{"text":"1.9","color":"white","bold":true}'
execute as @e[type=item,nbt={Age:24s},scores={creeper_drop=1..}] run data modify entity @s CustomName set value '{"text":"1.8","color":"red","bold":true}'
execute as @e[type=item,nbt={Age:26s},scores={creeper_drop=1..}] run data modify entity @s CustomName set value '{"text":"1.7","color":"red","bold":true}'
execute as @e[type=item,nbt={Age:28s},scores={creeper_drop=1..}] run data modify entity @s CustomName set value '{"text":"1.6","color":"red","bold":true}'
execute as @e[type=item,nbt={Age:30s},scores={creeper_drop=1..}] run data modify entity @s CustomName set value '{"text":"1.5","color":"white","bold":true}'
execute as @e[type=item,nbt={Age:32s},scores={creeper_drop=1..}] run data modify entity @s CustomName set value '{"text":"1.4","color":"white","bold":true}'
execute as @e[type=item,nbt={Age:34s},scores={creeper_drop=1..}] run data modify entity @s CustomName set value '{"text":"1.3","color":"white","bold":true}'
execute as @e[type=item,nbt={Age:36s},scores={creeper_drop=1..}] run data modify entity @s CustomName set value '{"text":"1.2","color":"red","bold":true}'
execute as @e[type=item,nbt={Age:38s},scores={creeper_drop=1..}] run data modify entity @s CustomName set value '{"text":"1.1","color":"red","bold":true}'
execute as @e[type=item,nbt={Age:40s},scores={creeper_drop=1..}] run data modify entity @s CustomName set value '{"text":"1.0","color":"red","bold":true}'
execute as @e[type=item,nbt={Age:40s},scores={creeper_drop=1..}] at @s run playsound minecraft:block.stone_button.click_on master @a ~ ~ ~ 1 2
execute as @e[type=item,nbt={Age:42s},scores={creeper_drop=1..}] run data modify entity @s CustomName set value '{"text":"0.9","color":"white","bold":true}'
execute as @e[type=item,nbt={Age:44s},scores={creeper_drop=1..}] run data modify entity @s CustomName set value '{"text":"0.8","color":"white","bold":true}'
execute as @e[type=item,nbt={Age:46s},scores={creeper_drop=1..}] run data modify entity @s CustomName set value '{"text":"0.7","color":"white","bold":true}'
execute as @e[type=item,nbt={Age:48s},scores={creeper_drop=1..}] run data modify entity @s CustomName set value '{"text":"0.6","color":"red","bold":true}'
execute as @e[type=item,nbt={Age:50s},scores={creeper_drop=1..}] run data modify entity @s CustomName set value '{"text":"0.5","color":"red","bold":true}'
execute as @e[type=item,nbt={Age:52s},scores={creeper_drop=1..}] run data modify entity @s CustomName set value '{"text":"0.4","color":"red","bold":true}'
execute as @e[type=item,nbt={Age:54s},scores={creeper_drop=1..}] run data modify entity @s CustomName set value '{"text":"0.3","color":"white","bold":true}'
execute as @e[type=item,nbt={Age:56s},scores={creeper_drop=1..}] run data modify entity @s CustomName set value '{"text":"0.2","color":"white","bold":true}'
execute as @e[type=item,nbt={Age:58s},scores={creeper_drop=1..}] run data modify entity @s CustomName set value '{"text":"0.1","color":"white","bold":true}'
execute as @e[type=item,nbt={Age:60s},scores={creeper_drop=1..}] run data modify entity @s CustomName set value '{"text":"0.0","color":"red","bold":true}'
execute as @e[type=item,nbt={Age:0s},scores={creeper_drop=1..}] run data modify entity @s CustomNameVisible set value 1b

#Dropped item exploding (summons in void so the creeper isn't seen when spawned)
execute as @e[type=item,nbt={Age:60s},scores={creeper_drop=1}] at @s run summon creeper ~ -70 ~ {Invulnerable:1b,CustomNameVisible:0b,ExplosionRadius:1b,Fuse:0,ignited:1b,Tags:["item_boom"],CustomName:'{"text":"Item"}'}
execute as @e[type=item,nbt={Age:60s},scores={creeper_drop=2}] at @s run summon creeper ~ -70 ~ {Invulnerable:1b,CustomNameVisible:0b,ExplosionRadius:3b,Fuse:0,ignited:1b,Tags:["item_boom"],CustomName:'{"text":"Creeper TNT"}',Team:"creeper"}
execute as @e[type=item,nbt={Age:60s},scores={creeper_drop=1..}] at @s positioned ~ -70 ~ run tp @e[type=minecraft:creeper,limit=1,sort=nearest,tag=item_boom] @s
execute as @e[type=item,nbt={Age:60s},scores={creeper_drop=1..}] at @s run particle dust{color:[1.000,0.000,0.000],scale:1.5} ~ ~ ~ 1.5 1.5 1.5 1 8 normal
execute as @e[type=item,nbt={Age:60s},scores={creeper_drop=1..}] at @s run particle minecraft:poof ~ ~ ~ 0.7 0.7 0.7 0.1 12
kill @e[type=item,nbt={Age:60s},scores={creeper_drop=1..}]

#Reset creeper dropped item score
scoreboard players set @a[team=creeper,scores={creeper_drop=1..}] creeper_drop 0
scoreboard players set @a[team=creeper,scores={creeper_tnt=1..}] creeper_tnt 0


