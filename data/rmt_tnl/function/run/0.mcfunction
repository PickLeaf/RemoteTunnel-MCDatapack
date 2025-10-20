execute if block ~ ~1 ~ minecraft:redstone_lamp[lit=true] \
    run forceload add ~ ~
execute if block ~ ~1 ~ minecraft:redstone_lamp[lit=false] \
    run forceload remove ~ ~

execute unless predicate rmt_tnl:chunk_loader run \
    function rmt_tnl:chunk_loader/when_destory