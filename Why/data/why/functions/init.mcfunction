tellraw @a [{"text":"reload - "},{"text":"Why","color":"light_purple","bold":true},{"text":" - ","color":"white","bold":false},{"text":"by Bzlbzlbzl","color":"light_purple"}]

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
