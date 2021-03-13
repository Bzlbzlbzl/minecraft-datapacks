#Stops the game
bossbar remove minecraft:dt_timer
scoreboard players set %timer death_tag -1
worldborder center 0 0
worldborder set 60000000
tag @a remove dtIt
scoreboard players set %survivor death_tag 0