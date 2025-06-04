#Run from pushback script, extra logic check for neutral mobs
data modify storage minecraft:powers UUID set from entity @a[tag=presPush,limit=1] UUID
execute store success score %angry pres_bears run data modify storage minecraft:powers UUID set from entity @s AngryAt
execute if score %angry pres_bears matches 0 run function powers:scripts/push