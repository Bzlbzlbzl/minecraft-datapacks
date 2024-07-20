#Removes all tags and scoreboards from the game before disabling the pack
tellraw @a [{"text":"removed - "},{"text":"Powers","color":"#FF1C82","bold":true},{"text":" - ","color":"white","bold":false},{"text":"by Beezily","color":"light_purple"}]

#Ghost
team remove ghost

scoreboard objectives remove ghost
scoreboard objectives remove ghost_cd
scoreboard objectives remove ghost_drop

#Creeper
team remove creeper

scoreboard objectives remove creeper_drop
scoreboard objectives remove creeper_tnt
scoreboard objectives remove creeper_boom
scoreboard objectives remove creeper_die

#President


#Songs
scoreboard objectives remove nbs_song_counter
#French Anthem
tag @e remove nbs_powers_french
scoreboard objectives remove nbs_powers_french
scoreboard objectives remove nbs_powers_french_t
#USA Anthem
tag @e remove nbs_powers_usa
scoreboard objectives remove nbs_powers_usa
scoreboard objectives remove nbs_powers_usa_t
#USSR Anthem
tag @e remove nbs_powers_ussr
scoreboard objectives remove nbs_powers_ussr
scoreboard objectives remove nbs_powers_ussr_t

datapack disable "file/Powers"
