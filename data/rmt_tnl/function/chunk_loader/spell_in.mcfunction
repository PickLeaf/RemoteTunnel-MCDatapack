advancement grant @s only rmt_tnl:chunk_loader

execute unless data storage nutlet:var {caller:"hit_block"} \
    run return fail
execute unless block ~ ~ ~ minecraft:lodestone \
    run return run \
        function rmt_tnl:info/setup_fail_1 {block:"lodestone"}

data modify storage rmt_tnl:var stop \
    set value 1b
execute positioned ~ ~-1 ~ \
    run function nutlet:-m/facing/entity_axis_align \
            {handler:"rmt_tnl:chunk_loader/setup"}
execute if data storage rmt_tnl:var stop \
    run return run \
        data remove storage rmt_tnl:var stop

execute align xyz if entity \
    @n[tag=nutlet.display,dx=1,dz=1,dy=1] \
        run return fail
execute positioned ~ ~-1 ~ \
    run function nutlet:-m/facing/entity_axis_align {handler:"rmt_tnl:chunk_loader/horizonize"}