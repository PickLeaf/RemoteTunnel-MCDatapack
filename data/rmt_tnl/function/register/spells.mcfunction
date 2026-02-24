# this function invoke by "/function #nutlet:spells" in nutlet datapack
data modify storage nutlet:spell list append value \
    {spell:"Chunk Loader", function:"rmt_tnl:chunk_loader/spell_in"}
data modify storage nutlet:spell list append value \
    {spell:"Item Fetch Hopper", function:"rmt_tnl:item_fetch_hopper/spell_in"}
data modify storage nutlet:spell list append value \
    {spell:"Item Push Dropper", function:"rmt_tnl:item_push_dropper/spell_in"}