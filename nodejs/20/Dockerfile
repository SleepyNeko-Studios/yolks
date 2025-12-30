FROM ghcr.io/parkervcp/yolks:nodejs_20

LABEL author="SleepyNeko Studios" maintainer="admin@sleepyneko.com"

USER root

RUN apt install -y ca-certificates

COPY ./discord-shield.crt /usr/local/share/ca-certificates/discord-shield.crt

RUN update-ca-certificates

USER container
