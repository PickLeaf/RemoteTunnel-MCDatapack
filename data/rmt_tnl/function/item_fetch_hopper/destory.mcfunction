execute if block ~ ~1 ~ minecraft:decorated_pot \
    if data block ~ ~1 ~ item.id \
    summon minecraft:chest_minecart \
        run function rmt_tnl:item_fetch_hopper/drop
execute unless block ~ ~1 ~ minecraft:decorated_pot \
    summon minecraft:chest_minecart \
        run function rmt_tnl:item_fetch_hopper/drop
data modify block ~ ~1 ~ item \
    set from block ~ ~ ~ \
    components."minecraft:custom_data".item
function rmt_tnl:uni/kill_display \
    with block ~ ~ ~ \
    components."minecraft:custom_data".display
setblock ~ ~ ~ minecraft:amethyst_block
kill @s