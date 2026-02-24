# Refuse the downward-facing crafter
function nutlet:-m/facing/block
execute if data storage nutlet:var {x_rotation:90} \
    run return run \
        function rmt_tnl:item_push_dropper/refuse_down
# check predicate
execute positioned ^ ^ ^1 \
    unless predicate rmt_tnl:item_push_dropper \
    run return run \
        data remove storage rmt_tnl:var stop
execute unless block ^ ^ ^1 minecraft:amethyst_block \
    run return run \
        data remove storage rmt_tnl:var stop
execute unless block ^ ^ ^2 minecraft:amethyst_block \
    run return run \
        data remove storage rmt_tnl:var stop
execute unless block ^ ^ ^3 minecraft:decorated_pot \
    run return run \
        data remove storage rmt_tnl:var stop
execute unless items block ^ ^ ^3 container.* \
    *[minecraft:lodestone_tracker] \
    run return run \
        data remove storage rmt_tnl:var stop
execute positioned ^ ^ ^1 \
    run function rmt_tnl:info/set_up_suc {size:"3x3x3"}
execute positioned ^ ^ ^3 \
    run function rmt_tnl:info/set_up_suc {size:"1x1"}
# place command block in world
function nutlet:-m/facing/block
execute positioned ^ ^ ^1 \
    run function rmt_tnl:uni/place_cb with storage nutlet:var facing
data remove storage nutlet:var facing
# summon marker and store hex_uuid
execute summon minecraft:marker \
    run function rmt_tnl:item_push_dropper/summon_marker
# inject const data in CB
data modify block ^ ^ ^1 \
    components."minecraft:custom_data".marker.hex \
    set from storage nutlet:var uuid.hex
data modify block ^ ^ ^1 \
    components."minecraft:custom_data".item \
    set from block ^ ^ ^3 item
data modify block ^ ^ ^1 \
    components."minecraft:custom_data".dim \
    set from entity @s Dimension
data remove block ^ ^ ^3 item
# modified command in command block
data modify storage nutlet:var uuid.func \
    set value "rmt_tnl:w/2"
execute positioned ^ ^ ^1 \
    run function rmt_tnl:uni/set_command \
        with storage nutlet:var uuid
data remove storage nutlet:var uuid
# dispaly 天线
data modify storage nutlet:var schematic set value \
    {tick:0, keepData:1b, id:"minecraft:lightning_rod", transformation: {\
        scale: [0.3f, 2f, 0.3f], translation: [-0.15f, -1f, -0.15f]},\
    prop: {facing: "down"}}
execute positioned ^ ^ ^3 \
    positioned ~ ~1.7 ~ \
    run function nutlet:-m/schematic/block {hasProp:"true"}
data modify block ^ ^ ^1 \
    components."minecraft:custom_data".display.hex \
    set from storage nutlet:var schematic.uuid
data remove storage nutlet:var schematic