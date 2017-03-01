# Dockerizing thunder xware
# xware version: Xware1.0.31 release date: 2014-08-27

FROM debian:wheezy-slim
MAINTAINER Senorsen <senorsen.zhang@gmail.com>

ENV LANG C.UTF-8
# disabled in docker hub RUN sed -i.bak 's/deb.debian.org/mirrors.aliyun.com/' /etc/apt/sources.list
RUN apt-get update \
    && apt-get install -y procps lib32z1 lib32ncurses5 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p /app/bin

WORKDIR /app
COPY thunder /app/
COPY start.sh /app/

VOLUME /app/TDDOWNLOAD
VOLUME /app/bin/cfg

CMD sh ./start.sh

