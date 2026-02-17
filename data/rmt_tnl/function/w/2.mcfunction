execute unless predicate rmt_tnl:item_push_dropper run \
    function rmt_tnl:item_push_dropper/when_destory

execute unless data block ~ ~1 ~ \
    Items[0].components."minecraft:lodestone_tracker".target \
    run return fail
execute unless data block ~ ~1 ~ Items[1].id \
    run return fail

data modify storage rmt_tnl:mem args append value {}
data modify storage rmt_tnl:mem args[-1].x set from block ~ ~1 ~ \
    Items[0].components."minecraft:lodestone_tracker".target.pos[0]
data modify storage rmt_tnl:mem args[-1].y set from block ~ ~1 ~ \
    Items[0].components."minecraft:lodestone_tracker".target.pos[1]
data modify storage rmt_tnl:mem args[-1].z set from block ~ ~1 ~ \
    Items[0].components."minecraft:lodestone_tracker".target.pos[2]
data modify storage rmt_tnl:mem args[-1].dim set from block ~ ~1 ~ \
    Items[0].components."minecraft:lodestone_tracker".target.dimension
data modify storage rmt_tnl:mem args[-1].item set from block ~ ~1 ~ Items[1]
function rmt_tnl:item_push_dropper/push with storage rmt_tnl:mem args[-1]
execute if data storage rmt_tnl:mem args[-1].return{success:1b} run \
    data remove block ~ ~1 ~ Items[1]
execute if data storage rmt_tnl:mem args[-1].return{null_lodestone:1b} \
    align xyz positioned ~0.5 ~1.5 ~0.5 run \
    function rmt_tnl:particle_warn_1x1
data remove storage rmt_tnl:mem args[-1]