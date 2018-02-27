FROM library/alpine

RUN apk upgrade --update \
 && apk add --no-cache --update \
        bash \
        ca-certificates \
        curl \
        openssl \
 && update-ca-certificates

SHELL [ "/bin/bash", "-c" ]

ARG ROCKER_VERSION=0.1.6
ARG DL_ROOT=https://github.com/grammarly/rocker-compose/releases/download
ARG DL_FILE=rocker-compose_linux_amd64.tar.gz

RUN curl -OSL ${DL_ROOT}/${ROCKER_VERSION}/${DL_FILE} \
        | tar -xz -C /usr/local/bin \
 && chmod +x /usr/local/bin/rocker-compose

ENTRYPOINT [ "rocker-compose" ]
CMD        [ "--help" ]

