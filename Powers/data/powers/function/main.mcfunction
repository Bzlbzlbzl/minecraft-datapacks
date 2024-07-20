## Powers

# Powers ID
execute as @a unless score @s powers_id matches 0.. run function powers:scripts/assign_id

# Ghost
#Reset scores if not sneaking or holding stuff or if hit
execute as @a[team=ghost,scores={ghost=20..},predicate=!powers:sneaking,gamemode=!spectator] run effect clear @s darkness
execute as @a[team=ghost,scores={ghost=20..},predicate=!powers:sneaking,gamemode=!spectator] at @s run playsound minecraft:entity.warden.listening_angry master @a ~ ~ ~ 0.5 2
execute as @a[team=ghost,scores={ghost=1..},predicate=!powers:sneaking,gamemode=!spectator] run scoreboard players set @s ghost 0
execute as @a[team=ghost,scores={ghost=20..},predicate=powers:sneaking,gamemode=!spectator] unless predicate powers:ghost_item_1 unless predicate powers:ghost_item_2 run effect clear @s darkness
execute as @a[team=ghost,scores={ghost=20..},predicate=powers:sneaking,gamemode=!spectator] unless predicate powers:ghost_item_1 unless predicate powers:ghost_item_2 at @s run playsound minecraft:entity.warden.listening_angry master @a ~ ~ ~ 0.5 2
execute as @a[team=ghost,scores={ghost=1..},predicate=powers:sneaking,gamemode=!spectator] unless predicate powers:ghost_item_1 unless predicate powers:ghost_item_2 run scoreboard players set @s ghost 0
execute as @a[team=ghost,scores={ghost=20..},nbt={HurtTime:9s},gamemode=!spectator] run effect clear @s darkness
execute as @a[team=ghost,scores={ghost=20..},nbt={HurtTime:9s},gamemode=!spectator] at @s run playsound minecraft:entity.warden.listening_angry master @a ~ ~ ~ 0.5 2
execute as @a[team=ghost,scores={ghost=1..},nbt={HurtTime:9s},gamemode=!spectator] run scoreboard players set @s ghost 0

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
effect give @a[team=creeper,tag=charged] speed 1 0 true
effect give @a[team=creeper,tag=charged] strength 1 0 true
effect give @a[team=creeper,tag=charged] haste 1 0 true
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
execute as @e[type=item,nbt={Age:0s},scores={creeper_drop=1..}] run data modify entity @s PickupDelay set value 32767s

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


# President
#Pushback ability

#Claim land ability
execute as @a[team=president,scores={pres_drop=1..},tag=!claimed] at @s anchored eyes positioned ^ ^ ^ as @e[type=item,nbt={Item:{id:"minecraft:written_book"},Age:0s},nbt=!{Item:{components:{"minecraft:written_book_content":{generation:1}}}},nbt=!{Item:{components:{"minecraft:written_book_content":{generation:2}}}},sort=nearest,limit=1,distance=..2] run function powers:scripts/claim_book

#Particles during drop
execute at @e[type=item,scores={pres_drop=2..}] run particle minecraft:enchant ~ ~ ~ 0.1 0.1 0.1 0 1 force

#Create claim land after delay (flag and marker)
execute as @e[type=item,scores={pres_drop=2}] at @s run function powers:scripts/create_claim

#Teleport item to marker and reset velocity
execute as @e[type=item,scores={pres_drop=1}] at @s as @e[type=marker,tag=presMarker] if score @s powers_id = @e[type=item,scores={pres_drop=1},limit=1,sort=nearest] powers_id positioned as @s run tp @e[type=item,scores={pres_drop=1},limit=1,sort=nearest] ~ ~ ~
execute as @e[type=item,scores={pres_drop=1}] run data merge entity @s {Motion:[0.0d,0.0d,0.0d]}

#Rotate armor stand to make it look like it's turning (turn item then tp in front)
execute as @e[type=item,scores={pres_drop=1}] at @s run tp @s ~ ~ ~ ~-5 0
execute as @e[type=item,scores={pres_drop=1}] at @s as @e[type=armor_stand,tag=presFlag] if score @s powers_id = @e[type=item,scores={pres_drop=1},limit=1,sort=nearest] powers_id run tp @s ^ ^-0.5 ^0.275 ~-5 0

#Flag bobbing
execute as @e[type=armor_stand,tag=presFlag,scores={pres_cd=40}] at @s run tp @s ~ ~0.0148 ~
execute as @e[type=armor_stand,tag=presFlag,scores={pres_cd=39}] at @s run tp @s ~ ~0.044 ~
execute as @e[type=armor_stand,tag=presFlag,scores={pres_cd=38}] at @s run tp @s ~ ~0.0721 ~
execute as @e[type=armor_stand,tag=presFlag,scores={pres_cd=37}] at @s run tp @s ~ ~0.0984 ~
execute as @e[type=armor_stand,tag=presFlag,scores={pres_cd=36}] at @s run tp @s ~ ~0.1223 ~
execute as @e[type=armor_stand,tag=presFlag,scores={pres_cd=35}] at @s run tp @s ~ ~0.1432 ~
execute as @e[type=armor_stand,tag=presFlag,scores={pres_cd=34}] at @s run tp @s ~ ~0.1606 ~
execute as @e[type=armor_stand,tag=presFlag,scores={pres_cd=33}] at @s run tp @s ~ ~0.174 ~
execute as @e[type=armor_stand,tag=presFlag,scores={pres_cd=32}] at @s run tp @s ~ ~0.1831 ~
execute as @e[type=armor_stand,tag=presFlag,scores={pres_cd=31}] at @s run tp @s ~ ~0.1877 ~
execute as @e[type=armor_stand,tag=presFlag,scores={pres_cd=30}] at @s run tp @s ~ ~0.1877 ~
execute as @e[type=armor_stand,tag=presFlag,scores={pres_cd=29}] at @s run tp @s ~ ~0.1831 ~
execute as @e[type=armor_stand,tag=presFlag,scores={pres_cd=28}] at @s run tp @s ~ ~0.174 ~
execute as @e[type=armor_stand,tag=presFlag,scores={pres_cd=27}] at @s run tp @s ~ ~0.1606 ~
execute as @e[type=armor_stand,tag=presFlag,scores={pres_cd=26}] at @s run tp @s ~ ~0.1432 ~
execute as @e[type=armor_stand,tag=presFlag,scores={pres_cd=25}] at @s run tp @s ~ ~0.1223 ~
execute as @e[type=armor_stand,tag=presFlag,scores={pres_cd=24}] at @s run tp @s ~ ~0.0984 ~
execute as @e[type=armor_stand,tag=presFlag,scores={pres_cd=23}] at @s run tp @s ~ ~0.0721 ~
execute as @e[type=armor_stand,tag=presFlag,scores={pres_cd=22}] at @s run tp @s ~ ~0.044 ~
execute as @e[type=armor_stand,tag=presFlag,scores={pres_cd=21}] at @s run tp @s ~ ~0.0148 ~
execute as @e[type=armor_stand,tag=presFlag,scores={pres_cd=20}] at @s run tp @s ~ ~-0.0148 ~
execute as @e[type=armor_stand,tag=presFlag,scores={pres_cd=19}] at @s run tp @s ~ ~-0.044 ~
execute as @e[type=armor_stand,tag=presFlag,scores={pres_cd=18}] at @s run tp @s ~ ~-0.0721 ~
execute as @e[type=armor_stand,tag=presFlag,scores={pres_cd=17}] at @s run tp @s ~ ~-0.0984 ~
execute as @e[type=armor_stand,tag=presFlag,scores={pres_cd=16}] at @s run tp @s ~ ~-0.1223 ~
execute as @e[type=armor_stand,tag=presFlag,scores={pres_cd=15}] at @s run tp @s ~ ~-0.1432 ~
execute as @e[type=armor_stand,tag=presFlag,scores={pres_cd=14}] at @s run tp @s ~ ~-0.1606 ~
execute as @e[type=armor_stand,tag=presFlag,scores={pres_cd=13}] at @s run tp @s ~ ~-0.174 ~
execute as @e[type=armor_stand,tag=presFlag,scores={pres_cd=12}] at @s run tp @s ~ ~-0.1831 ~
execute as @e[type=armor_stand,tag=presFlag,scores={pres_cd=11}] at @s run tp @s ~ ~-0.1877 ~
execute as @e[type=armor_stand,tag=presFlag,scores={pres_cd=10}] at @s run tp @s ~ ~-0.1877 ~
execute as @e[type=armor_stand,tag=presFlag,scores={pres_cd=9}] at @s run tp @s ~ ~-0.1831 ~
execute as @e[type=armor_stand,tag=presFlag,scores={pres_cd=8}] at @s run tp @s ~ ~-0.174 ~
execute as @e[type=armor_stand,tag=presFlag,scores={pres_cd=7}] at @s run tp @s ~ ~-0.1606 ~
execute as @e[type=armor_stand,tag=presFlag,scores={pres_cd=6}] at @s run tp @s ~ ~-0.1432 ~
execute as @e[type=armor_stand,tag=presFlag,scores={pres_cd=5}] at @s run tp @s ~ ~-0.1223 ~
execute as @e[type=armor_stand,tag=presFlag,scores={pres_cd=4}] at @s run tp @s ~ ~-0.0984 ~
execute as @e[type=armor_stand,tag=presFlag,scores={pres_cd=3}] at @s run tp @s ~ ~-0.0721 ~
execute as @e[type=armor_stand,tag=presFlag,scores={pres_cd=2}] at @s run tp @s ~ ~-0.044 ~
execute as @e[type=armor_stand,tag=presFlag,scores={pres_cd=1}] at @s run tp @s ~ ~-0.0148 ~

#Decrease cd score for flag and marker
scoreboard players remove @e[type=armor_stand,tag=presFlag,scores={pres_cd=1..}] pres_cd 1
scoreboard players set @e[type=armor_stand,tag=presFlag,scores={pres_cd=..0}] pres_cd 40
scoreboard players remove @e[type=marker,tag=presMarker,scores={pres_cd=1..}] pres_cd 1
scoreboard players set @e[type=marker,tag=presMarker,scores={pres_cd=..0}] pres_cd 20

#Particles circling (centered on flag and marker. marker spins too)
execute as @e[type=armor_stand,tag=presFlag] at @s run particle minecraft:enchant ^ ^0.8 ^0.3 0 0 0 0 1 force
execute as @e[type=marker,tag=presMarker] at @s run tp @s ~ ~ ~ ~-8 0
execute as @e[type=marker,tag=presMarker] at @s run particle minecraft:trial_spawner_detection_ominous ^ ^0.1 ^-1.8 0 0 0 0 1 force
execute as @e[type=marker,tag=presMarker] at @s run particle minecraft:trial_spawner_detection_ominous ^ ^0.1 ^1.8 0 0 0 0 1 force
execute as @e[type=marker,tag=presMarker,scores={pres_cd=20}] at @s positioned ~ ~0.2 ~ run function powers:scripts/sphere

#Song Mix system
#Increment song counter
scoreboard players add @e[tag=nbs_powers_french] nbs_song_counter 1
scoreboard players add @e[tag=nbs_powers_usa] nbs_song_counter 1
scoreboard players add @e[tag=nbs_powers_ussr] nbs_song_counter 1
#Play next song when song is finished
execute as @e[type=item,tag=nbs_powers_french,scores={pres_drop=1,nbs_song_counter=2640}] run function powers:songs/play_usa
execute as @e[type=item,tag=nbs_powers_usa,scores={pres_drop=1,nbs_song_counter=2440}] run function powers:songs/play_ussr
execute as @e[type=item,tag=nbs_powers_ussr,scores={pres_drop=1,nbs_song_counter=2580}] run function powers:songs/play_french

#French song tick
execute as @e[tag=nbs_powers_french] run scoreboard players operation @s nbs_powers_french += speed nbs_powers_french
execute as @e[tag=nbs_powers_french] run function powers:tree_french/0_2047
#USA song tick
execute as @e[tag=nbs_powers_usa] run scoreboard players operation @s nbs_powers_usa += speed nbs_powers_usa
execute as @e[tag=nbs_powers_usa] run function powers:tree_usa/0_2047
#USSR song tick
execute as @e[tag=nbs_powers_ussr] run scoreboard players operation @s nbs_powers_ussr += speed nbs_powers_ussr
execute as @e[tag=nbs_powers_ussr] run function powers:tree_ussr/0_2047

#Decrease drop score for items
scoreboard players remove @e[type=item,scores={pres_drop=2..}] pres_drop 1

#Reset drop score
scoreboard players set @a[team=president,scores={pres_drop=1..}] pres_drop 0

#Book return mechanics
tag @a[team=president,tag=claimed] add returnBook
execute as @a[team=president,tag=claimed,tag=returnBook] at @s as @e[type=item,scores={pres_drop=1},distance=..40.2] if score @s powers_id = @a[team=president,tag=claimed,tag=returnBook,limit=1,sort=nearest] powers_id run tag @a[team=president,tag=claimed,tag=returnBook,limit=1,sort=nearest] remove returnBook
execute as @a[team=president,tag=claimed,tag=returnBook] at @s run function powers:scripts/return_book

#President passive resistance and haste
effect give @a[team=president,tag=claimed] resistance 1 0 false
effect give @a[team=president,tag=claimed] haste 1 0 false

#President block all bullets (NO at @s BTW)
execute as @a[team=president,tag=claimed] at @s as @e[type=#powers:projectiles,tag=!presProj] run function powers:scripts/tag_projectile
execute at @a[team=president,tag=claimed] positioned ~ ~1 ~ as @e[type=#powers:projectiles,tag=!presProj,distance=..3] if predicate powers:50_chance run function powers:scripts/block_projectile
execute at @a[team=president,tag=claimed] positioned ~ ~1 ~ run tag @e[type=#powers:projectiles,tag=!presProj,distance=..3] add presProj

#President summon bear, bear kill self
execute as @a[team=president,tag=claimed,nbt={HurtTime:9s}] run function powers:scripts/count_bears
execute as @a[team=president,tag=claimed,nbt={HurtTime:9s}] if score @s pres_bears < %bears pres_bears at @s on attacker run function powers:scripts/summon_bear_confirm
execute as @e[type=polar_bear,tag=presBear,scores={pres_cd=1}] at @s run playsound minecraft:entity.breeze.shoot master @a ~ ~ ~ 1 2
execute as @e[type=polar_bear,tag=presBear,scores={pres_cd=1}] at @s run particle minecraft:poof ~ ~ ~ 0.6 0.6 0.6 0.2 30 force
execute as @e[type=polar_bear,tag=presBear,scores={pres_cd=1}] at @s run tp @s ~ -70 ~
execute as @e[type=polar_bear,tag=presBear,scores={pres_cd=0}] run kill @s
scoreboard players remove @e[type=polar_bear,tag=presBear,scores={pres_cd=1..}] pres_cd 1
