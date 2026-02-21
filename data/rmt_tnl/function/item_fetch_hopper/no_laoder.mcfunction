forceload remove ~ ~
execute at @s positioned ^ ^2 ^-1 \
    run function rmt_tnl:info/particle_1x1 {particle:"minecraft:flame"}
execute unless predicate rmt_tnl:timer/200 \
    run return fail
data modify storage nutlet:var schematic set value \
    {tick: 198s,transformation: {\
        scale: [0.3f, 0.3f, 0.3f]},\
    mergeData:{\
        background:-1610612736, shadow:1b, \
        width:3f, height:1f, line_width:100}}
execute at @s \
    run data modify storage nutlet:var schematic.dimension \
    set from block ^ ^1 ^-1 \
    components."minecraft:custom_data".dim
execute at @s positioned ^ ^2 ^-1 \
    run data modify storage nutlet:var schematic.text set value \
        '{"translate": "rmt_tnl.info.fail_3",\
        "fallback": "Lodestone Compass binding is not a Chunk Loader"}'
execute at @s positioned ^ ^2.6 ^-0.5 \
    rotated ~ ~-45 \
    run function nutlet:-m/schematic/text

data remove storage nutlet:var schematic