# Thunder xware docker image

迅雷离线下载 docker 镜像（使用 wheezy-slim 以缩小体积至 ~27MiB），forked from [yinheli](https://github.com/yinheli/docker-thunder-xware)

## 使用
### 运行
请选择一个合适的目录。第一次运行将创建两个目录：data, config 分别用于存放下载的文件，和迅雷客户端的配置。

```
docker run -d \
        # 通过 restart 来指定异常退出时重启
        --restart on-failure \
        --name xware \
        # 默认的 network 是 host
        # 可以指定其他网络配置(--net, --ip)，以控制其网络行为
        --net host \
        -v $(pwd)/data:/app/TDDOWNLOAD \
        -v $(pwd)/config:/app/bin/cfg \
        senorsen/docker-thunder-xware
```

### 查看运行情况

```
docker ps
```

**输出**
```
CONTAINER ID        IMAGE                                 COMMAND             CREATED             STATUS              PORTS               NAMES
c8a3d047af71        senorsen/docker-thunder-xware:latest   "./start.sh"        4 seconds ago       Up 3 seconds                            xware
```

### 查看日志(激活码)/到迅雷增加设备

```
docker logs xware
```

**输出**
```
killall: ETMDaemon: no process killed
killall: EmbedThunderManager: no process killed
killall: vod_httpserver: no process killed
initing...
try stopping xunlei service first...
setting xunlei runtime env...
port: 9000 is usable.

YOUR CONTROL PORT IS: 9000

starting xunlei service...
Connecting to 127.0.0.1:9000 (127.0.0.1:9000)
setting xunlei runtime env...
port: 9000 is usable.

YOUR CONTROL PORT IS: 9000

starting xunlei service...

getting xunlei service info...

THE ACTIVE CODE IS: xxxxxx

go to http://yuancheng.xunlei.com, bind your device with the active code.
finished.
```

绑定成功后就可以使用了。
