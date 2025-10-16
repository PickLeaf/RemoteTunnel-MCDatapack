$execute if block ~ ~ ~ $(block) \
    run return run function $(function)
#调试用 when debug
# $say $(block)
# $say $(function)
#particle minecraft:end_rod ~ ~ ~ 0.125 0.125 0.125 0 1
execute positioned ^ ^ ^0.05 \
    run function rmt_tnl:ray_cast with storage rmt_tnl:mem args[-1]