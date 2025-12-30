FROM ghcr.io/parkervcp/yolks:python_3.13

LABEL author="SleepyNeko Studios" maintainer="admin@sleepyneko.com"

USER root

RUN apt install -y ca-certificates

COPY ./../../discord-shield.crt /discord-shield.crt

RUN update-ca-certificates

USER container
