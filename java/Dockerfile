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

# Java doesn't read the system CA bundle (SSL_CERT_FILE etc.) like the other
# egg runtimes do, it has its own cacerts truststore, so the custom root CA
# has to be imported into it separately or HTTPS calls from apps fail with
# "PKIX path building failed".
RUN keytool -importcert -noprompt \
    -alias sleepyneko-studios-infra-root-ca \
    -file /usr/local/share/ca-certificates/SleepyNeko-Studios-Infra-Root-CA.crt \
    -cacerts -storepass changeit

ENV USER=container HOME=/home/container

USER container
WORKDIR /home/container

COPY --chown=container:container ./java/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
