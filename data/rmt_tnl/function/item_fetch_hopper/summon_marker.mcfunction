data modify entity @s data.dim \
    set from block ~ ~ ~ \
    item.components.minecraft:lodestone_tracker.target.dimension
data modify entity @s data.x \
    set from block ~ ~ ~ \
    item.components.minecraft:lodestone_tracker.target.pos[0]
data modify entity @s data.y \
    set from block ~ ~ ~ \
    item.components.minecraft:lodestone_tracker.target.pos[1]
data modify entity @s data.z \
    set from block ~ ~ ~ \
    item.components.minecraft:lodestone_tracker.target.pos[2]
function rmt_tnl:uni/summon_marker