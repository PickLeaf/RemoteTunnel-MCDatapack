data modify storage rmt_tnl:print cmd.nutlet \
    set value '{"text":""}'
function nutlet:get_version {storage:"rmt_tnl:print",path:"nutlet"}
execute if data storage rmt_tnl:print nutlet \
    run return run \
        function rmt_tnl:print/nutlet_exists
data modify storage rmt_tnl:print cmd.nutlet \
    set value '{"translate": "rmt_tnl.missing_nutlet",\
    "fallback": "(Missing Nutlet Datapack)",\
    "color":"red"}'