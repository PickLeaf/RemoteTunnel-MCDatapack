execute unless loaded ~ ~ ~ run \
    forceload add ~ ~
execute unless block ~ ~-1 ~ minecraft:repeating_command_block\
    {components:{"minecraft:custom_data":{"rmt_tnl:is_chunk_loader":1b}}} \
    run return run \
        function rmt_tnl:item_fetch_hopper/no_laoder
execute unless data block ~ ~1 ~ item.id \
    run return fail

data modify storage rmt_tnl:var return_item \
    set from block ~ ~1 ~ item
data remove block ~ ~1 ~ item