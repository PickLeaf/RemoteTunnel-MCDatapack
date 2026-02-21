execute if predicate rmt_tnl:timer/20 \
    unless predicate rmt_tnl:chunk_loader \
    run return run \
        function rmt_tnl:chunk_loader/destory

scoreboard players remove @s Nutlet.Clac 1
execute if score @s Nutlet.Clac matches 1.. \
    run return fail
scoreboard players set @s Nutlet.Clac 100

execute if block ^ ^ ^1 \
    minecraft:redstone_lamp[lit=true] \
    run forceload add ~ ~
execute if block ^ ^ ^1 \
    minecraft:redstone_lamp[lit=false] \
    run forceload remove ~ ~