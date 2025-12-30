FROM ghcr.io/parkervcp/yolks:python_3.10

LABEL author="SleepyNeko Studios" maintainer="admin@sleepyneko.com"

USER root

RUN apt install -y ca-certificates

COPY ./discord-shield.crt /usr/local/share/ca-certificates/discord-shield.crt

RUN update-ca-certificates

ENV REQUESTS_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt
ENV SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt

USER container
