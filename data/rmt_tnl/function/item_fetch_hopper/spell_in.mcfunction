advancement grant @s only rmt_tnl:chunk_loader

execute unless data storage nutlet:var {caller:"hit_block"} \
    run return fail
execute unless block ~ ~ ~ minecraft:furnace \
    run return run \
        function rmt_tnl:info/setup_fail_1 {block:"furnace"}

data modify storage rmt_tnl:var stop \
    set value 1b
function nutlet:-m/facing/block_axis_align \
    {handler:"rmt_tnl:item_fetch_hopper/setup"}
execute if data storage rmt_tnl:var stop \
    run return run \
        data remove storage rmt_tnl:var stop

execute align xyz if entity \
    @n[tag=nutlet.display,dx=0,dz=0,dy=0] \
        run return fail
function nutlet:-m/facing/block_axis_align \
    {handler:"rmt_tnl:item_fetch_hopper/show_schematic"}