execute unless predicate rmt_tnl:timer/chunk_loader \
    run return fail
execute unless predicate rmt_tnl:chunk_loader \
    run return run \
        function rmt_tnl:chunk_loader/destory

execute if block ^ ^ ^1 \
    minecraft:redstone_lamp[lit=true] \
    run forceload add ~ ~
execute if block ^ ^ ^1 \
    minecraft:redstone_lamp[lit=false] \
    run forceload remove ~ ~