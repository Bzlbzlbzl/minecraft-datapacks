#Stops the game and removes the bossbars as well
tellraw @a {"text":"","color":"gold","bold":true,"extra":[{"selector":"@p[gamemode=survival]"},{"text":" has won the game!"}]}
scoreboard players set %countdown death_swap -1
bossbar remove minecraft:ds_timer