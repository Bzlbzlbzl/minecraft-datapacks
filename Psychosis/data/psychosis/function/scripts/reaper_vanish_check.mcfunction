#Checks if reaper within 90 degrees of player rotation, if so then kill reaper and increment scoreboard RUN BY WITHER SKELETON

# This massive value will make the reaper disappear if player is not accessible (like logged off or something)
scoreboard players set %player_rot psychosis 10000

execute at @e[type=player,gamemode=!spectator,tag=psyHaunted] if score @s psy_id = @e[type=player,gamemode=!spectator,tag=psyHaunted,limit=1,sort=nearest] psy_id run tag @e[type=player,gamemode=!spectator,tag=psyHaunted,limit=1,sort=nearest] add psyPlayer
execute as @a[tag=psyPlayer] store result score %player_rot psychosis run data get entity @s Rotation[0] 1
execute store result score %reaper_rot psychosis run data get entity @s Rotation[0] 1

scoreboard players operation %rot_diff psychosis = %reaper_rot psychosis
scoreboard players operation %rot_diff psychosis -= %player_rot psychosis
execute if score %rot_diff psychosis matches ..-1 run scoreboard players operation %rot_diff psychosis *= %-1 psychosis
execute if score %rot_diff psychosis matches 180.. run scoreboard players set %rot_angle psychosis 360
execute if score %rot_diff psychosis matches 180.. run scoreboard players operation %rot_angle psychosis -= %rot_diff psychosis
execute if score %rot_diff psychosis matches ..179 run scoreboard players operation %rot_angle psychosis = %rot_diff psychosis
# %rot_angle shouldn't ever be negative UNLESS player was not accessible
execute if score %rot_angle psychosis matches ..-1 run scoreboard players operation %rot_angle psychosis *= %-1 psychosis

execute if score %rot_angle psychosis matches 80.. run tag @a[tag=psyPlayer] remove psyHaunted
execute if score %rot_angle psychosis matches 80.. run scoreboard players set @a[tag=psyPlayer] psy_check -60
execute if score %rot_angle psychosis matches 80.. run function psychosis:scripts/kill_creature

#ALSO kill if player too close
execute if score %rot_angle psychosis matches ..79 at @s if entity @e[gamemode=!spectator,type=player,distance=..2] run tag @a[tag=psyPlayer] remove psyHaunted
execute if score %rot_angle psychosis matches ..79 at @s if entity @e[gamemode=!spectator,type=player,distance=..2] run scoreboard players set @a[tag=psyPlayer] psy_check -100
execute if score %rot_angle psychosis matches ..79 at @s if entity @e[gamemode=!spectator,type=player,distance=..2] run function psychosis:scripts/kill_creature

tag @a[tag=psyPlayer] remove psyPlayer
