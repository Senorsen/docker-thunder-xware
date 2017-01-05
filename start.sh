#!/bin/sh
set -e

while true; do
    pid=$(ps -ef | grep vod_httpserver | grep -v grep | awk '{print $2}')
    if (test 0$pid -eq 0); then
        ./bin/portal
    else
        sleep 60
    fi
done

