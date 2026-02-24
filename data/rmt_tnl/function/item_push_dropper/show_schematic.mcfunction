execute positioned ^ ^ ^1 \
    run function rmt_tnl:info/particle_3x3x3 {particle:"minecraft:flame"}
execute positioned ^ ^ ^3 \
    run function rmt_tnl:info/particle_1x1 {particle:"minecraft:flame"}

data modify storage nutlet:var schematic set value \
    {tick:100, keepData:1b, transformation:{\
        scale:[0.3f, 0.3f, 0.3f], translation:[-0.15f, -0.15f, -0.15f]}}

data modify storage nutlet:var schematic.id set value "minecraft:air"
function nutlet:-m/schematic/item {hasComponent:"false"}
# clay
data modify storage nutlet:var schematic.id set value "minecraft:clay"
execute positioned ^1 ^ ^1 \
    run function nutlet:-m/schematic/block {hasProp:"false"}
execute positioned ^-1 ^ ^1 \
    run function nutlet:-m/schematic/block {hasProp:"false"}
execute positioned ^ ^-1 ^1 \
    run function nutlet:-m/schematic/block {hasProp:"false"}
# redstone lamp
data modify storage nutlet:var schematic.id set value "minecraft:redstone_lamp"
execute positioned ^ ^1 ^1 \
    run function nutlet:-m/schematic/block {hasProp:"false"}
# smooth stone
data modify storage nutlet:var schematic.id set value "minecraft:smooth_stone"
# --first layer 1
# adjacent
execute positioned ^ ^1 ^ \
    run function nutlet:-m/schematic/block {hasProp:"false"}
execute positioned ^ ^-1 ^ \
    run function nutlet:-m/schematic/block {hasProp:"false"}
execute positioned ^1 ^ ^ \
    run function nutlet:-m/schematic/block {hasProp:"false"}
execute positioned ^-1 ^ ^ \
    run function nutlet:-m/schematic/block {hasProp:"false"}
# corner
execute positioned ^1 ^1 ^ \
    run function nutlet:-m/schematic/block {hasProp:"false"}
execute positioned ^1 ^-1 ^ \
    run function nutlet:-m/schematic/block {hasProp:"false"}
execute positioned ^-1 ^1 ^ \
    run function nutlet:-m/schematic/block {hasProp:"false"}
execute positioned ^-1 ^-1 ^ \
    run function nutlet:-m/schematic/block {hasProp:"false"}
# --second layer 2
# corner
execute positioned ^1 ^1 ^1 \
    run function nutlet:-m/schematic/block {hasProp:"false"}
execute positioned ^1 ^-1 ^1 \
    run function nutlet:-m/schematic/block {hasProp:"false"}
execute positioned ^-1 ^1 ^1 \
    run function nutlet:-m/schematic/block {hasProp:"false"}
execute positioned ^-1 ^-1 ^1 \
    run function nutlet:-m/schematic/block {hasProp:"false"}
# --third layer 3
# adjacent
execute positioned ^ ^1 ^2 \
    run function nutlet:-m/schematic/block {hasProp:"false"}
execute positioned ^ ^-1 ^2 \
    run function nutlet:-m/schematic/block {hasProp:"false"}
execute positioned ^1 ^ ^2 \
    run function nutlet:-m/schematic/block {hasProp:"false"}
execute positioned ^-1 ^ ^2 \
    run function nutlet:-m/schematic/block {hasProp:"false"}
# corner
execute positioned ^1 ^1 ^2 \
    run function nutlet:-m/schematic/block {hasProp:"false"}
execute positioned ^1 ^-1 ^2 \
    run function nutlet:-m/schematic/block {hasProp:"false"}
execute positioned ^-1 ^1 ^2 \
    run function nutlet:-m/schematic/block {hasProp:"false"}
execute positioned ^-1 ^-1 ^2 \
    run function nutlet:-m/schematic/block {hasProp:"false"}
# clear data
data remove storage rmt_tnl:var schematic
# bigger schematic
data modify storage nutlet:var schematic.transformation set value \
    {scale:[0.8f, 0.8f, 0.8f], translation:[-0.4f, -0.4f, -0.4f]}
# amethyst block
data modify storage nutlet:var schematic.id set value "minecraft:amethyst_block"
execute positioned ^ ^ ^1 \
    run function nutlet:-m/schematic/block {hasProp:"false"}
execute positioned ^ ^ ^2 \
    run function nutlet:-m/schematic/block {hasProp:"false"}
# decorated pot, is item display
data modify storage nutlet:var schematic.id set value "minecraft:decorated_pot"
data remove storage nutlet:var schematic.uuid
execute positioned ^ ^ ^3 \
    run function nutlet:-m/schematic/block {hasProp:"false"}
data remove storage nutlet:var schematic.transformation.translation
execute if data storage nutlet:var schematic.uuid \
    positioned ^ ^ ^3 \
    rotated ~ 0 \
    run function nutlet:-m/schematic/item {hasComponent:"false"}
# display compass that should in decorated pot
data modify storage nutlet:var schematic.transformation set value \
    {scale:[0.5f, 0.5f, 0.5f]}
data modify storage nutlet:var schematic.id set value "minecraft:compass"
data modify storage nutlet:var schematic.component set value \
    {"minecraft:lodestone_tracker":{}}
execute if data storage nutlet:var schematic.uuid \
    positioned ^ ^ ^3 \
    positioned ~ ~0.6 ~ \
    rotated ~ -90 \
    run function nutlet:-m/schematic/item {hasComponent:"true"}
# display tip text
execute positioned ^ ^ ^1 \
    unless predicate rmt_tnl:item_push_dropper \
    run return run \
        data remove storage nutlet:var schematic
execute unless block ^ ^ ^1 minecraft:amethyst_block \
    run return run \
        data remove storage nutlet:var schematic

data modify storage nutlet:var schematic.mergeData set value \
    {background:-1610612736, shadow:1b, width:3f, height:1f, line_width:100}
execute unless items block ^ ^ ^3 container.* \
    *[minecraft:lodestone_tracker={}] \
    run data modify storage nutlet:var schematic.text set value \
        '{"translate": "rmt_tnl.info.fail_2",\
        "fallback": "The %s need contain %s",\
        "with": [\
            {"translate": "block.minecraft.decorated_pot"},\
            {"translate": "item.minecraft.lodestone_compass"}]}'
execute positioned ^ ^ ^-0.51 \
    facing ^ ^0.001 ^-1 \
    run function nutlet:-m/schematic/text

data remove storage nutlet:var schematic