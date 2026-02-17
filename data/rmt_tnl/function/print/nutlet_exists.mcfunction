# check version of nutlet
execute if predicate rmt_tnl:check_nutlet \
    run return 1

data modify storage rmt_tnl:print cmd.nutlet \
    set value '{"translate": "rmt_tnl.nutlet_low",\
        "fallback": "(LOW Version of Nutlet Datapack)",\
        "color":"red"}'