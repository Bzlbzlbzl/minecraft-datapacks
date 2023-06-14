# Fa Jin
#If player has no scoreboard, make it
execute as @a unless score @s fa_jin_was_sneaking matches 0..1 run scoreboard players set @s fa_jin_was_sneaking 0

#Fa jin counter and sound
scoreboard players set @a[predicate=why:sneaking,scores={fa_jin_was_sneaking=0}] fa_jin_was_sneaking 1
execute as @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1}] unless score @s fa_jin matches 100.. run scoreboard players add @s fa_jin 1
scoreboard players set @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1}] fa_jin_timer 200
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=1..99}] run playsound minecraft:entity.generic.drink player @a ~ ~ ~ 0.1 1.6
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=1..99}] run playsound minecraft:block.sculk.charge player @a ~ ~ ~ 1 1.2
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=1..99}] run playsound minecraft:entity.blaze.shoot player @a ~ ~ ~ 0.1 1.2

#Timer count down and fa_jin reset
scoreboard players remove @a[scores={fa_jin_timer=1..}] fa_jin_timer 1
execute at @a[scores={fa_jin_timer=0,fa_jin=1..}] run playsound minecraft:block.respawn_anchor.deplete player @a ~ ~ ~ 0.8 1.5
scoreboard players set @a[scores={fa_jin_timer=0,fa_jin=1..}] fa_jin -5
scoreboard players set @a[scores={fa_jin_timer=190,fa_jin=..0}] fa_jin -5

#Reset fa jin when jump, sounds and particles first
execute at @a[scores={fa_jin_jump=1..,fa_jin=1..20}] run playsound minecraft:entity.zombie.break_wooden_door player @a ~ ~ ~ 0.1 2
execute at @a[scores={fa_jin_jump=1..,fa_jin=21..40}] run playsound minecraft:entity.zombie.break_wooden_door player @a ~ ~ ~ 0.2 1.5
execute at @a[scores={fa_jin_jump=1..,fa_jin=41..60}] run playsound minecraft:entity.zombie.break_wooden_door player @a ~ ~ ~ 0.4 1.2
execute at @a[scores={fa_jin_jump=1..,fa_jin=61..80}] run playsound minecraft:entity.zombie.break_wooden_door player @a ~ ~ ~ 0.7 0.8
execute at @a[scores={fa_jin_jump=1..,fa_jin=81..100}] run playsound minecraft:entity.zombie.break_wooden_door player @a ~ ~ ~ 1 0.5
execute at @a[scores={fa_jin_jump=1..,fa_jin=1..20}] run particle minecraft:dust 1 0.2 0.2 0.6 ~ ~0.1 ~ 0.3 0 0.3 0 40 normal
execute at @a[scores={fa_jin_jump=1..,fa_jin=21..40}] run particle minecraft:dust 1 0.2 0.2 0.6 ~ ~0.1 ~ 0.35 0 0.35 0 50 normal
execute at @a[scores={fa_jin_jump=1..,fa_jin=41..60}] run particle minecraft:dust 1 0.2 0.2 0.6 ~ ~0.1 ~ 0.4 0 0.4 0 60 normal
execute at @a[scores={fa_jin_jump=1..,fa_jin=61..80}] run particle minecraft:dust 1 0.2 0.2 0.6 ~ ~0.1 ~ 0.45 0 0.45 0 80 normal
execute at @a[scores={fa_jin_jump=1..,fa_jin=81..100}] run particle minecraft:dust 1 0.2 0.2 0.6 ~ ~0.1 ~ 0.5 0 0.5 0 100 normal
effect clear @a[scores={fa_jin_jump=1..,fa_jin=1..}] jump_boost
scoreboard players set @a[scores={fa_jin_jump=1..,fa_jin=1..}] fa_jin -5

#Apply Jump Boost
effect give @a[scores={fa_jin=1..2}] jump_boost 1 1 true
effect give @a[scores={fa_jin=3..4}] jump_boost 1 2 true
effect give @a[scores={fa_jin=5..6}] jump_boost 1 3 true
effect give @a[scores={fa_jin=7..8}] jump_boost 1 4 true
effect give @a[scores={fa_jin=9..10}] jump_boost 1 5 true
effect give @a[scores={fa_jin=11..12}] jump_boost 1 6 true
effect give @a[scores={fa_jin=13..14}] jump_boost 1 7 true
effect give @a[scores={fa_jin=15..16}] jump_boost 1 8 true
effect give @a[scores={fa_jin=17..18}] jump_boost 1 9 true
effect give @a[scores={fa_jin=19..20}] jump_boost 1 10 true
effect give @a[scores={fa_jin=21..22}] jump_boost 1 11 true
effect give @a[scores={fa_jin=23..24}] jump_boost 1 12 true
effect give @a[scores={fa_jin=25..26}] jump_boost 1 13 true
effect give @a[scores={fa_jin=27..28}] jump_boost 1 14 true
effect give @a[scores={fa_jin=29..30}] jump_boost 1 15 true
effect give @a[scores={fa_jin=31..32}] jump_boost 1 16 true
effect give @a[scores={fa_jin=33..34}] jump_boost 1 17 true
effect give @a[scores={fa_jin=35..36}] jump_boost 1 18 true
effect give @a[scores={fa_jin=37..38}] jump_boost 1 19 true
effect give @a[scores={fa_jin=39..40}] jump_boost 1 20 true
effect give @a[scores={fa_jin=41..42}] jump_boost 1 21 true
effect give @a[scores={fa_jin=43..44}] jump_boost 1 22 true
effect give @a[scores={fa_jin=45..46}] jump_boost 1 23 true
effect give @a[scores={fa_jin=47..48}] jump_boost 1 24 true
effect give @a[scores={fa_jin=49..50}] jump_boost 1 25 true
effect give @a[scores={fa_jin=51..52}] jump_boost 1 26 true
effect give @a[scores={fa_jin=53..54}] jump_boost 1 27 true
effect give @a[scores={fa_jin=55..56}] jump_boost 1 28 true
effect give @a[scores={fa_jin=57..58}] jump_boost 1 29 true
effect give @a[scores={fa_jin=59..60}] jump_boost 1 30 true
effect give @a[scores={fa_jin=61..62}] jump_boost 1 31 true
effect give @a[scores={fa_jin=63..64}] jump_boost 1 32 true
effect give @a[scores={fa_jin=65..66}] jump_boost 1 33 true
effect give @a[scores={fa_jin=67..68}] jump_boost 1 34 true
effect give @a[scores={fa_jin=69..70}] jump_boost 1 35 true
effect give @a[scores={fa_jin=71..72}] jump_boost 1 36 true
effect give @a[scores={fa_jin=73..74}] jump_boost 1 37 true
effect give @a[scores={fa_jin=75..76}] jump_boost 1 38 true
effect give @a[scores={fa_jin=77..78}] jump_boost 1 39 true
effect give @a[scores={fa_jin=79..80}] jump_boost 1 40 true
effect give @a[scores={fa_jin=81..82}] jump_boost 1 41 true
effect give @a[scores={fa_jin=83..84}] jump_boost 1 42 true
effect give @a[scores={fa_jin=85..86}] jump_boost 1 43 true
effect give @a[scores={fa_jin=87..88}] jump_boost 1 44 true
effect give @a[scores={fa_jin=89..90}] jump_boost 1 45 true
effect give @a[scores={fa_jin=91..92}] jump_boost 1 46 true
effect give @a[scores={fa_jin=93..94}] jump_boost 1 47 true
effect give @a[scores={fa_jin=95..96}] jump_boost 1 48 true
effect give @a[scores={fa_jin=97..98}] jump_boost 1 49 true
effect give @a[scores={fa_jin=99..100}] jump_boost 1 50 true

#Fa_jin sounds
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=1}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.7 0.5744
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=2}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.7 0.5888
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=3}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.7 0.6032
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=4}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.7 0.6176
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=5}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.7 0.632
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=6}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.7 0.6464
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=7}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.7 0.6608
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=8}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.7 0.6752
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=9}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.7 0.6896
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=10}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.7 0.704
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=11}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.7 0.7184
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=12}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.7 0.7328
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=13}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.7 0.7472
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=14}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.7 0.7616
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=15}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.7 0.776
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=16}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.7 0.7904
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=17}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.7 0.8048
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=18}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.7 0.8192
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=19}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.7 0.8336
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=20}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.7 0.848
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=21}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.7 0.8624
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=22}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.7 0.8768
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=23}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.7 0.8912
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=24}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.7 0.9056
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=25}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.7 0.92
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=26}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.7 0.9344
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=27}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.7 0.9488
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=28}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.7 0.9632
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=29}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.7 0.9776
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=30}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.7 0.992
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=31}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.7 1.0064
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=32}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.7 1.0208
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=33}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.7 1.0352
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=34}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.7 1.0496
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=35}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.7 1.064
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=36}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.7 1.0784
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=37}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.7 1.0928
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=38}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.7 1.1072
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=39}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.7 1.1216
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=40}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.7 1.136
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=41}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.7 1.1504
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=42}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.7 1.1648
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=43}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.7 1.1792
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=44}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.7 1.1936
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=45}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.7 1.208
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=46}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.7 1.2224
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=47}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.7 1.2368
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=48}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.7 1.2512
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=49}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.7 1.2656
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=50}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.7 1.28
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=51}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.7 1.2944
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=52}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.7 1.3088
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=53}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.7 1.3232
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=54}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.7 1.3376
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=55}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.7 1.352
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=56}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.7 1.3664
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=57}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.7 1.3808
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=58}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.7 1.3952
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=59}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.7 1.4096
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=60}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.7 1.424
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=61}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.7 1.4384
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=62}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.7 1.4528
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=63}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.7 1.4672
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=64}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.7 1.4816
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=65}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.7 1.496
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=66}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.7 1.5104
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=67}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.7 1.5248
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=68}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.7 1.5392
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=69}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.7 1.5536
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=70}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.7 1.568
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=71}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.7 1.5824
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=72}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.7 1.5968
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=73}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.7 1.6112
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=74}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.7 1.6256
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=75}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.7 1.64
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=76}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.7 1.6544
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=77}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.7 1.6688
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=78}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.7 1.6832
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=79}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.7 1.6976
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=80}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.7 1.712
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=81}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.7 1.7264
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=82}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.7 1.7408
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=83}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.7 1.7552
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=84}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.7 1.7696
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=85}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.7 1.784
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=86}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.7 1.7984
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=87}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.7 1.8128
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=88}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.7 1.8272
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=89}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.7 1.8416
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=90}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.7 1.856
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=91}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.7 1.8704
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=92}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.7 1.8848
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=93}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.7 1.8992
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=94}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.7 1.9136
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=95}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.7 1.928
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=96}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.7 1.9424
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=97}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.7 1.9568
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=98}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.7 1.9712
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=99}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.7 1.9856
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=100}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.7 2.0
execute at @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1,fa_jin=100}] run playsound minecraft:block.note_block.xylophone player @a ~ ~ ~ 0.5 1.7

#Reset was_sneaking and jump
scoreboard players set @a[predicate=!why:sneaking,scores={fa_jin_was_sneaking=1}] fa_jin_was_sneaking 0
scoreboard players set @a[scores={fa_jin_jump=1..}] fa_jin_jump 0

#Fa jin particles RUN AFTER JUMP, SO CAN USE THE JUMP SCOREBOARD AS COUNTER
execute as @a[scores={fa_jin=1..}] run scoreboard players operation @s fa_jin_jump = @s fa_jin
execute as @a[scores={fa_jin=21..40}] run scoreboard players operation @s fa_jin_jump /= %2 fa_jin
execute as @a[scores={fa_jin=41..60}] run scoreboard players operation @s fa_jin_jump /= %3 fa_jin
execute as @a[scores={fa_jin=61..80}] run scoreboard players operation @s fa_jin_jump /= %4 fa_jin
execute as @a[scores={fa_jin=81..100}] run scoreboard players operation @s fa_jin_jump /= %5 fa_jin
execute as @a[scores={fa_jin=1..}] at @s run function why:fa_jin/fa_jin_particle
execute as @a[scores={fa_jin=1..}] run scoreboard players set @s fa_jin_jump 0
