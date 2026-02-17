execute positioned ~ ~0.5 ~ \
    run function rmt_tnl:uni/particle_3x3x4 {particle:"minecraft:flame"}

data modify storage nutlet:var schematic set value \
    {tick:100, keepData:1b, transformation:{\
        scale:[0.3f, 0.3f, 0.3f], translation:[-0.15f, -0.15f, -0.15f]}}

data modify storage nutlet:var schematic.id set value "minecraft:air"
function nutlet:-m/schematic/item {hasComponent:"false"}
# mud
# middle layer
data modify storage nutlet:var schematic.id set value "minecraft:mud"
execute positioned ~1 ~ ~1 \
    run function nutlet:-m/schematic/block {hasProp:"false"}
execute positioned ~-1 ~ ~1 \
    run function nutlet:-m/schematic/block {hasProp:"false"}
execute positioned ~1 ~ ~-1 \
    run function nutlet:-m/schematic/block {hasProp:"false"}
execute positioned ~-1 ~ ~-1 \
    run function nutlet:-m/schematic/block {hasProp:"false"}
# bottom layer
execute positioned ~1 ~-1 ~1 \
    run function nutlet:-m/schematic/block {hasProp:"false"}
execute positioned ~-1 ~-1 ~1 \
    run function nutlet:-m/schematic/block {hasProp:"false"}
execute positioned ~1 ~-1 ~-1 \
    run function nutlet:-m/schematic/block {hasProp:"false"}
execute positioned ~-1 ~-1 ~-1 \
    run function nutlet:-m/schematic/block {hasProp:"false"}
execute positioned ~1 ~-1 ~ \
    run function nutlet:-m/schematic/block {hasProp:"false"}
execute positioned ~-1 ~-1 ~ \
    run function nutlet:-m/schematic/block {hasProp:"false"}
execute positioned ~ ~-1 ~1 \
    run function nutlet:-m/schematic/block {hasProp:"false"}
execute positioned ~ ~-1 ~-1 \
    run function nutlet:-m/schematic/block {hasProp:"false"}
# amethyst block
data modify storage nutlet:var schematic.id set value "minecraft:amethyst_block"
execute positioned ~1 ~1 ~1 \
    run function nutlet:-m/schematic/block {hasProp:"false"}
execute positioned ~-1 ~1 ~1 \
    run function nutlet:-m/schematic/block {hasProp:"false"}
execute positioned ~1 ~1 ~-1 \
    run function nutlet:-m/schematic/block {hasProp:"false"}
execute positioned ~-1 ~1 ~-1 \
    run function nutlet:-m/schematic/block {hasProp:"false"}
execute positioned ~1 ~1 ~ \
    run function nutlet:-m/schematic/block {hasProp:"false"}
execute positioned ~-1 ~1 ~ \
    run function nutlet:-m/schematic/block {hasProp:"false"}
execute positioned ~ ~1 ~1 \
    run function nutlet:-m/schematic/block {hasProp:"false"}
execute positioned ~ ~1 ~1 \
    run function nutlet:-m/schematic/block {hasProp:"false"}
# golden pressure plate
data modify storage nutlet:var schematic.id set value "minecraft:light_weighted_pressure_plate"
execute positioned ~1 ~2 ~1 \
    run function nutlet:-m/schematic/block {hasProp:"false"}
execute positioned ~-1 ~2 ~1 \
    run function nutlet:-m/schematic/block {hasProp:"false"}
execute positioned ~1 ~2 ~-1 \
    run function nutlet:-m/schematic/block {hasProp:"false"}
execute positioned ~-1 ~2 ~-1 \
    run function nutlet:-m/schematic/block {hasProp:"false"}
# redstone lamp
data modify storage nutlet:var schematic.id set value "minecraft:redstone_lamp"
execute positioned ^ ^ ^-1 \
    run function nutlet:-m/schematic/block {hasProp:"false"}
# muddy mangrove roots
data modify storage nutlet:var schematic.id set value "minecraft:muddy_mangrove_roots"
execute positioned ^ ^ ^1 \
    run function nutlet:-m/schematic/block {hasProp:"false"}
execute positioned ^1 ^ ^ \
    run function nutlet:-m/schematic/block {hasProp:"false"}
execute positioned ^-1 ^ ^ \
    run function nutlet:-m/schematic/block {hasProp:"false"}
# bigger schematic
data modify storage nutlet:var schematic.transformation set value \
    {scale:[0.5f, 0.5f, 0.5f], translation:[-0.25f, -0.25f, -0.25f]}
# purpur block
data modify storage nutlet:var schematic.id set value "minecraft:purpur_block"
function nutlet:-m/schematic/block {hasProp:"false"}
# lodestone
data modify storage nutlet:var schematic.id set value "minecraft:lodestone"
execute positioned ~ ~1 ~ \
    run function nutlet:-m/schematic/block {hasProp:"false"}
# hopper
data modify storage nutlet:var schematic.prop.facing set value "down"
data modify storage nutlet:var schematic.id set value "minecraft:hopper"
execute positioned ~ ~-1 ~ \
    run function nutlet:-m/schematic/block {hasProp:"true"}
# decorated pot, is item display
data remove storage nutlet:var schematic.transformation.translation
data modify storage nutlet:var schematic.id set value "minecraft:decorated_pot"
execute positioned ~ ~2 ~ \
    run function nutlet:-m/schematic/item {hasComponent:"true"}

data remove storage nutlet:var schematic