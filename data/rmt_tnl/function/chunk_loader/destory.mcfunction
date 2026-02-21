function rmt_tnl:uni/kill_display \
    with block ~ ~ ~ \
    components."minecraft:custom_data".display
setblock ~ ~ ~ minecraft:purpur_block
forceload remove ~ ~
kill @s