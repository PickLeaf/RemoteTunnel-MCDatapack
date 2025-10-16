execute \
    unless entity @p \
    run return \
        run schedule function rmt_tnl:print/info 2t
function rmt_tnl:print/version
function rmt_tnl:print/link
function rmt_tnl:print/error
function rmt_tnl:print/macro \
    with storage rmt_tnl:print cmd
data remove storage rmt_tnl:print cmd