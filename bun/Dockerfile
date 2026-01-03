ARG BASE_TAG=debian
FROM --platform=$TARGETOS/$TARGETARCH oven/bun:${BASE_TAG}

LABEL author="SleepyNeko Studios" maintainer="admin@sleepyneko.com"

USER root

RUN apt-get update \
    && apt-get install -y git sqlite3 libsqlite3-dev curl make g++ ca-certificates tzdata iproute2 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && useradd -m -d /home/container container

COPY ./SleepyNeko-Studios-Infra-Root-CA.crt /usr/local/share/ca-certificates/SleepyNeko-Studios-Infra-Root-CA.crt
RUN update-ca-certificates
ENV NODE_EXTRA_CA_CERTS=/etc/ssl/certs/ca-certificates.crt
ENV BUN_TLS_CA_FILE=/etc/ssl/certs/ca-certificates.crt

ENV USER=container HOME=/home/container

USER container
WORKDIR /home/container

COPY --chown=container:container ./bun/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
