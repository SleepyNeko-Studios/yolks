ARG BASE_TAG=php8.2-alpine
FROM dunglas/frankenphp:${BASE_TAG}

LABEL author="SleepyNeko Studios" maintainer="admin@sleepyneko.com"

USER root

RUN apk update && apk upgrade && apk add --no-cache ca-certificates
COPY ./SleepyNeko-Studios-Infra-Root-CA.crt /usr/local/share/ca-certificates/SleepyNeko-Studios-Infra-Root-CA.crt
RUN update-ca-certificates

RUN install-php-extensions mysqli gd intl zip opcache imagick

RUN useradd -m -d /home/container container
ENV USER=container HOME=/home/container

USER container
WORKDIR /home/container

COPY --chown=container:container ./php/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
