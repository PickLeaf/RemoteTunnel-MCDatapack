data modify storage rmt_tnl:var drop_item \
    set from block ~ ~ ~ \
    components."minecraft:custom_data".item

execute if block ^ ^ ^2 minecraft:decorated_pot \
    if data block ^ ^ ^2 item.id \
    positioned ^ ^ ^2 \
    summon minecraft:chest_minecart \
        run function rmt_tnl:item_push_dropper/drop
execute unless block ^ ^ ^2 minecraft:decorated_pot \
    positioned ^ ^ ^2 \
    summon minecraft:chest_minecart \
        run function rmt_tnl:item_push_dropper/drop
data modify block ^ ^ ^2 item \
    set from storage rmt_tnl:var drop_item

function rmt_tnl:uni/kill_display \
    with block ~ ~ ~ \
    components."minecraft:custom_data".display

setblock ~ ~ ~ minecraft:amethyst_block
kill @s