tellraw @a [{"text":"reload - "},{"text":"Passive Protection","color":"green","bold":true},{"text":" - ","color":"white","bold":false},{"text":"by Bzlbzlbzl","color":"light_purple"}]

team add p-prot
team modify p-prot seeFriendlyInvisibles false
team modify p-prot collisionRule pushOwnTeam
scoreboard objectives add p_prot_id dummy
scoreboard players set %next p_prot_id 1