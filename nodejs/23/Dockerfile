FROM ghcr.io/parkervcp/yolks:nodejs_23

LABEL author="SleepyNeko Studios" maintainer="admin@sleepyneko.com"

USER root

RUN apt install -y ca-certificates

COPY ./discord-shield.crt /usr/local/share/ca-certificates/discord-shield.crt

RUN update-ca-certificates

ENV NODE_EXTRA_CA_CERTS=/usr/local/share/ca-certificates/discord-shield.crt

USER container
