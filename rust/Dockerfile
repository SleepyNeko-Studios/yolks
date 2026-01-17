ARG BASE_TAG=slim-bookworm
FROM rust:${BASE_TAG}

LABEL author="SleepyNeko Studios" maintainer="admin@sleepyneko.com"

USER root

RUN apt-get update \
    && apt-get install -y git curl iproute2 pkg-config libssl-dev build-essential ca-certificates tzdata \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && useradd -m -d /home/container container

COPY ./SleepyNeko-Studios-Infra-Root-CA.crt /usr/local/share/ca-certificates/SleepyNeko-Studios-Infra-Root-CA.crt
RUN update-ca-certificates
ENV SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt
ENV SSL_CERT_DIR=/etc/ssl/certs

ENV USER=container HOME=/home/container CARGO_HOME=/home/container/.cargo

USER container
WORKDIR /home/container

COPY --chown=container:container ./rust/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
