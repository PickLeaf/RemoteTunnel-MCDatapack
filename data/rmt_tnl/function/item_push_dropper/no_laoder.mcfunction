forceload remove ~ ~
data modify storage rmt_tnl:var push_item.return_bool \
    set value 1b

execute at @s positioned ^ ^ ^3 \
    run function rmt_tnl:info/particle_1x1 {particle:"minecraft:flame"}
execute unless predicate rmt_tnl:timer/200 \
    run return fail
data modify storage nutlet:var schematic set value \
    {tick:198s, keepData:1b, transformation: {\
        scale: [0.5f, 0.5f, 0.5f]},\
    mergeData:{\
        background:-214748364, shadow:1b, \
        width:3f, height:1f, line_width:100}}
execute at @s \
    run data modify storage nutlet:var schematic.dimension \
        set from block ^ ^ ^1 \
        components."minecraft:custom_data".dim
data modify storage nutlet:var schematic.text set value \
    '{"translate": "rmt_tnl.info.fail_3",\
    "fallback": "Lodestone Compass binding is not a Chunk Loader"}'
execute at @s positioned ^ ^0.6 ^3.5 \
    run function nutlet:-m/schematic/text
execute at @s positioned ^ ^0.6 ^3.5 \
    facing ^ ^0.001 ^-1 \
    run function nutlet:-m/schematic/text

data remove storage nutlet:var schematic