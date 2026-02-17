execute if block ^ ^ ^1 minecraft:lodestone \
    facing ^ ^-1 ^ \
    run return run \
        function rmt_tnl:chunk_loader/show_schematic
execute if block ^ ^ ^-1 minecraft:lodestone \
    facing ^ ^1 ^ \
    run return run \
        function rmt_tnl:chunk_loader/show_schematic
function rmt_tnl:chunk_loader/show_schematic