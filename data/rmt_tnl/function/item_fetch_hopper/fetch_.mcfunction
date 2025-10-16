execute unless loaded ~ ~ ~ run \
    forceload add ~ ~

execute unless predicate rmt_tnl:check_remote_loader/item_fetch_hopper \
    run return run \
        data modify storage rmt_tnl:mem args[-1].return.null_lodestone set value 1b
execute unless data block ~ ~3 ~ item.id \
    run return fail

data modify storage rmt_tnl:mem args[-1].return.item \
    set from block ~ ~3 ~ item
data remove block ~ ~3 ~ item