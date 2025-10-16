execute if data storage rmt_tnl:mem \
    {ForceUnloadChunkWhenLoaderBeDestory:"true"} \
    run forceload remove ~ ~

setblock ~ ~ ~ minecraft:air
fill ~1 ~1 ~1 ~-1 ~-1 ~-1 minecraft:air destroy