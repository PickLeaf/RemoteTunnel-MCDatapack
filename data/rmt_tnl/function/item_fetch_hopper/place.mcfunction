data remove block ~ ~ ~ Items[{count:8,id:"minecraft:amethyst_block"}]
data remove block ~ ~ ~ Items[{count:4,id:"minecraft:crying_obsidian"}]
data remove block ~ ~ ~ Items[{count:1,id:"minecraft:pearlescent_froglight"}]
data remove block ~ ~ ~ Items[{count:3,id:"minecraft:decorated_pot"}]
data remove block ~ ~ ~ Items[{count:4,id:"minecraft:mangrove_trapdoor"}]
setblock ~ ~3 ~ minecraft:decorated_pot
data modify block ~ ~3 ~ item set from block ~ ~ ~ \
    Items[{count:1,id:"minecraft:compass",components:{"minecraft:lodestone_tracker":{}}}]
data remove block ~ ~ ~ Items[{count:1,id:"minecraft:compass",components:{"minecraft:lodestone_tracker":{}}}]
setblock ~ ~ ~ minecraft:decorated_pot destroy

fill ~1 ~2 ~1 ~-1 ~2 ~-1 minecraft:crying_obsidian
fill ~1 ~1 ~ ~-1 ~2 ~ minecraft:amethyst_block
fill ~ ~1 ~1 ~ ~2 ~-1 minecraft:amethyst_block
fill ~ ~1 ~ ~ ~2 ~ minecraft:pearlescent_froglight
setblock ~1 ~ ~ minecraft:mangrove_trapdoor[facing=east,half=top,open=true]
setblock ~-1 ~ ~ minecraft:mangrove_trapdoor[facing=west,half=top,open=true]
setblock ~ ~ ~1 minecraft:mangrove_trapdoor[facing=south,half=top,open=true]
setblock ~ ~ ~-1 minecraft:mangrove_trapdoor[facing=north,half=top,open=true]

setblock ~ ~1 ~ minecraft:repeating_command_block[facing=up]{\
    Command:"function rmt_tnl:run/1",TrackOutput:0b}

data modify storage rmt_tnl:mem args append value {}
data modify storage rmt_tnl:mem args[-1].x set from block ~ ~3 ~ \
    item.components."minecraft:lodestone_tracker".target.pos[0]
data modify storage rmt_tnl:mem args[-1].y set from block ~ ~3 ~ \
    item.components."minecraft:lodestone_tracker".target.pos[1]
data modify storage rmt_tnl:mem args[-1].z set from block ~ ~3 ~ \
    item.components."minecraft:lodestone_tracker".target.pos[2]
data modify storage rmt_tnl:mem args[-1].dim set from block ~ ~3 ~ \
    item.components."minecraft:lodestone_tracker".target.dimension
function rmt_tnl:item_fetch_hopper/place_remote_pot with storage rmt_tnl:mem args[-1]
execute if data storage rmt_tnl:mem args[-1].return{fail:1b} run \
    loot spawn ~ ~ ~ loot minecraft:blocks/decorated_pot
data remove storage rmt_tnl:mem args[-1]

execute align xyz as @e[dx=1,dy=1,dz=1,type=minecraft:item] facing entity @p eyes \
    run tp @s ^ ^ ^2