#Restarts manhunt by resetting everything and killing a lot of things
tag @a[tag=manhuntRunner] remove manhuntRunner
tag @a[tag=beenToOW] remove beenToOW
tag @a[tag=beenToN] remove beenToN
kill @e[tag=manhuntMarkerOW]
kill @e[tag=manhuntMarkerN]
time set 0
setworldspawn ~ ~ ~
clear @a
kill @e
advancement revoke @a everything
kill @e[type=item]