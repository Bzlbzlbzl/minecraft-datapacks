tellraw @a [{"text":"reload - "},{"text":"Passive Protection","color":"green","bold":true},{"text":" - ","color":"white","bold":false},{"text":"by Bzlbzlbzl","color":"light_purple"}]

team add p-prot
team modify p-prot seeFriendlyInvisibles false
team modify p-prot collisionRule pushOwnTeam
team modify p-prot friendlyFire false
scoreboard objectives add p_prot_id dummy
scoreboard objectives add p_sneak minecraft.custom:minecraft.sneak_time
scoreboard objectives add p_last dummy
scoreboard objectives add p_mod dummy
scoreboard objectives add p_pos dummy
scoreboard objectives add p_dpos dummy
scoreboard players set %timer p_prot_id 0
scoreboard players set %next p_prot_id 1
scoreboard players set %2 p_prot_id 2
scoreboard players set %10 p_prot_id 10

#p_prot_id is for the ID's of all mobs. Also timer uses p_prot_id
#p_sneak is player sneak detection
#p_last checks player's last sneak value, p_mod is modulo calculations; pProt mobs use these for particles
#p_pos and p_dpos are used for chicken projectile calculations