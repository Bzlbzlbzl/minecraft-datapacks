#Restarts manhunt by resetting everything
tag @a[tag=manhuntRunner] remove manhuntRunner
kill @e[tag=manhuntMarkerOW]
kill @e[tag=manhuntMarkerN]
time set 0
setworldspawn ~ ~ ~
clear @a
advancement revoke @a everything
kill @e[type=item]