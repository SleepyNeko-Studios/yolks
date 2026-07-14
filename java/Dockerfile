ARG BASE_TAG=21-jdk-jammy
FROM --platform=$TARGETOS/$TARGETARCH eclipse-temurin:${BASE_TAG}

LABEL author="SleepyNeko Studios" maintainer="admin@sleepyneko.com"

USER root

RUN apt-get update \
    && apt-get install -y git curl maven gradle ca-certificates tzdata iproute2 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && useradd -m -d /home/container container

COPY ./SleepyNeko-Studios-Infra-Root-CA.crt /usr/local/share/ca-certificates/SleepyNeko-Studios-Infra-Root-CA.crt
RUN update-ca-certificates

ENV USER=container HOME=/home/container

USER container
WORKDIR /home/container

COPY --chown=container:container ./java/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
