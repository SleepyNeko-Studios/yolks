ARG VERSION=latest
FROM n8nio/n8n:${VERSION}

LABEL author="SleepyNeko Studios" maintainer="admin@sleepyneko.com"

USER root

RUN apk add --no-cache ca-certificates git
COPY ./SleepyNeko-Studios-Infra-Root-CA.crt /usr/local/share/ca-certificates/SleepyNeko-Studios-Infra-Root-CA.crt
RUN update-ca-certificates

ENV NODE_EXTRA_CA_CERTS=/usr/local/share/ca-certificates/SleepyNeko-Studios-Infra-Root-CA.crt

ENV N8N_USER_FOLDER="/home/container/.n8n"

RUN adduser -D -h /home/container -s /bin/sh container
ENV USER=container HOME=/home/container

USER container
WORKDIR /home/container

COPY --chown=container:container ./n8n/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

CMD ["/bin/sh", "/entrypoint.sh"]
