#Recursive particles per tick, more for more fa_jin, bigger for even more
execute if entity @s[scores={fa_jin=1..20}] run particle dust{color:[1.000,0.000,0.000],scale:0.3} ~ ~0.4 ~ 0.15 0.2 0.15 0 1 normal
execute if entity @s[scores={fa_jin=21..40}] run particle dust{color:[1.000,0.000,0.000],scale:0.45} ~ ~0.4 ~ 0.15 0.2 0.15 0 1 normal
execute if entity @s[scores={fa_jin=41..60}] run particle dust{color:[1.000,0.000,0.000],scale:0.6} ~ ~0.4 ~ 0.15 0.2 0.15 0 1 normal
execute if entity @s[scores={fa_jin=61..80}] run particle dust{color:[1.000,0.000,0.000],scale:0.75} ~ ~0.4 ~ 0.15 0.2 0.15 0 1 normal
execute if entity @s[scores={fa_jin=81..100}] run particle dust{color:[1.000,0.000,0.000],scale:0.9} ~ ~0.4 ~ 0.15 0.2 0.15 0 1 normal

scoreboard players remove @s fa_jin_jump 1
execute if score @s fa_jin_jump matches 1.. run function why:fa_jin/fa_jin_particle