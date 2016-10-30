#!/bin/bash

if [ ! -d data ]; then
    mkdir -p data
fi
chown -R directnet: data

docker run -d \
        --name=xware \
        --net dockerdirect \
        --ip 172.22.46.2 \
        --cpuset-cpus 0 \
        --memory 300m \
        -v $(pwd)/data:/app/TDDOWNLOAD \
        xunlei
