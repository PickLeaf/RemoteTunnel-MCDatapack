$execute in $(dim) positioned $(x) $(y) $(z) \
    if block ~ ~3 ~ minecraft:decorated_pot run return run \
        data modify storage rmt_tnl:mem args[-1].return.fail set value 1b

forceload add ~ ~
$execute in $(dim) positioned $(x) $(y) $(z) run \
    setblock ~ ~3 ~ minecraft:decorated_pot destroy
execute unless block ~ ~1 ~ minecraft:repeating_command_block run \
    forceload remove ~ ~