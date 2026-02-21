execute positioned ^ ^1 ^-1 \
    run function rmt_tnl:info/particle_3x3x3 {particle:"minecraft:flame"}

data modify storage nutlet:var schematic set value \
    {tick:100, keepData:1b, transformation:{\
        scale:[0.3f, 0.3f, 0.3f], translation:[-0.15f, -0.15f, -0.15f]}}

data modify storage nutlet:var schematic.id set value "minecraft:air"
function nutlet:-m/schematic/item {hasComponent:"false"}
# polished blackstone slab
# bottom
data modify storage nutlet:var schematic.id set value "minecraft:polished_blackstone_slab"
data modify storage nutlet:var schematic.prop.type set value "bottom"
execute positioned ^ ^2 ^ \
    run function nutlet:-m/schematic/block {hasProp:"true"}
execute positioned ^1 ^2 ^ \
    run function nutlet:-m/schematic/block {hasProp:"true"}
execute positioned ^-1 ^2 ^ \
    run function nutlet:-m/schematic/block {hasProp:"true"}
execute positioned ^1 ^2 ^-1 \
    run function nutlet:-m/schematic/block {hasProp:"true"}
execute positioned ^-1 ^2 ^-1 \
    run function nutlet:-m/schematic/block {hasProp:"true"}
execute positioned ^1 ^2 ^-2 \
    run function nutlet:-m/schematic/block {hasProp:"true"}
execute positioned ^-1 ^2 ^-2 \
    run function nutlet:-m/schematic/block {hasProp:"true"}
execute positioned ^ ^2 ^-2 \
    run function nutlet:-m/schematic/block {hasProp:"true"}
# top
data modify storage nutlet:var schematic.prop.type set value "top"
execute positioned ^1 ^1 ^ \
    run function nutlet:-m/schematic/block {hasProp:"true"}
execute positioned ^-1 ^1 ^ \
    run function nutlet:-m/schematic/block {hasProp:"true"}
execute positioned ^1 ^1 ^-2 \
    run function nutlet:-m/schematic/block {hasProp:"true"}
execute positioned ^-1 ^1 ^-2 \
    run function nutlet:-m/schematic/block {hasProp:"true"}
# polished blackstone button and stair
# get facing
function nutlet:-m/facing/entity
data modify storage rmt_tnl:var schematic.front \
    set from storage nutlet:var facing.facing
execute facing ^ ^ ^-1 \
    run function nutlet:-m/facing/entity
data modify storage rmt_tnl:var schematic.behind \
    set from storage nutlet:var facing.facing
execute facing ^1 ^ ^ \
    run function nutlet:-m/facing/entity
data modify storage rmt_tnl:var schematic.left \
    set from storage nutlet:var facing.facing
execute facing ^-1 ^ ^ \
    run function nutlet:-m/facing/entity
data modify storage rmt_tnl:var schematic.right \
    set from storage nutlet:var facing.facing
# stairs
data modify storage nutlet:var schematic.id set value "minecraft:polished_blackstone_stairs"
data modify storage nutlet:var schematic.prop set value {"half":"top"}

data modify storage nutlet:var schematic.prop.facing \
    set from storage rmt_tnl:var schematic.front
execute positioned ^ ^1 ^-2 \
    run function nutlet:-m/schematic/block {hasProp:"true"}

data modify storage nutlet:var schematic.prop.facing \
    set from storage rmt_tnl:var schematic.right
execute positioned ^1 ^1 ^-1 \
    run function nutlet:-m/schematic/block {hasProp:"true"}

data modify storage nutlet:var schematic.prop.facing \
    set from storage rmt_tnl:var schematic.left
execute positioned ^-1 ^1 ^-1 \
    run function nutlet:-m/schematic/block {hasProp:"true"}
# slighterly bigger
data modify storage nutlet:var schematic.transformation set value \
    {scale:[0.5f, 0.5f, 0.5f], translation:[-0.25f, -0.25f, -0.25f]}
# polished blackstone button
data modify storage nutlet:var schematic.id set value "minecraft:polished_blackstone_button"
data remove storage nutlet:var schematic.prop
data modify storage nutlet:var schematic.prop.facing \
    set from storage rmt_tnl:var schematic.behind
execute positioned ^ ^ ^-2 \
    run function nutlet:-m/schematic/block {hasProp:"true"}

data modify storage nutlet:var schematic.prop.facing \
    set from storage rmt_tnl:var schematic.left
execute positioned ^1 ^ ^-1 \
    run function nutlet:-m/schematic/block {hasProp:"true"}

data modify storage nutlet:var schematic.prop.facing \
    set from storage rmt_tnl:var schematic.right
execute positioned ^-1 ^ ^-1 \
    run function nutlet:-m/schematic/block {hasProp:"true"}
# clear facing data
data remove storage rmt_tnl:var schematic
# bigger schematic
data modify storage nutlet:var schematic.transformation set value \
    {scale:[0.8f, 0.8f, 0.8f], translation:[-0.4f, -0.4f, -0.4f]}
# deepslate
data modify storage nutlet:var schematic.id set value "minecraft:deepslate"
execute positioned ^ ^ ^-1 \
    run function nutlet:-m/schematic/block {hasProp:"false"}
# amethyst block
data modify storage nutlet:var schematic.id set value "minecraft:amethyst_block"
execute positioned ^ ^1 ^-1 \
    run function nutlet:-m/schematic/block {hasProp:"false"}
# decorated pot, is item display
data modify storage nutlet:var schematic.id set value "minecraft:decorated_pot"
data remove storage nutlet:var schematic.uuid
execute positioned ^ ^2 ^-1 \
    run function nutlet:-m/schematic/block {hasProp:"false"}
data remove storage nutlet:var schematic.transformation.translation
execute if data storage nutlet:var schematic.uuid \
    positioned ^ ^2 ^-1 \
    run function nutlet:-m/schematic/item {hasComponent:"false"}
# display compass that should in decorated pot
data modify storage nutlet:var schematic.transformation set value \
    {scale:[0.5f, 0.5f, 0.5f]}
data modify storage nutlet:var schematic.id set value "minecraft:compass"
data modify storage nutlet:var schematic.component set value \
    {"minecraft:lodestone_tracker":{}}
execute if data storage nutlet:var schematic.uuid \
    positioned ^ ^2 ^-0.6 \
    run function nutlet:-m/schematic/item {hasComponent:"true"}
# display tip text
execute positioned ^ ^1 ^-1 \
    unless predicate rmt_tnl:item_fetch_hopper \
    run return run \
        data remove storage nutlet:var schematic
execute unless block ^ ^1 ^-1 minecraft:amethyst_block \
    run return run \
        data remove storage nutlet:var schematic

data modify storage nutlet:var schematic.mergeData set value \
    {background:-1610612736, shadow:1b, width:3f, height:1f, line_width:250}
execute unless items block ^ ^2 ^-1 container.* \
    *[minecraft:lodestone_tracker={}] \
    run data modify storage nutlet:var schematic.text set value \
        '{"translate": "rmt_tnl.info.fail_2",\
        "fallback": "The %s need contain %s",\
        "with": [\
            {"translate": "block.minecraft.decorated_pot"},\
            {"translate": "item.minecraft.lodestone_compass"}]}'
execute positioned ^ ^1 ^0.51 \
    run function nutlet:-m/schematic/text

data remove storage nutlet:var schematic