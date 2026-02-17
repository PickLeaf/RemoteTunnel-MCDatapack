execute unless predicate rmt_tnl:item_fetch_hopper run \
    function rmt_tnl:item_fetch_hopper/when_destory

execute if data block ~ ~-1 ~ item.id \
    run return fail
execute unless data block ~ ~2 ~ item.components."minecraft:lodestone_tracker".target \
    run return fail

data modify storage rmt_tnl:mem args append value {}
data modify storage rmt_tnl:mem args[-1].x set from block ~ ~2 ~ \
    item.components."minecraft:lodestone_tracker".target.pos[0]
data modify storage rmt_tnl:mem args[-1].y set from block ~ ~2 ~ \
    item.components."minecraft:lodestone_tracker".target.pos[1]
data modify storage rmt_tnl:mem args[-1].z set from block ~ ~2 ~ \
    item.components."minecraft:lodestone_tracker".target.pos[2]
data modify storage rmt_tnl:mem args[-1].dim set from block ~ ~2 ~ \
    item.components."minecraft:lodestone_tracker".target.dimension
function rmt_tnl:item_fetch_hopper/fetch with storage rmt_tnl:mem args[-1]
data modify block ~ ~-1 ~ item \
    set from storage rmt_tnl:mem args[-1].return.item
execute if data storage rmt_tnl:mem args[-1].return{null_lodestone:1b} \
    align xyz positioned ~0.5 ~2.5 ~0.5 run \
    function rmt_tnl:particle_warn_1x1
data remove storage rmt_tnl:mem args[-1]