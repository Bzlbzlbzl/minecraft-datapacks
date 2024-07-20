#Run by president to see how many bears they have, updates their pres_bears score
execute at @s as @e[type=polar_bear,tag=presBear] if score @s powers_id = @a[team=president,tag=claimed,limit=1,sort=nearest] powers_id run tag @s add presCurr
execute store result score @s pres_bears run execute if entity @e[tag=presCurr]
tag @e[type=polar_bear,tag=presBear,tag=presCurr] remove presCurr