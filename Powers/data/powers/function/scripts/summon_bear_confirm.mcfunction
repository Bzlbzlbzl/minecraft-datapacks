#Run by attacker to confirm if they will summon bear or not (attacker runs on ALL attackers, this limits to 1)
scoreboard players operation @s pres_bears = @a[team=president,tag=claimed,nbt={HurtTime:9s},limit=1,sort=nearest] pres_bears
execute if score @s pres_bears < %bears pres_bears run function powers:scripts/summon_bear