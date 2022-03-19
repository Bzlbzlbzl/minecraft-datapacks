tellraw @a [{"text":"reload - "},{"text":"Death Tag","color":"dark_red","bold":true},{"text":" - ","color":"white","bold":false},{"text":"by Bzlbzlbzl","color":"light_purple"}]

scoreboard objectives add death_tag dummy
scoreboard objectives add dt_death deathCount
scoreboard objectives add dtTimer trigger
scoreboard objectives add dtStart trigger

scoreboard players reset * death_tag
scoreboard players reset * dt_death
scoreboard players reset * dtTimer
scoreboard players reset * dtStart

scoreboard players set %time death_tag 2400
scoreboard players set %neg death_tag -1
scoreboard players set %timelock death_tag 0
scoreboard players set %ticksPerMin death_tag 1200
scoreboard players set %startlock death_tag 0
scoreboard players set %game death_tag 0

# %time is the time that will be set to when the game starts
# %neg is -1 temporary number
# %timelock is whether or not the dtTimer trigger is locked or not (0 unlocked, 1 locked)
# %ticksPerMin is 60*20 temporary number
# %startlock is whether or not the dtStart trigger is locked or not (0 unlocked, 1 locked)
# %game is the gamemode that is started (1 normal, 2 survivor)


