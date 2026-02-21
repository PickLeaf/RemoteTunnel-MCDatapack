data modify block ~ ~ ~ \
    components."minecraft:custom_data".item.Slot \
    set value 0b
data modify entity @s Items \
    append from block ~ ~ ~ \
    components."minecraft:custom_data".item
tp @s ~ ~1 ~
kill @s