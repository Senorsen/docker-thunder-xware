# Dockerizing thunder xware
# xware version: Xware1.0.31 release date: 2014-08-27

FROM debian:8
MAINTAINER yinheli <me@yinheli.com>

ENV LANG C.UTF-8
RUN /bin/sed -i.bak 's/deb.debian.org/mirrors.aliyun.com/' /etc/apt/sources.list
RUN rm /bin/sh && ln -s /bin/bash /bin/sh && \
    apt-get update && apt-get install -y zlib1g-dev lib32z1 lib32ncurses5 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    mkdir -p /app/bin

RUN echo 'directnet:x:1001:1001::/app:/bin/bash' >> /etc/passwd
WORKDIR /app
COPY thunder /app/
COPY start.sh /app/
RUN chmod +x start.sh && chmod +x ./bin/portal
RUN mkdir -p TDDOWNLOAD && chown -R directnet: .
VOLUME /app/TDDOWNLOAD
USER directnet

CMD ["./start.sh"]

