tellraw @a [{"text":"reload - "},{"text":"Powers","color":"#FF1C82","bold":true},{"text":" - ","color":"white","bold":false},{"text":"by Beezily","color":"light_purple"}]

#Ghost
team add ghost {"text":"Ghost","bold":true,"color":"#6d92f1"}
team modify ghost collisionRule never
team modify ghost color gray
team modify ghost friendlyFire false
team modify ghost seeFriendlyInvisibles true

scoreboard objectives add ghost dummy
scoreboard objectives add ghost_cd dummy
scoreboard objectives add ghost_drop minecraft.dropped:minecraft.phantom_membrane

#Creeper
team add creeper {"text":"Creeper","bold":true,"color":"#047604"}
team modify creeper color green
team modify creeper collisionRule pushOwnTeam

scoreboard objectives add creeper_drop minecraft.custom:minecraft.drop
scoreboard objectives add creeper_tnt minecraft.dropped:minecraft.tnt
scoreboard objectives add creeper_boom dummy
scoreboard objectives add creeper_die minecraft.custom:minecraft.deaths