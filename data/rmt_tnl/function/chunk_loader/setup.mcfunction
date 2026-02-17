# check predicate
execute unless predicate rmt_tnl:chunk_loader \
    run return run \
        data remove storage rmt_tnl:var stop
execute unless block ~ ~ ~ minecraft:purpur_block \
    run return run \
        data remove storage rmt_tnl:var stop
function rmt_tnl:info/set_up_suc
# place command block in world
function nutlet:-m/facing/entity
function rmt_tnl:uni/place with storage nutlet:var facing
data remove storage nutlet:var facing
# summon marker and store hex_uuid
execute summon minecraft:marker \
    run function rmt_tnl:chunk_loader/summon_marker
data modify block ~ ~ ~ components."minecraft:custom_data".marker.hex \
    set from storage nutlet:var uuid.hex
# modified command in command block
data modify storage nutlet:var uuid.func \
    set value "rmt_tnl:w/0"
function rmt_tnl:uni/set_command with storage nutlet:var uuid
data remove storage nutlet:var uuid