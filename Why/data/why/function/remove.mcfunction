#Removes all tags and scoreboards from the game before disabling the pack
tellraw @a [{"text":"removed - "},{"text":"Why","color":"light_purple","bold":true},{"text":" - ","color":"white","bold":false},{"text":"by Bzlbzlbzl","color":"light_purple"}]

scoreboard objectives remove why

scoreboard objectives remove villager_defense

scoreboard objectives remove fa_jin
scoreboard objectives remove fa_jin_was_sneaking
scoreboard objectives remove fa_jin_jump
scoreboard objectives remove fa_jin_timer

scoreboard objectives remove snowgolem_upgrade

datapack disable "file/Why"
