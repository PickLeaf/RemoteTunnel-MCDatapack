# check predicate
execute unless predicate rmt_tnl:chunk_loader \
    run return run \
        data remove storage rmt_tnl:var stop
execute unless block ~ ~ ~ minecraft:purpur_block \
    run return run \
        data remove storage rmt_tnl:var stop
execute positioned ~ ~0.5 ~ \
    run function rmt_tnl:info/set_up_suc {size:"3x3x4"}
# place command block in world
function nutlet:-m/facing/entity
function rmt_tnl:uni/place_cb with storage nutlet:var facing
data remove storage nutlet:var facing
# summon marker and store hex_uuid
execute summon minecraft:marker \
    run function rmt_tnl:chunk_loader/summon_marker
data modify block ~ ~ ~ components."minecraft:custom_data".marker.hex \
    set from storage nutlet:var uuid.hex
data modify block ~ ~ ~ \
    components."minecraft:custom_data"."rmt_tnl:is_chunk_loader" \
    set value 1b
# modified command in command block
data modify storage nutlet:var uuid.func \
    set value "rmt_tnl:w/0"
function rmt_tnl:uni/set_command with storage nutlet:var uuid
data remove storage nutlet:var uuid
# dispaly 天线
data modify storage nutlet:var schematic set value \
    {tick:0, keepData:1b, id:"minecraft:lightning_rod", transformation: {\
        scale: [0.3f, 2f, 0.3f], translation: [-0.15f, -1f, -0.15f]},\
    prop: {facing: "down"}}
execute positioned ~ ~3.7 ~ \
    run function nutlet:-m/schematic/block {hasProp:"true"}
data modify block ~ ~ ~ \
    components."minecraft:custom_data".display.hex \
    set from storage nutlet:var schematic.uuid
data remove storage nutlet:var schematic