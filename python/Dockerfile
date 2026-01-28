ARG VERSION=3.7
FROM ghcr.io/parkervcp/yolks:python_${VERSION}

LABEL author="SleepyNeko Studios" maintainer="admin@sleepyneko.com"

USER root

RUN apt update && apt install -y ca-certificates && rm -rf /var/lib/apt/lists/*
COPY ./SleepyNeko-Studios-Infra-Root-CA.crt /usr/local/share/ca-certificates/SleepyNeko-Studios-Infra-Root-CA.crt
RUN update-ca-certificates

ENV REQUESTS_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt
ENV SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt

USER container
