data modify storage rmt_tnl:var drop_item.Slot \
    set value 0b
data modify entity @s Items \
    append from storage rmt_tnl:var drop_item
data remove storage rmt_tnl:var drop_item
kill @s