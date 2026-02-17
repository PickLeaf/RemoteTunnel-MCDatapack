# this function invoke by "/function #nutlet:config" in nutlet datapack
data modify storage nutlet:config list append value \
    {description:"Whether to print version info of Rock Gernerator when login the world.",\
    name:"Remote Tunnel:Print Version", storage_path:"rmt_tnl:config showVersion", acceptable:[1b, 0b],\
    default:"1b", type:"storage"}