tellraw @a [{"text":"reload - "},{"text":"Why","color":"light_purple","bold":true},{"text":" - ","color":"white","bold":false},{"text":"by Beezily","color":"light_purple"}]

scoreboard objectives add why dummy

#Villager defense
scoreboard objectives add villager_defense dummy
scoreboard players set %villager_defense why 1

#Fa Jin
scoreboard objectives add fa_jin dummy
scoreboard objectives add fa_jin_was_sneaking dummy
scoreboard objectives add fa_jin_jump minecraft.custom:minecraft.jump
scoreboard objectives add fa_jin_timer dummy
scoreboard players set %2 fa_jin 2
scoreboard players set %3 fa_jin 3
scoreboard players set %4 fa_jin 4
scoreboard players set %5 fa_jin 5
scoreboard players set %fa_jin why 1

#Snowgolem Upgrade
scoreboard objectives add snowgolem_upgrade dummy
scoreboard players set %proj_select snowgolem_upgrade -1
scoreboard players set %snowgolem_upgrade why 1

#Flower Effects
scoreboard players set %flower_effects why 1

#Crazy Spawns
scoreboard objectives add crazy_spawns dummy
scoreboard players set %cursed_armor crazy_spawns 0
scoreboard players set %zombies crazy_spawns 0
scoreboard players set %skeletons crazy_spawns 0
scoreboard players set %spiders crazy_spawns 0
scoreboard players set %creepers crazy_spawns 0
scoreboard players set %endermans crazy_spawns 0
scoreboard players set %witches crazy_spawns 0
scoreboard players set %crazy_spawns why 1
