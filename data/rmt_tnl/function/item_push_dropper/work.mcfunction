execute unless predicate rmt_tnl:timer/20 \
    run return fail
execute positioned ^ ^ ^1 \
    unless predicate rmt_tnl:item_push_dropper \
    run return run \
        function rmt_tnl:item_push_dropper/destory
execute if block ^ ^1 ^1 \
    minecraft:redstone_lamp[lit=true] \
    run return fail

execute unless items block ~ ~ ~ container.* * \
    run return fail
data modify storage rmt_tnl:var push_item \
    set from block ~ ~ ~ Items[-1]
function rmt_tnl:item_push_dropper/jump \
    with entity @s data

execute if data storage rmt_tnl:var push_item{return_bool:1b} \
    run return run \
        data remove storage rmt_tnl:var push_item

data remove block ~ ~ ~ Items[-1]