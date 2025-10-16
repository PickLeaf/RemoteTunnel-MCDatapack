# 配置: 当加载器被破坏时, 是否强制卸载区块
# Config: Whether to force unload chunk when the Chunk Loader be destory
# 接受的值: 
# acceptable vales: 
# ["true", "false"]
data modify storage rmt_tnl:config \
    ForceUnloadChunkWhenLoaderBeDestory set value \
    "false"


