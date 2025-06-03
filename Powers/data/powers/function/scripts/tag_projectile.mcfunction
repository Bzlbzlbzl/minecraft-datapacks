#Run by projectiles near president to tag self if shot by president or inGround (to not be blocked)
data modify storage minecraft:powers UUID set from entity @a[team=president,tag=claimed,limit=1,sort=nearest] UUID
execute store success score %success pres_drop run data modify storage minecraft:powers UUID set from entity @s Owner
execute if score %success pres_drop matches 0 run tag @s add presProj
execute if data entity @s {inGround:1b} run tag @s add presProj