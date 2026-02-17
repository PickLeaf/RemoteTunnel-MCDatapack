execute unless data storage rmt_tnl:config \
{version:"V1.1"} run return \
    run function rmt_tnl:version_changed {version:"V1.1"}

execute if data storage rmt_tnl:config {showVersion:1b} \
    run function rmt_tnl:print/info