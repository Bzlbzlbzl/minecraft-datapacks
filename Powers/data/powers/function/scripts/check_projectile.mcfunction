#Run by projectiles near the checking president to tag self to be ignored if shot by president or inGround (to not be blocked)
# Yes I realize this scoreboard thing allows two presidents near each other to repeat checks for projectiles every tick
tag @a[tag=presToProtect] remove presToProtect
# Extra removal just in case this function doesn't finish running
tag @a[team=president,tag=claimed,limit=1,sort=nearest] add presToProtect
data modify storage minecraft:powers UUID set from entity @a[team=president,tag=claimed,limit=1,sort=nearest] UUID
execute store success score %success pres_drop run data modify storage minecraft:powers UUID set from entity @s Owner
scoreboard players operation @s powers_id = @a[team=president,tag=claimed,limit=1,sort=nearest] powers_id
execute if predicate powers:50_chance if score %success pres_drop matches 1 at @s run function powers:scripts/block_projectile
execute if predicate powers:50_chance unless data entity @s Owner at @s run function powers:scripts/block_projectile
tag @a[tag=presToProtect] remove presToProtect