# Dockerizing thunder xware
# xware version: Xware1.0.31 release date: 2014-08-27

FROM debian:wheezy-slim
MAINTAINER yinheli <me@yinheli.com>

ENV LANG C.UTF-8
RUN sed -i.bak 's/deb.debian.org/mirrors.aliyun.com/' /etc/apt/sources.list
RUN apt-get update \
    && apt-get install -y procps lib32z1 lib32ncurses5 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p /app/bin

RUN echo 'directnet:x:1001:1001::/app:/bin/sh' >> /etc/passwd
WORKDIR /app
COPY thunder /app/
COPY start.sh /app/
RUN chmod +x start.sh && chmod +x ./bin/portal
RUN mkdir -p TDDOWNLOAD && chown -R directnet: .
VOLUME /app/TDDOWNLOAD
#USER directnet

CMD ["./start.sh"]

