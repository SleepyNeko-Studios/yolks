FROM ghcr.io/parkervcp/apps:uptimekuma

LABEL author="SleepyNeko Studios" maintainer="admin@sleepyneko.com"

USER root

RUN apk update && apk add ca-certificates
COPY ./SleepyNeko-Studios-Infra-Root-CA.crt /usr/local/share/ca-certificates/SleepyNeko-Studios-Infra-Root-CA.crt
RUN update-ca-certificates

ENV NODE_EXTRA_CA_CERTS=/usr/local/share/ca-certificates/SleepyNeko-Studios-Infra-Root-CA.crt

USER container
