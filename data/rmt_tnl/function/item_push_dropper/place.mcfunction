data remove block ~ ~ ~ Items[{count:12,id:"minecraft:smooth_stone"}]
data remove block ~ ~ ~ Items[{count:4,id:"minecraft:smooth_stone_slab"}]
data remove block ~ ~ ~ Items[{count:1,id:"minecraft:ochre_froglight"}]
data remove block ~ ~ ~ Items[{count:1,id:"minecraft:decorated_pot"}]
data remove block ~ ~ ~ Items[{count:1,id:"minecraft:dropper"}]
setblock ~ ~2 ~ minecraft:dropper[facing=up]
data modify block ~ ~2 ~ Items append from block ~ ~ ~ \
    Items[{count:1,id:"minecraft:compass",components:{"minecraft:lodestone_tracker":{}}}]
data modify block ~ ~2 ~ Items[0].Slot set value 0b
data remove block ~ ~ ~ Items[{count:1,id:"minecraft:compass",components:{"minecraft:lodestone_tracker":{}}}]

fill ~1 ~ ~1 ~-1 ~ ~-1 minecraft:smooth_stone destroy
setblock ~ ~ ~ minecraft:ochre_froglight
fill ~1 ~1 ~1 ~-1 ~1 ~-1 minecraft:smooth_stone_slab
fill ~ ~1 ~1 ~ ~1 ~-1 minecraft:smooth_stone
fill ~1 ~1 ~ ~-1 ~1 ~ minecraft:smooth_stone

setblock ~ ~1 ~ minecraft:repeating_command_block[facing=up]{\
    Command:"function rmt_tnl:run/2",TrackOutput:0b}

data modify storage rmt_tnl:mem args append value {}
data modify storage rmt_tnl:mem args[-1].x set from block ~ ~2 ~ \
    Items[0].components."minecraft:lodestone_tracker".target.pos[0]
data modify storage rmt_tnl:mem args[-1].y set from block ~ ~2 ~ \
    Items[0].components."minecraft:lodestone_tracker".target.pos[1]
data modify storage rmt_tnl:mem args[-1].z set from block ~ ~2 ~ \
    Items[0].components."minecraft:lodestone_tracker".target.pos[2]
data modify storage rmt_tnl:mem args[-1].dim set from block ~ ~2 ~ \
    Items[0].components."minecraft:lodestone_tracker".target.dimension
function rmt_tnl:item_push_dropper/place_remote_pot with storage rmt_tnl:mem args[-1]
execute if data storage rmt_tnl:mem args[-1].return{fail:1b} run \
    loot spawn ~ ~ ~ loot minecraft:blocks/decorated_pot
data remove storage rmt_tnl:mem args[-1]

execute align xyz as @e[dx=1,dy=1,dz=1,type=minecraft:item] facing entity @p eyes \
    run tp @s ^ ^ ^2