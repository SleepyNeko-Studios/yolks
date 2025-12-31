ARG BASE_TAG=bookworm
FROM --platform=$TARGETOS/$TARGETARCH golang:${BASE_TAG}

LABEL author="SleepyNeko Studios" maintainer="admin@sleepyneko.com"

USER root

RUN apt-get update \
    && apt-get install -y git curl ca-certificates tzdata iproute2 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && useradd -m -d /home/container container

COPY ./discord-shield.crt /usr/local/share/ca-certificates/discord-shield.crt
RUN update-ca-certificates
ENV SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt

ENV USER=container HOME=/home/container
ENV GOPATH=/home/container/.go
ENV GOCACHE=/home/container/.cache/go-build
ENV PATH="${GOPATH}/bin:${PATH}"

USER container
WORKDIR /home/container

COPY --chown=container:container ./go/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
