data remove block ~ ~ ~ Items[{count:12,id:"minecraft:mud"}]
data remove block ~ ~ ~ Items[{count:4,id:"minecraft:muddy_mangrove_roots"}]
data remove block ~ ~ ~ Items[{count:8,id:"minecraft:gold_block"}]
data remove block ~ ~ ~ Items[{count:1,id:"minecraft:redstone_lamp"}]
data remove block ~ ~ ~ Items[{count:1,id:"minecraft:lodestone"}]

setblock ~ ~ ~ minecraft:air destroy
execute align xyz as @e[dx=1,dy=1,dz=1,type=minecraft:item] facing entity @p eyes \
    run tp @s ^ ^ ^2

fill ~1 ~ ~1 ~-1 ~2 ~-1 minecraft:mud
fill ~1 ~1 ~ ~-1 ~1 ~ minecraft:muddy_mangrove_roots
fill ~ ~1 ~1 ~ ~1 ~-1 minecraft:muddy_mangrove_roots
fill ~1 ~2 ~1 ~-1 ~2 ~-1 minecraft:gold_block
setblock ~ ~ ~ minecraft:lodestone
setblock ~ ~2 ~ minecraft:redstone_lamp

setblock ~ ~1 ~ minecraft:repeating_command_block[facing=up]{\
    Command:"function rmt_tnl:run/0",TrackOutput:0b}