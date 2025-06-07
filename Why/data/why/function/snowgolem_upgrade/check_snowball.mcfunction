#A check function run AT every snow golem AS every non-processed snowball
data modify storage snowgolem_upgrade UUID set from entity @s Owner
execute store success score @s snowgolem_upgrade run data modify storage snowgolem_upgrade UUID set from entity @e[type=snow_golem,limit=1,sort=nearest] UUID
execute if score @s snowgolem_upgrade matches 0 run function why:snowgolem_upgrade/create_projectile
