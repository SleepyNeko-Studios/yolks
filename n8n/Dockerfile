ARG VERSION=latest
FROM n8nio/n8n:${VERSION}

LABEL author="SleepyNeko Studios" maintainer="admin@sleepyneko.com"

USER root

# Reinstall apk-tools since n8n removes it
RUN ARCH=$(uname -m) && \
    wget -qO- "http://dl-cdn.alpinelinux.org/alpine/latest-stable/main/${ARCH}/" | \
    grep -o 'href="apk-tools-static-[^"]*\.apk"' | head -1 | cut -d'"' -f2 | \
    xargs -I {} wget -q "http://dl-cdn.alpinelinux.org/alpine/latest-stable/main/${ARCH}/{}" && \
    tar -xzf apk-tools-static-*.apk && \
    ./sbin/apk.static -X http://dl-cdn.alpinelinux.org/alpine/latest-stable/main -U --allow-untrusted add apk-tools && \
    rm -rf sbin apk-tools-static-*.apk

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
