ARG VERSION=latest
FROM n8nio/n8n:${VERSION}

LABEL author="SleepyNeko Studios" maintainer="admin@sleepyneko.com"

USER root

RUN if command -v apk > /dev/null 2>&1; then \
        apk add --no-cache ca-certificates git \
        && adduser -D -h /home/container -s /bin/sh container; \
    elif command -v apt-get > /dev/null 2>&1; then \
        apt-get update && apt-get install -y --no-install-recommends ca-certificates git \
        && rm -rf /var/lib/apt/lists/* \
        && useradd -m -d /home/container container; \
    else \
        echo "Unsupported package manager. Please install ca-certificates and git manually." >&2; \
        exit 1; \
    fi

COPY ./SleepyNeko-Studios-Infra-Root-CA.crt /usr/local/share/ca-certificates/SleepyNeko-Studios-Infra-Root-CA.crt
RUN update-ca-certificates

ENV NODE_EXTRA_CA_CERTS=/usr/local/share/ca-certificates/SleepyNeko-Studios-Infra-Root-CA.crt

ENV N8N_USER_FOLDER="/home/container/.n8n"

ENV USER=container HOME=/home/container

USER container
WORKDIR /home/container

COPY --chown=container:container ./n8n/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

CMD ["/bin/sh", "/entrypoint.sh"]
