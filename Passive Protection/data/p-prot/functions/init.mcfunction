tellraw @a [{"text":"reload - "},{"text":"Passive Protection","color":"green","bold":true},{"text":" - ","color":"white","bold":false},{"text":"by Bzlbzlbzl","color":"light_purple"}]

team add p-prot
team modify p-prot seeFriendlyInvisibles false
team modify p-prot collisionRule pushOwnTeam
scoreboard objectives add p_prot_id dummy
scoreboard objectives add p_sneak minecraft.custom:minecraft.sneak_time
scoreboard objectives add p_last dummy
scoreboard objectives add p_mod dummy
scoreboard players set %timer p_prot_id 0
scoreboard players set %fire p_prot_id 0
scoreboard players set %next p_prot_id 1
scoreboard players set %2 p_prot_id 2
scoreboard players set %10 p_prot_id 10