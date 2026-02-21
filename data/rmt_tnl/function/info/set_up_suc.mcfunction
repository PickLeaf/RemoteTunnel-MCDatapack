playsound block.anvil.land player @s ~ ~ ~
$execute positioned ~ ~ ~ \
    run function rmt_tnl:info/particle_$(size) {particle:"minecraft:happy_villager"}