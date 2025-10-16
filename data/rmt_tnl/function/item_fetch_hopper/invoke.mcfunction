advancement revoke @s only rmt_tnl:place/item_fetch_hopper
data modify storage rmt_tnl:mem args append value \
    {block:"#rmt_tnl:machine",function:"rmt_tnl:item_fetch_hopper/be_located"}
execute anchored eyes run \
    function rmt_tnl:ray_cast with storage rmt_tnl:mem args[-1]
data remove storage rmt_tnl:mem args[-1]