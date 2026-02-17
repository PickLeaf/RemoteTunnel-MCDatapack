data modify storage rmt_tnl:print cmd.error \
    set value '{"translate": "rmt_tnl.load_resourcepack",\
        "fallback": "(Missing Resource Pack)"},\
        {"translate": "rmt_tnl.load_unexpected_version",\
        "color": "dark_red",\
        "fallback": "(Be loaded to UNEXPECTED version!)"}'