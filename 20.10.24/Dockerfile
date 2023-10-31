FROM docker:20.10.24

ENV PYTHONWARNINGS="ignore::DeprecationWarning"

RUN apk add --no-cache \
    git \
    make \
    libffi-dev \
    openssl-dev \
    gcc \
    libc-dev \
    bash \
    gettext \
    curl \
    wget \
    zip \
    coreutils \
    diffutils

RUN mkdir /root/.ssh && ssh-keyscan -t rsa gitlab.com >> /root/.ssh/known_hosts

COPY config /root/.ssh/config
COPY docker-compose /usr/bin/docker-compose
COPY docker-ci-entrypoint.sh /usr/bin/docker-ci-entrypoint.sh

ENTRYPOINT ["docker-ci-entrypoint.sh"]
