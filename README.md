# Thunder xware docker image

迅雷离线下载 docker 镜像（使用 wheezy-slim 以缩小体积至 ~27MiB），forked from [yinheli](https://github.com/yinheli/docker-thunder-xware)

## 使用

### 拉取镜像

```
docker pull senorsen/docker-thunder-xware:latest
```

### 创建一个下载目录. 用于挂载卷

```
mkdir data
```

### 运行

```
docker run -d \
        # 通过 restart 来指定异常退出时重启
        --restart on-failure \
        --name xware \
        --net host \
        -v $(pwd)/data:/app/TDDOWNLOAD \
        senorsen/docker-thunder-xware
```

### 查看运行情况

```
docker ps
```

```
// output:
CONTAINER ID        IMAGE                                 COMMAND             CREATED             STATUS              PORTS               NAMES
c8a3d047af71        senorsen/docker-thunder-xware:latest   "./start.sh"        4 seconds ago       Up 3 seconds                            xware
```

### 查看日志(激活码)/到迅雷增加设备

```
docker logs xware
```

```
// output:
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

绑定成功后就可以开心地使用了.




