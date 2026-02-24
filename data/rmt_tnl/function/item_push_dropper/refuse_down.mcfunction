title @s actionbar \
    {"translate": "rmt_tnl.info.setup_fail_4",\
    "bold": true, "color": "red",\
    "fallback": "The %s should not face downwards",\
    "with":[{\
        "translate":"block.minecraft.crafter"}]}
playsound block.vault.insert_item_fail player @s ~ ~ ~
data remove storage rmt_tnl:var stop