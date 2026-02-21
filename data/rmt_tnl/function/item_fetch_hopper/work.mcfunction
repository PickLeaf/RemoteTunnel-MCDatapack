execute unless predicate rmt_tnl:timer/20 \
    run return fail
execute positioned ^ ^1 ^-1 \
    unless predicate rmt_tnl:item_fetch_hopper \
    run return run \
        function rmt_tnl:item_fetch_hopper/destory

execute if items block ~ ~ ~ container.2 * \
    run return fail
function rmt_tnl:item_fetch_hopper/jump \
    with entity @s data
execute unless data storage rmt_tnl:var return_item \
    run return fail
data modify storage rmt_tnl:var return_item.Slot \
    set value 2b
data modify block ~ ~ ~ Items \
    append from storage rmt_tnl:var return_item
data remove storage rmt_tnl:var return_item