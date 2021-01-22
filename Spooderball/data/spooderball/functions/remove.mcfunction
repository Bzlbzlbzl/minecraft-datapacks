#Removes all traces of the datapack
tellraw @a [{"text":"removing - "},{"text":"Spooderball","color":"white","bold":true},{"text":" - ","color":"white","bold":false},{"text":"by Bzlbzlbzl","color":"light_purple"}]

scoreboard objectives remove spooderball
datapack disable "file/Spooderball"