execute unless loaded ~ ~ ~ run \
    forceload add ~ ~
execute unless block ~ ~-1 ~ minecraft:repeating_command_block\
    {components:{"minecraft:custom_data":{"rmt_tnl:is_chunk_loader":1b}}} \
    run return run \
        function rmt_tnl:item_push_dropper/no_laoder
execute if data block ~ ~-2 ~ item.id \
    run return run \
        data modify storage rmt_tnl:var push_item.return_bool \
            set value 1b

data modify block ~ ~-2 ~ item \
    set from storage rmt_tnl:var push_item
data remove storage rmt_tnl:var push_item