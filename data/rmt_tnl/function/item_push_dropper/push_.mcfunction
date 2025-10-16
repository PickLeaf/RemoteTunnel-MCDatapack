execute unless loaded ~ ~ ~ run \
    forceload add ~ ~

execute unless predicate rmt_tnl:check_remote_loader/item_push_dropper \
    run return run \
        data modify storage rmt_tnl:mem args[-1].return.null_lodestone set value 1b
execute if data block ~ ~-1 ~ item.id \
    run return fail

data modify block ~ ~-1 ~ item \
    set from storage rmt_tnl:mem args[-1].item
data modify storage rmt_tnl:mem args[-1].return.success set value 1b