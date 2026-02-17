execute if block ~1 ~ ~ minecraft:redstone_lamp \
    facing ~1 ~ ~ \
    run tp @s ~ ~ ~ ~ ~
execute if block ~-1 ~ ~ minecraft:redstone_lamp \
    facing ~-1 ~ ~ \
    run tp @s ~ ~ ~ ~ ~
execute if block ~ ~ ~1 minecraft:redstone_lamp \
    facing ~ ~ ~1 \
    run tp @s ~ ~ ~ ~ ~
execute if block ~ ~ ~-1 minecraft:redstone_lamp \
    facing ~ ~ ~-1 \
    run tp @s ~ ~ ~ ~ ~
function rmt_tnl:uni/summon_marker